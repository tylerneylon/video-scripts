## 18 - Adding a subclass

Now I'd like to extend the functionality of this script
by being able to optionally draw the x-axis and the y-axis.

I'm going to do this by subclassing the `Grapher` class.
I'll make a subclass called `AxisGrapher`.
To be honest, the point of making a subclass here instead of just
adding functionality to the existing class is to illustrate what it's
like to make a subclass.

If I were not using this in a tutorial video, I might not implement it
exactly this way.
I've set up the base class so that I really just need to override this
one function - `setup_char_table` - in order to slightly modify the
behavior of the base class.

What I'm doing here is making the call to the super class's version of
this method. I have *not* used colon syntax in that line because I
want `self` to be the value of `self` that I receive in this method
call, but if I used a colon here, then `Grapher` would be set as
`self` inside the call. In this special case, this is a case where I
cannot use colon syntax. I have to be conscious of what object owns
the method, and what `self` is. `self` might not be the same as
where the method is.

That's a special case when you call super.

What I've just done is set `c` to the column that represents the
`y=0` column - I mean `x=0` column, sorry.

Now I'm going to iterate `r` over all possible rows. I'll set that
character to be a vertical bar (`|`). We can make that a one-liner.

Let's draw the x-axis. Again, I'm going to use `range_mapper` to
map my `y=0` value into the row value, like that.
I can iterate over all columns and this time I'll use a hyphen
(`-`) as the character.

That's everything I need to do there.

If I'm being careful about parsing the command-line arguments, then
basically the way I'm going to check if they want to use axes is to
look for `-a` as a flag. If they have that flag, then I expect there
to be another argument, `arg[2]`.
I'm going to act differently depending on whether or not the first
argument is a `-a`.
If it is a `-a`, then my global variable `g` will be an `AxisGrapher`
instance. For convenience here, I'll copy over the math equation to
graph into `arg[1]`. From this point on, `arg[1]` is always the
equation to graph.

If there was no `-a`, we'll continue to use the original `Grapher`
class for the instance.

If I've done everything correctly - great!

I can even edit this instance here (the bash line) - there we go!
There's our axes.
