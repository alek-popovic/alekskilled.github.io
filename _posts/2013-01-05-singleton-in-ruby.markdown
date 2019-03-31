---
layout: post
title:  "Singleton in Ruby"
date:   2013-01-05 20:22:00 +0100
categories: ruby
---

A class of which only a single instance can exist. Ensure a class only has one instance and provide a global point of access to it.

The idea of the singleton pattern is that you want a class with only one instance.

<img src="{{ "/assets/img/singleton.png" | relative_url }}">

Example:

{% gist 7ff01e6d1729bf3115a2cd07a508c93d %}