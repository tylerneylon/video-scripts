## 8 - Loops

<!-- 8.1 While loops -->

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

<!-- 8.2 For loops -->

Let's talk about for loops.

I'll start a new script.

A simple for loop starts with the keyword `for`
and it includes a number range over which we'll iterate
the loop variable.

Just like the while loop, you want to include the body of the
loop between the `do` and `end` keywords.

    -- In the file for_loops.lua:

    print('simple for')
    for i = 1, 5 do
      print(i)
    end

We can also use a *step parameter*.
In that case, we add a third number to the parameters
being used for the for loop.

    -- Appending to the file for_loops.lua:

    print('for with a step 0.5:')
    for i = 1, 5, 0.5 do
      print(i)
    end

You can probably guess what these do just by looking at them.
Maybe the only nontrivial thing is that both the starting and the
ending numbers are included when I execute the loop.

    > dofile('for_loops.lua')
    simple for
    1
    2
    3
    4
    5
    for with a step 0.5:
    1
    1.5
    2
    2.5
    3
    3.5
    4
    4.5
    5

There we go.

There's another type of `for` syntax in Lua using what's called an
*iterator*.
I'm not going to cover them in detail, but I will cover, in a few
minutes,
the `pairs` and `ipairs` functions,
which are the most useful iterators that Lua comes with.

<!-- 8.3 The break statement -->

Lua includes a `break` statement, but *not* a `continue` statement.
I'll give you an example of `break`.
It'll print the first number, and this will stop as soon as the keyword
`break` is seen, so it'll only print the first number:

    > for i = 1, 10 do print(i) break end
    1

<!-- 8.4 Repeat-until loops -->

Lua also has a repeat-until loop which is like a do-while loop.
The syntax is to begin with the keyword `repeat`, followed by a block
of statements, the keyword `until`,
and then an ending condition.

    -- In the file repeat.lua:

    i = 1
    repeat
      print(i)
      i = i + 1
    until i == 6

We can confirm that this prints out 1 through 5 by running the script:

    > dofile('repeat.lua')
    1
    2
    3
    4
    5

There you go!

<!-- 8.5 The goto statement -->

Lua 5.2 added the `goto` statement.
I'm not going to cover that in detail in this video.

In my experience, the vast majority of code works well
with the loop constructs we've already covered - not using `goto`;
although, I also feel that, in rare cases, a `goto` is
the best control flow mechanism to use.
