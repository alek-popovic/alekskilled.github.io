---
layout: page
title: Rails
permalink: /rails/
---

{% for post in site.categories.rails %}
 <li><span>{{ post.date | date_to_string }}</span> &nbsp; <a href="{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
