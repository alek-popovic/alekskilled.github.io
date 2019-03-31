---
layout: post
title:  "Factory Method in Ruby"
date:   2013-01-03 20:22:00 +0100
categories: ruby
---

Creates an instance of several derived classes. Define an interface for creating an object, but let subclasses decide which class to instantiate. Factory Method lets a class defer instantiation to subclasses.

<img src="{{ "/assets/img/factory-method_pattern.png" | relative_url }}">

Example:

{% gist 8a6d3e7c6534b6a9c6cebeb6e8826c1e %}