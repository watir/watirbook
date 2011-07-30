## Ubuntu Linux 11.04

![Ubuntu Linux 11.04 default desktop](images/installation/ubuntu-11-04/ubuntu-11-04-desktop.png)\

*Ubuntu Linux 11.04 default desktop*

Machine is a clean installation of Ubuntu Linux 11.04, fully patched, 512 MB RAM. Firefox 5.0, Chrome 12

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

### watir-webdriver

I think that Watir-webdriver gem is the future of Watir. In short, it can drive both Firefox, Chrome and Opera.

Since Firefox is installed by default on Ubuntu, all you have to do is install watir-webdriver gem with `sudo gem install watir-webdriver --no-ri --no-rdoc`.

    $ sudo gem install watir-webdriver --no-ri --no-rdoc
    (...)
    Successfully installed watir-webdriver-0.2.8
    4 gems installed

### Firefox with watir-webdriver

![Firefox on Ubuntu 11.04](images/installation/ubuntu-11-04/firefox.png)\

*Firefox on Ubuntu 11.04*

Let's check if it can drive Firefox:

    $ irb

    > require "rubygems"
    => true

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :ff
    => #<Watir::Browser:0x..fb734a4d8 url="about:blank" title="">

    > browser.goto "watir.com"
    => "http://watir.com/"

![Watir-webdriver drives Firefox on Ubuntu 11.04](images/installation/ubuntu-11-04/webdriver-ff.png)\

*Watir-webdriver drives Firefox on Ubuntu 11.04*

### Chrome with watir-webdriver

![Chrome on Ubuntu 11.04](images/installation/ubuntu-11-04/chrome.png)\

*Chrome on Ubuntu 11.04*

Now, lets see if it can really drive Chrome too. Ubuntu does not have Chrome installed by default, so you have to install it yourself. Download it from [google.com/chrome](http://www.google.com/chrome). After installation Chrome will appear at *Applications > Internet > Chrome*.

    $ irb

    > require "rubygems"
    => true

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :chrome
    Selenium::WebDriver::Error::WebDriverError: Unable to find the chromedriver executable. Please download the server from http://code.google.com/p/chromium/downloads/list and place it somewhere on your PATH. More info at http://code.google.com/p/selenium/wiki/ChromeDriver.
    (...)

Looks like we have to install something called chromedriver executable. Fortunately, the error message is pretty clear. Download `chromedriver_linux32_14.0.836.0.zip` (ChromeDriver server for linux32) from http://code.google.com/p/chromium/downloads/list and unzip it (mouse right click and then `Extract Here`, for example). You will get a file named `chromedriver`. Put it "somewhere on your PATH", as the error message said. If you have no idea what that means, read on. To find out where to put `chromedriver` file, type `echo $PATH` in Terminal:

    $ echo $PATH
    /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

So, in my case, these folders are on my PATH: `/usr/local/sbin`, `/usr/local/bin`, `/usr/sbin` `/usr/bin`, `/sbin`, `/bin` and `/usr/games`.

 `/usr/games` looked like a good place to put the file. (Sounds like `chromedriver` will have the most fun there.) You can copy the file from Terminal, or with Nautilus (default Ubuntu file manager). To open the folder in Nautilus, go to *Places > Computer > File System > usr > games*. But Nautilus complained when I tried to copy the file there. It said: `Error while moving "chromedriver". There was an error moving the file into /usr/games.` and *Show more details* said `Error moving file: Permission denied`. But, I could not find a way to provide root password. So, I have tried to copy the file to all other folders in my PATH. Can you guess what happened? Yes, `Error moving file: Permission denied`.

Terminal to the rescue! `chromedriver` file is at my Desktop folder, and to copy it to, go to Desktop in Terminal and use this (you will have to provide root password):

    $ sudo cp chromedriver /usr/games/

Just to see if it would work, I tried to execute it with `/usr/games/chromedriver`:

    $ /usr/games/chromedriver
    bash: /usr/games/chromedriver: Permission denied

But, as you can see, I got `Permission denied` error message. The only thing left is to add a folder to the PATH that is accessible without using `sudo`. The easiest way to do it on Ubuntu is to create a folder called `bin` in your home folder (`/home/zeljko/bin` in my case). You have to reboot (or at least log out and then log in, but I have not checked that) and by some magic (provided by /home/zeljko/.profile file in my case) `/home/zeljko/bin` will appear in your PATH:

    $ echo $PATH
    /home/zeljko/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

Let's drive Chrome, finally:

    $ irb

    > require "rubygems"
    => true

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :chrome
    => #<Watir::Browser:0x..fb743b7d4 url="about:blank" title="about:blank">

    > browser.goto "watir.com"
    => "http://watir.com/"

And it really works!

![Watir-webdriver drives Chrome on Ubuntu 11.04](images/installation/ubuntu-11-04/webdriver-chrome.png)\

*Watir-webdriver drives Chrome on Ubuntu 11.04*

### Opera with watir-webdriver

![Opera on Ubuntu 11.04](images/installation/ubuntu-11-04/opera.png)\

*Opera on Ubuntu 11.04*

To drive [[Opera] make sure you have it installed.

[Opera]: http://www.opera.com/

\newpage

