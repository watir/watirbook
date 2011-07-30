## Ubuntu Linux 11.04

![Ubuntu Linux 11.04 default desktop](images/installation/ubuntu-11-04/ubuntu-11-04-desktop.png)\

*Ubuntu Linux 11.04 default desktop*

Machine is a clean installation of Ubuntu Linux 11.04, fully patched, 512 MB RAM.

### Ruby

Let's see if Ubuntu comes with Ruby installed. Open Terminal (Applications > Accessories > Terminal) and type `ruby -v`:

    $ ruby -v
    The program 'ruby' is currently not installed.  You can install it by typing:
    sudo apt-get install ruby

Install it with `sudo apt-get install ruby`:

    $ sudo apt-get install ruby
    (...)
    Setting up libruby1.8 (1.8.7.302-2) ...
    Setting up ruby1.8 (1.8.7.302-2) ...
    Setting up ruby (4.5) ...
    (...)

Check the version with `ruby -v`:

    $ ruby -v
    ruby 1.8.7 (2010-08-16 patchlevel 302) [i686-linux]

Ruby 1.8.7 is pretty good, but 1.9.2 would be better. Since we just want to get Watir installed the easiest possible way, we will user Ruby 1.8.7.

### RubyGems

Let's see the version of RubyGems we got with Ruby with `gem -v`:

    $ gem -v
    The program 'gem' is currently not installed.  You can install it by typing:
    sudo apt-get install rubygems1.8

Looks like we did not get any version installed. We will install RubyGems with apt-get, since that is the easiest way:

    $ sudo apt-get install rubygems1.8
    (...)
    Setting up ruby1.8-dev (1.8.7.302-2) ...
    Setting up rubygems1.8 (1.3.7-3) ...


Ask RubyGems for it's version with `gem -v`:

    zeljko@ubuntu:~$ gem -v
    1.3.7

RubyGems 1.3.7 is really old ([May 13, 2010](https://rubygems.org/gems/rubygems-update/versions)). Let's try to update it the usual way, with `gem update --system`:

    zeljko@ubuntu:~$ gem update --system
    ERROR:  While executing gem ... (RuntimeError)
        gem update --system is disabled on Debian, because it will overwrite the content of the rubygems Debian package, and might break your Debian system in subtle ways. The Debian-supported way to update rubygems is through apt-get, using Debian official repositories.
    If you really know what you are doing, you can still update rubygems by setting the REALLY_GEM_UPDATE_SYSTEM environment variable, but please remember that this is completely unsupported by Debian.

Since I do not *really* know what I am doing, I will leave RubyGems at version 1.3.7 and hope everything will work.

### Firefox, Chrome and Opera with watir-webdriver gem

I think that Watir-webdriver gem is the future of Watir. In short, it can drive both Firefox, Chrome and Opera.

Since Firefox is installed by default on Ubuntu, all you have to do is install watir-webdriver gem with `sudo gem install watir-webdriver --no-ri --no-rdoc`.

    $ sudo gem install watir-webdriver --no-ri --no-rdoc
    (...)
    Successfully installed watir-webdriver-0.2.8
    4 gems installed

Let's check if it can drive Firefox:

    zeljko@ubuntu:~$ irb
    irb(main):001:0> require "rubygems"
    => true
    irb(main):002:0> require "watir-webdriver"
    => true
    irb(main):003:0> browser = Watir::Browser.new :ff
    => #<Watir::Browser:0x..fb734a4d8 url="about:blank" title="">
    irb(main):004:0> browser.goto "watir.com"
    => "http://watir.com/"

![Watir-webdriver drives Firefox on Ubuntu](images/installation/ubuntu-11-04/webdriver-ff.png)\

*Watir-webdriver drives Firefox on Ubuntu*

\newpage

