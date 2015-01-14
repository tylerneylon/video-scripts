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


