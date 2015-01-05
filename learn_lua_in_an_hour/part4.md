## 4 - Operators & Flexible Assignment

Let's talk about operators.

Lua has the usual arithmetic operators.

    > = 1 + 2 * 3 ^ 2
    19

It also adds an exponentiation operator,
so this is 3 squared times 2 plus 1.

Division is always a floating-point operation, even if the
inputs are integer values.

    > = 2 / 3
    0.66666666666667

Lua has a clean modulo operator.
It's capable of handling non-integer or negative inputs.

    > = 10 % 3
    1
    > = 1.1 % 0.4
    0.3

There's also a hash operator which gives us the length
of a string and can work on tables, as we'll see later in
the video.

    > = s2
    hi
    > = #s2
    2

Lua has the usual conditional or comparison operators.

    > = 2 == 2
    true

In the case of the not-equal operator, it's spelled with
a tilde as the first character (`~=`).

    > = 2 ~= 3
    true

When you compare two values that have different types, Lua
always considers them not equal to each other.

    > = 2 == '2'
    false

Lua also has the standard less-than / greater-than operators.

    > = 'abc' < 'def'
    true

In the case of strings, Lua puts them in alphabetical
order using the current locale.

The string concatenation operator in Lua is the double-dot.

    > = 'abc' .. 'def'
    abcdef

Nil and false are the only falsy values in Lua.

    > = not not nil
    false

This is interesting because that means 0 is considered truthy.

    > = not not 0
    true

The boolean operators are short-circuited, which means that as
soon as Lua can determine the total value of the `or` or `and` clause,
it doesn't even bother to evaluate the rest of the expressions, like that:

    > = true and print('hi')
    hi
    nil
    > = false and print('hi')
    false

