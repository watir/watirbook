## Ubuntu Linux 11.04 ##

*You will need internet access if you want to follow examples in this chapter.*

![Ubuntu Linux 13.10 default desktop](https://raw.github.com/watir/watirbook/master/images/installation/ubuntu/desktop.png)

Machine is a clean installation of Ubuntu Linux 11.04, fully patched, 512 MB RAM. Firefox 5.0, Chrome 12, Opera 11.50.





### Ruby ###

Let's see if Ubuntu comes with Ruby installed. Open Terminal (*Applications > Accessories > Terminal*) and type `ruby -v`:

    $ ruby -v
    The program 'ruby' is currently not installed. You can install it
    by typing:
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





### RubyGems ###

Let's see the version of RubyGems we got with Ruby with `gem -v`:

    $ gem -v
    The program 'gem' is currently not installed. You can install it
    by typing:
    sudo apt-get install rubygems1.8

Looks like we did not get any version installed. We will install RubyGems with `apt-get`, since that is the easiest way:

    $ sudo apt-get install rubygems1.8
    (...)
    Setting up ruby1.8-dev (1.8.7.302-2) ...
    Setting up rubygems1.8 (1.3.7-3) ...


Ask RubyGems for it's version with `gem -v`:

    $ gem -v
    1.3.7

RubyGems 1.3.7 is really old ([May 13, 2010](https://rubygems.org/gems/rubygems-update/versions)). Let's try to update it the usual way, with `gem update --system`:

    $ gem update --system
    ERROR:  While executing gem ... (RuntimeError)
    gem update --system is disabled on Debian, because it will
    overwrite the content of the rubygems Debian package, and
    might break your Debian system in subtle ways. The
    Debian-supported way to update rubygems is through apt-get,
    using Debian official repositories. If you really know what
    you are doing, you can still update rubygems by setting the
    REALLY_GEM_UPDATE_SYSTEM environment variable, but please
    remember that this is completely unsupported by Debian.

Since I do not *really* know what I am doing, I will leave RubyGems at version 1.3.7 and hope everything will work.





### watir-webdriver ###

I think that Watir-webdriver gem is the future of Watir. In short, it can drive Firefox, Chrome and Opera.

Install watir-webdriver gem with `sudo gem install watir-webdriver --no-ri --no-rdoc`.

    $ sudo gem install watir-webdriver --no-ri --no-rdoc
    (...)
    Successfully installed watir-webdriver-0.2.8
    4 gems installed





### Firefox with watir-webdriver ###

![Firefox on Ubuntu 11.04](https://raw.github.com/watir/watirbook/master/images/installation/ubuntu/firefox.png)

Since Firefox is installed by default on Ubuntu, you do not have to install it.

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

![Watir-webdriver drives Firefox on Ubuntu 11.04](https://raw.github.com/watir/watirbook/master/images/installation/ubuntu/webdriver-firefox.png)

No problem here, works just fine.





### Chrome with watir-webdriver ###

![Chrome on Ubuntu 11.04](https://raw.github.com/watir/watirbook/master/images/installation/ubuntu/chrome.png)

Now, lets see if it can really drive Chrome too. Ubuntu does not have Chrome installed by default, so you have to install it yourself. Download it from *[google.com/chrome](http://www.google.com/chrome)*. After installation Chrome will appear at *Applications > Internet > Chrome*.

    $ irb

    > require "rubygems"
    => true

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :chrome
    Selenium::WebDriver::Error::WebDriverError: Unable to find the
    chromedriver executable. Please download the server from
    http://code.google.com/p/chromium/downloads/list and place it
    somewhere on your PATH. More info at
    http://code.google.com/p/selenium/wiki/ChromeDriver.
    (...)

Looks like we have to install something called *chromedriver executable*. Fortunately, the error message is pretty clear. Download `chromedriver_linux32_14.0.836.0.zip` (or newer version, the description should be *ChromeDriver server for linux32*) from
*http://code.google.com/p/chromium/downloads/list* and unzip it (mouse right click and then *Extract Here*, for example). You will get a file named `chromedriver`. Put it *somewhere on your `PATH`*, as the error message said.

The easiest way to do it on Ubuntu is to create a folder called `bin` in your home folder (`/home/zeljko/bin` in my case). You have to reboot (or at least log out and then log in, but I have not checked that) and by some magic (provided by `/home/zeljko/.profile` file in my case) `/home/zeljko/bin` folder will appear in your `PATH`:

    $ echo $PATH
    /home/zeljko/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:
    /sbin:/bin:/usr/games

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

![Watir-webdriver drives Chrome on Ubuntu 11.04](https://raw.github.com/watir/watirbook/master/images/installation/ubuntu/webdriver-chrome.png)





### Java ###

To drive Opera, you will have to install Java first. Let's check if Java is already installed with `java -version`:

    $ java
    The program 'java' can be found in the following packages:
     * gcj-4.4-jre-headless
     * gcj-4.5-jre-headless
     * openjdk-6-jre-headless
    Try: sudo apt-get install <selected package>

Looks like we will have to install Java. Install it with `sudo apt-get install openjdk-6-jre-headless`:

    $ sudo apt-get install openjdk-6-jre-headless
    (...)
    Setting up openjdk-6-jre-lib (6b22-1.10.2-0ubuntu1~11.04.1) ...
    Setting up icedtea-6-jre-cacao (6b22-1.10.2-0ubuntu1~11.04.1) ...
    Setting up icedtea-6-jre-jamvm (6b22-1.10.2-0ubuntu1~11.04.1) ...
    Setting up ca-certificates-java (20100412) ...
    creating /etc/ssl/certs/java/cacerts...
    done.

Let's check if Java is really installed with `java -version`:

    $ java -version
    java version "1.6.0_22"
    OpenJDK Runtime Environment (IcedTea6 1.10.2)
    (6b22-1.10.2-0ubuntu1~11.04.1)
    OpenJDK Client VM (build 20.0-b11, mixed mode, sharing)

Looks good to me!





### Opera with watir-webdriver ###

![Opera on Ubuntu 11.04](https://raw.github.com/watir/watirbook/master/images/installation/ubuntu/opera.png)

To drive [Opera](http://www.opera.com/) make sure you have it installed.

Let's see how it drives Opera. Open our old friend, IRB:

    $ irb

    > require "rubygems"
    => true

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :opera
    Selenium::WebDriver::Error::WebDriverError: Unable to find the
    Selenium server jar. Please download the standalone server from
    http://code.google.com/p/selenium/downloads/list and set the
    SELENIUM_SERVER_JAR environmental variable to its location.
    More info at http://code.google.com/p/selenium/wiki/OperaDriver.
    (...)

Error message similar to the one when we first tried to open Chrome. The solution is similar too. We have to download a file, put it somewhere and point a variable to it. Do not worry, it sounds more complicated than it really is. Fortunately again, the error message says it all. Go to *http://code.google.com/p/selenium/downloads/list* and download `selenium-server-standalone-2.5.0.jar` (or newer version, the description should be *Use this if you want to use the Selenium RC or Remote WebDriver or use Grid 2 without needing any additional dependencies*). Since I have put `chromedriver` file in `/home/zeljko/bin`, I will put this file there too.

The last step is setting `SELENIUM_SERVER_JAR` environmental variable. If you just got lost, I have step by step guide how to do it. Open Nautilus and go to your home folder: *Places > Home Folder*. You want to edit `.bashrc` file, but by default files that have names starting with dot are not displayed. To see the file go to *View > Show Hidden Files*. Doubleclick `.bashrc` file (it will open the file in *gedit* editor). Add this line to the file:

    export SELENIUM_SERVER_JAR=~/bin/selenium-server-standalone-2.5.0.jar

Save the file and close all Terminal windows. Open Terminal again. To check if the variable is set, try `printenv | grep SELENIUM`:

    $ printenv | grep SELENIUM
    SELENIUM_SERVER_JAR=/home/zeljko/bin/selenium-server-standalone-2.5.0.jar

Looks good to me!  After all this work, enjoy driving Opera:

    $ irb

    > require "rubygems"
    => true

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :opera
    => #<Watir::Browser:0x..fb72fd854 url="http://watir.com/" title="Watir">

    > browser.goto "watir.com"
    => "http://watir.com/"


![Watir-webdriver drives Opera on Ubuntu 11.04](https://raw.github.com/watir/watirbook/master/images/installation/ubuntu/webdriver-opera.png)
