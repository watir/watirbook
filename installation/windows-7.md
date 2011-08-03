## Windows 7

![Windows 7 default desktop](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows-7/windows-7-desktop.png)\

*Windows 7 default desktop*

Machine is a clean installation of Microsoft 7 Professional 32-bit, Service Pack 1, 1 GB RAM. Fully patched with Internet Explorer 9.

### Ruby

You probably do not have Ruby installed. To make sure, open command prompt (*Start > Search programs and files > type: cmd > Enter*) and type `ruby -v`.

    C:\Users\zeljko>ruby -v
    'ruby' is not recognized as an internal or external command,
    operable program or batch file.

If you get the same thing as I did, you do not have Ruby installed.

Download the latest Ruby 1.9. from [rubyinstaller.org/downloads](http://rubyinstaller.org/downloads). At the moment it is Ruby 1.9.2-p290 and it is approximately 14 MB. Execute the file.

![Ruby Installation](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows-7/windows-7-ruby-installation.png)\

*Ruby Installation*

You can leave all settings at default values, except at the *Installation Destination and Optional Tasks* screen check both *Add Ruby executables to your PATH* and *Associate .rb and .rbw files with this Ruby installation* checkboxes. Installation should take you just a few seconds.

Let's check if Ruby is installed. You will have to open another command prompt, because the one you have opened does not see Ruby.

    C:\Users\zeljko>ruby -v
    ruby 1.9.2p290 (2011-07-09) [i386-mingw32]

Congratulations! You now have the latest and greatest Ruby, 1.9.2!

### RubyGems

Software written in Ruby is usually distributed as RubyGems (colloquial name is gem), Ruby package manager. Sometimes Ruby installations do not have the latest versions of RubyGems, so we will first update it. RubyGems is also a gem, (a bit recursive, right?) and we can ask it for it's version with `gem -v`.

    C:\Users\zeljko>gem -v
    1.7.2

You should update it with `gem update --system`:

    C:\Users\zeljko>gem update --system
    Updating rubygems-update
    Fetching: rubygems-update-1.8.5.gem (100%)
    Successfully installed rubygems-update-1.8.5
    Installing RubyGems 1.8.5
    RubyGems 1.8.5 installed
    (...)
    RubyGems system software updated

Ask RubyGems again for it's version, just to make sure:

    C:\Users\zeljko>gem -v
    1.8.5

### watir-webdriver

If you are just starting with Watir, start with watir-webdriver gem. It can drive (alphabetically) Chrome, Firefox, Internet Explorer and Opera.

Install it with `gem install watir-webdriver --no-ri --no-rdoc`:

    C:\Users\zeljko>gem install watir-webdriver --no-ri --no-rdoc
    (...)
    Fetching: watir-webdriver-0.2.6.gem (100%)
    (...)
    Successfully installed watir-webdriver-0.2.6
    6 gems installed

### Internet Explorer with watir-webdriver

Let's see if it can drive Internet Explorer:

    C:\Users\zeljko>irb
    irb(main):001:0> require "watir-webdriver"
    => true
    irb(main):002:0> browser = Watir::Browser.new :ie
    Selenium::WebDriver::Error::NoSuchDriverError: Unexpected error launching Internet Explorer. Protected Mode must be set to the same value (enabled or disabled) for all zones.
    (...)

I got `Protected Mode must be set to the same value (enabled or disabled) for all zones` error message and Windows Firewall popup appeared letting me know that it has blocked `C:\ruby192\bin\ruby.exe`.

![Windows Firewall has blocked some features of this program](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows-7/firewall.png)\

*Windows Firewall has blocked some features of this program*

For now just close the popup, let's see how to fix the error message.

Open *Internet Explorer > wrench > Internet Options > Security*. There are four zones: Internet, Local intranet, Trusted sites and Restricted sites. Protected Mode is enabled by default in Internet and Restricted sites. Enable it for Local intranet and Trusted sites and close the browser.

![Enable Protected Mode for all zones](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows-7/protected-mode.png)\

*Enable Protected Mode for all zones*

Let' try again:

    C:\Users\zeljko>irb
    irb(main):001:0> require "watir-webdriver"
    => true
    irb(main):002:0> browser = Watir::Browser.new :ie
    => #<Watir::Browser:0x..fcf3d4bb8 url="http://localhost:5555/" title="WebDriver">
    irb(main):003:0> browser.goto "watir.com"
    => "http://watir.com/"
    irb(main):004:0>

It works!

![watir-webdriver gem drives Internet Explorer 9 on Windows 7](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows-7/webdriver-ie.png)\

*watir-webdriver gem drives Internet Explorer 9 on Windows 7*

### Firefox with watir-webdriver

Can it drive Firefox? It can! (If you do not have it installed, download it from [mozilla.com/firefox](http://www.mozilla.com/firefox/).)

    C:\Users\zeljko>irb
    irb(main):001:0> require "watir-webdriver"
    => true
    irb(main):002:0> browser = Watir::Browser.new :ff
    => #<Watir::Browser:0x62d8c4a6 url="about:blank" title="">
    irb(main):003:0> browser.goto "watir.com"
    => "http://watir.com/"

![watir-webdriver gem drives Firefox 5 on Windows 7](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows-7/webdriver-ff.png)\

*watir-webdriver gem drives Firefox 5 on Windows 7*

### Chrome with watir-webdriver

Could it be that it can drive Chrome too? Let's find out. (You can get Chrome at [google.com/chrome](http://www.google.com/chrome).)

    C:\Users\zeljko>irb
    irb(main):001:0> require "watir-webdriver"
    => true
    irb(main):002:0> browser = Watir::Browser.new :chrome
    Selenium::WebDriver::Error::WebDriverError: Unable to find the chromedriver executable. Please download the server from http://code.google.com/p/chromium/downloads/list and place it somewhere on your PATH. More info at http://code.google.com/p/selenium/wiki/ChromeDriver.
    (...)

Looks like there is a problem. You have to download `chromedriver_win32_14.0.836.0.zip` from http://code.google.com/p/chromium/downloads/list. Unzip the file (you will get `chromedriver.exe`) and put it in any folder that is in your PATH. To check which folders are in PATH, open command prompt and type `path`:

    C:\Users\zeljko>path
    PATH=C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Ruby192\bin

Folders are separated with `;`. `C:\Ruby192\bin` looks like a good place, so I will put `chromedriver.exe there. Let's try again:

    C:\Users\zeljko>irb
    irb(main):001:0> require "watir-webdriver"
    => true
    irb(main):002:0> browser = Watir::Browser.new :chrome
    Started ChromeDriver
    port=49522
    => #<Watir::Browser:0x..fdbf27548 url="about:blank" title="about:blank">
    irb(main):003:0> browser.goto "watir.com"
    => "http://watir.com/"

![watir-webdriver gem drives Chrome 12 on Windows 7](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows-7/webdriver-chrome.png)\

*watir-webdriver gem drives Chrome 12 on Windows 7*

I got Windows Firewall popup again letting me know that it has blocked `C:\ruby192\bin\chromedriver.exe`. Just close it for now, I have no idea what to do with it.

### Opera with watir-webdriver

And finally, let's drive Opera. If you do not have it installed, you can get it at [opera.com](http://www.opera.com/).

    C:\Users\zeljko>irb
    irb(main):001:0> require "watir-webdriver"
    => true
    irb(main):002:0> browser = Watir::Browser.new :opera
    Selenium::WebDriver::Error::WebDriverError: Unable to find the Selenium server jar.  Please download the standalone server from http://code.google.com/p/selenium/downloads/list and set the SELENIUM_SERVER_JAR environmental variable to its location.  More info at http://code.google.com/p/selenium/wiki/OperaDriver.

Download `selenium-server-standalone-2.0.0.jar` from http://code.google.com/p/selenium/downloads/list and put it in `C:\Ruby192\bin`. Then make SELENIUM_SERVER_JAR environmental variable and set it to `C:\Ruby192\bin\selenium-server-standalone-2.0.0.jar`. To create environmental variable right click computer and click `Properties > Advanced system settings > Environmental Variables > User variables > New... > Variable name: SELENIUM_SERVER_JAR > Variable value: C:\Ruby192\bin\selenium-server-standalone-2.0.0.jar > OK > OK > OK`.

Still no luck. This is what I get:

    C:\Users\zeljko>irb
    irb(main):001:0> require "watir-webdriver"
    => true
    irb(main):002:0> browser = Watir::Browser.new :opera
    ChildProcess::Error: The system cannot find the file specified.
    from C:/Ruby192/lib/ruby/gems/1.9.1/gems/childprocess-0.1.9/lib/childprocess/windows/functions.rb:40:in `create_proc'
    from C:/Ruby192/lib/ruby/gems/1.9.1/gems/childprocess-0.1.9/lib/childprocess/windows/process.rb:58:in `launch_process'
    from C:/Ruby192/lib/ruby/gems/1.9.1/gems/childprocess-0.1.9/lib/childprocess/abstract_process.rb:52:in `start'
    from C:/Ruby192/lib/ruby/gems/1.9.1/gems/selenium-webdriver-2.0.1/lib/selenium/server.rb:27:in `start'
    from C:/Ruby192/lib/ruby/gems/1.9.1/gems/selenium-webdriver-2.0.1/lib/selenium/webdriver/opera/service.rb:37:in `start'
    from C:/Ruby192/lib/ruby/gems/1.9.1/gems/selenium-webdriver-2.0.1/lib/selenium/webdriver/opera/bridge.rb:21:in `initialize'
    from C:/Ruby192/lib/ruby/gems/1.9.1/gems/selenium-webdriver-2.0.1/lib/selenium/webdriver/common/driver.rb:39:in `new'
    from C:/Ruby192/lib/ruby/gems/1.9.1/gems/selenium-webdriver-2.0.1/lib/selenium/webdriver/common/driver.rb:39:in `for'
    from C:/Ruby192/lib/ruby/gems/1.9.1/gems/selenium-webdriver-2.0.1/lib/selenium/webdriver.rb:76:in `for'
    from C:/Ruby192/lib/ruby/gems/1.9.1/gems/watir-webdriver-0.2.6/lib/watir-webdriver/browser.rb:35:in `initialize'
    from (irb):2:in `new'
    from (irb):2
    from C:/Ruby192/bin/irb:12:in `<main>'

\newpage

