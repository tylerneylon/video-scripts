## 8 - Loops

<!-- 7.1 While loops -->

Lua has several loop constructs.
I'll start by looking at the `while` loop.
In a new Lua script, we can create a loop that
begins with the keyword `while`,
followed by a conditional, the keyword `do`,
and then an arbitrary block of statements, followed by
the keyword `end`:

    -- In the file loops.lua:

    i = 1
    while i <= 10 do
      print(i)
      i = i + 1
    end

This will count from 1 to 10 and print out the results.
To verify that, I'll run the script:

    > dofile('loops.lua')
    1
    2
    3
    4
    5
    6
    7
    8
    9
    10

