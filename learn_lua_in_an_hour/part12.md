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

