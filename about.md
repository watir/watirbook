# About Watir

What is this thing Watir, that I have decided to write a book about?

The answer used to be pretty simple a few years ago, but it is not any more. Bret Pettichord (Watir co-creator) would say that it is family of Ruby libraries that drive browsers. (Ruby is a programming language, if you did not hear about it so far.)

Watir project is a collection of open source tools (RubyGems) that drive browsers and help you automate boring and repetitive parts of functional testing of web applications, so you have more time to test with your brain.

It can drive Microsoft Internet Explorer, Mozilla Firefox, Apple Safari, Google Chrome and Opera. Watir works on all major operating systems: Microsoft Windows, Apple Mac OS X and Linux. At the moment most Watir gems run on Ruby MRI (or CRuby), and Celerity and OperaWatir run on JRuby.

Celerity is the only gem that does not drive a real browser, it emulates one. That means that it is way faster but does not use your application in a way a real user would. You should make the decision if speed or accuracy is more important to you. Of course, you can always have some tests in a real browser and some in Celerity.

Watir-webdriver gem is new and shiny. It uses WebDriver (part of Selenium project) to drive browsers.

Since Watir is "just" a family of Ruby libraries, that means Watir code is in fact Ruby code. Why is that important? Because it means you have full access to all nice Ruby features in your tests.

It is important to say that Watir CAN NOT control browser plugins like Java applets, Adobe Flash or Microsoft Silverlight. There are open source projects that can control some browser plugins.

If you like Watir, but for some reason just can not use Ruby, I have good news. Watir is ported to .NET (WatiN) and Java (Watij).

Watir is also an [open source] project. If you do not know what open source is, for now it is enough that you know that you do not have to pay anything to use it. Really, anything.

[open source]: http://en.wikipedia.org/wiki/Open_source

\newpage

