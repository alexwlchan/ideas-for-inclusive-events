---
layout: page
title: "All the ideas"
---

{% assign groups = site.ideas | group_by: "category" | sort: "title" %}

This page has every idea on the list, in as much detail as possible.

### Table of contents:

{% for group in groups %}
*   {{ group.name }}
{% for idea in group.items %}
    -   <a href="#{{ idea.slug }}">{{ idea.title }}</a>
{% endfor %}

{% endfor %}


{% for group in groups %}

<div class="separator separator__sec" aria-hidden="true">&#9672;</div>

<h1 class="title">{{ group.name }}</h1>

{% for idea in group.items %}
<h2 id="{{ idea.slug }}">{{ idea.title }} <a href="{{ idea.url }}">&infin;</a></h2>

**{{ idea.summary | cleanup_text | smartify }}**

{{ idea.content | cleanup_text | smartify | replace: "<h2 ", "<h3 " | replace: "</h2>", "</h3>" }}

{% if forloop.last == false %}<div class="separator" aria-hidden="true">&#9671;</div>{% endif %}

{% endfor %}

{% endfor %}
