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
In Lua, it's a convention to also use a parameter
called `self`, although this name is technically
up to the programmer.

I'm using the word *method* to talk about a special
kind of function call that has access to a
`self` variable and is bundled with a class.
Lua itself doesn't distinguish between functions
and methods - Lua sees them all as functions.
So when I say the word *method* what I mean is:
a regular Lua function that meets two conditions.

Condition 1: It's a value in a table used as a class. And,

Condition 2: It expects to receive a `self` parameter when it's called.

This will all become more clear with examples.

<!-- 16.2 colon syntax -->

Now is a good time to carefully cover colon syntax for
function definitions and function calls.

The main purpose of colon syntax is to make it easier
to define and call methods on tables used as classes.



<!-- 16.3 constructors -->

<!-- 16.4 methods -->

<!-- 16.5 inheritance -->
