## Mac OS X 10.7, 10.6 and 10.5 ##

*You will need internet access if you want to follow examples in this chapter.*

![Mac OS X 10.6 default desktop](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/mac/desktop.png)\

*Mac OS X 10.6 default desktop*

Machine is a clean installation of Mac OS X 10.7.2, 10.6.8 or 10.5.8, fully patched, with 4 GB RAM. 10.7 has Safari 5.1.2, 10.6 has Safari 5.1 and 10.5 has Safari 5.0.6. Firefox is 6.0.1, Chrome 13, Opera 11.51. All browsers are English (US) version.





### Ruby ###

Regarding installing Ruby on Mac, I have good news and bad news. Good news is that Ruby is already installed by default, so you can skip this step if you just want to try Watir. Bad news is that you have an old version of Ruby installed. It will be good enough for trying Watir, but if you decide you want to use it, you will probably want to install a newer version. So, for now, I will skip Ruby installation. I will cover it later.

To check if Ruby is installed on your Mac, open Terminal application (located in `/Applications/Utilities`) any type `ruby -v`.

On 10.7 you should get this:

    $ ruby -v
    ruby 1.8.7 (2010-01-10 patchlevel 249) [universal-darwin11.0]

On 10.6 you should get this:

    $ ruby -v
    ruby 1.8.7 (2009-06-12 patchlevel 174) [universal-darwin10.0]

On 10.5 you should get this:

    $ ruby -v
    ruby 1.8.6 (2009-06-08 patchlevel 369) [universal-darwin9.0]





### RubyGems on 10.7 and 10.6 ###

With RubyGems, the same story as with Ruby. It is already installed, but an old version. Let's see which version is here with `gem -v`.

On 10.7 you should get this:

    $ gem -v
    1.3.6

On 10.6 you should get this:

    $ gem -v
    1.3.5

Both versions are pretty old. Watir needs never version. Fortunately, it is easy to upgrade RubyGems with `sudo gem update --system`:

    $ sudo gem update --system
    (...)
    RubyGems 1.8.12 installed
    (...)





### RubyGems on 10.5 ###

With RubyGems, the same story as with Ruby. It is already installed, but an old version. Let's see which version is here with `gem -v`:

    $ gem -v
    1.0.1

RubyGems 1.0.1 is pretty old. Watir needs never version. Fortunately, it should be easy to upgrade RubyGems with `sudo gem update --system`:

    $ sudo gem update --system
    (...)
    Updating RubyGems...
    ERROR:  While executing gem ... (Gem::RemoteSourceException)
    HTTP Response 302 fetching http://gems.rubyforge.org/yaml

Now you see why I said "should be easy". RubyGems 1.0.1 is so old, it could not even be updated the easy way. See how lucky you are to have this book? Of course there is a way to upgrade to the newer version of RubyGems. The latest version I could install or Ruby 1.8.6 is RubyGems 1.4.2. Download [rubygems-update-1.4.2.gem] (click *Download* link), open Terminal window in folder where you have downloaded it (`/Users/zeljko/Downloads` in my case) and install it:

    $ sudo gem install -l rubygems-update-1.4.2.gem
    Successfully installed rubygems-update-1.4.2
    1 gem installed
    Installing ri documentation for rubygems-update-1.4.2...
    Installing RDoc documentation for rubygems-update-1.4.2...

    $ sudo update_rubygems
    RubyGems 1.4.2 installed
    File not found: README

Ignore `File not found: README` error message. Check if RubyGems is updated:

    $ gem -v
    1.4.2

Everything is as it should be.

[rubygems-update-1.4.2.gem]: https://rubygems.org/gems/rubygems-update/versions/1.4.2





### OSX GCC Installer ###

You will need OSX GCC Installer or Xcode if you want to install watir-webdriver gem. OSX GCC Installer is way smaller than Xcode (287 MB instead of 1.68 GB for 10.7, 180 MB instead of 4.1 GB for 10.6). If you want to install safariwatir gem, OSX GCC Installer is not enough, you will have to install Xcode. There is no OSX GCC Installer for 10.5, you will have to install Xcode 3.1 ("just" 1 GB).

Download OSX GCC Installer from https://github.com/kennethreitz/osx-gcc-installer and install it.





### Xcode 4.2.1 for 10.7 ###

To install Xcode 4.2.1 on 10.7, open App Store application and search for Xcode. Download and install it. Please notice it is 1.68 GB.





### Xcode 3.2 for 10.6 ###

*Xcode 3.2 does not work on Mac OS 10.5. It works on 10.6.*

You will need Xcode from Apple if you want to install watir-webdriver or safariwatir gems.

The easiest way to install Xcode is from Mac OS DVD. Insert the DVD, go to *Optional Installs* folder and double click *Xcode.mpkg* file.

![Install Xcode 3.2 from Mac OS DVD](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/mac/xcode-3-2.png)\

*Install Xcode 3.2 from Mac OS DVD*

