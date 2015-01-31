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

<!-- 14.2 the math module -->

Next I'll talk about the pieces of the math module
that I find most useful.

You can find the square root of a number using the
`math.sqrt` function.

    > = math.sqrt(64)
    8
    > = math.sqrt(2)
    1.4142135623731

The `math.random` function behaves differently
depending on the number of inputs it receives.
With no inputs, it returns a pseudorandom float
between 0 and 1. It can equal 0, but is always
less than 1.

    > = math.random()
    0.45865013192345

With one input, it returns a pseudorandom integer
between 1 and the input, including both endpoints
as possible outputs.

    > = math.random(10)
    6

With two inputs, it returns a pseudorandom integer
between the two inputs; again the endpoints are
possible outputs.

    > = math.random(5, 8)
    5

The math module has common trig functions, which
work in radians. Pi is available as `math.pi`.

    > = math.pi
    3.1415926535898

<!-- 14.3 the math module -->
