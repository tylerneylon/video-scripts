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

<!-- 14.3 the string module -->

Now for some functions in the `string` module.

The `string.sub` function returns the substring of its
first input between two indices given as parameters.
Here's an example:

    > str = "pancakes"
    > = string.sub(str, 4, 7)
    cake

Both endpoints are included. In this example, "c"
is the 4th letter and "e" is the 7th.

You can also use `string.sub` as a method call with
the colon syntax, like this:

    > = str:sub(1, 3)
    pan

Remember that Lua strings are arbitrary byte sequences.
The `string.byte` function returns the numeric
value of a byte within a string like this:

    > = string.byte(str, 2)
    97  -- Editor's note: 97 is the decimal ascii value of 'a'.

Again, you call it as a method call using colon syntax
like this:

    > = str:byte(2)
    97

The `string.format` function works like the `printf` function
found in many other languages. Here's an example:

    > = string.format("I eat %s %d times a day", str, 3)
    I eat pancakes 3 times a day

I won't cover Lua's format specifiers in detail, but they
are mostly the same as those in C.
