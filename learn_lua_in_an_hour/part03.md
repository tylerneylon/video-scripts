## 3 - Types

That's three ways to run Lua code.
Lua also runs from embedded apps.

Let's talk about types.

![](https://raw.githubusercontent.com/tylerneylon/video-scripts/master/learn_lua_in_an_hour/img/slide1.png)

These are all 8 types in Lua.
I'll mainly talk about these 6 highlighted types in this video.

`true` and `false` are the **boolean** values.

    > a = true
    > b = false

The built-in `type` function returns a string indicating the type of the input.

    > = type(a)
    boolean

There's a single **number** type.
You can type numbers in standard decimal notation, scientific notation,

    > print(4.22e1)
    42.2

or in hex.

    > print(0x10)
    16

In Lua 5.2 and earlier, numbers are represented internally as 64-bit doubles
by default. Lua 5.3 still has a single number type, but it can internally use
either an integer or a double representation.

The built-in `tonumber` function converts numbers and strings to numbers.

    > = tonumber('2.7')
    2.7

Lua **strings** are immutable. You can use single- or double-quotes to specify
them. It doesn't make any semantic difference which type of quotes you use.

    > s1 = 'hi'
    > s2 = "hi"
    > = (s1 == s2)
    true

These literals can have the usual escaped characters like newlines and tabs.

    > print('hi \n there \t \\')
    hi
     there   \

Lua strings internally are arbitrary-length byte sequences; zero bytes are allowed.
Type a backslash followed by up to three decimal digits to specify arbitrary bytes.

    > = '\65\66\67\0'
    ABC

Multiline strings can start with two open square brackets. They don't allow
escaped characters within this type of string.

    > print([[
    one
    two
    three]])
    one
    two
    three

The built-in `tostring` function returns a reasonable
string representation of any value.

    > = tostring(true)
    true

**Tables** are key-value maps, and Lua's only container type.
I'll cover tables later in the video.

The **nil** value conceptually means no value.
Undefined variables evaluate to `nil`; it's *not* an error.

    > = abc
    nil

Setting values to `nil`
undefines them and allows them to be
garbage collected.

    > s1 = nil

You can also explicitly call `collectgarbage()`, but usually you
don't have to because the garbage collector is running automatically.

    > collectgarbage()

**Functions** can be assigned to variables and passed into and out of
other functions. I'll talk more about functions later in the video.

    > fn = function (x) return x*x end
    > = fn(3)
    9

**Userdata** and **threads** are slightly advanced types that
I won't cover in detail now.
A userdata object is basically a black-box type used by libraries
to wrap C-level structs like a `FILE *` from C's `stdio` library.

    > f = io.open('file', 'w')
    > = type(f)
    userdata

A thread is a coroutine instance.

Assignments are global by default.
Use `local` to make them local.

    > local a = 7

