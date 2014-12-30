## 3 - Types

That's three ways to run Lua code.
Lua also runs from embedded apps.

Let's talk about types.

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

In Lua 5.2 and earlier, numbers are represented internally as 64-bit doubles.
Lua 5.3 still has a single number type, but can also use a pure integer
representation internally.




