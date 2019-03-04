---
layout: page
title: Ruby
permalink: /ruby/
---

{% for post in site.categories.ruby %}
 <li><span>{{ post.date | date_to_string }}</span> &nbsp; <a href="{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
