---
layout: post
title:  "Objects and Classes"
date:   2018-10-09 12:29:52 +0200
categories: The Ruby Object Model and Metaprogramming
---
In `Ruby` programming language to understand `Ruby Object Model` and `Metaprogramming` we have to start with the three most basic and most important things:

{% highlight ruby %}
#=> Objects.
{% endhighlight %}

We will look at `objects` and see what `objects` are.

{% highlight ruby %}
#=> Self.
{% endhighlight %}

We will look at the `magical` word `self` and the `current object`.

{% highlight ruby %}
#=> Current class.
{% endhighlight %}

We'll look at something that's as `hidden` from your idea of a `current class` that is used by an `interpreter`.

Before we start talking about all these `cool` things, I need to tell you something. If you came from some other world like `Java, C#, PHP` or some other object-oriented programming language, or come from a commercial environment where people tell you that you need to `design your code` right before you start.

For such people, designing a code means and looks like something like `this`:

<img src="{{ "/assets/img/UML-Class-Diagram.png" | relative_url }}">

What is this? This is the `UML class diagram`. This is a `static` representation of the structure of your `program`, or even more precisely a `static` representation of `classes` in your `program`. Programmers with `decades` of experience will tell you this is the `right` and only `correct` way to create `object-oriented code`. But unfortunately this is `not true`.

When considering `object-oriented programming`, we need to think about `objects` rather than the `static connection` between `classes`.

We will look more at `objects` than to `classes`, of course the `classes are always present`, but they are only `helpers` that `objects can be created`, even when it comes to `class`, we will look at them as `objects`.

Therefore, from the previous text, we can conclude that we should stop using `class-oriented programming` and try to start using `object-oriented programming`.

Basically in `object-oriented programming` we have a very `simple equation`:

{% highlight ruby %}
  State
  ----------
  + Behavior
  ----------
  Object
  ----------
#=> State plus behavior is an object!!!
{% endhighlight %}

Let's explain this differently:

The `object` is defined by its:

{% highlight ruby %}
  ----------
  State
  ----------
#=> data that is in the object!!!
{% endhighlight %}

{% highlight ruby %}
  ----------
  Behavior
  ----------
#=> Behavior what object do!!!
{% endhighlight %}

Let's look at this on a concrete case:

{% highlight ruby %}
# frozen_string_literal: true

require 'date'

# Drummer class
class Drummer
  def initialize(nick_name, first_name, last_name, birth_date, drum_kit)
    @nick_name  = nick_name
    @first_name = first_name
    @last_name  = last_name
    @birth_date = Date.parse(birth_date)
    @drum_kit   = drum_kit
  end

  def nickname
    @nick_name
  end

  def birthday
    @birth_date
  end

  def full_name
    "#{@my_first_name} #{@my_last_name}"
  end

  def kit
    @drum_kit
  end
end
{% endhighlight %}
