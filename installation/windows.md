## Windows 8.1 ##

I> You will need internet access if you want to follow examples. All examples are tested with Microsoft Windows 8.1 Pro. All browsers are English (US) version.

![Windows 8.1 default desktop](https://raw.github.com/watir/watirbook/master/images/installation/windows/desktop.png)





### Ruby ###

You probably do not have Ruby installed. To make sure, open Command Prompt application and type `ruby -v`. If you are not familiar with Command Prompt, see *Command-line interface* chapter.

    >ruby -v
    'ruby' is not recognized as an internal or
    external command, operable program or batch file.

If you get the same thing as I did, you do not have Ruby installed.

Download the latest Ruby 2.0 from *[rubyinstaller.org/downloads](http://rubyinstaller.org/downloads)*. At the moment it is *Ruby 2.0.0-p353*. Execute the file.

![Ruby Installation](https://raw.github.com/watir/watirbook/master/images/installation/windows/ruby.png)

You can leave all settings at default values, except at the *Installation Destination and Optional Tasks* screen check *Add Ruby executables to your PATH* checkbox. Installation should take you just a few seconds.

Let's check if Ruby is installed. You will have to open another command prompt, because the one you have opened does not see Ruby.

    >ruby -v
    ruby 2.0.0p353 (2013-11-22) [i386-mingw32]

Congratulations! You now have the latest and greatest Ruby!





### RubyGems ###

Software written in Ruby is usually distributed as RubyGems (colloquial name is *gem*), Ruby package manager. Sometimes Ruby installations do not have the latest versions of RubyGems, so we will first update it. RubyGems is also a gem, (a bit recursive, right?) and we get it's version with `gem -v`.

    >gem -v
    2.0.14

You should update it with `gem update --system`:

    >gem update --system
    (...)
    RubyGems system software updated





### selenium-webdriver ###

Let's try selenium-webdriver gem.

    >gem install selenium-webdriver --no-ri --no-rdoc
    (...)
    Successfully installed selenium-webdriver-2.38.0
    (...)





### Internet Explorer ###

![Internet Explorer 11](https://raw.github.com/watir/watirbook/master/images/installation/windows/internet_explorer.png)

Since Internet Explorer (tested with version 11) is already installed, we will start with it. We will be using IRB (Interactive Ruby Shell). If you are not familiar with it, see *IRB* chapter.

    >irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for
    :internet_explorer
    Selenium::WebDriver::Error::WebDriverError: Unable
    to find standalone executable. Please download the
    IEDriverServer from
    http://code.google.com/p/selenium/downloads/list
    and place the executable on your PATH.
    (...)

Windows Firewall popup appeared letting me know that it has blocked Ruby.

![Windows Firewall has blocked some features of this program](https://raw.github.com/watir/watirbook/master/images/installation/windows/firewall.png)

For now just close the popup, let's see how to fix the error message. Follow the instructions from the error message. Go to [code.google.com/p/selenium/downloads/list](http://code.google.com/p/selenium/downloads/list) and download 32-bit or 64-bit IEDriverServer. Extract the downloaded zip file (with mouse right click and then *Extract All..*, for example). Let's find out what is on the PATH.

    >PATH
    PATH=C:\Windows\system32;C:\Windows;
    C:\Windows\System32\Wbem;
    C:\Windows\System32\WindowsPowerShell\v1.0\;
    C:\Ruby200\bin

`C:\Ruby200\bin` (or where ever you have installed Ruby) looks like a good place to me. Move the IEDriverServer file there.

Let' try again:

    >irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for
    :internet_explorer
    Started InternetExplorerDriver server (32-bit)
    2.38.0.0
    Listening on port 5555
    => #<Selenium::WebDriver::Driver:0x5469141e
    browser=:internet_explorer>

    > browser.get "http://watir.com"
    => nil





### Firefox ###

![Firefox 26](https://raw.github.com/watir/watirbook/master/images/installation/windows/firefox.png)

If it is not installed (tested with version 25.0.1), download it from [mozilla.com/firefox](http://www.mozilla.com/firefox/).

    >irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :firefox
    => #<Selenium::WebDriver::Driver:0xdc8ad4a
    browser=:firefox>

    > browser.get "http://watir.com"
    => ""





### Chrome ###

![Chrome 31](https://raw.github.com/watir/watirbook/master/images/installation/windows/chrome.png)

If it is not installed (tested with version 31), download it from [google.com/chrome](http://www.google.com/chrome).

    >irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :chrome
    Selenium::WebDriver::Error::WebDriverError: Unable
    to find the chromedriver executable. Please
    download the server from
    http://chromedriver.storage.googleapis.com/
    index.html and place it somewhere on your PATH.
    More info at
    http://code.google.com/p/selenium/wiki/
    ChromeDriver.
    (...)

You have to download [ChromeDriver](http://chromedriver.storage.googleapis.com/index.html). Unzip the file and put it in any folder that is in your `PATH`. If you do not know what is `PATH`, see *Internet Explorer* chapter. In short, move the file to Ruby folder, probably `C:\Ruby200\bin`.

Let's try again:

    >irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :chrome
    Starting ChromeDriver (v2.7.236900) on port 9515
    => #<Selenium::WebDriver::Driver:0x..fc23f2ebe
    browser=:chrome>

    > browser.get "http://watir.com"
    => nil

I got Windows Firewall popup again letting me know that it has blocked ChromeDriver. Just close it for now, I have no idea what to do with it.





### Chromium ###

![Chromium 34](https://raw.github.com/watir/watirbook/master/images/installation/windows/chromium.png)

First make sure that you can drive Chrome. (See *Chrome* chapter.) Then download [Chromium](https://download-chromium.appspot.com/). (Tested with version 33.) Replace `C:\chrome\chrome.exe` with path to Chromium executable.

    >irb

    > require "selenium-webdriver"
    => true

    > Selenium::WebDriver::Chrome.path =
    'C:\chrome\chrome.exe'
    => "C:\\chrome\\chrome.exe"

    > browser = Selenium::WebDriver.for :chrome
    Starting ChromeDriver (v2.7.236900) on port 9515
    => #<Selenium::WebDriver::Driver:0x..f9d38b82e
    browser=:chrome>

    > browser.get "http://watir.com"
    => nil





### PhantomJS ###

To drive [PhantomJS](http://phantomjs.org/) (tested with version 1.9.2) download it, unzip the file and put it in any folder that is in your `PATH`. If you do not know what is `PATH`, see *Internet Explorer* chapter. In short, move `phantomjs.exe` file to Ruby folder, probably `C:\Ruby200\bin`.

Let's try driving it:

    >irb

    > browser = Selenium::WebDriver.for :phantomjs
    (...)
    => #<Selenium::WebDriver::Driver:0x442ed372
    browser=:phantomjs>

    > browser.get "http://watir.com"
    => {}

    > browser.save_screenshot "phantomjs.png"
    => #<File:phantomjs.png (closed)>

The last command saves screenshot of the page. A screenshot from a headless browser. Nice, right?

![PhantomJS](https://raw.github.com/watir/watirbook/master/images/installation/windows/phantomjs.png)





### Java ###

To drive Opera, you will have to install Java first. Let's check if Java is already installed with `java -version`:

    >java -version
    'java' is not recognized as an internal or
    external command, operable program or batch file.

Looks like we will have to install Java. There is big *Free Java Download* button at
[java.com](http://www.java.com/). Execute downloaded file and install Java. Let's check if Java is really installed with `java -version`:

    >java -version
    java version "1.7.0_45"
    Java(TM) SE Runtime Environment
    (build 1.7.0_45-b18)
    Java HotSpot(TM) Client VM (build 24.45-b08,
    mixed mode, sharing)

Looks good to me!





### Opera ###

![Opera 18](https://raw.github.com/watir/watirbook/master/images/installation/windows/opera.png)

And finally, let's drive Opera. If you do not have it installed, you can get it at [opera.com](http://www.opera.com/) (tested with version 18.0).

    >irb

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

Download `selenium-server-standalone-2.39.0.jar` (or newer version) from
[Google Code](http://code.google.com/p/selenium/downloads/list) and put it in `C:\Ruby200\bin`. Then make `SELENIUM_SERVER_JAR` environmental variable and set it to `C:\Ruby200\bin\selenium-server-standalone-2.39.0.jar`. (If you have a newer version of `selenium-server-standalone` file, replace `2.39.0` appropriately.)

If you just want to try driving Opera, typing this into Command Prompt will do the trick:

    >set SELENIUM_SERVER_JAR=C:\Ruby200\bin\
    selenium-server-standalone-2.39.0.jar

Let's try driving Opera again.

    >irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :opera
    Selenium::WebDriver::Error::UnknownError: Could
    not find a platform that supports bundled
    launchers, please set it manually
    Build info: version: '2.39.0', revision: 'ff23eac',
    time: '2013-12-16 16:11:15'
    System info: host: 'IE11WIN8_1', ip: '10.0.2.15',
    os.name: 'Windows 8',
    os.arch: 'x86', os.version: '6.2', java.version:
    '1.7.0_45'
    Driver info: driver.version: OperaDriver
    (org.openqa.selenium.WebDriverException)

Looks like Selenium can not drive Opera on Windows 8.1.

If I ever manage to drive Opera on Windows, to create a permanent environmental variable, use `setx`:

    >setx SELENIUM_SERVER_JAR C:\Ruby200\bin\
    selenium-server-standalone-2.39.0.jar
    SUCCESS: Specified value was saved.

Open new command prompt, the old one will not see `SELENIUM_SERVER_JAR` variable.
