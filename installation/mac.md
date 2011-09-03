## Mac OS X 10.6 ##

![Mac OS X 10.6 default desktop](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/mac/desktop.png)\

*Mac OS X 10.6 default desktop*

Machine is a clean installation of Mac OS X 10.6.8, fully patched, with 4 GB RAM. Safari 5.1 (6534.50), Firefox 6.0.1, Chrome 13.0.782.218, Opera 11.51. All browsers are English (US) version.





### Ruby ###

Regarding installing Ruby on Mac, I have good news and bad news. Good news is that Ruby is already installed by default, so you can skip this step if you just want to try Watir. Bad news is that you have an old version of Ruby installed. It will be good enough for trying Watir, but if you decide you want to use it, you will probably want to install a newer version of Ruby. So, for now, I will skip Ruby installation. I will cover it later.

To check if Ruby is installed on your Mac, open Terminal application (located in `/Applications/Utilities`) any type `ruby -v`:

    $ ruby -v
    ruby 1.8.7 (2009-06-12 patchlevel 174) [universal-darwin10.0]

You should get the same result as I did. Ruby 1.8.7 patchlevel 174 (released June 12, 2009). That is actually not so bad.





### RubyGems ###

With RubyGems, the same story as with Ruby. It is already installed, but an old version. Let's see which version is here with `gem -v`:

    $ gem -v
    1.3.5

1.3.5 is pretty old. Watir needs never version. Fortunately, it is easy to upgrade RubyGems with `sudo gem update --system`:

    $ sudo gem update --system
    (...)
    RubyGems 1.8.10 installed
    (...)





### Xcode 3.2 ###

You will need Xcode from Apple if you want to install watir-webdriver or safariwatir gems.

The easiest way to install Xcode is from Mac OS DVD. Insert the DVD, go to *Optional Installs* folder and double click *Xcode.mpkg* file.

![Install Xcode 3.2 from Mac OS DVD](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/mac/xcode-dvd.png)\

*Install Xcode 3.2 from Mac OS DVD*

You can get a newer version from Apple web site. You will need Apple ID. It is username and password you already use for iTunes Store or Mac App Store. If you do not have Apple ID, you can create one for free. Sign in with your Apple ID at [Xcode] site and on the bottom right you will see *Looking for Xcode 3? Download Now*. Download *Xcode 3.2.6 and iOS SDK 4.3 (Disk Image)*. Please notice it is 4.1 GB.

You can get the newest Xcode 3.2 without Apple ID and without downloading 4 GB file. Install Xcode 3.2 from Mac OS DVD and run Software Update. It will update Xcode to 3.2.6, and downloaded file will be "just" about 600 MB.





### Xcode 4 ###

According to Xcode site, Xcode 4 "is a free download for all members of the iOS and Mac Developer Programs". Both programs are $99/year. If you are not a member of mentioned programs (I am not), you can buy it from Mac App Store for $4.99. But, since you can install Xcode 3 for free, there is no need to buy anything.

[Xcode]: http://developer.apple.com/xcode/





### Safari with safariwatir ###

![Safari 5.1 on Mac 10.6](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/mac/safari.png)\

*Safari 5.1 on Mac 10.6*

Safari is installed by default on Mac OS X, so you do not have to install it. You do have to install Xcode 3 or 4 (see previous chapters).

If you do not have Xcode installed, you will get this error message if you try to install safariwatir:

    $ sudo gem install safariwatir --no-ri --no-rdoc
    (...)
    Fetching: rb-appscript-0.6.1.gem (100%)
    Building native extensions.  This could take a while...
    ERROR:  Error installing safariwatir:
    ERROR: Failed to build gem native extension.
    /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby
      extconf.rb
    mkmf.rb can't find header files for ruby at
      /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/ruby.h
    Gem files will remain installed in
      /Library/Ruby/Gems/1.8/gems/rb-appscript-0.6.1 for inspection.
    Results logged to
      /Library/Ruby/Gems/1.8/gems/rb-appscript-0.6.1/./gem_make.out

