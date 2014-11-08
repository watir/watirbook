## Ubuntu Linux 13.10 ##

I> You will need internet access if you want to follow examples. All examples are tested with Ubuntu Linux 13.10 32-bit. All browsers are English (US) version.

![Ubuntu Linux 13.10](https://raw.githubusercontent.com/watir/watirbook/master/manuscript/images/installation/ubuntu/desktop.png)





### Ruby ###

Let's see if Ubuntu comes with Ruby installed. Open Terminal and type `ruby -v`:

    $ ruby -v
    The program 'ruby' can be found in the following
    packages:
     * ruby1.8
     * ruby1.9.1
    Try: sudo apt-get install <selected package>


Install it with `sudo apt-get install ruby1.9.1`:

    $ sudo apt-get install ruby1.9.1
    (...)
    Setting up ruby1.9.1 (1.9.3.194-8.1ubuntu2.1) ...
    (...)

Check the version with `ruby -v`:

    $ ruby -v
    ruby 1.9.3p194 (2012-04-20 revision 35410)
    [i686-linux]





### RubyGems ###

Let's see the version of RubyGems we got with Ruby with `gem -v`:

    $ gem -v
    1.8.23

Update RubyGems with `gem update --system`:

    $ gem update --system
    ERROR:  While executing gem ... (RuntimeError)
    gem update --system is disabled on Debian, because
    it will overwrite the content of the rubygems
    Debian package, and might break your Debian system
    in subtle ways. The Debian-supported way to update
    rubygems is through apt-get, using Debian official
    repositories. If you really know what you are
    doing, you can still update rubygems by setting
    the REALLY_GEM_UPDATE_SYSTEM environment variable,
    but please remember that this is completely
    unsupported by Debian.

Since I do not *really* know what I am doing, I will leave RubyGems at current version and hope everything will work.





### selenium-webdriver ###

Let's try selenium-webdriver gem. Install it with `sudo gem install selenium-webdriver --no-ri --no-rdoc`.

    $ sudo gem install selenium-webdriver --no-ri
    --no-rdoc
    (...)
    Fetching: ffi-1.9.3.gem (100%)
    Building native extensions.  This could take a
    while...
    ERROR:  Error installing selenium-webdriver:
    ERROR: Failed to build gem native extension.
    (...)

This should fix the problem:

    $ sudo apt-get install ruby1.9.1-dev
    (...)
    Setting up ruby1.9.1-dev (1.9.3.194-8.1ubuntu2.1)

Let's try installing selenium-webdriver again:

    $ sudo gem install selenium-webdriver --no-ri
    --no-rdoc
    (...)
    Successfully installed selenium-webdriver-2.37.0
    (...)

Sucess!





### Firefox ###

![Firefox 25](https://raw.githubusercontent.com/watir/watirbook/master/manuscript/images/installation/ubuntu/firefox.png)

Since Firefox (tested with version 25.0.1) is installed by default on Ubuntu, you do not have to install it.

Let's check if it can drive Firefox:

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :firefox
    => #<Selenium::WebDriver::Driver:0x21564606
    browser=:firefox>

    > browser.get "http://watir.com"
    => ""

No problem here, works just fine.





### PhantomJS ###

To drive [PhantomJS](http://phantomjs.org/) (tested with version 1.9.0), install it via `apt-get`:

    $ sudo apt-get install phantomjs
    (...)
    Setting up phantomjs (1.9.0-1) ...

Let's try driving it:

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :phantomjs
    => #<Selenium::WebDriver::Driver:0x..fa5f26f44
    browser=:phantomjs>

    > browser.get "http://watir.com"
    => {}

    > browser.save_screenshot "phantomjs.png"
    => #<File:phantomjs.png (closed)>

The last command saves screenshot of the page. A screenshot from a headless browser. Nice, right?

![PhantomJS 1.9.0](https://raw.githubusercontent.com/watir/watirbook/master/manuscript/images/installation/ubuntu/phantomjs.png)





### Chrome ###

![Chrome 31](https://raw.githubusercontent.com/watir/watirbook/master/manuscript/images/installation/ubuntu/chrome.png)

Now, lets see if it can really drive Chrome (tested with version 31) too. Ubuntu does not have Chrome installed by default, so you have to install it yourself. Download it from *[google.com/chrome](http://www.google.com/chrome)*.

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :chrome
    Selenium::WebDriver::Error::WebDriverError: Unable
    to find the chromedriver executable. Please
    download the server from
    http://code.google.com/p/chromedriver/downloads/
    list and place it somewhere on your PATH. More
    info at
    http://code.google.com/p/selenium/wiki/
    ChromeDriver.
    (...)

Looks like we have to install something called *ChromeDriver executable*. Fortunately, the error message is pretty clear. [code.google.com/p/chromedriver/downloads/list](http://code.google.com/p/chromedriver/downloads/list) will let you know that *ChromeDriver executable* is now located at [chromedriver.storage.googleapis.com](http://chromedriver.storage.googleapis.com/index.html). Download the latest version of `chromedriver_linux32.zip` or `chromedriver_linux64.zip` (check if you have 32-bit or 64-bit operating system) and unzip it (mouse right click and then *Extract Here*, for example). You will get a file named `chromedriver`. Put it *somewhere on your `PATH`*, as the error message said.

Let's find out what is *on our `PATH`*.

    $ echo $PATH
    /home/zeljko/bin:/usr/local/sbin:/usr/local/bin:
    /usr/sbin:/usr/bin:/sbin:/bin:/usr/games

`/usr/bin` looks like a nice place, so let's move `chromedriver` there. You will have to provide your password to move the file there.

    $ sudo mv chromedriver /usr/bin

Let's drive Chrome, finally:

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :chrome
    => #<Selenium::WebDriver::Driver:0x5b77effe
    browser=:chrome>

    > browser.get "http://watir.com"
    => nil

And it really works!





### Chromium ###

![Chromium 30](https://raw.githubusercontent.com/watir/watirbook/master/manuscript/images/installation/ubuntu/chrome.png)

Let's try driving [Chromium](http://www.chromium.org/) (tested with version 30) too, just for fun. Install it with `sudo apt-get install chromium-browser`:

    $ sudo apt-get install chromium-browser
    (...)
    Setting up chromium-browser
    (30.0.1599.114-0ubuntu0.13.10.2) ...
    (...)

If you did not already install ChromeDriver, see *Chrome* chapter.

    $ irb

    > require "selenium-webdriver"
    => true

    > Selenium::WebDriver::Chrome.path =
    "/usr/bin/chromium-browser"
    => "/usr/bin/chromium-browser"

    > browser = Selenium::WebDriver.for :chrome
    => #<Selenium::WebDriver::Driver:0x..fb4c9860a
    browser=:chrome>

    > browser.get "http://watir.com"
    => nil





### Java ###

To drive Opera, you will have to install Java first. Let's check if Java is already installed:

    $ java -version
    The program 'java' can be found in the following
    packages:
     * default-jre
     * gcj-4.6-jre-headless
     * gcj-4.7-jre-headless
     * openjdk-7-jre-headless
     * openjdk-6-jre-headless
    Try: sudo apt-get install <selected package>

Looks like we will have to install Java. Install it with `sudo apt-get install openjdk-7-jre-headless`:

    $ sudo apt-get install openjdk-7-jre-headless
    (...)
    Setting up openjdk-7-jre-lib (7u25-2.3.12-4ubuntu3)
    (...)





### Opera ###

![Opera 12.16](https://raw.githubusercontent.com/watir/watirbook/master/manuscript/images/installation/ubuntu/opera.png)

To drive [Opera](http://www.opera.com/) (tested with version 12.16) make sure you have it installed.

Let's see how it drives Opera. Open our old friend, IRB:

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :opera
    Selenium::WebDriver::Error::WebDriverError: Unable
    to find the Selenium server jar. Please download
    the standalone server from
    http://code.google.com/p/selenium/downloads/list
    and set the SELENIUM_SERVER_JAR environmental
    variable to its location. More info at
    http://code.google.com/p/selenium/wiki/OperaDriver.
    (...)

Error message similar to the one when we first tried to open Chrome. The solution is similar too. We have to download a file, put it somewhere and point a variable to it. Do not worry, it sounds more complicated than it really is. Fortunately again, the error message says it all. Go to [code.google.com/p/selenium/downloads/list](http://code.google.com/p/selenium/downloads/list) and download
﻿`selenium-server-standalone-2.39.0.jar` (or newer version, the description should be *Use this if you want to use the Selenium RC or Remote WebDriver or use Grid 2 without needing any additional dependencies*).

The last step is setting `SELENIUM_SERVER_JAR` environmental variable. If you just want to try driving Opera, typing this into Terminal will do the trick (assuming that the file is located in Downloads folder, if you have a newer version of `selenium-server-standalone` file, replace `2.39.0` appropriately):

    $ export SELENIUM_SERVER_JAR=
    ~/Downloads/selenium-server-standalone-2.39.0.jar

Let's drive Opera, finally! (Following steps will work only in Terminal tab or window where you have exported `SELENIUM_SERVER_JAR` environment variable.)

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :opera
    => #<Selenium::WebDriver::Driver:0x..fb4bb92ce
    browser=:opera>

    > browser.get "http://watir.com"
    => nil

If you plan to drive Opera frequently, you should add `SELENIUM_SERVER_JAR` to `.bashrc` file. Create (if the file does not exist) or edit `.bashrc` file in your home folder (`/home/z/.bashrc` in my case, or shorter `~/.bashrc`) with your favorite text editor. Add `export SELENIUM_SERVER_JAR...` line to the file.

    $ nano ~/.bashrc

Save the file (ctrl+x) and close all Terminal windows. Open Terminal again. To check if the variable is set, try `printenv | grep SELENIUM`:

    $ printenv | grep SELENIUM
    SELENIUM_SERVER_JAR=/home/zeljko/bin/
    selenium-server-standalone-2.39.0.jar

Looks good to me!
