# About Watir

What is this thing Watir, that I have decided to write a book about? The answer used to be pretty simple a few years ago, but it is not any more. Bret Pettichord (Watir co-creator) would say that it is family of Ruby libraries that drive browsers. (Ruby is a programming language, if you did not hear about it so far.) I would add to that that Watir is an [open source] project. If you do not know what open source is, for now it is enough that you know that you do not have to pay anything to use it. Really, anything.

I was thinking about open source, and I have asked myself: "So, what is an open source project, after all?"  After a lot of thinking (and a few beers) I think I know the answer. Open source project is code, documentation and community. So simple.

[open source]: http://en.wikipedia.org/wiki/Open_source

# History

## Code

Watir is fairly old project. According to github.com, [the first commit] containing Ruby code was made in October 2003. That is almost 8 years ago. In internet years, it is almost a century.

As far as I can tell, the code was first in SVN repository at RubyForge, then moved to SVN repository at [OpenQA] and now is git repository at [GitHub].

License it an important part of every open source project. The very first commit had the license, and as far as I can tell, it was BSD, although it was not explicitly stated.

In January 2005, when [the first version of Watir], 1.0.1, was released as a zip file (according to RubyForge) we had some code. Zip file? Really?! Really. RubyGems did not exist back then. And you thought I was joking when I sad it is almost a century in internet years.

Watir 1.4.1 (August 2005) was a big success, downloaded almost 45k times. That was also the first version that was available as both a gem and exe file. Watir is [23rd] on the list of top RubyForge downloads, if that means anything these days.

[Watir gem] is now hosted at RubyGems.org, all gems have over 55k downloads, and the current version (1.8.1) over 2k downloads. Watir gem is not the only gem included in the Watir project, there is also [firewatir], [commonwatir], [safariwatir], [celerity], [watir-webdriver] and the youngest one, [operawatir]. There used to be [chromewatir] gem too, but it is replaced with watir-webdriver.

There are a few frameworks that simplify writing Watir code: [taza], [watircraft], [watirloo], and [watirsplash], but only the last one is updated.

There is even one fork of Watir project, [Vapir]. Ethan (he never said his last name) created a fork in May 2010.

[the first commit]: https://github.com/bret/watir/commit/aca359922c6b3db2ec8329ea0b26c186b00e0bb5
[OpenQA]: http://svn.openqa.org/fisheye/browse/watir
[GitHub]: https://github.com/bret/watir
[the first version of Watir]: http://rubyforge.org/frs/?group_id=104&release_id=41300
[23rd]: http://rubyforge.org/top/toplist.php?type=downloads
[Watir gem]: https://rubygems.org/gems/watir
[firewatir]: https://rubygems.org/gems/firewatir
[commonwatir]: https://rubygems.org/gems/safariwatir
[safariwatir]: https://rubygems.org/gems/commonwatir
[celerity]: https://rubygems.org/gems/celerity
[watir-webdriver]: https://rubygems.org/gems/watir-webdriver
[operawatir]: https://rubygems.org/gems/operawatir
[chromewatir]: https://rubygems.org/gems/chromewatir
[taza]: https://rubygems.org/gems/taza
[watircraft]: https://github.com/bret/watircraft/
[watirloo]: https://rubygems.org/gems/watirloo
[watirsplash]: https://rubygems.org/gems/watirsplash
[Vapir]: http://vapir.org/

## Documentation

The first significant [documentation] I could find in repository was made by Bret in April 2004. When I started using Watir (March 2005) it already had pretty good documentation. It had [user guide] written by Jonathan Kohl and RDoc documentation. [RDoc] documentation is now hosted at RubyDoc.info that auto-generates it with every new release.

Internet Archive Wayback Machine says we had a [web site] since [February 2005], and around [August 2009] we moved the site to http://watir.com/. Paul Rogers registered watir.com [domain] in April 2005 (according to whois.net). Maybe [watir.org] would be better for open source project, but it was taken. Alister Scott did a great job with the web site. The plan is that all you need to know will be there, but not overwhelming like wiki. With time we were just adding more and more stuff there, maybe it is the time for a cleanup.

I am also very proud that we do not have www in front of our domain at our web site. I even tried going to www.watir.com and it redirected to watir.com. I was so proud. If you do not know what I am talking about, take a look at http://no-www.org/.

