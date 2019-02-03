---
layout: page
title: "The long version"
---

{% assign groups = site.ideas | group_by: "category" | sort: "title" %}

This page has every idea on the list, in as much detail as possible.

### Table of contents:

{% for category in site.data.idea_categories %}

*   {{ category.name }}

    {% for idea in category.ideas %}
    - [{{ idea.title }}](#{{ idea.slug }})
    {% endfor %}

{% endfor %}



{% for category in site.data.idea_categories %}

<div class="separator separator__sec" aria-hidden="true">&#9672;</div>

<h1 class="title">{{ category.name }}</h1>

{% if category.description %}
<p class="intro">
  {{ category.description | cleanup_text | smartify }}
</p>
{% endif %}

{% for idea in category.ideas %}
<h2 id="{{ idea.slug }}">{{ idea.title }} <a href="{{ idea.url }}">&infin;</a></h2>

<strong>{{ idea.summary | cleanup_text | smartify }}</strong>

{{ idea.content | cleanup_text | smartify | replace: "<h2 ", "<h3 " | replace: "</h2>", "</h3>" }}

{% if forloop.last == false %}<div class="separator" aria-hidden="true">&#9671;</div>{% endif %}
{% endfor %}

{% endfor %}
