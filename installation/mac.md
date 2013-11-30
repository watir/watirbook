## Mac OS X 10.9 ##

*You will need internet access if you want to follow examples in this chapter.*

![Mac OS X 10.9 default desktop](https://raw.github.com/watir/watirbook/master/images/installation/mac/desktop.png)

Machine is a clean installation of Mac OS X 10.9, fully patched, with 4 GB RAM with Safari 7.0. Firefox is Firefox 25.0.1, Chrome 31, Opera 18.0, PhantomJS 1.9.2. All browsers are English (US) version.





### Ruby ###

Good news is that Ruby is already installed by default. To check Ruby version, open Terminal application (located in `/Applications/Utilities`) any type `ruby -v`.

You should get this:

    $ ruby -v
    ruby 2.0.0p247 (2013-06-27 revision 41674) [universal.x86_64-darwin13]





### RubyGems ###

It is already installed, but an old version. Let's see which version is here with `gem -v`.

You should get this:

    $ gem -v
    2.0.3

Fortunately, it is easy to upgrade RubyGems with `sudo gem update --system`:

    $ sudo gem update --system
    (...)
    RubyGems 2.1.11 installed
    (...)




### selenium-webdriver ###

Let's try selenium-webdriver gem. It can drive Firefox, Chrome, Opera, Safari and PhantomJS. Install it with `sudo gem install selenium-webdriver --no-ri --no-rdoc`.

You will probably get this:

    $ sudo gem install selenium-webdriver
    (...)
    Fetching: ffi-1.9.3.gem (100%)
    Building native extensions.  This could take a while...
    ERROR:  Error installing selenium-webdriver:
    ERROR: Failed to build gem native extension.

    /System/Library/Frameworks/Ruby.framework/Versions/2.0/usr/bin/ruby extconf.rb
    mkmf.rb can't find header files for ruby at /System/Library/Frameworks/Ruby.framework/Versions/2.0/usr/lib/ruby/include/ruby.h

    Gem files will remain installed in /Library/Ruby/Gems/2.0.0/gems/ffi-1.9.3 for inspection.
    Results logged to /Library/Ruby/Gems/2.0.0/gems/ffi-1.9.3/ext/ffi_c/gem_make.out

Fortunately, it is easy to fix. Install command line developer tools. To install them, type `git --version` into Terminal. A popup will appear asking if you would like to install command line developer tools.

![Install command line developer tools popup](https://raw.github.com/watir/watirbook/master/images/installation/mac/command-line-developer-tools-1.png)

Click *Install*. After the installation is finished, try again:

    $ sudo gem install selenium-webdriver --no-ri --no-rdoc
    (...)
    Successfully installed selenium-webdriver-2.37.0
    (...)





### Firefox ###

![Firefox 6 on Mac OS 10.6](https://raw.github.com/watir/watirbook/master/images/installation/mac/firefox.png)

Let's try to drive Firefox! To drive [Firefox](http://www.mozilla.org/en-US/firefox/new/), make sure you have it installed. Open our old friend IRB and type this:

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :firefox
    => #<Selenium::WebDriver::Driver:0x10e1416dd9107ffe browser=:firefox>

    > browser.navigate.to "http://watir.com"
    => ""

Great! We can drive Firefox.





### Homebrew ###

To drive Chrome, you need [Homebrew](http://brew.sh/). To install it, paste this into Terminal. You will have to type your password during installation.

    $ ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
    (...)
    ==> Installation successful!
    You should run `brew doctor' *before* you install anything.
    Now type: brew help

To check if everything is set up correctly, type `brew doctor`:

    $ brew doctor
    Your system is ready to brew.

Everything looks good!

(You can thank me later for Homebrew.)





### Chrome ###

![Chrome 13 on Mac OS 10.6](https://raw.github.com/watir/watirbook/master/images/installation/mac/chrome.png)

To drive [Chrome](https://www.google.com/intl/en/chrome/browser/), make sure you have it installed.

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :chrome
    Selenium::WebDriver::Error::WebDriverError: Unable to find the chromedriver executable. Please download the server from http://code.google.com/p/chromedriver/downloads/list and place it somewhere on your PATH. More info at http://code.google.com/p/selenium/wiki/ChromeDriver.
    (...)

Looks like we have to install something called *chromedriver executable*. The easiest way to install chromedriver is via Homebrew.

    $ brew install chromedriver
    ==> Downloading http://chromedriver.storage.googleapis.com/2.7/chromedriver_mac32.zip
    ######################################################################## 100.0%
    🍺  /usr/local/Cellar/chromedriver/2.7: 2 files, 21M, built in 13 seconds

Let's try again:

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :chrome
    => #<Selenium::WebDriver::Driver:0xec6568f803e9898 browser=:chrome>

    > browser.navigate.to "http://watir.com"
    => ""

Finally! It works!





### Java on 10.7 ###

To drive Opera, you need Java. It is not installed by default on Mac OS X 10.7. To install it type `java -version` in Terminal:

    $ java -version
    No Java runtime present, requesting install.

You will get `No Java runtime present, requesting install` message and a popup window will appear.

![Install Java](https://raw.github.com/watir/watirbook/master/images/installation/mac/java.png)

Click button *Install* and Java will install. Check if Java is installed with `java -version`:

    $ java -version
    java version "1.6.0_29"
    Java(TM) SE Runtime Environment (build 1.6.0_29-b11-402-11M3527)
    Java HotSpot(TM) 64-Bit Server VM (build 20.4-b02-402, mixed mode)





### Opera with watir-webdriver ###

![Opera 11.51 on Mac 10.6](https://raw.github.com/watir/watirbook/master/images/installation/mac/opera.png)

Let's see how it drives Opera. To drive [Opera], make sure you have it installed.

    $ irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :opera
    Selenium::WebDriver::Error::WebDriverError: Unable to find the
    Selenium server jar. Please download the standalone server from
    http://code.google.com/p/selenium/downloads/list and set the
    SELENIUM_SERVER_JAR environmental variable to its location.
    More info at http://code.google.com/p/selenium/wiki/OperaDriver.

Error message similar to the one when we first tried to open Chrome. The solution is similar too. We have to download a file, put it somewhere and point a variable to it. Do not worry, it sounds more complicated than it really is. Fortunately again, the error message says it all. Go to *http://code.google.com/p/selenium/downloads/list* and download `selenium-server-standalone-2.5.0.jar` (or newer version). Since I have put `chromedriver` file in `/usr/bin`, I will put `selenium-server-standalone-2.5.0.jar` file there too. You will have to provide admin password when copying the file.

The last step is setting `SELENIUM_SERVER_JAR` environmental variable. Create (if the file does not exist) or edit `.bash_profile` file in your home folder (`/Users/zeljko` in my case) with your favorite text editor. Add this line to the file:

     export SELENIUM_SERVER_JAR=/usr/bin/selenium-server-standalone-2.5.0.jar

If you just got lost, I have step by step guide how to do it. Open new Terminal tab or window (it should open in your home folder by default, `/Users/zeljko` in my case) and type `nano .bash_profile`:

    $ nano .bash_profile

*GNU nano* text editor will open. Paste (cmd-v, for example) `export SELENIUM_SERVER_JAR...` line. Exit *GNU nano* and save the file with *control+x*. Press *y* when it asks `Save modified buffer (ANSWERING "No" WILL DESTROY CHANGES)?` and press *Enter* when it displays `File Name to Write: .bash_profile` or `Save modified buffer (ANSWERING "No" WILL DESTROY CHANGES)?` (text is different if the file already exists or not).

![GNU nano asking should it save changes to `.bash_profile` file](https://raw.github.com/watir/watirbook/master/images/installation/mac/nano.png)

 If you have done everything right, GNU nano will close and you will see normal Terminal window. We can check if the line is written to `.bash_profile` file:

    $ cat .bash_profile
    export SELENIUM_SERVER_JAR=/usr/bin/selenium-server-standalone-2.5.0.jar

Let's drive Opera, finally! Open new Terminal window or tab (this is important, already opened windows or tabs would not see `SELENIUM_SERVER_JAR` variable).

    $ irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :opera
    #<Watir::Browser:0x1017f6a28 url="opera:debug" title="Connect to Debugger">

![watir-webdriver gem drives Opera 11.51 on Mac 10.6](https://raw.github.com/watir/watirbook/master/images/installation/mac/webdriver-opera.png)

[Opera]: http://www.opera.com/



