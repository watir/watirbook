# Introduction

Watir project is a collection of open source tools (Ruby gems) that drives browsers and helps you automate boring and repetitive parts of functional testing of web applications, so you have more time to test with your brain.

It can drive Microsoft Internet Explorer, Mozilla Firefox, Apple Safari, Google Chrome and Opera.

Watir works on all major operating systems: Microsoft Windows, Apple Mac OS X and Linux.

Celerity is the only gem that does not drive a real browser, it emulates one. That means that it is way faster but does not use your application in a way a real user would. You should make the decision if speed or accuracy is more important to you. Of course, you can always have some tests in a real browser and some in Celerity.

Watir is "just" a family of Ruby libraries, so you have full access to all nice Ruby features in your tests.

At the moment Watir runs on Ruby MRI (or CRuby), Celerity and OperaWatir run on JRuby.

Watir-webdriver gem uses WebDriver (part of Selenium project) to drive browsers.

Watir can not control browser plugins like Java applets, Adobe Flash or Microsoft Silverlight. There are open source projects that can control some browser plugins.

If you like Watir, but for some reason just can not use Ruby, I have good news. Watir is ported to .NET (WatiN) and Java (Watij).

\newpage

