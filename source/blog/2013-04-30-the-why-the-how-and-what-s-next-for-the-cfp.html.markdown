---
title: "The why, the how and what’s next for the CfP"
date: 2013-04-30 23:38 EEST
tags: cfp, euruko, speakers, proposals
authors: nikosd, apantsiop
---

When we first started organizing EuRuKo 2013 we made the following question to ourselves:

> **What are the most important aspects of the conference?**

and we all agreed on the following:

1. Quality of presentations
2. Socializing and friendly atmosphere

Everything else follows and is of lower priority.

We handled the second early in the process by putting a lot of effort in trying to find the best possible venue without exceeding the budget.
And we believe we really nailed it! Then it was time to find the best possible solution to the most important aspect of the conference: the presentations.

Before continuing, we should mention that EuRuKo is a special kind of event: it’s non-profit and organized by the community for the community.
This means it carries some special opportunities but also many special challenges.

Goals
-----

What we wanted to achieve is simple: high quality of presentations from the most diverse possible team of presenters.
We don’t believe that these two are contradictory, quite the opposite, the one re-enforces the other.
Still though, there were some challenges that needed to be faced:

* Encourage proposal submission by everyone (including “newbies”, minorities, etc)
* Encourage refinements on proposals
* Make sure that the selection process is neutral, fair and unbiased
* Make sure that the most interesting proposals are actually selected by the community

And...
------

As you [should](/blog/2013-03-28-call-for-presentations/)
[already](/blog/2013-04-13-ten-days-before-the-cfp-closes-and/)
[have](/blog/2013-04-22-oh-my-cfp-submissions-coming-to-an-end-what-s-next-stats-and-more/)
[noticed](/blog/2013-04-28-taking-off-the-cfp-masks-the-ones-who-made-it-in-the-shortlist/)
the CfP process was a rather long and community driven process so far.
It took more than _500 registered users_, _250 suggestions_, almost _3.000 casted votes_ and something less than _30.000 impressions_
to come up with **[30 astonishing proposals](http://cfp.euruko2013.org/proposals)** that made it to the shortlist.

These 30 proposals will now give one last eponymous fight in order to be presented during EuRuKo 2013.
And let’s not forget all those other proposals that didn’t make it: most of them (if not all of them) could be easily chosen instead.
If you check the ratings, the numbers are amazingly close. And this is where the ranking algorithm comes in...

How did the proposals get chosen?
---------------------------------

Before we answer this question, let’s answer the following ones:

1. What constitutes a good indication of interestingness?
2. What makes a bad indication of interestingness?
3. What makes a bad judge?

With a little simplyfication, here are some answers:

**Good indications of interestingness**

* Engagement
* Popularity
* Explicit preference
* Ratios instead of absolute raw numbers (or vanity metrics)

**Bad indications of interestingness**

* Bad data
* Easily exploitable data

**Bad judges**

* Unfair and/or biased to specific proposals or authors
* Irrelevant to the domain

Now, let’s go back to the original question: _how did the proposals get chosen?_

**First of all the ingredients (a.k.a the metrics):**

1. Ratio of “upvotes” to total votes
2. Ratio of unique user impressions for a specific proposal (a.k.a. how many users viewed this proposal) to total unique user impressions for all proposals (a.k.a. how many users viewed at least one proposal)

**Then the recipe (a.k.a the algorithm):**

1. Calculate the confidence interval for the votes ratio using the Wilson score interval
2. Do the same for the impressions ratio
3. Weight them giving a heavy preference to votes over impressions
4. Sum them up
5. Rank the proposals based on the above number
6. Select the first 30 proposals from unique authors

**And the special secret spice (a.k.a the exceptions):**

1. Before executing the recipe, exclude users with very little engagement in order to not skew the results

What’s next?
------------

Now, it’s the time we define the final lineup for EuRuKo 2013.
We choose the exact 10 talks we would like to see in order of preference.
We organise a really awesome conference.
And by saying ‘we’, we mean the delegates, the organisers, the volunteers, the supporters, the sponsors and all the ruby community which will watch or read the presentations online.

P.S.: Tickets won’t be available for much longer, so [grab yours now](https://www.eventora.com/en/Events/euruko-2013-athens) and come to Athens for an awesome summer.

References
----------

* [http://en.wikipedia.org/wiki/Binomial_proportion_confidence_interval](http://en.wikipedia.org/wiki/Binomial_proportion_confidence_interval)
* [http://www.ucl.ac.uk/english-usage/staff/sean/resources/binomialpoisson.pdf](http://www.ucl.ac.uk/english-usage/staff/sean/resources/binomialpoisson.pdf)
* [http://www.evanmiller.org/how-not-to-sort-by-average-rating.html](http://www.evanmiller.org/how-not-to-sort-by-average-rating.html)
* [http://possiblywrong.wordpress.com/2011/06/05/reddits-comment-ranking-algorithm/](http://possiblywrong.wordpress.com/2011/06/05/reddits-comment-ranking-algorithm/)
* [http://amix.dk/blog/post/19588](http://amix.dk/blog/post/19588)
* [http://blog.reddit.com/2009/10/reddits-new-comment-sorting-system.html](http://blog.reddit.com/2009/10/reddits-new-comment-sorting-system.html)
* [https://github.com/euruko2013/vestibule/blob/master/app/models/proposal.rb](https://github.com/euruko2013/vestibule/blob/master/app/models/proposal.rb)
