---
layout: post
title:  "Liskov Substitution Principle in Ruby"
date:   2012-04-20 20:22:00 +0100
categories: ruby
---

Many developers find the Liskov Substitution Principle (LSP) tangled and complicated. This is how Robert Martin defines the LSP principle: “Subclasses should add to a base class’s behaviour, not replace it.” In a more informal interpretation, the principle states that parent instances should be replaceable with one of their child instances without creating any unexpected or incorrect behaviour. Therefore, LSP ensures that abstractions are correct, and helps developers achieve more reusable code and better organize class hierarchies.

Now that we know what the LSP principle is getting at, let’s consider a piece of code that violates LSP. In the example below, we are implementing user statistics. There are two classes: a base class (UserStatistic) and its child class (AdminStatistic). The child class violates the LSP principle since it completely redefines the base class by returning a string with filtered data, whereas the base class returns an array of posts.

{% gist 5dfbc11ad808b9b70c4a427d8cce9869 %}

Now let’s see how we refactored the code so it conforms to the Liskov substitution principle:

{% gist 131d4a09fd2554aba25f32434157fc69 %}

To comply with the LSP principle, we can segregate the filtration logic and the statistics string generation logic into two methods: “posts“ and “formatted_posts“. Therefore, we refactored the method posts that filtrates user posts, so the method returns the same type of data as the base class.