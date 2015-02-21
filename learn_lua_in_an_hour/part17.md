## 17 - The lgraph example

At this point, I've actually covered all of the Lua material
that I wanted to cover in this video. But I'd like to end
with something fun which is a concrete example using a lot
of the things we've just gone over in an app that will act
like a graphing calculator based in the terminal.
It will receive a mathematical function as an input string,
and it will use ascii characters to draw the graph of
that function.

So, let's make this script.

I'll call it `lgraph` for Lua grapher.

I'll begin with a hash-bang (`#!`) string so that I
can call it directly from the shell without having to
consciously use the Lua interpreter.

*[Editor's note: In this part of the tutorial, the code
blocks have line numbers since these blocks are described
out of order. They make up a single Lua script, all
of which is on this page (in pieces); any missing line
numbers are for blank lines.
The source for this Lua script, with modifications from
the next part of the tutorial, is
[here](https://github.com/tylerneylon/video-scripts/blob/master/learn_lua_in_an_hour/lgraph).]*

    -- Line 1:
     #!/usr/local/bin/lua

<!-- 0:44 -->

I'm going to start with a multiline string here, which
is a usage string.
I like to do this because programmers looking at the script
can see the usage right away at the top of the file.

    -- Line 2:
    usage_str = [[
    Usage:
      lgraph 'function of x'
    
    Example:
      lgraph 'x^2'
    ]]

It's assigned also to a global variable which I can later use
to print out to the user what's going on.

Right now I'm just setting up the structure.
I plan to explain and program in a top-down manner, meaning
that I'm going to start with the highest conceptual-level
thing happening and define more-and-more detailed pieces as
I need them.

    -- Line 10:
    -- Supporting functions.

<!-- These comments force markdown to give us separate code blocks. -->

    -- Line 24:
    -- Define the Grapher class.

<!-- Force a separate code block. -->

    -- Line 63:
    -- Parse command-line arguments.

<!-- Force a separate code block. -->

    -- Line 70:
    -- Graph the input.

<!-- 1:27 -->

I'm going to define a class called `Grapher`.
At the very end here I'm going to declare an instance of that
class, and I will call this `graph` method on it with `arg[1]`.
`arg` is a special built-in variable name that the interpreter
populates with the strings we get from the command line.

    -- Line 70:
    -- Graph the input.

    g = Grapher:new()
    g:graph(arg[1])

To be nice to the user, if they have not given us an equation
to graph, instead of just having a horrible failure, we'll
print out the usage string. And we'll exit politely.

    -- Line 63:
    -- Parse command-line arguments.

    if not arg[1] then
      print(usage_str)
      os.exit(0)
    end

Now we're ready to define the `Grapher` class itself.

I'm going to start off with a table of regular values - no
functions yet.
I'll define my `x` window, my `y` window, number of columns
in ascii to print out, number of rows as well.
I'll just hard code them for now because it's simple to do.

    -- Line 24:
    -- Define the Grapher class.

    Grapher = {xmin = -1, xmax = 1, ymin = -1, ymax = 1, ncols = 80, nrows = 40}

Here is a constructor.
We'll make a local table.
I have to make sure the `__index` key is set to `self`.
And I'm going to return the new instance with `self` set
as the metatable.

    -- Line 28:
    function Grapher:new ()
      return setmetatable({}, {__index = self})
    end

<!-- 2:50 -->

Now we're ready to define this key function - the `graph`
function, which receives an equation (`eqn`) string as input.
I'm going delegate a lot of my work to this `setup_char_table`
method that I have *not* written yet. I will write it.

    -- Line 52:
    function Grapher:graph(eqn)
      self:setup_char_table(eqn)

      for row = 1, self.nrows do
        for col = 1, self.ncols do
          io.write(self.char[col][row] or ' ')
        end
        io.write('\n')
      end
    end

The idea there is that I have this `self.char` table, which is
sort of like a two-dimensional array, conceptually.
That will give me a way to easily iterate over all the rows 
and columns, as I'm doing here right now.
If there is no value there - if it's `nil` - I'll just write
a space character out. If it's not `nil`, then I'll write
whatever character *is* there out.
That's what that current code will do.

That's the complete `graph` function.

<!-- 3:43 -->

Really, it's not doing any intelligent work, because I've
delegated it all to this `setup_char_table` function, which
is going to do the real work here.

    -- Line 32:
    -- Makes a map self.char[col][row] = <nil or character to print>.
    function Grapher:setup_char_table(eqn)
      local f = loadstring('local x = ...; return ' .. eqn)

This line is probably going to be the single most interesting
line because it's going to do the most nontrivial work in the
program.
What I'm going to do is parse and compile `eqn` as, basically,
Lua code.

<!-- 4:10 -->

Completely insecure code.
Security vulnerabilities there.
Let's pretend the user is a very friendly, nice person.

Let me explain this "`...`" notation, because this might be
confusing.
When Lua compiles something using `load` or `loadstring`,
`...` is sort of like a macro that expands to be all the
parameters that are given to the function `f`.
Remember that `loadstring` returns a function. So if I were
to execute this `y = f(3)` line, then this code would be
executed with `x` set to the value 3.
Let's say `eqn` was set to the string `x^2`.
Effectively, the function `f` would be `x^2`, so the value
of `y` would be 9.

Really, `eqn` could be any valid Lua expression, as long as
it depends on `x` and no other variables, then we have
whatever function the user wanted to define.

That makes it easier to write a graphing calculator.

A very insecure graphing calculator.

But, a graphing calculator nonetheless.

    -- Line 36:
    -- This will be a table of tables so that self.char[col][row] is either
    -- nil or the character to print at that location.
    self.char = {}

    local y_to_row = range_mapper(self.ymin, self.ymax, self.nrows, 1)
    local col_to_x = range_mapper(1, self.ncols, self.xmin, self.xmax)

I have not yet written the function `range_mapper`.
But I will.

That function gives us exactly a linear mapping between
two ranges -- between a beginning range -- in this case I'm
mapping ascii column space into the `x` space, mathematically.
Based on those two things, what I can do is go through all the
columns that I care about. For each column, figure out what the
mathematical `y` value is based on `col`.
Then I can use that mathematical `y` value to convert back
into ascii space like that.

Essentially, what I want to do here, is I want to set
`self.char[col][row]` to be equal to `'o'`. It may be the case that
`self.char[col][row]` can't be set yet because this value
(`self.char[col]`) could be `nil`.

    -- Line 43:
      for col = 1, self.ncols do
        local y = f(col_to_x(col))
        local row = round(y_to_row(y))

        self.char[col] = {}
        self.char[col][row] = 'o'
      end
    end

<!-- 6:32 -->

This could be the first thing I'm putting in that particular column.
In fact, most of the time we would expect that to be true.

I wonder if I could just use this shortcut?
Probably, I can just do that - let's try that out.
Ok, great.

I've done everything except for these two supporting functions
that I haven't defined yet, but that I've used.

I've actually used two functions that I haven't defined yet.
One is called `round`, which is easy.
This is just going to round to the nearest integer, which is
the same as taking the floor of `x + 0.5`.

    -- Line 12:
    local function round(x)
      return math.floor(x + 0.5)
    end

Now this function, `range_mapper`, is a little more interesting
because it's going to
*return* a function that I have to make on the fly.
Conceptually, what I'm going to do is calculate this percentage
that the input is from `a1`. The input is a number in the range
`a1` to `b1`. I'm going to turn that into a percentage. Then
I'm going to return that percentage converted into the
`a2` to `b2` range.

    -- Line 16:
    -- This returns a *function* that maps [a1, b1] to [a2, b2].
    local function range_mapper(a1, b1, a2, b2)
      return function (x)
        local perc_from_a1 = (x - a1) / (b1 - a1)
        return a2 + (b2 - a2) * perc_from_a1
      end
    end

Ok.

There's a very good chance that I've made some typos along the
way, so let's take a look at those typos.

*[Editor's note: the remarks below are about fixing two typing
mistakes that have been left out of the code blocks you see
on this page.]*

I forgot to write the word `set` there.

Let's try this again.

Let's see ... `perc_from_a1`.

There we go! Great! Only two typos... so far.

    $ lgraph x
                                                                      oo
                                                                    oo  
                                                                  oo    
                                                               ooo      
                                                             oo         
                                                           oo           
                                                        ooo             
                                                      oo                
                                                    oo                  
                                                  oo                    
                                               ooo                      
                                             oo                         
                                           oo                           
                                        ooo                             
                                      oo                                
                                    oo                                  
                                 ooo                                    
                               oo                                       
                             oo                                         
                          ooo                                           
                        oo                                              
                      oo                                                
                    oo                                                  
                 ooo                                                    
               oo                                                       
             oo                                                         
          ooo                                                           
        oo                                                              
      oo                                                                
    oo                                                                  

Let's make a more interesting graph here.

    $ lgraph 'x^2 - 0.5'
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
    o                                                                  o
     o                                                                o 
      o                                                              o  
       o                                                            o   
        oo                                                        oo    
          o                                                      o      
           oo                                                  oo       
             o                                                o         
              oo                                            oo          
                oo                                        oo            
                  oo                                    oo              
                    oo                                oo                
                      ooo                          ooo                  
                         ooo                    ooo                     
                            oooooo        oooooo                        
                                  oooooooo                              

Sweet, there's a parabola.

Let's do one of my favorites - let's do a little trig.

    $ lgraph 'math.sin(3 * x)'
                                                     ooooo              
                                                  ooo     ooo           
                                                 o           o          
                                                o             o         
                                              oo               oo       
                                             o                   o      
                                                                  o     
                                            o                           
                                           o                       o    
                                          o                         o   
                                         o                           o  
                                        o                             o 
                                                                       o
                                       o                                
                                      o                                 
                                     o                                  
                                    o                                   
    o                                                                   
     o                             o                                    
      o                           o                                     
       o                         o                                      
        o                       o                                       
                               o                                        
         o                                                              
          o                   o                                         
           oo               oo                                          
             o             o                                            
              o           o                                             
               ooo     ooo                                              
                  ooooo                              

Aw, yea, that's looking good.

Something even more interesting.
Here's a nice trig function.

    $ lgraph 'math.sin(6 * x) / 3 + math.cos(2 * x) / 2'
                                                                        
                                                                        
                                                                        
                                            ooo                         
                                          oo   oo                       
                                        oo       oo                     
                                       o           o                    
                                      o             o                   
                                     o               o                  
            ooooo                  oo                                   
          oo     ooo              o                   o                 
         o          oo           o                     o                
        o             oo       oo                       o               
       o                ooooooo                          o              
      o                                                   o             
     o                                                                  
    o                                                      o            
                                                            o           
                                                             oo         
                                                               oo     oo
                                                                 ooooo  

I like that.
