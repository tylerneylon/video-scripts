## 2 - Docs, Installation, and the Interpreter

Let's get started with the docs and how to install Lua.
The official site is [lua.org](http://www.lua.org/).
If I click on documentation, I can see the official book,
called *Programming in Lua*.

The third edition is the latest right now.
The first edition is available online.
You can read the entire thing for free.
It's useful, but it covers an older version of the language.

Another great resource is the reference manual. This is
basically a set of man pages for Lua. It covers
the C API, the standard library, and all of the core language itself.
It's not a great way to learn,
but once you know the language, it is a great way to look up things
you may have forgotten, or technical details you *almost* know, but that
you need to double-check.

If I click on
[the download link](http://www.lua.org/download.html),
I can download a gzipped file [of Lua's source].
These instructions include downloading and unzipping.
The highlighted instructions here will
work you through downloading and building on linux.
To build on mac os x, you have to replace the word `linux`
with `macosx`.
Or you could use [homebrew](http://brew.sh/).
Just type in `brew install lua`.

On windows, you can use the
[`luaforwindows`](https://code.google.com/p/luaforwindows/)
project on Google code.
I haven't used this myself, but it looks good, so I think
it will probably work well.

As far as the interpreter goes, once you've installed Lua,
you can type in `lua` in the shell, and now you can type
in statements directly.

If you want to see the value of an expression,
you can't just type the expression - at least not with Lua 5.2 or earlier.
You have to type an equal sign as the first character of a line
and then it will evaluate the expression after the equal sign.

Control-D escapes from the interpreter.

You can use your favorite text editor to
type in a Lua script. Then you can type at the shell
`lua` 
and then the name of your script file, and it will execute it.
*[Example lua script below.]*

If you know the absolute path of your Lua interpreter, then
you can insert a first line of the form `#!` followed by the
absolute path of your interpreter.
Make sure that your file has execute permissions. Then you
can execute that file directly.

    -- Contents of example lua file:

    #!/usr/local/bin/lua
    print('yoyo')

