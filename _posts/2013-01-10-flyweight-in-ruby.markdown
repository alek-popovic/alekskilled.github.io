---
layout: post
title:  "Flyweight in Ruby"
date:   2013-01-10 20:22:00 +0100
categories: ruby
---

A fine-grained instance used for efficient sharing. Use sharing to support large numbers of fine-grained objects efficiently. A flyweight is a shared object that can be used in multiple contexts simultaneously. The flyweight acts as an independent object in each context — it’s indistinguishable from an instance of the object that’s not shared.

<img src="{{ "/assets/img/flyweight-uml.svg" | relative_url }}">

Example:

{% gist dbe2e8620e9bee2da92a5f261d091e28 %}