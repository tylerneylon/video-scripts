## 7 - Chunks and comments

<!-- 7.1 Chunks as files -->

The word *chunk* in Lua means any block of statements that are
compiled as a unit.
The most obvious example is a Lua file.
I'll create a new file to demonstrate.

Chunks are always treated as the body of a function, which
has two consequences.
First, local variables are not visible outside the chunk.
Second, you can return values, which stops the execution of the chunk.

    -- In the file example.lua:

    local x = 1
    y = 2
    return 'w00t'

In the interpreter, I'll use the built-in `dofile` function to
execute the script I just wrote.
The global `x` is left undefined since it was a `local` in the file:

    > = x
    nil

The global `y` *is* defined:

    > = y
    2

and the return value `r` has been received from the file:

    > = r
    w00t

<!-- 7.2 Chunks in the interpreter -->

Any code executed in the interpreter is compiled as a chunk.

This means that variables declared as `local` aren't visible in the
next chunk, like this:

    > local x = 64
    > = x
    nil

They *are* visible within the same chunk, though:

    > local x = 64; print(x)
    64

The semicolon, by the way, is an optional line separator in Lua.

I can also return values from an interpreter line, like this:

    > return 1, 2, 3
    1    2    3

The default action of the interpreter is to print out
the return values.

<!-- 7.3 The built-in load[string] function -->

In Lua 5.2 and later, there's a nice built-in function called `load`
which accepts a string, compiles it as a Lua chunk, and returns a
function you can call to execute that chunk.
In Lua 5.1, which I'm using here, you want to call `loadstring`
to perform the same action.

Here is an example:

    > f = loadstring('print("hi")')

Notice that my code hasn't run yet.
It's only been compiled so far. I can call `f` to run the chunk:

    > f()
    hi

<!-- 7.4 Comments -->

Lua has two types of comments - single-line and multi-line.
To illustrate that, I'll create a new Lua file.
Here is a regular Lua statement:

    -- In the file comments.lua:

    print('string 1')

If at any point, Lua sees two hyphens, then the rest of that line
is a comment.

    -- Adding to the previous line in comments.lua:

    print('string 1') -- print('string 2')

To start a multiline comment, you need to use two hyphens followed by
two open square brackets.
To show that this is in fact a multiline comment, I'm going to put
in multiple lines:

    -- Appending in the file comments.lua:

    --[[
      print('string 3')
      print('string 4')
    --]]

We'll see that they're not executed.

To show that this is the end [of the comment block], and that
they're executed again, I'll create another statement:

    -- Appending in the file comments.lua:

    print('string 5')

When I run this, we should only see strings 1 and 5 printed out
because the rest are commented.

    > dofile('comments.lua')
    string 1
    string 5

There you go!
