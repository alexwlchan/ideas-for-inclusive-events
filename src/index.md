---
layout: page
---

<p class="intro">
  For better or for worse, conferences and meetups are really important for career development.
  Sharing ideas, having conversations, meeting new people -- if you can't attend, you miss out on a lot of these opportunities.
</p>

<p class="intro">
  <strong>It's important to open these events to as wide a range of people as possible, and make them feel welcome when they attend.</strong>
  It addresses a serious source of unfairness, and everyone benefits from having a wider diversity of people and ideas.
</p>

I'm always fascinated by the things organisers do to make events more inclusive and accessible.
That could be live captioning of talks.
Thoughtfully designed name badges.
A diversity scholarship.
The list goes on, and now the best ideas I've seen are all here.

This mini-site started as a [blog post I wrote in August 2018](https://alexwlchan.net/2018/08/inclusive-conferences/), listing all the ideas I'd seen.
I got lots of good feedback and suggestions -- but nowhere to put them!
A blog post is a point-in-time snapshot; I wanted something I could continually update and improve.

If you organise an event, you can take these ideas to make your events more inclusive and accessible.

If you attend, speak at, or sponsor an event, you have power -- you can ask for these accommodations where they don't already exist.
Be picky about where you choose to participate, and walk away from events that don’t meet your standards.

This page has a list of all the ideas, and a brief summary.
Each idea also has an individual page that goes into more detail, and there's [another page]({{ site.url }}/long-versions/) that contains all the detail in one, single, searchable page -- just like that original blog post.

All the source code for the site is [on GitHub]({{ site.github_repo }}).
The site was last updated on {{ site.time | date: site.date_format }}.


# Acknowledgements

Most of these aren't original ideas -- this is a collection of other people's ideas, either from conferences I've attended myself or followed online.

I've helped organise [PyCon UK](https://2018.pyconuk.org/) for the last three years, and there's heavy reference to it throughout -- but most of these ideas predate my involvement.

For a list of all the conferences and people who influenced this site, check out the [acknowledgements page]({{ site.url }}/other-awesome-people/).



# Putting it into practice

I hope these ideas are useful, and you can use them to make your events more inclusive.

This list is long -- **don't feel bad if you can't do all of it**.
I’ve never seen a conference that implements all of these, or even most of them. Some of this is expensive (either in time or money), and you can’t do it all.
It's a list of suggestions, not absolute requirements.

Just do your best – **some improvements are better than no improvements**. Anything you can do to make your event more inclusive is a worthwhile thing to do.
And in many cases, they'll help more than just the intended group.
For example, [live captioning]({{ site.url }}/ideas/live-captioning/) is usually meant for the deaf and hard-of-hearing, but it benefits other attendees as well!

Here’s a useful rule of thumb: **explicit is better than implicit**.
The more you think about this, and the more detail you provide, the easier it is for somebody to decide if they’ll feel welcome at your event.
And if you’ve clearly thought about it already, it’s easier for somebody to ask for an accommodation you haven’t thought of – because they’re more likely to get a positive response.
Saying you can’t do something is more useful than an empty page.

Now go plan an awesome conference!


# You missed something!

This list is almost certainly incomplete, and reflects the conferences I’m most interested in. You’ll have other ideas I haven’t thought of – I’d love to hear about them. Maybe they’ll appear in a future version!

Did I miss an idea?
Make a mistake?
Overlook a critical requirement?

Let me know -- send me [an email]({{ site.email | encode_mailto }}), drop me [a tweet](https://twitter.com/{{ site.twitter }}), or [open an issue]({{ site.github_repo }}/issues/new) on GitHub.

<h1 id="short-version">The short version</h1>

{% for category in site.data.idea_categories %}

### {{ category.name }}

{% if category.description %}
  {{ category.description | cleanup_text | smartify }}
{% endif %}

{% for idea in category.ideas %}
* [{{ idea.title }}.]({{ site.url }}{{ idea.url }}) {{ idea.summary | cleanup_text | smartify }}
{% endfor %}

{% endfor %}
