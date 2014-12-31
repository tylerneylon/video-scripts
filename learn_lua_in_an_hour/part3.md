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
unless you're working with a specially-compiled 32-bit version of Lua, which
is unusual.
Lua 5.3 still has a single number type, but it can also use a pure integer
representation internally.

goal: 44s

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

goal: 86s

**Tables** are key-value maps, and Lua's only container type.
I'll cover tables later in the video.

goal: 92s

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

goal: 112s


