## Mac OS X 10.9 ##

*You will need internet access if you want to follow examples in this chapter.*

![Mac OS X 10.9 default desktop](https://raw.github.com/watir/watirbook/master/images/installation/mac/desktop.png)

Machine is a clean installation of Mac OS X 10.9, fully patched, with 4 GB RAM. All browsers are English (US) version.





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
    (...)

Fortunately, it is easy to fix. Install command line developer tools. To install them, type `git --version` into Terminal. A popup will appear asking if you would like to install command line developer tools.

![Install command line developer tools popup](https://raw.github.com/watir/watirbook/master/images/installation/mac/command-line-developer-tools.png)

Click *Install*. After the installation is finished, try again:

    $ sudo gem install selenium-webdriver --no-ri --no-rdoc
    (...)
    Successfully installed selenium-webdriver-2.37.0
    (...)





### Safari ###

![Safari 7 on Mac OS 10.9](https://raw.github.com/watir/watirbook/master/images/installation/mac/safari.png)

Since Safari (version 7.0) is already installed, all you have to do is to open IRB and type this:

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :safari
    => #<Selenium::WebDriver::Driver:0x..f93d5546968bec45e browser=:safari>

    irb(main):003:0> browser.navigate.to "http://watir.com"
    => nil





### Firefox ###

![Firefox 6 on Mac OS 10.6](https://raw.github.com/watir/watirbook/master/images/installation/mac/firefox.png)

To drive [Firefox](http://www.mozilla.org/en-US/firefox/new/) (version 25.0.1), make sure you have it installed. Open our old friend IRB and type this:

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

To drive [Chrome](https://www.google.com/intl/en/chrome/browser/) (version 31), make sure you have it installed.

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :chrome
    Selenium::WebDriver::Error::WebDriverError: Unable to find the chromedriver
    executable. Please download the server from
    http://code.google.com/p/chromedriver/downloads/list and place it somewhere
    on your PATH. More info at
    http://code.google.com/p/selenium/wiki/ChromeDriver.
    (...)

Looks like we have to install something called *chromedriver executable*. The easiest way to install chromedriver is via Homebrew.

    $ brew install chromedriver
    (...)

Let's try again:

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :chrome
    => #<Selenium::WebDriver::Driver:0xec6568f803e9898 browser=:chrome>

    > browser.navigate.to "http://watir.com"
    => ""

Finally! It works!





### Chromium ###

Let's try driving [Chromium](http://www.chromium.org/) (version 33) too, just for fun. Download zip file it from [download-chromium.appspot.com](https://download-chromium.appspot.com/). Unzip the file and move `Chromium.app` file to `/Applications` folder. If you did not already install chromedriver, see Chrome chapter. To open the browser for the first time you will have to right click it while holding control, then click *Open* from context menu. The next time you can open it in an usual way.

    $ irb

    > require "selenium-webdriver"
    => true

    > Selenium::WebDriver::Chrome.path =
    "/Applications/Chromium.app/Contents/MacOS/Chromium"
    => "/Applications/Chromium.app/Contents/MacOS/Chromium"

    > browser = Selenium::WebDriver.for :chrome
    => #<Selenium::WebDriver::Driver:0x1e35d5faa9511ec6 browser=:chrome>

    > browser.navigate.to "http://watir.com"
    => nil





### PhantomJS ###

To drive [PhantomJS](http://phantomjs.org/) (version 1.9.2), make sure you have it installed. The easiest way to install it is via Homebrew. (You can thank me now for Homebrew. You are welcome.)

    $ brew install phantomjs
    (...)

Let's try driving it:

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :phantomjs
    => #<Selenium::WebDriver::Driver:0x..fbdc736b89bb162d0 browser=:phantomjs>

    > browser.navigate.to "http://watir.com"
    => ""

    > browser.save_screenshot "phantomjs.png"
    => #<File:phantomjs.png (closed)>

The last command saves screenshot of the page. A screenshot from a headless browser. Nice, right?

![PhantomJS](https://raw.github.com/watir/watirbook/master/images/installation/mac/phantomjs.png)





### Opera ###

![Opera 11.51 on Mac 10.6](https://raw.github.com/watir/watirbook/master/images/installation/mac/opera.png)

To drive [Opera](http://www.opera.com/) (version 12.16), make sure you have it installed.

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :opera
    Selenium::WebDriver::Error::WebDriverError: Unable to find the Selenium
    server jar.  Please download the standalone server from
    http://code.google.com/p/selenium/downloads/list and set the
    SELENIUM_SERVER_JAR environmental variable to its location. More info at
    http://code.google.com/p/selenium/wiki/OperaDriver.
    (...)

Error message similar to the one when we first tried to open Chrome. The solution is similar too. Install selenium-server-standalone via Homebrew! (If you did not thank me for Homebrew, you can do it now. You are welcome.)

    $ brew install selenium-server-standalone
    (...)

Let's try again:

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :opera

![Install Java](https://raw.github.com/watir/watirbook/master/images/installation/mac/java.png)

A popup window will appear saying *To open "java," you need a Java SE 6 runtime. Would you like to install one now?*. Click buttion *Install*, agree with license agreement and Java will install.

Check if Java is installed. Open new Terminal window or tab (it is important to open new window or tab, Terminal will not see Java otherwise) and type `java -version`:

    $ java -version
    java version "1.6.0_65"
    Java(TM) SE Runtime Environment (build 1.6.0_65-b14-462-11M4609)
    Java HotSpot(TM) 64-Bit Server VM (build 20.65-b04-462, mixed mode)

The last step is setting `SELENIUM_SERVER_JAR` environmental variable.

If you just want to try driving opera, typing this into Terminal will do the trick:

    $ export SELENIUM_SERVER_JAR=/usr/local/opt/selenium-server-standalone/selenium-server-standalone-2.37.0.jar

Let's drive Opera, finally! (Following steps will work only in Terminal tab or window where you have exported SELENIUM_SERVER_JAR environment variable.)

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :opera
    Selenium::WebDriver::Error::UnknownError: Invalid service list received:
    (...)
    (java.lang.IllegalStateException)
    (...)

If you get above error message, install an older version of Opera. Looks like Selenium can not drive newer versions. The last version that I managed to drive was 12.16. You can get older versions at [opera.com/download/guide/?os=mac&list=all](http://www.opera.com/download/guide/?os=mac&list=all) or [arc.opera.com/pub/opera](http://arc.opera.com/pub/opera/).

Let's try again.

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :opera
    => #<Selenium::WebDriver::Driver:0x..fc28c93dae7536a48 browser=:opera>

    > browser.navigate.to "http://watir.com"
     => nil

Success!

If you plan to drive Opera frequently, you should add SELENIUM_SERVER_JAR to `.bash_profile` file. Create (if the file does not exist) or edit `.bash_profile` file in your home folder (`/Users/zeljko/.bash_profile` in my case, or shorter `~/.bash_profile`) with your favorite text editor. Add `export SELENIUM_SERVER_JAR...` line to the file (if you have a newer version of `selenium-server-standalone` file, replace `2.37.0` appropriately).

This is how to do it with *GNU nano*. Type type `nano ~/.bash_profile`. *GNU nano* text editor will open. Paste (cmd-v, for example) `export SELENIUM_SERVER_JAR...` line. Exit *GNU nano* and save the file with *control+x*. Press *y* when it asks `Save modified buffer (ANSWERING "No" WILL DESTROY CHANGES)?` and press *Enter* when it displays `File Name to Write: .bash_profile` or `Save modified buffer (ANSWERING "No" WILL DESTROY CHANGES)?` (text is different if the file already exists or not).

![GNU nano asking should it save changes to `.bash_profile` file](https://raw.github.com/watir/watirbook/master/images/installation/mac/nano.png)

 If you have done everything right, GNU nano will close and you will see normal Terminal window. We can check if the line is written to `.bash_profile` file:

    $ cat ~/.bash_profile
    export SELENIUM_SERVER_JAR=
    /usr/local/opt/selenium-server-standalone/selenium-server-standalone-2.37.0.jar

Open new Terminal window or tab (this is important, already opened windows or tabs would not see `SELENIUM_SERVER_JAR` variable). Run the same commands again and everything should just work.

    $ irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :opera
    => #<Selenium::WebDriver::Driver:0x..fc28c93dae7536a48 browser=:opera>

    > browser.navigate.to "http://watir.com"
     => nil
