## 13 - Error handling

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

<!-- 13.2 the assert function -->

The built-in `assert` function accepts as input a boolean
and an error message.
It throws the error message if the boolean is false, like this:

    > cond = false
    > = assert(cond, 'ruh-roh')
    stdin:1: ruh-roh
    stack traceback:
        <other stuff here>

However, if the condition is true, then it simply returns
the inputs it receives.

    > cond = true
    > return assert(cond, 'ruh-roh')
    true    ruh-roh
    -- Editor's note: the "return" acts the same as an =.

A common pattern in Lua, for functions that return error
messages, is to first return a boolean indicating success or
failure, followed by, in the success case, the useful return
values; or in the failure case, an error message.

`assert` works well with this pattern.
I'll demonstrate by creating two functions that return
success or failure depending on which one I call.

    > funciton bad() return false, 'was bad' end
    > function good() return true, 42 end

And we'll see that
`assert` easily wraps these function calls.
In this case it'll throw the error message:

    > = assert(bad())
    stdin:1: was bad
    stack traceback:
        <other stuff here>

And in this case - the good case - it will simply
return the useful return values:

    > = assert(good())
    true    42

<!-- 13.3 the pcall function -->

The built-in `pcall` function makes *protected* function
calls.
It basically wraps a call to catch exceptions.

You use it by first sending in the function that you want to call
followed by parameters that you want to give to it.

    > =pcall(print, 'a good call')
    a good call
    true

It calls the function with the given parameters.
The first return value is going to be a boolean indicating
success or failure. The others
are either going to be the called function's return values,
or an error message if an exception was thrown.

I'll give an example of a case where an exception is thrown.

    > = pcall(io.write, false)
    false    bad argument #1 to '?' (string expected, got boolean)

In summary, `pcall` converts exception-like errors
into return-value errors.
I like to think of it as a sort of inverse of the
`assert` function.

<!-- 13.4 the xpcall function -->

There's another built-in function called `xpcall` which
offers basically the same functionality as `pcall`, except
that one of its input parameters is a callback function
to handle exception-like errors.
