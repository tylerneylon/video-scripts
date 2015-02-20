## 18 - Adding a subclass

Now I'd like to extend the functionality of this script
by being able to optionally draw the x-axis and the y-axis.

I'm going to do this by subclassing the `Grapher` class.
I'll make a subclass called `AxisGrapher`.
To be honest, the point of making a subclass here instead of just
adding functionality to the existing class is to illustrate what it's
like to make a subclass.

If I were not using this in a tutorial video, I might not implement it
exactly this way.
I've set up the base class so that I really just need to override this
one function - `setup_char_table` - in order to slightly modify the
behavior of the base class.

    -- Editor's note: this is a partial diff from the old lua script:
    62a63,78
    > -- Define AxisGrapher, a subclass of Grapher.
    > 
    > AxisGrapher = Grapher:new()
    > 
    > function AxisGrapher:setup_char_table(eqn)
    >   Grapher.setup_char_table(self, eqn)  -- Call super's version.
    > 
    >   -- Draw the y-axis.
    >   local c = round(range_mapper(self.xmin, self.xmax, 1, self.ncols)(0))
    >   for r = 1, self.nrows do self.char[c][r] = '|' end
    > 
    >   -- Draw the x-axis.
    >   local r = round(range_mapper(self.ymin, self.ymax, self.nrows, 1)(0))
    >   for c = 1, self.ncols do self.char[c][r] = '-' end
    > end
    > 

What I'm doing here is making the call to the super class's version of
this method. I have *not* used colon syntax in that line because I
want `self` to be the value of `self` that I receive in this method
call, but if I used a colon here, then `Grapher` would be set as
`self` inside the call. In this special case, this is a case where I
cannot use colon syntax. I have to be conscious of what object owns
the method, and what `self` is. `self` might not be the same as
where the method is.

That's a special case when you call super.

What I've just done is set `c` to the column that represents the
`y=0` column - I mean `x=0` column, sorry.

Now I'm going to iterate `r` over all possible rows. I'll set that
character to be a vertical bar (`|`). We can make that a one-liner.

Let's draw the x-axis. Again, I'm going to use `range_mapper` to
map my `y=0` value into the row value, like that.
I can iterate over all columns and this time I'll use a hyphen
(`-`) as the character.

That's everything I need to do there.

If I'm being careful about parsing the command-line arguments, then
basically the way I'm going to check if they want to use axes is to
look for `-a` as a flag. If they have that flag, then I expect there
to be another argument, `arg[2]`.

    -- Another partial diff:
    65c81
    < if not arg[1] then
    ---
    > if not arg[1] or (arg[1] == '-a' and not arg[2]) then

I'm going to act differently depending on whether or not the first
argument is a `-a`.
If it is a `-a`, then my global variable `g` will be an `AxisGrapher`
instance. For convenience here, I'll copy over the math equation to
graph into `arg[1]`. From this point on, `arg[1]` is always the
equation to graph.

    -- The last partial diff. These are all the diffs between
    -- the last part's Lua script and this part's.
    69a86,92
    > if arg[1] == '-a' then
    >   g = AxisGrapher:new()
    >   arg[1] = arg[2]
    > else
    >   g = Grapher:new()
    > end
    > 
    72d94
    < g = Grapher:new()

If there was no `-a`, we'll continue to use the original `Grapher`
class for the instance.

If I've done everything correctly - great!

    $ lgraph -a x
                                      |                               oo
                                      |                             oo  
                                      |                           oo    
                                      |                        ooo      
                                      |                      oo         
                                      |                    oo           
                                      |                 ooo             
                                      |               oo                
                                      |             oo                  
                                      |           oo                    
                                      |        ooo                      
                                      |      oo                         
                                      |    oo                           
                                      | ooo                             
                                      |o                                
    --------------------------------------------------------------------
                                 ooo  |                                 
                               oo     |                                 
                             oo       |                                 
                          ooo         |                                 
                        oo            |                                 
                      oo              |                                 
                    oo                |                                 
                 ooo                  |                                 
               oo                     |                                 
             oo                       |                                 
          ooo                         |                                 
        oo                            |                                 
      oo                              |                                 
    oo                                |                                 

I can even edit this instance here (the bash line) - there we go!

    $ lgraph -a 'math.sin(10 * x) / 3 + math.cos(3 * x) / 2'
                                      |                                 
                                      |                                 
                                      |                                 
                                      |  ooo                            
                                      | o   o                           
                                      |o     o                          
                                      |                                 
                                      |       o                         
                      ooo            o|        o                        
                     o   oo         o |                                 
                    o      o          |         o                       
                            o      o  |                                 
                   o         o    o   |          o                      
                              oooo    |                                 
                  o                   |           o                     
    --------------------------------------------------------------------
                 o                    |            o       oo    o      
                                      |             o     o       o     
                o                     |              o  oo         o    
    o                                 |               oo                
     o         o                      |                             o   
      o       o                       |                              o  
                                      |                                 
       o     o                        |                               o 
        oo  o                         |                                o
          oo                          |                                 
                                      |                                 
                                      |                                 
                                      |                                 
                                      |                         

There's our axes.
