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