Wiki is an important part of our documentation. We had it in early stages of the project. The first web site had a link to [Web Testing with Ruby] wiki (still live, but obsolete, from [February 2004]). I do not remember there was anything useful at the wiki while it was at RubyForge. We started working on the [wiki] when we moved to OpenQA. Alister did a lot of work on it, and I have moved the user guide there and renamed it to [tutorial]. We have a lot of documentation there at the moment, but it needs some love. A lot of stuff should be updated.

We have a [bug tracker] at OpenQA. Previously it was at RubyForge, for firewatir at Google Code, and for safariwatir at GitHub. All of them are now at OpenQA.

Since October 2007 we have [Google Custom Search] that searches all Watir related sites but nothing else. It was usually embedded or linked from our web page.

[documentation]: https://github.com/bret/watir/commit/099d95c6189e1cec1bf010ead639f29191195ed4
[RDoc]: http://rubydoc.info/gems/watir
[user guide]: http://replay.waybackmachine.org/20050115054556/http://wtr.rubyforge.org/watir_user_guide.html
[web site]: http://replay.waybackmachine.org/20050206120226/http://wtr.rubyforge.org/
[February 2005]: http://waybackmachine.org/20050901000000*/http://wtr.rubyforge.org
[August 2009]: http://watirpodcast.com/26-alister-scott-on-watir-com/
[domain]: http://www.whois.net/whois/watir.com
[watir.org]: http://www.whois.net/whois/watir.org
[Web Testing with Ruby]: http://www.clabs.org/wtr/
[February 2004]: http://web.archive.org/20040415000000*/http://www.clabs.org/wtr/
[wiki]: http://wiki.openqa.org/display/WTR/Project+Home
[tutorial]: http://wiki.openqa.org/display/WTR/Tutorial
[bug tracker]: http://jira.openqa.org/browse/WTR
[Google Custom Search]: http://bit.ly/watirsearch

## Community

[Wtr-general] mailing list exists from October 2003, about the same time when the first commits were made to the code, but way back then the list was not about Watir as we know it today. It was about a larger topic, web testing in Ruby. We moved wtr-general from RubyForge to OpenQA, and from there to [Google Groups].

Wtr-general says Watir project was stared by Chris Morris, Johnatan Kohl, Bret Pettichord and Paul Rogers.

We also have [wtr-development] mailing list at RubyForge, and it is still there. One of the rare things we did not move around. We have even managed to make Jira bug tracker send mail to wtr-development when any ticket is created or changed. I think it makes the developers more aware of the problems people have.

We had [wtr-core] group at RubyForge for a while, but that is not active any more.

I see spam at other lists from time to time, but I think we managed to keep our lists clean, polite and productive.

In the past 2,5 years I have been pushing [Stack Overflow] as "the" place to get Watir support, but had little luck, up until recently. I think in the last few weeks or months, almost every day a new question is posted there. Some people also started participating, and I am really happy for that. We have also tried to create a separate [Watir Stack Exchange] site, but that failed. I think it was good that we have tried, at least we created some buzz around Stack Overflow/Exchange. There is 256 questions tagged Watir there. (Nice, round number.) We finally have enough active users to get the questions answered.

I have started recording [Watir podcast] in May 2008, and that makes us one of the rare projects that has it's own podcast. It is hard to tell how much impact the podcast has. I like to think that it gives us a human face (well, human voice at least). So far I have recorded 44 episodes. I started using podtrac (for tracking how many times a podcast is downloaded) in December 2009 and since then we had about 300-400 downloads per episode. Episode [#26] with Alister (we were talking about moving our web site to watir.com) is interesting. I am not sure why, but it has about three times more unique and total downloads than any other show. I guess I will have to have him on the show more frequently. I am not sure what I will do with the podcast in the future. My current plan is to reduce the size of the episodes to 5-15 minutes. Also, it is interesting that old episodes are still downloaded, even the very first one.

One of the first "real" marketing adventures was free ad at stackoverflow.com. It is hard to measure how successful it was. We did it two times ([January 2010] and [June 2010]). I could not find any numbers on how successful the ad was, but additional exposure could not hurt. The [third round] is up right now, but I did not have the time to create an ad yet.

We also have #watir [IRC] channel at freenode, but I never got used to hanging out there. When I have the time, nobody is there. When I have to work I usually shut down mail, messengers and stuff like that to reduce distractions.

People have been [blogging] about Watir. We have a list of people that mostly blog about Watir at our web site.

I remember seeing articles about Watir in print magazines, I wrote one for a local computer [magazine].

I am sure I am not the only one that speaks about Watir at local [conferences] and meet-ups. We even organized a few conferences specifically about Watir: [AWTA] in Austin, Texas (2000-2009); [Watir Day] in San Francisco, California (2011).

