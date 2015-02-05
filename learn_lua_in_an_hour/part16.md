## 16 - tables as classes

<!-- 16.1 intro -->

Now let's talk about using tables as classes.

Lua doesn't directly contain classes, but it's
easy to use tables in an object-oriented way.
When I talk about classes in Lua, I just mean
tables used so that they
combine data and behavior in one place, and
where inheritance is possible.

When you treat a table as a class instance, you
want to make sure that method calls have access
to the instance. In C++ you would use the `this`
pointer; in Python you would use `self`.
Lua also uses a parameter called `self`.

I'm using the word *method* even though
Lua itself doesn't distinguish between functions
and methods - Lua sees them all as functions.
So when I say the word *method* what I mean is:
a regular Lua function that meets two conditions.

Condition 1: It's a value in a table used as a class. And,

Condition 2: It expects its first input to be a `self` parameter when it's called.

This will all become more clear with examples.

<!-- 16.2 colon syntax -->

Now is a good time to explain colon syntax for
function definitions and function calls.

The main purpose of colon syntax is to make it easier
to define and call methods on tables used as classes.

Here's how we can define a method using regular syntax:

    > t = {mynum = 343}
    > function t.f(self) print(self.mynum) end

We can call the method like this:

    > t.f(t)
    343

When you're defining a function in a table, using a colon
instead of a period inserts a first input parameter called
`self`.

    > function t:g() print(self.mynum) end

So `g` and `f` are the same.

When you call a function in a table, using a colon inserts
the table as the first parameter value passed to the function.
So this:

    > t:g()
    343

is the same as this:

    > t.g(t)
    343

That's everything about colon syntax.

<!-- 16.3 constructors -->

Let's make some example classes.

I'll make two classes. The first is a class that
can print out values from a sequence of numbers that
increase by 2 with each step.
After that, we'll make a subclass based on the
sequence of square numbers.

First I'll type out a constructor, then I'll use it,
and then I'll explain what each line does.

    > Sequence = {}
    >  function Sequence:new()
    >>   new_seq = {last_num = 0}
    >>   self.__index = self
    >>   return setmetatable(new_seq, self)
    >> end

We can use this to get a new Sequence instance
like this:

    > seq = Sequence:new()

The first constructor line creates a new table that
will be the returned instance. The second line makes
sure that `Sequence` itself has an `__index` key
pointing to itself. The purpose of this is to make
`Sequence` useful as a metatable where instances
will find their methods. The last line sets
`Sequence` as the metatable for the new instance
and returns the new instance.

<!-- 16.4 methods -->

So now we have a constructor and an instance, but
we can't actually do anything yet with the instance.
Let's change that by defining a couple methods on
the class.

    >  function Sequence:next()
    >>   return self.last_num + 2
    >> end
    >  funciton Sequence:forward(n)
    >>   for i = 1, n do
    >>     self.last_num = self:next()
    >>     print(self.last_num)
    >>   end
    >> end

Now I can print out some values in the sequence
like this:

    > seq:forward(5)
    2
    4
    6
    8
    10

You might want to pause the video to consider how
the `self` values and use of colon syntax works out.

<!-- 16.5 inheritance -->

Now for something interesting.

We defined the `forward` method in a nice general
way, so that it doesn't actually know anything about
the sequence. It just calls the `next` method, which
encapsulates the order of the sequence.

So we can make a subclass that prints out a
different sequence by overriding the `next` method.
Let's do that for square numbers.

    >  Squares = Sequence:new()
    >  function Squares:next()
    >>   local root = math.sqrt(self.last_num) + 1
    >>   return root * root
    >> end

`Squares` is a subclass, so it may be surprising to see
that it begins life as an instance of `Sequence`. But
this is a nice way to implement inheritance in Lua.
It works because classes and instances are all just
tables, and instance behavior is based entirely on
metatables.

Here is how we can use this subclass:

    > sq = Squares:new()
    > sq:forward(5)
    1
    4
    9
    16
    25

It might be useful to pause the video to see how the
constructor behaves in the call to `Squares:new`.
The constructor treats `Squares` as `self` instead
of `Sequence`, which is critical for this subclass
pattern. The result is that the `sq` instance has
`Squares` as a metatable. Calls to `self:next`,
will call the version of `next` in `Squares` instead
of the version in `Sequence`.

<!-- Note to self: a slide here might be useful -->
