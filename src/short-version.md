---
layout: page
title: The short version
---

{% for category in site.data.idea_categories %}

### {{ category.name }}

{% if category.description %}
  {{ category.description | cleanup_text | smartify }}
{% endif %}

{% for idea in category.ideas %}
* [{{ idea.title }}.]({{ site.url }}{{ idea.url }}) {{ idea.summary | cleanup_text | smartify }}
{% endfor %}

{% endfor %}

## [That's great, but I want more detail!]({{ site.url }}/short-version/)
