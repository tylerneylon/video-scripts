## 3 - Types

That's three ways to run Lua code.
Lua also runs from embedded apps.

Let's talk about types.

goal:  7s

These are all 8 types in Lua.
I'll mainly talk about these 6 highlighted types in this video.

goal: 12s

`true` and `false` are the **boolean** values.

    > a = true
    > b = false

The built-in `type` function returns a string indicating the type of the input.

    > = type(a)
    boolean

goal: 22s

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

goal: 44s

The built-in `tonumber` function converts numbers and strings to numbers.

    > = tonumber('2.7')
    2.7

goal: 49s

Lua **strings** are immutable. You can use single- or double-quotes to type a
literal. There's no big difference between the two.

    > s1 = 'hi'
    > s2 = "hi"
    > = (s1 == s2)
    true

These literals can have the usual escaped characters like tabs or newlines.

    > print('hi \n there \t \\')
    hi
     there   \

Lua strings are arbitrary-length byte sequences; zero bytes are allowed.
Type slash and up to three decimal digits to specify any byte value.

    > = '\65\66\67\0'
    ABC

Multiline strings can start with two square brackets. They don't support
escaped characters, and end as soon as they see two closing square brackets.

    > print([[
    one
    two
    three]])
    one
    two
    three

goal: 91s

The built-in `tostring` function returns a reasonable
string representation of any value.

    > = tostring(true)
    true

goal: 96s

**Tables** are key-value maps, and Lua's only container type.
I'll cover tables later in the video.

goal: 102s

The **nil** value conceptually means no value.
Undefined variables evaluate to `nil`; this might be a
surprise as this is an error in many languages.

    > = abc
    nil

Setting values to `nil`
undefines them and allows them to be
garbage collected.

    > s1 = nil

You can also call `collectgarbage()` explicitly,
but the garbage collector is always running automatically for you.

    > collectgarbage()

goal: 122s

**Functions** can be assigned to variables and passed in and out of
other functions. I'll talk more about functions later in the video.

    > fn = function (x) return x*x end
    > = fn(3)
    9

goal: 131s

<!-- <userdata & thread> -->

**Userdata** and **threads** are slightly advanced types that
I won't cover in detail now.
A userdata object is basically a black-box type used by libraries
to wrap C-level structs.

    > f = io.open('file', 'w')
    > = type(f)
    userdata

A thread is an instance of a coroutine.

goal: 148s

Assignments are global by default.
Use `local` to make them local.

    > local a = 7

goal: 153s