You can get a newer version from Apple web site. You will need Apple ID. It is username and password you already use for iTunes Store or Mac App Store. If you do not have Apple ID, you can create one for free. Sign in with your Apple ID at [Xcode] site and on the bottom right you will see *Looking for Xcode 3? Download Now*. Download *Xcode 3.2.6 and iOS SDK 4.3 (Disk Image)*. Please notice it is 4.1 GB.

You can get the newest Xcode 3.2 without Apple ID and without downloading 4 GB file. Install Xcode 3.2 from Mac OS DVD and run Software Update. It will update Xcode to 3.2.6, and downloaded file will be "just" about 600 MB.

[Xcode]: http://developer.apple.com/xcode/





### Xcode 3.1 for 10.5 ###

*Xcode 3.1 is for Mac OS 10.5. On 10.6 install Xcode 3.2 or Xcode 4.*

You will need Xcode from Apple for watir-webdriver and safariwatir gems.

The easiest way to install Xcode is from Mac OS DVD. Insert the DVD, go to *Optional Installs/Xcode Tools* folder and double click *XcodeTools* file. Leave all settings at default values.

![Install Xcode 3.1.2 from Mac OS DVD](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/mac/xcode-3-1.png)\

*Install Xcode 3.1.2 from Mac OS DVD*

Optionally, after Xcode is installed, run Software Update. At the moment, there is no update.

If you do not have Mac OS 10.5 DVD, you can download Xcode 3.1.4 from Apple. Log in to http://connect.apple.com/ with your Apple ID. Click *Developer Tools* link (at the right hand side, under *Downloads*) and download *Xcode 3.1.4 Developer DVD (Disk Image)*. Please note it is 993 MB.





### Xcode 4 for 10.6 ###

*Xcode 4 does not work on Mac OS 10.5. It works on 10.6.*

According to Xcode site, Xcode 4 "is a free download for all members of the iOS and Mac Developer Programs". Both programs are $99/year. If you are not a member of mentioned programs (I am not), you can buy it from Mac App Store for $4.99. But, since you can install Xcode 3 for free, there is no need to buy anything.





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
    /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/
    ruby extconf.rb
    mkmf.rb can't find header files for ruby at /System/Library/
    Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/ruby.h
    Gem files will remain installed in /Library/Ruby/Gems/1.8/gems/
    rb-appscript-0.6.1 for inspection.
    Results logged to /Library/Ruby/Gems/1.8/gems/rb-appscript-0.6.1/
    ./gem_make.out

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

    > browser.goto "http://watir.com"
    => nil

It works! :)

![safariwatir gem driving Safari 5 on Mac OS 10.6](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/mac/safariwatir.png)\

*safariwatir gem driving Safari 5 on Mac OS 10.6*





### watir-webdriver ###

Let's try watir-webdriver gem. For now it can drive Firefox, Chrome and Opera. It should also be able to drive Safari in the future. Install it with `sudo gem install watir-webdriver --no-ri --no-rdoc`.

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





### Firefox with watir-webdriver on 10.6 ###

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





### Firefox with watir-webdriver on 10.5 ###

There is a problem with driving Firefox 4+ on 10.5:

    $ irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :ff
    Selenium::WebDriver::Error::WebDriverError: unable to start Firefox cleanly, args: ["-silent"]
    (...)

Take a look at https://github.com/jnicklas/capybara/issues/313 for more detail.

The easiest way to fix it is to uninstall the current version of Firefox, and install Firefox 3.6.22. I could not find how to download Firefox 4 or 5, so I did not test with them.

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

Looks like we have to install something called *chromedriver executable*. Fortunately, the error message is pretty clear. Download `chromedriver_mac_14.0.836.0.zip` (or newer version, the description should be *ChromeDriver server for Mac OS X*) from *http://code.google.com/p/chromium/downloads/list* and unzip it (with mouse double-click, for example). You will get a file named `chromedriver`. Put it *somewhere on your `PATH`*, as the error message said. If you have no idea what that means, read on. To find out where to put `chromedriver` file, type this in Terminal:

    $ echo $PATH
    /usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

So, in my case, these folders are on my `PATH`: `/usr/bin`, `/bin`, `/usr/sbin`, `/sbin`, `/usr/local/bin` and `/usr/X11/bin`. `usr/bin` looks like a good place to put `chromedriver` file. To open the folder, go to *Finder > Go > Go to Folder > /usr/bin > Go*. Copy the file there. You will have to provide admin password.

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

On 10.6 you should get this:

    $ java -version
    java version "1.6.0_26"
    Java(TM) SE Runtime Environment (build 1.6.0_26-b03-384-10M3425)
    Java HotSpot(TM) 64-Bit Server VM (build 20.1-b02-384, mixed mode)

On 10.5 you should get this:

    java version "1.5.0_30"
    Java(TM) 2 Runtime Environment, Standard Edition (build 1.5.0_30-b03-389-9M3425)
    Java HotSpot(TM) Client VM (build 1.5.0_30-161, mixed mode)





### Opera with watir-webdriver ###

![Opera 11.51 on Mac 10.6](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/mac/opera.png)\

*Opera 11.51 on Mac 10.6*

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

