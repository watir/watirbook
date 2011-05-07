# About Watir

What is this thing Watir, that I have decided to write a book about? The answer used to be pretty simple a few years ago, but it is not any more. Bret Pettichord (Watir co-creator) would say that it is family of Ruby libraries that drive browsers. (Ruby is a programming language, if you did not hear about it so far.) I would add to that that Watir is an [open source] project. If you do not know what open source is, for now it is enough that you know that you do not have to pay anything to use it. Really, anything.

I was thinking about Watir project, and I have asked myself: "So, what is an open source project, after all?"  After a lot of thinking (and a few beers) I think I know the answer. Open source project is code, documentation and community. So simple.

[open source]: http://en.wikipedia.org/wiki/Open_source

# History

## Code

Watir is fairly old project. According to github.com, [the first commit] containing Ruby code was made in October 2003. That is almost 8 years ago. In internet years, it is almost a century.

As far as I can tell, the code was first in SVN repository at RubyForge, then moved to [OpenQA] and now is at [GitHub].

License it an important part of every open source project. The very first commit had the license, and as far as I can tell, it was BSD, although it was not explicitly stated.

In January 2005, when [the first version of Watir], 1.0.1, was released (according to RubyForge) as a zip file we had some code. Zip file? Really?! Really.

Watir 1.4.1 (August 2005) was a big success, downloaded almost 45k times. That was also the first version that was available as both a gem and exe file. Watir is [23rd] on the list of top RubyForge downloads, if that means anything these days.

[Watir gem] is now hosted at RubyGems.org, all gems have over 55k downloads, and the current version (1.8.1) over 2k downloads. Watir gem is not the only gem included in the Watir project, there is also [firewatir], [commonwatir], [safariwatir], [celerity], [watir-webdriver] and the youngest one, [operawatir]. There used to be [chromewatir] gem too, but it is replaced with watir-webdriver.

There are a few frameworks that simplify writing Watir code: [taza], [watircraft], [watirloo], and [watirsplash], but only the last one is updated.

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

## Documentation

The first significant [documentation] I could find in repository was made by Bret in April 2004. When I started using Watir (March 2005) it already had pretty good documentation. It had [user guide] written by Jonathan Kohl and RDoc documentation. [RDoc] documentation is now hosted at RubyDoc.info that auto-generates it with every new release.

Internet Archive Wayback Machine says we had a [web site] since [February 2005], and around [August 2009] we moved the site to http://watir.com/. Paul Rogers registered watir.com [domain] in April 2005 (according to whois.net). Maybe [watir.org] would be better for open source project, but it was taken. Alister Scott did a great job with the web site. The plan is that all you need to know will be there, but not overwhelming like wiki. With time we were just adding more and more stuff there, maybe it is the time for a cleanup.

I am also very proud that we do not have www in front of our domain at our web site. I even tried going to www.watir.com and it redirected to watir.com. I was so proud. If you do not know what I am talking about, take a look at http://no-www.org/.

Wiki is an important part of our documentation. We had it in early stages of the project. The first web site had a link to [Web Testing with Ruby] wiki (still live, but obsolete, from [February 2004]). I do not remember having anything useful at the wiki while it was at RubyForge. We started working on the [wiki] when we moved to OpenQA. Alister did a lot of work on it, and I have moved the user guide there and renamed it to [tutorial]. We have a lot of documentation there at the moment, but it needs some love. A lot of stuff should be updated.

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
