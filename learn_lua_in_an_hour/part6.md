## 6 - Functions and closures

<!-- 6.1 functions: global syntax -->

Let's talk about functions and closures.
A closure is a function that refers to variables declared outside
of itself, but which are *not* globals.

For this part of the video, I'm going to use a text editor
to write my Lua because, in practice, you'll be using a text
editor to write
your code, and multiline Lua doesn't work as well in the
interpreter.

    -- In the file fn.lua:

    function abc(a, b, c)
      print(a, b, c)
      return 3
    end

I've declared a global function here called `abc`.
Syntax for functions always starts with the word `function` and
ends with the word `end`.

Within the interpreter, I can use the built-in `dofile` function
to load and execute this script.
That's what the `dofile` function does.

    > dofile('fn.lua')

Now I can call `abc` with any three values that I like, like this:

    > abc(1, 2, 'hi')
    1       2       hi

<!-- 6.2 functions: flexible parameter passing -->

Similar to flexible assignments, Lua function calls accept a flexible
number of parameters.
If I call `abc` with a single parameter, then the extra variables
inside the function receive the `nil` value.

    > abc(1)
    1    nil    nil

If I call the function with extra *values*, the extra values are discarded.

    > abc(1, 2, 3, 4)
    1    2    3

<!-- 6.3 functions: flexible return values -->

Return values work similarly.
I can accept more or fewer values than are actually returned by the function.

    > a, b = abc()
    nil    nil    nil
    > = a
    3
    > = b
    nil

Now I'm going to define a function that returns 4 values.

    -- In the file fn.lua:

    function ret4()
      return 4, 5, 6, 7
    end

When you chain function calls together, the output of one function goes
into the input of another,
similarly to flexible assignment.

In this example, the extra return value 7 will be discarded.

    > dofile('fn.lua')
    > abc(ret4())
    4    5    6

<!-- 6.4 functions: anonymous and local functions -->

You can also create anonymous functions.
The syntax is the same, except that you leave out the name of the
function.
Here's an example that returns an empty table:

    > g = function () return {} end
    > = g()
    table: 0x7fdfd170a9f0

And you can create *local* functions.
That means the function, considered as a variable, only has local scope.

    > local function hi() print('hi') end

This is useful when you're writing a module and you want to call an
internal function that isn't visible outside the scope of the module.
