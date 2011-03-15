# Introduction

Watir is an open source tool that drives browsers and helps you automate boring and repetitive parts of functional testing of web applications, so you have more time to test with your hands (and brain).

It can drive Microsoft Internet Explorer, Mozilla Firefox, Apple Safari and Google Chrome. In the near future (when Watir 2.0 is released) it should also be able to drive Opera.

Watir works on all major operating systems: Microsoft Windows, Apple Mac OS X and Linux.

There is also a project named Celerity that uses the Watir API, but does not drive a real browser, it emulates one. That means that it is way faster and does not use your application in a way a real user would. You should make the decision if speed or accuracy is more important to you. Of course, you can always have some tests in a real browser and some in Celerity.

Watir is just a Ruby library, so you have full access to all nice Ruby features in your tests.

At the moment Watir runs in Ruby MRI (or CRuby) and Celerity runs in JRuby. There is a patch to drive Firefox on JRuby, but it is not officially supported at the moment.

Watir 2.0 will use Selenium's WebDriver to drive browsers.

Watir can not control browser plugins like Java applets, Adobe Flash or Microsoft Silverlight. There are open source projects that can control some browser plugins.

If you like Watir, but for some reason just can not use Ruby, I have good news. Watir is ported to .NET (WatiN) and Java (Watij).

\newpage

