## Ubuntu Linux 10.10

> *Chapter on Ubuntu Linux 10.10 will not be updated. All updates go to Ubuntu Linux 11.04 chapter. I did not delete this chapter because it could help somebody, sometime, maybe.*

Machine is a clean installation of Ubuntu Linux 10.10, fully patched, with Firefox 3.6.15 and 512 MB RAM.

### Ruby

Let's see if Ubuntu comes with Ruby installed. Open Terminal (Applications > Accessories > Terminal) and type `ruby -v`:

    zeljko@ubuntu:~$ ruby -v
    The program 'ruby' is currently not installed.  You can install it by typing:
    sudo apt-get install ruby

Install it with `sudo apt-get install ruby`:

    zeljko@ubuntu:~$ sudo apt-get install ruby
    [sudo] password for zeljko: 
    Reading package lists... Done
    (...)
    ldconfig deferred processing now taking place

Check the version with `ruby -v`:

    zeljko@ubuntu:~$ ruby -v
    ruby 1.8.7 (2010-06-23 patchlevel 299) [i686-linux]

### RubyGems

Let's see the version of RubyGems we got with Ruby with `gem -v`:

    zeljko@ubuntu:~$ gem -v
    The program 'gem' can be found in the following packages:
     * rubygems1.8
     * rubygems1.9.1
    Try: sudo apt-get install <selected package>

Looks like we did not get any version installed. You should skip installing Rubygems with apt-get, you will see in why in a minute. To show you what *not to do*, I will install rubygems1.8 with `sudo apt-get install rubygems1.8`:

    zeljko@ubuntu:~$ sudo apt-get install rubygems1.8
    Reading package lists... Done
    (...)
    Setting up rubygems1.8 (1.3.7-2) ...

Ask RubyGems for it's version with `gem -v`:

    zeljko@ubuntu:~$ gem -v
    1.3.7

RubyGems 1.3.7 is really old ([May 13, 2010][137]), I feel there will be problems with it. Let's try to update it with `gem update --system`:

    zeljko@ubuntu:~$ gem update --system
    ERROR:  While executing gem ... (RuntimeError)
        gem update --system is disabled on Debian, because it will overwrite the content of the rubygems Debian package, and might break your Debian system in subtle ways. The Debian-supported way to update rubygems is through apt-get, using Debian official repositories.
    If you really know what you are doing, you can still update rubygems by setting the REALLY_GEM_UPDATE_SYSTEM environment variable, but please remember that this is completely unsupported by Debian.

Since I do not *really* know what I am doing, I will uninstall RubyGems with `sudo apt-get remove rubygems1.8` and install it from source:

    zeljko@ubuntu:~$ sudo apt-get remove rubygems1.8
    Reading package lists... Done
    (...)
    Removing rubygems1.8 ...
    Processing triggers for man-db ...

Download RubyGems from [Download RubyGems][gems] page, extract it (right click > Extract Here) and install with `sudo ruby setup.rb`:

    zeljko@ubuntu:~/Downloads/rubygems-1.6.2$ sudo ruby setup.rb 
    RubyGems 1.6.2 installed
    (...)
    RubyGems installed the following executables:
      /usr/bin/gem1.8

Let's check the version with `gem1.8 -v`:

    zeljko@ubuntu:~/Downloads/rubygems-1.6.2$ gem1.8 -v
    1.6.2

RubyGems 1.6.2, finally!

### Firefox and Chrome with watir-webdriver gem

I think that Watir-webdriver gem is the future of Watir. In short, it can drive both Firefox and Chrome.

If you already have Ruby and RubyGems, install watir-webdriver gem with `sudo gem install watir-webdriver --no-ri --no-rdoc`.

