## 11 - io.read, io.write

<!-- 11.1 io intro -->

So far we know how to print to standard out using the `print` function.

Now I'm going to talk about two functions in the standard library called
`io.read` and `io.write`.
`io` is a table.
It's a table that has some functions as some of its values.

It's part of the standard library, and
if you're using Lua from an embedded app, such as a game, the
developers may have chosen to exclude some of the
modules of the standard library - or all of them -
for security reasons, probably.
So it's not guaranteed that you have access to these functions.
By default, such as in the interpreter, you *do* have access to these functions.

I'm going to tell you about them since they're very useful.

<!-- 11.2 io.read -->

The default action of `io.read` is to read a line from standard in.

The return value is the string with the line.
However, it excludes the newline character at the end of the line.

    > line = io.read()
    hi  -- Editor's note: the string "hi<enter>" is user-typed.
    > = line
    hi
    > = #line
    2

You can also use `io.read` by giving it a number parameter.
This asks `io.read` to read up to that many characters from standard in.

    > s = io.read(4)
    abcdefghi  -- User-typed.

As you can see in this example,
the variable `s` will have 4 characters.

    > = s
    abcd

<!-- 11.3 io.write -->

`io.write` acts similarly to `print`.
I'll give it a string as input here:

    > s = 'hallo\n'
    > io.write(s)
    hallo

One thing that's interesting is that the string contained a
newline. `io.write` did *not* add a newline - that's the way
`io.write` behaves.
`print`, on the other hand, if I give it the same string, *will*
add a newline:

    > print(s)
    hallo!

    >  -- Editor's note: the next Lua prompt is here.

`io.write` also accepts multiple parameters.
If it takes a number as an input, then it converts that to a string;
otherwise it only accepts strings.
It concatenates multiple parameters together without any spaces
between them, and never adds a newline at the end, like that:

    > io.write('pi is ', 'close to ', 3.14)
    pi is close to 3.14>  -- Editor's note: the > is Lua's input prompt.
