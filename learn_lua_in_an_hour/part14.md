## 14 - Useful standard library functions

<!-- 14.1 file operations -->

Now we're going to talk about what I think are the
most useful functions in Lua's standard library.
We'll start with file operations.

You can open files in Lua with the `io.open` function like this:

    > f = io.open('file.txt', 'w')

The first argument is the filename, and then the mode - 
just like `fopen` in C.
`w` means write mode, and you can use `r` for read mode.

You can write to a file by using the `write` method,
giving it the string that you want to write.

    > f:write('pizza\n')

I used a colon instead of a period because the `write` method
treats `f` as an object being acted upon.
I'll talk more about the colon syntax later.

You can close the file by using the `close` method.

    > f:close()

Reading a file is the same, except that we use the `read`
method. This method has the same input structure as
`io.read`. Here's an example:

    > f = io.open('file.txt')
    > = f:read()
    pizza
    > f:close()