Install Xcode 3 or 4 and try again:

    $ sudo gem install safariwatir --no-ri --no-rdoc
    (...)
    Successfully installed safariwatir-0.4.0
    (...)

Let's try safariwatir.

    $ irb

    > require "safariwatir"
    => true

    > browser = Watir::Safari.new
    => #<Watir::Safari:0x10116fc68
      @scripter=#<Watir::AppleScripter:0x10116fbf0
      @js=#<Watir::JavaScripter:0x10116fc18>, @typing_lag=0.08,
      @app=app("/Applications/Safari.app"),
      @document=app("/Applications/Safari.app").documents[1],
      @appname="Safari">>

    > browser.goto "http://google.com"
    => nil

It works! :)

![safariwatir gem driving Safari 5 on Mac OS 10.6](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/mac/safariwatir.png)\

*safariwatir gem driving Safari 5 on Mac OS 10.6*





### watir-webdriver ###

Let's try watir-webdriver gem. For now it can drive Firefox, Chrome and Opera on Mac. It should also be able to drive Safari in the future. Install it with `sudo gem install watir-webdriver --no-ri --no-rdoc`.

If you did not install Xcode, you will get this:

    $ sudo gem install watir-webdriver --no-ri --no-rdoc
    (...)
    Fetching: ffi-1.0.7.gem (100%)
    (...)
    Building native extensions.  This could take a while...
    ERROR:  Error installing watir-webdriver:
    ERROR: Failed to build gem native extension.
    /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby
      extconf.rb
    mkmf.rb can't find header files for ruby at
      /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/ruby.h
    Gem files will remain installed in
      /Library/Ruby/Gems/1.8/gems/ffi-1.0.7 for inspection.
    Results logged to
      /Library/Ruby/Gems/1.8/gems/ffi-1.0.7/ext/ffi_c/gem_make.out

Fortunately, it is easy to fix. Install Xcode 3 or 4 (see previous chapters).

Try again:

    $ sudo gem install watir-webdriver --no-ri --no-rdoc
    (...)
    Successfully installed watir-webdriver-0.3.2
    (...)





### Firefox with watir-webdriver ###

![Firefox 6 on Mac OS 10.6](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/mac/firefox.png)\

*Firefox 6 on Mac OS 10.6*

Let's try to drive Firefox! To drive [Firefox], make sure you have it installed. Open our old friend IRB and type this:

    $ irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :ff
    => #<Watir::Browser:0x10101ee40 url="about:blank" title="">

    > browser.goto "watir.com"
    => "http://watir.com/"

Great! We can drive Firefox.

![watir-webdriver driving Firefox 4 on Mac OS 10.6](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/mac/webdriver-firefox.png)\

*watir-webdriver driving Firefox 4 on Mac OS 10.6*

[Firefox]: http://www.mozilla.com/en-US/firefox/new/





### Chrome with watir-webdriver ###

![Chrome 13 on Mac OS 10.6](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/mac/chrome.png)\

*Chrome 13 on Mac OS 10.6*

Let's see if it can really drive Chrome too. To drive [Chrome], make sure you have it installed.

    $ irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :chrome
    Selenium::WebDriver::Error::WebDriverError: Unable to find the
    chromedriver executable. Please download the server from
    http://code.google.com/p/chromium/downloads/list and place it
    somewhere on your PATH. More info at
    http://code.google.com/p/selenium/wiki/ChromeDriver.

Looks like we have to install something called *chromedriver executable*. Fortunately, the error message is pretty clear. Download `chromedriver_mac_14.0.836.0.zip` (or newer version, the description should be *ChromeDriver server for Mac OS X*) from *http://code.google.com/p/chromium/downloads/list* and unzip it (with mouse double-click, for example). You will get a file named `chromedriver`. Put it *somewhere on your PATH*, as the error message said. If you have no idea what that means, read on. To find out where to put `chromedriver` file, type this in Terminal:

    $ echo $PATH
    /usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