[Wtr-general]: http://rubyforge.org/pipermail/wtr-general/
[Google Groups]: http://groups.google.com/group/watir-general/
[wtr-development]: http://rubyforge.org/pipermail/wtr-development/
[wtr-core]: http://rubyforge.org/pipermail/wtr-core/
[Stack Overflow]: http://stackoverflow.com/tags/watir
[Watir Stack Exchange]: http://watirpodcast.com/35-zeljko-filipin-on-watir-stack-exchange-site/
[Watir podcast]: http://watirpodcast.com/
[#26]: http://watirpodcast.com/26-alister-scott-on-watir-com/
[January 2010]: http://meta.stackoverflow.com/questions/31913/open-source-advertising-sidebar-1h-2010/38414#38414
[June 2010]: http://meta.stackoverflow.com/questions/53346/open-source-advertising-sidebar-2h-2010/53544#53544
[third round]: http://meta.stackoverflow.com/questions/74983/open-source-advertising-sidebar-1h-2011
[IRC]: http://wiki.openqa.org/display/WTR/The+IRC+Channel
[blogging]: http://watir.com/blogs/
[magazine]: http://www.vidilab.com/digitalvidi/arhiva/vidi158/index.php
[conferences]: http://zeljkofilipin.com/category/self-education/events/
[AWTA]: http://awta.wikispaces.com/AWTA
[Watir Day]: http://watir.com/watir-day/

# Today

## Code

If you are just starting using Watir, I would suggest that you start with watir-webdriver gem. I think it is the future of Watir project. Some time in the future we will probably no longer develop other gems, just watir-webdriver. It will probably not happen soon (in the next few months), but it might be sooner than you expect.

If you are already using Watir, you can continue to use the gem(s) you have used so far. The only exception is firewatir gem. It can not drive Firefox 4. Good new is that watir-webdriver gem can. So, if you have to drive Firefox 4, start moving your tests to watir-webdriver. If you are still using Firefox 3, you can use either firewatir or watir-webdriver.

Jari Bakken, creator of watir-webdriver gem, also created celerity gem. If you have a need for headless browser driver, take a look at celerity. There is also headless driver in watir-webdriver, but I did not have the time to play with it so far, so I could not recommend it. My guess is that it is pretty usable, but that is only a guess.

Andreas Tolf Tolfsen, lead developer of operawatir gem says Opera should be supported via watir-webdriver gem in the near future. Until then, if you need to drive Opera, use operawatir, but have in mind that you might need to move to watir-webdriver soon.

Safariwatir was created by Dave Hoover in July 2006. Tom Copeland (of RubyForge fame) took over the project in October 2009. Safariwatir was never really popular, but it was there, waiting for somebody to take care of it. If you need to drive Safari on Mac (safariwatir does not work on Windows) give it a try. There is a rumor that watir-webdriver will be able to drive Safari in the future.

## Community

We have created [watir] account at twitter.com (June 2009). It is pretty active. Alister and I post there when there is something significant, like new releases or blog posts. I also used it to link to new Stack Overflow questions, but not any more. It has 242 followers at the moment. We used to display tweets with [#watir] hash tag at the Watir web site, but it got flooded with _a lot_ of posts in some strange language. At the moment, all posts containing [@watir] will appear in the sidebar of watir.com.

We had a [LinkedIn] group for some time (April 2008) with 554 members, but just recently I started posting relevant Watir links there. Usually the same stuff as Twitter account.

Since all the cool kids are at Facebook, so are we. I have created the account a few months ago but I did not have the time to start using it since this February (2011). I wanted facebook.com/watir url, but it is taken, so I took facebook.com/[watirproject]. Usually the same stuff gets posted there as all other social media we use. 82 likes so far.

I was hoping we would get some interaction at Twitter, LinkedIn and Facebook, but it is pretty quiet so far.

We started receiving donations at watir.com via PayPal since 2009 and via [Pledgie] since at least January 2010. Andreas suggested we start using [Flattr] in March 2011. We have received about $1000 in donations.

[watir]: https://twitter.com/#!/watir
[#watir]: https://twitter.com/#!/search/%23watir
[@watir]: https://twitter.com/#!/search/%40watir
[LinkedIn]: http://www.linkedin.com/groups?about=&gid=88535&trk=anet_ug_grppro
[watirproject]: https://www.facebook.com/watirproject
[Pledgie]: http://pledgie.com/campaigns/2982
[Flattr]: https://flattr.com/thing/141470/Watir
