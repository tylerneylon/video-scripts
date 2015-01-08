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

