---
layout: page
title: ES6
permalink: /es6/
---

{% for post in site.categories.ES6 %}
 <li><span>{{ post.date | date_to_string }}</span> &nbsp; <a href="{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