So, in my case, these folders are on my PATH: `/usr/bin`, `/bin`, `/usr/sbin`, `/sbin`, `/usr/local/bin` and `/usr/X11/bin`. `usr/bin` looks like a good place to put `chromedriver` file. To open the folder, go to *Finder > Go > Go to Folder > /usr/bin > Go*. Copy the file there. You will have to provide admin password.

Let's try again:

    $ irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :chrome
    => #<Watir::Browser:0x12d610c url="about:blank" title="about:blank">

    > browser.goto "watir.com"
    => "http://watir.com/"

Finally! It works!

![watir-webdriver driving Chrome 12 on Mac OS 10.5](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/mac/webdriver-chrome.png)\

*watir-webdriver driving Chrome 12 on Mac OS 10.5*

[Chrome]: http://www.google.com/chrome/





### Java ###

To drive Opera, you need Java. Fortunatelly, it is already installed. All you have to do is check if it is installed with `java -version`:

    $ java -version
    java version "1.6.0_26"
    Java(TM) SE Runtime Environment (build 1.6.0_26-b03-384-10M3425)
    Java HotSpot(TM) 64-Bit Server VM (build 20.1-b02-384, mixed mode)





### Opera with watir-webdriver ###

![Opera 11.51 on Mac 10.6](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/mac/opera.png)\

*Opera 11.51 on Mac 10.6*

Let's see how it drives Opera. To drive [Opera], make sure you have it installed.

    $ irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :opera
    Selenium::WebDriver::Error::WebDriverError: Unable to find the
    Selenium server jar.  Please download the standalone server from
    http://code.google.com/p/selenium/downloads/list and set the
    SELENIUM_SERVER_JAR environmental variable to its location.
    More info at http://code.google.com/p/selenium/wiki/OperaDriver.

Error message similar to the one when we first tried to open Chrome. The solution is similar too. We have to download a file, put it somewhere and point a variable to it. Do not worry, it sounds more complicated than it really is. Fortunately again, the error message says it all. Go to *http://code.google.com/p/selenium/downloads/list* and download `selenium-server-standalone-2.5.0.jar` (or newer version). Since I have put `chromedriver` file in `/usr/bin`, I will put `selenium-server-standalone-2.5.0.jar` file there too. You will have to provide admin password when copying the file.

The last step is setting SELENIUM_SERVER_JAR environmental variable. Create (if the file does not exist) or edit `.bash_profile` file in your home folder (`/Users/zeljko` in my case) with your favorite text editor. Add this line to the file:

     export SELENIUM_SERVER_JAR=/usr/bin/selenium-server-standalone-2.5.0.jar

If you just got lost, I have step by step guide how to do it. Open new Terminal tab or window and type `nano .bash_profile`:

    $ nano .bash_profile

GNU nano text editor will open. Paste (cmd-v) `export SELENIUM_SERVER_JAR...` line. Exit GNU nano and save the file with *control+x*, press *y* when it asks `Save modified buffer (ANSWERING "No" WILL DESTROY CHANGES) ?` and press *Enter* when it displays `Save modified buffer (ANSWERING "No" WILL DESTROY CHANGES) ?`.

![GNU nano asking should it save changes to `.bash_profile` file](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/mac/nano.png)\

*GNU nano asking should it save changes to `.bash_profile` file*

 If you have done everything right, GNU nano will close and you will see normal Terminal window. We can check if the line is written to `.bash_profile` file:

    $ cat .bash_profile
    export SELENIUM_SERVER_JAR=/usr/bin/selenium-server-standalone-2.5.0.jar

Let's drive Opera, finally! Open new Terminal window or tab (this is important, already opened windows or tabs would not see `SELENIUM_SERVER_JAR` variable).

    $ irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :opera
    #<Watir::Browser:0x1017f6a28 url="opera:debug" title="Connect to Debugger">

![watir-webdriver gem drives Opera 11.51 on Mac 10.6](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/mac/webdriver-opera.png)\

*watir-webdriver gem drives Opera 11.51 on Mac 10.6*

[Opera]: http://www.opera.com/

\newpage