If you get `ERROR: Failed to build gem native extension.` error message, you do not have everything you need:

    zeljko@ubuntu:~$ sudo gem1.8 install watir-webdriver --no-ri --no-rdoc
    Fetching: json_pure-1.5.1.gem (100%)
    Fetching: rubyzip-0.9.4.gem (100%)
    Fetching: ffi-1.0.7.gem (100%)
    Building native extensions.  This could take a while...
    ERROR:  Error installing watir-webdriver:
      ERROR: Failed to build gem native extension.
            /usr/bin/ruby1.8 extconf.rb
    extconf.rb:2:in `require': no such file to load -- mkmf (LoadError)
      from extconf.rb:2
    Gem files will remain installed in /usr/lib/ruby/gems/1.8/gems/ffi-1.0.7 for inspection.
    Results logged to /usr/lib/ruby/gems/1.8/gems/ffi-1.0.7/ext/ffi_c/gem_make.out

Fix the problem with `sudo apt-get install ruby-full`:

    zeljko@ubuntu:~$ sudo apt-get install ruby-full
    Reading package lists... Done
    (...)
    Setting up ruby-full (4.5) ...
    Processing triggers for libc-bin ...
    ldconfig deferred processing now taking place

Try installing watir-webdriver now.

    zeljko@ubuntu:~$ sudo gem1.8 install watir-webdriver --no-ri --no-rdoc
    Building native extensions.  This could take a while...
    Fetching: childprocess-0.1.8.gem (100%)
    Fetching: selenium-webdriver-0.1.4.gem (100%)
    Fetching: watir-webdriver-0.2.1.gem (100%)
    Successfully installed ffi-1.0.7
    Successfully installed childprocess-0.1.8
    Successfully installed selenium-webdriver-0.1.4
    Successfully installed watir-webdriver-0.2.1
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

![Watir-webdriver drives Firefox on Ubuntu](images/ubuntu-webdriver-firefox.jpg)\

*Watir-webdriver drives Firefox on Ubuntu*

Wasn't that way easier than firewatir install?! I sure think so. Now, lets see if it can really drive Chrome too.

Ubuntu does not have Chrome installed by default, so you have to install it yourself. Download it from [google.com/chrome](http://www.google.com/chrome). After installation Chrome will appear at *Applications > Internet > Chrome*.

And it really works!

    zeljko@ubuntu:~$ irb
    irb(main):001:0> require "rubygems"
    => true
    irb(main):002:0> require "watir-webdriver"
    => true
    irb(main):003:0> browser = Watir::Browser.new :chrome
    => #<Watir::Browser:0x..fb7453398 url="" title="">
    irb(main):004:0> browser.goto "watir.com"
    => "http://watir.com/"


![Watir-webdriver drives Chrome on Ubuntu](images/ubuntu-webdriver-chrome.jpg)\

*Watir-webdriver drives Chrome on Ubuntu*

### Firefox with firewatir gem

If you tried to install firewatir gem with RubyGems 1.3.7, you would get error message `hoe requires RubyGems version >= 1.4`. Firewatir gem needs hoe gem, and it needs Rubygems 1.4 or newer.

Install firewatir gem with `sudo gem1.8 install firewatir` or
`sudo gem1.8 install firewatir --no-ri --no-rdoc`:

    zeljko@ubuntu:~/Downloads/rubygems-1.6.2$ sudo gem1.8 install firewatir --no-ri --no-rdoc
    (...)
    Fetching: commonwatir-1.8.0.gem (100%)
    Fetching: firewatir-1.8.0.gem (100%)
    (...)
    Successfully installed commonwatir-1.8.0
    Successfully installed firewatir-1.8.0
    8 gems installed

Install `Linux plugin for Firefox 3.6` from [Watir Installation][watir] page, restart Firefox, and close it when it restarts. It is important to restart it and then close. Check if everything works:

    zeljko@ubuntu:~/Downloads/rubygems-1.6.2$ irb
    irb(main):001:0> require "rubygems"
    => true
    irb(main):002:0> require "firewatir"
    => true
    irb(main):003:0> browser = Watir::Browser.new
    => #<FireWatir::Firefox:0x..fb7434718 url="about:home" title="Ubuntu Start Page">
    irb(main):004:0> browser.goto "watir.com"
    => #<FireWatir::Firefox:0x..fb7434718 url="http://watir.com/" title="Watir">

Firefox should open and navigate to watir.com.

![Firewatir drives Firefox on Ubuntu](images/ubuntu-firewatir.jpg)\

*Firewatir drives Firefox on Ubuntu*

[137]: https://rubygems.org/gems/rubygems-update/versions
[gems]: https://rubygems.org/pages/download
[watir]: http://watir.com/installation/

\newpage

