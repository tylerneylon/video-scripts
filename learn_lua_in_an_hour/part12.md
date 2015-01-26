## 12 - require and modules

<!-- 12.1 require/module intro -->

The `io` table is an example of a module.
The word *module* in Lua basically means a library.
The built-in `require` function is the standard way
of including modules.
It's sort of like an `import` statement in Python or a
`#include` in C-like languages.

<!-- 12.2 the vec.lua module -->

In order to demonstrate modules, I'll build a simple
one called `vec.lua` (code below, typed in sync with this text).
This will be a module that works with two-dimensional vectors.

I'll start by defining a function that computes the norm of
a vector.
The *norm* of a vector is basically its distance from zero.

I'll also define a distance function which computes the
distance between
any two given two-dimensional vectors

I can reuse the `norm` function
to help me with that calculation, like this.

Remember that chunks are compiled as the body of a function,
so a good way to get the `vec` table out
is to return the value.

    -- In the file vec.lua:

    local vec = {}

    vec.norm = function (x, y)
      return math.sqrt(x * x + y * y)
    end

    vec.dist = function(x1, y1, x2, y2)
      return vec.norm(x1 - x2, y1 - y2)
    end

    return vec

<!-- 12.3 loadfile and dofile -->

Next I'm going to describe three functions building up
in complexity to the `require` function.

Simplest is the `loadfile` function, which loads a Lua file,
compiles it as a chunk, and then returns a function which will
execute that chunk.

    > f = loadfile('vec.lua')

`loadfile` itself does not actually run the code.
If I call the function, then the code is finally run.

    > vec = f()

Now I should have a table in the `vec` variable, and I
can call functions on it -- for example, here's the norm
of `(1, 1)`:

    > = vec
    table: 0x7f91e1d14070
    > = vec.norm(1, 1)
    1.4142135623731

The next function in complexity is the function `dofile`,
which works similarly to `loadfile`, except that it also
takes the extra step of actually executing the code
and returning the value from the chunk.

    > v = dofile('vec.lua')

So `v` will
have the same functions as `vec` above.

    > = v
    table: 0x7f91e1d145c0
    > = v.norm(1, 2)
    2.2360679774998

<!-- 12.4 require -->

The last function that I'll describe is the `require` function.

The first difference you'll notice is that I don't have to add
the `.lua` filename extension at the end.

    > v2 = require('vec')

Now this is actually a different table than the previous two values,
although it has the same functionality.

    > = v2
    table: 0x7f91e1f15780
    > = v2.norm(1, 3)
    3.1622776601684

One difference between `require` and `dofile`
is that `require` caches its values.
So if I call it again with the same input, it will actually give me
the same return value as before, as opposed to re-executing the module.

    > v3 = require('vec')
    > = v2 == v3
    true

The final difference is that `require` searches through a path
specified in the `package.path` string.

    > = package.path
    ./?.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;/usr/local/lib/lua/5.1/?.lua;/usr/local/lib/lua/5.1/?/init.lua

So it will look in multiple locations for your Lua files.

It's a common practice to assign the return value of a `require` call
to a variable of the same name as the module, like this:

    > io = require('io')
