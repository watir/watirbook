# About Watir

![Watir Logo](https://raw.github.com/watir/watirbook/master/images/watir_logo.jpg)

What is this thing Watir, that I have decided to write a book about?

Bret Pettichord (Watir co-creator) would say that it is family of Ruby libraries that drive browsers. A bit more verbose: Watir project is a collection of open source tools (RubyGems) that drive browsers and help you automate boring and repetitive parts of functional testing of web applications, so you have more time to test with your brain.

Watir is pronounced *water*, and it stands for Web Application Testing in Ruby. It is implemented in Ruby, programming language. You have probably heard about web framework Ruby on Rails. Rails is also implemented in Ruby. Both Ruby and Watir (and Rails) are [open source](http://en.wikipedia.org/wiki/Open_source) projects. If you do not know what open source is, all you need to know fow now is that you do not have to pay anything to use it. Really, anything.

Today Watir can drive Microsoft Internet Explorer, Mozilla Firefox, Apple Safari, Google Chrome and Opera. Watir works on all major operating systems: Microsoft Windows, Apple Mac OS X and Linux.

The fact that Watir is implemented in Ruby does not mean that it can only drive web applications written in Ruby. Since Watir gems drive browsers, it does not matter at all which operating system (Windows, Linux, Mac...), programming language (C#, Java, PHP, Ruby...) or framework your web applications uses.

Since Watir is "just" a family of Ruby libraries, that means Watir code is in fact Ruby code. Why is that important? Because it means you have full access to all nice Ruby features in your tests. It also means that if you need to access databases, read or write Excel files (or any other file type), send or receive mail, you can do it from your scripts. Watir can not do all that stuff, but that functionality is either included in Ruby (reading or writing to files, for example) or there are Ruby gems that cover that functionality (databases, Excel files, sending or receiving mail...).

## What can it do?

Watir can do almost anything that user can manually do with the browser. Open a page, click a link, button, radio button, checkbox, enter text in a text field... Of course, just driving the browser does not mean it is useful for testing. It can also inspect the page currently opened in the browser. For example it can tell you the URL from the address bar, page title, list all links from the page, or just specific set of links (that have text "click", for example), or just one link (that has id "link1", for example)... Is a checkbox present on the page, is the radio button visible, what text is entered in the text field...

## What it can not do?

It is important to say that Watir CAN NOT control browser plugins like Java applets, Adobe Flash or Microsoft Silverlight. There are open source projects that can control some browser plugins.

## Recorders

Let's make it explicit at the very beginning of the book. Watir project does not have a recorder. You will even find that Watir community does not like recorders. **Really** does not like recorders. There are a few recorders available that will create Watir code, but none of them does a great job, and therefore none of them is included in the Watir project. If you are using a recorder and you have a problem, the problem is most likely in the recorder, and not in Watir. Please report all such problems to the recorder support forum or mailing list.

## Gems

Software written in Ruby is usually distributed as RubyGems file. You can just call it a gem. Watir project is consisted of a few gems.

The project started with watir gem (the whole project was named after it). It can only drive Internet Explorer on Windows. At the moment it is the best Internet Explorer driver. If you need to drive Internet Explorer, I would recommend watir gem.

The next gem that appeared was firewatir. It runs on Windows, Mac and Linux and drives Firefox, but only up to Firefox 3.6, so if you need to run Firefox 4 or newer, you can not use it. The gem is deprecated since Watir 2.0. If you want to drive Firefox, use watir-webdriver gem.

After it came safariwatir. It drives Safari, but only on Mac. There is no Windows version. Safariwatir works, but it is not in active development. There is a chance that watir-webdriver will be able to drive Safari soon. If you need to drive Safari on Mac, safariwatir is your only choice. If you need to drive Safari on Windows, you are out of luck.

For a short period of time, there was chromewatir gem. It was able to drive Chrome, but only on Windows, I think. It was back in the day when Chrome was available only on Windows. It does not work with the recent Chrome releases. If you want to drive Chrome, use watir-webdriver gem.

Celerity is the only gem that does not drive a real browser, but it emulates one. That means it is way faster but does not use your application in a way a real user would. At the moment, celerity works but it is not in active development. If you want your test to run faster, I think it would be better to drive a few headless Firefox instances. For even more speed, use more than one machine to run the tests.

Watir-webdriver gem is new and shiny. It uses WebDriver (part of Selenium project) to drive browsers. It works on Windows, Mac and Linux and can drive Internet Explorer, Firefox, Chrome and Opera. If you want to drive any of the supported browsers, I would recommend this gem. The only exception is Internet Explorer. I think watir gem has better support for it.

Operawatir is the newest gem. It is developed by Opera Software, the same company that develops Opera browser. It works on Windows, Mac and Linux and can drive Opera. It needs JRuby to run, so it complicates installation a bit. If you already have Ruby MRI installed and you want to drive Opera, I would recommend watir-webdriver gem.

In short: if you want to drive Internet Explorer, use watir gem; if you want to drive Safari, use safariwatir gem; if you want to drive Firefox, Chrome or Opera, use watir-webdriver gem.

## Alternatives

If you like the idea of testing web applications by driving real browsers, but for some reason just can not use Ruby (or you do not want to), I have good news. The success of Watir project has inspired people to create similar projects using different programming languages:

- WatiN, .NET Framework, http://watin.org/
- Watij, Java, http://watij.com/
- Win32-Watir, Perl, http://search.cpan.org/dist/Win32-Watir/
- win-control, Gambit (Lisp/Scheme), http://code.google.com/p/win-control/

WatiN and Watij are active projects. If you would prefer to drive browsers with .NET or Java, I would recommend them.

I have tried to contact authors of Win32-Watir and win-control, but did not get any response, so I could not recommend them.

Another popular tool for driving browsers is Selenium (http://seleniumhq.org/). Watir-webdriver uses WebDriver (part of Selenium project) to drive browsers, so Selenium and Watir communities are now closer than ever.



