## 10 - if, else, elseif

<!-- 10.1 if, else, elseif -->

The `if` statement in Lua is straightforward.

I'll start by giving a very simple example.
You start with the keyword `if`, a condition,
the keyword `then`, followed by any block of statements, and
the keyword `end`.

    > i = 0
    > if i == 0 then
    >>  print(1)
    >> end
    1

It does what you'd expect it to do.
I'll show you a more complicated example now.

    > if i == 0 then
    >>  print(1)
    >> elseif i > 0 then
    >>  print(2)
    >> else
    >>  print(3)
    >> end
    1

You can have an `elseif` clause, and you can have an `else` clause.
Both of those are optional.
You could have one without the other, or just have the `if` clause
by itself.
