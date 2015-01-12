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

