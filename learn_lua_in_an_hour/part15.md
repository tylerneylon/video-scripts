## 15 - Metatables

<!-- 15.1 metatable intro -->

Now we'll cover metatables.

Every table in Lua has an optional property called a *metatable*.
It's completely separate from the key/value data, and is set
to `nil` by default.

Metatables allow us to add object-oriented behavior to tables,
among other things.

With metatables, we can overload operations performed
on tables. The most useful operations to overload are the getting
and setting of key/value pairs, which is the only metatable usage
I'll cover carefully in this video.

<!-- 15.2 setting and getting a metatable -->

We can set a table's metatable using the built-in `setmetatable`
function, like this:

    > meta = {a = 1}
    > t = setmetatable({}, meta)

The first parameter is the table whose metatable is being set;
the second is the metatable itself. The first input is also
the return value.

Even though key `a` exists in the metatable, it doesn't exist
in `t` itself:

    > = t.a
    nil

Only special keys in a metatable can change a table's behavior.
I'll mention a couple of these keys in just a second.

We can get a table's metatable using the built-in `getmetatable`
function, like this:

    > m = getmetatable(t)
    > = m == meta
    true

<!-- 15.3 delegating gets -->

Let's change the behavior of `t` by providing a backup table.
If a key isn't in `t`, Lua will look for it in the backup.

    > backup = {mykey = 100}
    > meta.__index = backup
    > = t.mykey
    100

`__index`, as a key in a metatable, is known to Lua as
providing a way to handle failed key lookups. If the
`__index` value is another table, then Lua will use
that other table as a backup location to find
key/value pairs.

Keys already in `t` itself will overshadow
any values in the backup table, like this:

    > t.mykey = 200
    > = t.mykey, backup.mykey
    200      100

We'll see in a minute that this functionality enables
a kind of class inheritance behavior.

<!-- 15.4 delegating sets -->

We can also overload a table's behavior when a key/value pair
is set for a new key.

This works by setting a function as the value of the
`__newindex` key in a metatable. This function
is called by Lua with the table, key, and value
being set as parameters.

Here's an example:

    > meta.__newindex = function (t, k, v) print(k, v) end
    > t.newkey = 500
    newkey    500

We tried to set a new key in `t`; `t`'s metatable
has a `__newindex` function, so that function is called
instead of setting the value.
Our function could have saved the data somewhere, but
it just printed things out.

    > = t.newkey
    nil

The `newkey` string is still not a key of `t`.

Setting values on *existing* keys of `t` does *not* call
our `__newindex` function:

    > t.mykey = 600
    -- Editor's note: nothing is printed, unlike the last set.

This `__newindex` functionality lets us make things like
read-only tables, proxy tables, or tables that take action on
every data access to them.

<!-- 15.5 rawget and rawset -->

There are two built-in functions called `rawget` and `rawset`
which can access a table's data while ignoring its metatable.

    > -- rawget, rawset

I won't cover these functions in detail, but I wanted to let
you know they exist.
