# Installation 

Because Watir is a Ruby library, you have to install Ruby first.

For Windows, there is one click installer. Ruby is probably already installed on Mac and Linux. Type `ruby -v` in command prompt to see if you have it installed. On Mac it will look something like this:

    $ ruby -v
    ruby 1.8.6 (2008-08-11 patchlevel 287) [universal-darwin9.0]

If you get an error message, please go to Ruby web site and follow instruction how to install it.

Ruby 1.8.6 is recommended on all platforms.

Ruby has a package system called Ruby gems, and Watir is released as a gem. 

Watir installation is different on each operating system. Only Firefox is available for all major operating systems, and other browsers are available only on some platforms. Hence, you can not install all browser drivers on all platforms.

Depending of your platform, there are a few choices. On all platforms, you have to update Ruby gems first.

On Windows:

    gem update --system

On Mac and Linux:

    sudo gem update --system

If Ruby gems are already up to date, you will get a message saying: `Nothing to update`.

The next step is installing Watir.

On Windows:

    gem install watir

It will install drivers for Internet Explorer and Firefox.

On Mac:

    sudo gem install firewatir
    sudo gem install safariwatir

The first line will install driver for Firefox, and the second one for Safari. If you plan to use only one driver, feel free to install only one.

On Linux:

    sudo gem install firewatir

Firefox drivers need JSSH extension for Firefox installed. You can find it at Watir wiki.

Driver for Chrome is installed with:

    gem install chromewatir

It works only on Windows. I did not put it in Windows section, because it is broken at the moment due to some changes in Chrome 3. It should be fixed soon.

It is not required, but I would highly recommend to install a browser extension like Internet Explorer Developer Toolbar of Firebug for Firefox. It will make your testing much more enjoying activity.

Internet Explorer 8 and Apple Safari are shipped with such a tool already installed.

\newpage

