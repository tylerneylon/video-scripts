## 5 - Tables and Print

<!-- 5.1 tables: intro -->

Tables are Lua's only container type. They're associative arrays,
which are key-value dictionaries built using hash tables.

<!-- 5.2 tables: getting and setting identifier keys -->

I can set up an empty table by using open-and-close curly brackets
like this:

    > t = {}

From there I can set values using this dot syntax:

    > t.abc = 12

I can also perform lookups.
This dot syntax treats the keys as strings, and it only works for
identifiers, which means the strings can only contain
alphanumeric or underscores characters.

    > = t.abc
    12

I can also perform lookups on undefined keys, which return `nil`
without an error.

    > = t.def
    nil

However, if I try to perform a lookup on a `nil` as if it were a
table, that will be an error:

    > = t.def.hij
    stdin:1: attempt to index field 'def' (a nil value)
    stack traceback:
            stdin:1: in main chunk
            [C]: ?

<!-- 5.3 tables: getting and setting general keys -->

Lua also has a square-bracket notation which allows me to use
arbitrary Lua expressions as keys.

    > = t['abc']
    12

Here's an example of a number as a key via the variable `a`:

    > a = 12
    t[a] = 34

Here's an example of a table as a key:

    > t[t] = 56

Here's an example of a function as a value:

    > t[1] = print

I can call the function like this:

    > t[1]('hi')
    hi

<!-- 5.4 tables: literals -->

Lua also has a syntax to specify non-empty tables.
In this case, I'm creating a table with the keys `abc` and `def`:

    > u = {abc = 12, def = 34}
    > = u.abc
    12

This syntax works by treating the left-hand side as a string key;
it has to be an identifier.
The right-hand side is an arbitrary Lua expression.
Here's an example with a function on the right-hand side:

    > u = {pr = print}
    > u.pr('yo')
    yo

If you want to specify non-identifiers as keys, you can use
a square-bracket notation like this:

    > v = {[34] = 1, [true] = 2}
    > = v[true]
    2

<!-- 5.5 tables: arrays -->

If a table has consecutive number keys starting at 1, then
it's called an *array*. Arrays aren't a new type - they're
just tables with a specific key structure.
In Lua syntax, I can specify an array by omitting the `=`'s
in the table literal:

    > arr = {2, 3, 5, 7}

This is the first 4 prime numbers.
When I use this syntax, Lua assigns keys as numbers starting
at 1 and increasing from there.

    > = arr[1]
    2
    > = arr[2]
    3

I can use the hash operator to see the size of an array:

    > = #arr
    4

<!-- 5.6 tables: equality -->

Tables in Lua are considered equal only if they're identical.

    > = t == t
    true

It is *not* enough for their contents to be the same, like this:

    > a = {}
    > b = {}
    > = a == b
    false

In other words, the expressions being compared have to evaluate to
literally the same table.

    > a = b
    > = a == b
    true

<!-- 5.7 print -->
