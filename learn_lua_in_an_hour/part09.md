## 9 - pairs and ipairs

<!-- 9.1 pairs -->

The `pairs` and `ipairs` functions allow us to iterate over
tables.
I'll demonstrate by defining a table with three key-value pairs:

    > t = {key1 = true, key2 = false, key3 = true}

We can use an iterator with a special form of a for loop using
the `in` keyword, like this. I'll print out all the key-value
pairs in the table.

    > for k, v in pairs(t) do print(k, v) end
    key1  true
    key3  true
    key2  false

The first loop variable - which is `k` here - gets the keys
from the table.
The second - which is `v` here - gets the values.

Tables don't store any order information about keys, and
we don't get any guarantees about the order of iteration.

I can also use a single loop variable if I only care about
the keys:

    > for k in pairs(t) do print(k) end
    key1
    key3
    key2

If I only care about the values, then I do need to use two
loop variables, but, as a convention to other programmers,
I can set an underscore `_` as the first loop variable.
This indicates that I don't really care about the value stored
in the underscore variable.

    > for _, v in pairs(t) do print(v) end
    true
    true
    false

<!-- 9.2 ipairs -->

The `ipairs` function works with arrays, so I'll define an
array with some Fibonacci numbers in it.

    > arr = {1, 1, 2, 3, 5, 8}

The syntax to use `ipairs` is the same as `pairs`, like this:

    > for k, v in ipairs(arr) do print(k, v) end
    1       1
    2       1
    3       2
    4       3
    5       5
    6       8

The difference is that `ipairs` expects its input table to
be an array, and that it iterates over keys in order starting
from 1.

To summarize, use `ipairs` to iterate over an array that needs
to be processed in order; otherwise use `pairs`.
