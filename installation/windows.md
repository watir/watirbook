## Windows 8.1 ##

*You will need internet access if you want to follow examples in this chapter.*

![Windows 7 default desktop](https://raw.github.com/watir/watirbook/master/images/installation/windows/desktop.png)

Machine is a clean installation of Microsoft Windows 8.1 Pro with Internet Explorer 11, 1 GB RAM, fully patched.





### Ruby ###

You probably do not have Ruby installed. To make sure, open Command Prompt application and type `ruby -v`.

    >ruby -v
    'ruby' is not recognized as an internal or external command,
    operable program or batch file.

If you get the same thing as I did, you do not have Ruby installed.

Download the latest Ruby 2.0 from *[rubyinstaller.org/downloads](http://rubyinstaller.org/downloads)*. At the moment it is *﻿Ruby 2.0.0-p353*. Execute the file.

![Ruby Installation](https://raw.github.com/watir/watirbook/master/images/installation/windows/ruby.png)

You can leave all settings at default values, except at the *Installation Destination and Optional Tasks* screen check *Add Ruby executables to your PATH* checkbox. Installation should take you just a few seconds.

Let's check if Ruby is installed. You will have to open another command prompt, because the one you have opened does not see Ruby.

    >ruby -v
    ﻿ruby 2.0.0p353 (2013-11-22) [i386-mingw32]

Congratulations! You now have the latest and greatest Ruby!





### RubyGems ###

Software written in Ruby is usually distributed as RubyGems (colloquial name is *gem*), Ruby package manager. Sometimes Ruby installations do not have the latest versions of RubyGems, so we will first update it. RubyGems is also a gem, (a bit recursive, right?) and we get it's version with `gem -v`.

    >gem -v
    ﻿2.0.14

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

Since Internet Explorer is already installed, we will start with it.

    ﻿>irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :internet_explorer
    Selenium::WebDriver::Error::WebDriverError: Unable to find standalone executable. Please download the IEDriverServer from http://code.google.com/p/selenium/downloads/list and place the executable on your PATH.
    (...)

Windows Firewall popup appeared letting me know that it has blocked Ruby.

![Windows Firewall has blocked some features of this program](https://raw.github.com/watir/watirbook/master/images/installation/windows/firewall.png)

For now just close the popup, let's see how to fix the error message. Follow the instructions from the error message. Go to [code.google.com/p/selenium/downloads/list](http://code.google.com/p/selenium/downloads/list) and download 32-bit or 64-bit IEDriverServer. Extract the downloaded zip file (with mouse right click and then *Extract All..*, for example). Let's find out what is on the PATH.

    >PATH
    PATH=C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Ruby200\bin

`C:\Ruby200\bin` (or where ever you have installed Ruby) looks like a good place to me. Move the IEDriverServer file there.

Let' try again:

    ﻿>irb

    > require "selenium-webdriver"
    => true

    > browser = Selenium::WebDriver.for :internet_explorer
    Started InternetExplorerDriver server (32-bit)
    2.38.0.0
    Listening on port 5555
    => #<Selenium::WebDriver::Driver:0x5469141e browser=:internet_explorer>

    > browser.navigate.to "http://watir.com"
    => nil





### Firefox with watir-webdriver ###

![Firefox 5 on Windows 7](https://raw.github.com/watir/watirbook/master/images/installation/windows/firefox.png)

*Firefox 5 on Windows 7*

Can it drive Firefox? It can! (If you do not have it installed, download it from *[mozilla.com/firefox](http://www.mozilla.com/firefox/)*.)

    >irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :ff
    => #<Watir::Browser:0x62d8c4a6 url="about:blank" title="">

    > browser.goto "watir.com"
    => "http://watir.com/"

![watir-webdriver gem drives Firefox 5 on Windows 7](https://raw.github.com/watir/watirbook/master/images/installation/windows/webdriver-firefox.png)





### Chrome with watir-webdriver ###

![Chrome 13 on Windows 7](https://raw.github.com/watir/watirbook/master/images/installation/windows/chrome.png)

Could it be that it can drive Chrome too? Let's find out. (You can get Chrome at *[google.com/chrome](http://www.google.com/chrome)*.)

    >irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :chrome
    Selenium::WebDriver::Error::WebDriverError: Unable to find the
    chromedriver executable. Please download the server from
    http://code.google.com/p/chromium/downloads/list and place it
    somewhere on your PATH. More info at
    http://code.google.com/p/selenium/wiki/ChromeDriver.
    (...)

Looks like there is a problem. You have to download `chromedriver_win32_14.0.836.0.zip` (or newer version) from *https://code.google.com/p/chromedriver/downloads/list*. Unzip the file (you will get `chromedriver.exe`) and put it in any folder that is in your `PATH`. To check which folders are in `PATH`, open command prompt and type `path`:

    >path
    PATH=C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;
    C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Ruby192\bin

Folders are separated with `;`. `C:\Ruby192\bin` looks like a good place, so I will put `chromedriver.exe` there. Let's try again:

    >irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :chrome
    Started ChromeDriver
    port=49522
    => #<Watir::Browser:0x..fdbf27548 url="about:blank"
    title="about:blank">

    > browser.goto "watir.com"
    => "http://watir.com/"

![watir-webdriver gem drives Chrome 12 on Windows 7](https://raw.github.com/watir/watirbook/master/images/installation/windows/webdriver-chrome.png)

I got Windows Firewall popup again letting me know that it has blocked
`C:\ruby192\bin\chromedriver.exe`. Just close it for now, I have no idea what to do with it.





### Java ###

To drive Opera, you will have to install Java first. Let's check if Java is already installed with `java -version`:

    >java -version
    'java' is not recognized as an internal or external command,
    operable program or batch file.

Looks like we will have to install Java. There is big *Free Java Download* button at
*http://www.java.com/en/download*. Execute download file and install Java. Let's check if Java is really installed with `java -version`:

    >java -version
    java version "1.6.0_26"
    Java(TM) SE Runtime Environment (build 1.6.0_26-b03)
    Java HotSpot(TM) Client VM (build 20.1-b02, mixed mode, sharing)

Looks good to me!





### Opera with watir-webdriver on 7 and Vista###

![Opera on Windows 7](https://raw.github.com/watir/watirbook/master/images/installation/windows/opera.png)

And finally, let's drive Opera. If you do not have it installed, you can get it at *[opera.com](http://www.opera.com/)*.

    >irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :opera
    Selenium::WebDriver::Error::WebDriverError: Unable to find the
    Selenium server jar.  Please download the standalone server from
    http://code.google.com/p/selenium/downloads/list and set the
    SELENIUM_SERVER_JAR environmental variable to its location.  More
    info at http://code.google.com/p/selenium/wiki/OperaDriver.

Download `selenium-server-standalone-2.5.0.jar` (or newer version) from
*http://code.google.com/p/selenium/downloads/list* and put it in `C:\Ruby192\bin`. Then make `SELENIUM_SERVER_JAR` environmental variable and set it to `C:\Ruby192\bin\selenium-server-standalone-2.5.0.jar`. To create environmental variable, right click *computer* and click `Properties > Advanced system settings > Environmental Variables > User variables > New... > Variable name: SELENIUM_SERVER_JAR > Variable value: C:\Ruby192\bin\selenium-server-standalone-2.5.0.jar > OK > OK > OK`.

Open new command prompt, the old one will not see `SELENIUM_SERVER_JAR` variable.

    >irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :opera
    Selenium::WebDriver::Error::UnhandledError: No response in a
      timely fashion.
    Build info: version: '2.3.0', revision: '13158', time:
      '2011-08-01 18:13:39'
    System info: os.name: 'Windows 7', os.arch: 'x86',
      os.version: '6.1', java.version: '1.6.0_26'
    Driver info: driver.version: OperaDriver
      (com.opera.core.systems.scope.exceptions.
      ResponseNotReceivedException)

IRB said `No response in a timely fashion`. Then I got Windows Firewall popup. Since I do not know what to do with it, just close the popup.

![Windows Firewall blocking Java](https://raw.github.com/watir/watirbook/master/images/installation/windows/java.png)

And finally I got Opera startup error popup saying: `Opera has failed to access or upgrade your profile. This may have occurred because your computer has insufficient resources available or because some files are locked by other applications. You may have to restart your computer before Opera will start again.`

![Opera startup error](https://raw.github.com/watir/watirbook/master/images/installation/windows/opera-startup-error.png)

Well, rebooting did not help. Not even reinstalling Opera (and then rebooting). What did help is running command prompt as administrator. So, instead of *Start > Search programs and files > cmd > Enter*, right click *cmd* and select *Run as administrator*.

![Run command prompt as administrator](https://raw.github.com/watir/watirbook/master/images/installation/windows/cmd-as-administrator.png)

Finally, let's drive Opera:

    >irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :opera
    => #<Watir::Browser:0x..fef436832 url="http://www.google.hr/"
      title="Google">

    > browser.goto "watir.com"
    => "http://watir.com/"

![watir-webdriver gem drives Opera 11.50 on Windows 7](https://raw.github.com/watir/watirbook/master/images/installation/windows/webdriver-opera.png)





### Opera with watir-webdriver on XP ###

And finally, let's drive Opera. If you do not have it installed, you can get it at *[opera.com](http://www.opera.com/)*.

    >irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :opera
    Selenium::WebDriver::Error::WebDriverError: Unable to find the
    Selenium server jar.  Please download the standalone server from
    http://code.google.com/p/selenium/downloads/list and set the
    SELENIUM_SERVER_JAR environmental variable to its location.  More
    info at http://code.google.com/p/selenium/wiki/OperaDriver.

Download `selenium-server-standalone-2.5.0.jar` (or newer version) from
*http://code.google.com/p/selenium/downloads/list* and put it in `C:\Ruby192\bin`. Then make `SELENIUM_SERVER_JAR` environmental variable and set it to `C:\Ruby192\bin\selenium-server-standalone-2.5.0.jar`. To create environmental variable right click *My Computer* and then `Properties > Advanced > Environment Variables > User variables > New > Variable name: SELENIUM_SERVER_JAR > Variable value: C:\Ruby192\bin\selenium-server-standalone-2.5.0.jar > OK > OK > OK`

Open new command prompt, the old one will not see `SELENIUM_SERVER_JAR` variable.

    >irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :opera
    Selenium::WebDriver::Error::UnhandledError: Could not start the
      process:
    Cannot run program
    "C:\Documents and Settings\zeljko\.launcher\
      launcher-win32-i86pc.exe":
    CreateProcess error=14001, This application has failed to start
      because the
    application configuration is incorrect. Reinstalling the
      application may fix this problem
    Build info: version: '2.5.0', revision: '13516', time:
      '2011-08-23 18:29:57'
    System info: os.name: 'Windows XP', os.arch: 'x86',
      os.version: '5.1', java.version: '1.6.0_26'
    Driver info: driver.version: OperaDriver
    (org.openqa.selenium.WebDriverException)

I got Windows Firewall popup. Since I do not know what to do with it, just close the popup.

![Windows Firewall blocking Java](https://raw.github.com/watir/watirbook/master/images/installation/windows/java.png)

I also got `This application has failed to start because the application configuration is incorrect. Reinstalling the application may fix this problem` error message. Well, rebooting did not help. Not even reinstalling Opera (and then rebooting). What did help is installing [Microsoft Visual C++ 2008 Redistributable Package (x86)](http://www.microsoft.com/download/en/details.aspx?id=29).

Finally, let's drive Opera:

    >irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :opera
    => #<Watir::Browser:0x..fef436832 url="http://www.google.hr/"
      title="Google">

    > browser.goto "watir.com"
    => "http://watir.com/"





### DevKit ###

Watir and watir-webdriver gems needs `ffi` gem, and it needs RubyInstaller Development Kit (DevKit) . Do not worry, it is not complicated as it sounds. If you do not have DevKit installed, you will get this error message while installing watir or watir-webdriver gems:

    Fetching: ffi-1.0.11.gem (100%)
    ERROR:  Error installing watir:
    The 'ffi' native gem requires installed build tools.

    Please update your PATH to include build tools or download the DevKit
    from 'http://rubyinstaller.org/downloads' and follow the instructions
    at 'http://github.com/oneclick/rubyinstaller/wiki/Development-Kit'

The solution is easy. Go to http://rubyinstaller.org/downloads and download the latest version of DevKit. At the moment it is DevKit-tdm-32-4.5.2-20110712-1620-sfx.exe. Execute the file. It tried to extract it to the folder where the file was located, in my case it was `C:\Documents and Settings\zeljko\Desktop\`. The documentation says spaces in path could cause trouble, as is often the case. Install it to `C:\devkit`. It will actually just extract itself there and DevKit window will disappear. There will be no *Installation OK* popup.

![Where to extract DevKit](https://raw.github.com/watir/watirbook/master/images/installation/windows/devkit-folder.png)

![DevKit extracting](https://raw.github.com/watir/watirbook/master/images/installation/windows/devkit-extracting.png)

Go to `C:\devkit` in command prompt and type `ruby dk.rb init`:

    C:\devkit>ruby dk.rb init
    [INFO] found RubyInstaller v1.9.3 at C:/Ruby193

    Initialization complete! Please review and modify the auto-generated
    'config.yml' file to ensure it contains the root directories to all
    of the installed Rubies you want enhanced by the DevKit.

And the final step is `ruby dk.rb install`:

    C:\devkit>ruby dk.rb install
    [INFO] Installing 'C:/Ruby193/lib/ruby/
      site_ruby/1.9.1/rubygems/defaults/operating_system.rb'
    [INFO] Installing 'C:/Ruby193/lib/ruby/site_ruby/devkit.rb'

That is it, you are ready to install watir and watir-webdriver gems.





### watir ###

![Internet Explorer 9 on Windows 7](https://raw.github.com/watir/watirbook/master/images/installation/windows/ie.png)

Let's install Watir, finally. It is also done from the command line, the command is `gem install watir`. I prefer to add `--no-ri --no-rdoc` options, because I do not use either ri (Ruby Index) or RDoc (Ruby Documentation), and it cuts installation time to one third. So, if you want ri or Rdoc, use `gem install watir`, else use `gem install watir --no-ri --no-rdoc`.

Watir gem (the whole Watir project got named after this gem) can drive Internet Explorer. It has better Internet Explorer support than watir-webdriver gem. Install it with `gem install watir --no-ri --no-rdoc`.

    >gem install watir --no-ri --no-rdoc
    (...)
    Successfully installed watir-2.0.4
    (...)

Let's drive Internet Explorer with it:


    >irb

    > require "watir"
    => true

    > browser = Watir::Browser.new
    => #<Watir::IE:0x..f8169d746 url="about:blank" title="">

    > browser.goto "watir.com"
    => 16.998912

![watir gem drives Internet Explorer 9 on Windows 7](https://raw.github.com/watir/watirbook/master/images/installation/windows/watir-ie.png)
