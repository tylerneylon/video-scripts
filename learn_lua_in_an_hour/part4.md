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

