## 13 - error handling

<!-- 13.1 error categories and the error function -->

Lua has two categories of errors that can be communicated
across function calls.

The first category includes exception-like errors.
The second includes errors given by return values.

Now, the documentation avoids words like "exception," "throw,"
and "catch." But I'm going to use the exception language because
I think it clearly communicates the behavior that's going on here.

First I'll show you an example of an error thrown by the
standard library
which is then caught by the interpreter and printed.

    > io.write(false)
    stdin:1: bad argument #1 to 'write' (string expected, got boolean)
    stack traceback:
        <other stuff here>

In this case, there's a bad argument to the `io.write` function.

If you want to throw a custom exception error, then you
can call the built-in `error` function with a string
describing the error.

    > function f() error('my error msg') end

In this case, my function `f` will throw that error;
the interpreter will catch it and print `my error msg`.

    > f()
    stdin:1: my error msg
    stack traceback:
        <other stuff here>
