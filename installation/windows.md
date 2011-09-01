## Windows 7, Vista and XP ##

![Windows 7 default desktop](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows/desktop.png)\

*Windows 7 default desktop*

Machine is a clean installation of Microsoft Windows 7 Professional 32-bit, Service Pack 1; Microsoft Windows Vista Ultimate 32-bit, Service Pack 1; Microsoft Windows XP Professional, Version 2002, Service Pack 3. Windows 7 and Vista machines have 1 GB RAM, XP has 512 MB. All machinges are fully patched, including Internet Explorer 9 on 7 and Vista. I left Internet Explorer on version 6 at XP machine, just for fun.

I did not notice any difference in installing or using Watir on any version on Windows, so I have decided to put them in one chapter.





### Ruby ###

You probably do not have Ruby installed. To make sure, open command prompt and type `ruby -v`. On 7 and Vista open command prompt with *Start > Search programs and files > type: cmd > Enter*, and on XP with *Start > Run... > type cmd > Enter*.

    >ruby -v
    'ruby' is not recognized as an internal or external command,
    operable program or batch file.

If you get the same thing as I did, you do not have Ruby installed.

Download the latest Ruby 1.9. from *[rubyinstaller.org/downloads](http://rubyinstaller.org/downloads)*. At the moment it is *Ruby 1.9.2-p290* and it is approximately 14 MB. Execute the file.

![Ruby Installation](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows/ruby.png)\

*Ruby Installation*

You can leave all settings at default values, except at the *Installation Destination and Optional Tasks* screen check both *Add Ruby executables to your PATH* and *Associate .rb and .rbw files with this Ruby installation* checkboxes. Installation should take you just a few seconds.

Let's check if Ruby is installed. You will have to open another command prompt, because the one you have opened does not see Ruby.

    >ruby -v
    ruby 1.9.2p290 (2011-07-09) [i386-mingw32]

Congratulations! You now have the latest and greatest Ruby, 1.9.2!





### RubyGems ###

Software written in Ruby is usually distributed as RubyGems (colloquial name is *gem*), Ruby package manager. Sometimes Ruby installations do not have the latest versions of RubyGems, so we will first update it. RubyGems is also a gem, (a bit recursive, right?) and we get it's version with `gem -v`.

    >gem -v
    1.7.2

You should update it with `gem update --system`:

    >gem update --system
    (...)
    RubyGems system software updated

Ask RubyGems again for it's version, just to make sure:

    >gem -v
    1.8.10





### Internet Explorer with watir ###

Let's install Watir, finally. It is also done from the command line, the command is `gem install watir`. I prefer to add `--no-ri --no-rdoc` options, because I do not use either ri (Ruby Index) or RDoc (Ruby Documentation), and it cuts installation time to one third. So, if you want ri or Rdoc, use `gem install watir`, else use `gem install watir --no-ri --no-rdoc`.

Watir gem (the whole Watir project got named after this gem) can also drive Internet Explorer. It has better Internet Explorer support than watir-webdriver gem. Install it with `gem install watir --no-ri --no-rdoc`.

    >gem install watir --no-ri --no-rdoc
    (...)
    Successfully installed watir-2.0.1
    13 gems installed

Let's drive Internet Explorer with it:


    >irb

    > require "watir"
    => true

    > browser = Watir::Browser.new
    => #<Watir::IE:0x..f8169d746 url="about:blank" title="">

    > browser.goto "watir.com"
    => 16.998912

![watir gem drives Internet Explorer 9 on Windows 7](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows/watir-ie.png)\

*watir gem drives Internet Explorer 9 on Windows 7*





### watir-webdriver ###

If you are just starting with Watir, start with watir-webdriver gem. It can drive Internet Explorer, Firefox, Chrome, and Opera.

Install it with `gem install watir-webdriver --no-ri --no-rdoc`:

    >gem install watir-webdriver --no-ri --no-rdoc
    (...)
    Successfully installed watir-webdriver-0.3.2
    6 gems installed





### Internet Explorer with watir-webdriver ###

![Internet Explorer 9 on Windows 7](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows/ie.png)\

*Internet Explorer 9 on Windows 7*

Since Internet Explorer is already installed, we will start with it. Let's see if watir-webdriver can drive Internet Explorer:

    >irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :ie
    Selenium::WebDriver::Error::NoSuchDriverError: Unexpected error
    launching Internet Explorer. Protected Mode must be set to the
    same value (enabled or disabled) for all zones.
    (...)

I got `Protected Mode must be set to the same value (enabled or disabled) for all zones` error message (does not appear for Internet Explorer 6 on Windows XP) and Windows Firewall popup appeared letting me know that it has blocked `C:\ruby192\bin\ruby.exe`.

![Windows Firewall has blocked some features of this program](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows/firewall.png)\

*Windows Firewall has blocked some features of this program*

For now just close the popup, let's see how to fix the error message.

Open *Internet Explorer > wrench > Internet Options > Security*. There are four zones: Internet, Local intranet, Trusted sites and Restricted sites. Protected Mode is enabled by default in Internet and Restricted sites. Enable it for Local intranet and Trusted sites and close the browser.

![Enable Protected Mode for all zones](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows/protected-mode.png)\

*Enable Protected Mode for all zones*

Let' try again:

    >irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :ie
    => #<Watir::Browser:0x..fcf3d4bb8 url="http://localhost:5555/"
    title="WebDriver">

    > browser.goto "watir.com"
    => "http://watir.com/"

It works!

![watir-webdriver gem drives Internet Explorer 9 on Windows 7](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows/webdriver-ie.png)\

*watir-webdriver gem drives Internet Explorer 9 on Windows 7*





### Firefox with watir-webdriver ###

![Firefox 5 on Windows 7](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows/firefox.png)\

*Firefox 5 on Windows 7*

Can it drive Firefox? It can! (If you do not have it installed, download it from *[mozilla.com/firefox](http://www.mozilla.com/firefox/)*.)

    >irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :ff
    => #<Watir::Browser:0x62d8c4a6 url="about:blank" title="">

    > browser.goto "watir.com"
    => "http://watir.com/"

![watir-webdriver gem drives Firefox 5 on Windows 7](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows/webdriver-firefox.png)\

*watir-webdriver gem drives Firefox 5 on Windows 7*





### Chrome with watir-webdriver ###

![Chrome 13 on Windows 7](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows/chrome.png)\

*Chrome 13 on Windows 7*

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

Looks like there is a problem. You have to download `chromedriver_win32_14.0.836.0.zip` (or newer version) from *http://code.google.com/p/chromium/downloads/list*. Unzip the file (you will get `chromedriver.exe`) and put it in any folder that is in your PATH. To check which folders are in PATH, open command prompt and type `path`:

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
    => #<Watir::Browser:0x..fdbf27548 url="about:blank" title="about:blank">

    > browser.goto "watir.com"
    => "http://watir.com/"

![watir-webdriver gem drives Chrome 12 on Windows 7](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows/webdriver-chrome.png)\

*watir-webdriver gem drives Chrome 12 on Windows 7*

I got Windows Firewall popup again letting me know that it has blocked `C:\ruby192\bin\chromedriver.exe`. Just close it for now, I have no idea what to do with it.





### Java ###

To drive Opera, you will have to install Java first. Let's check if Java is already installed with `java -version`:

    >java -version
    'java' is not recognized as an internal or external command,
    operable program or batch file.

Looks like we will have to install Java. There is big *Free Java Download* button at *http://www.java.com/en/download*. Execute download file and install Java. Let's check if Java is really installed with `java -version`:

    >java -version
    java version "1.6.0_26"
    Java(TM) SE Runtime Environment (build 1.6.0_26-b03)
    Java HotSpot(TM) Client VM (build 20.1-b02, mixed mode, sharing)

Looks good to me!





### Opera with watir-webdriver ###

![Opera on Windows 7](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows/opera.png)\

*Opera on Windows 7*

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

Download `selenium-server-standalone-2.5.0.jar` (or newer version) from *http://code.google.com/p/selenium/downloads/list* and put it in `C:\Ruby192\bin`. Then make SELENIUM_SERVER_JAR environmental variable and set it to `C:\Ruby192\bin\selenium-server-standalone-2.5.0.jar`. To create environmental variable on Windows 7 and Vista, right click *computer* and click `Properties > Advanced system settings > Environmental Variables > User variables > New... > Variable name: SELENIUM_SERVER_JAR > Variable value: C:\Ruby192\bin\selenium-server-standalone-2.5.0.jar > OK > OK > OK`. On Windows XP right click *My Computer* and then `Properties > Advanced > Environment Variables > User variables > New > Variable name: SELENIUM_SERVER_JAR > Variable value: C:\Ruby192\bin\selenium-server-standalone-2.5.0.jar > OK > OK > OK`

Open new command prompt, the old one will not see `SELENIUM_SERVER_JAR` variable.

    >irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :opera

Windows 7 and Vista said:

    Selenium::WebDriver::Error::UnhandledError: No response in a timely fashion.
    Build info: version: '2.3.0', revision: '13158', time: '2011-08-01 18:13:39'
    System info: os.name: 'Windows 7', os.arch: 'x86', os.version: '6.1',
      java.version: '1.6.0_26'
    Driver info: driver.version: OperaDriver
      (com.opera.core.systems.scope.exceptions.ResponseNotReceivedException)

Windows XP said:

    Selenium::WebDriver::Error::UnhandledError: Could not start the process:
    Cannot run program
    "C:\Documents and Settings\zeljko\.launcher\launcher-win32-i86pc.exe":
    CreateProcess error=14001, This application has failed to start because the
    application configuration is incorrect. Reinstalling the application may fix
    this problem
    Build info: version: '2.5.0', revision: '13516', time: '2011-08-23 18:29:57'
    System info: os.name: 'Windows XP', os.arch: 'x86', os.version: '5.1',
      java.version: '1.6.0_26'
    Driver info: driver.version: OperaDriver (org.openqa.selenium.WebDriverException)

On Windows 7 and Vista, IRB said `No response in a timely fashion`. Then I got Windows Firewall popup. Since I do not know what to do with it, I just close it.

![Windows Firewall blocking Java](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows/java.png)\

*Windows Firewall blocking Java*

And finally I got Opera startup error popup saying: `Opera has failed to access or upgrade your profile. This may have occurred because your computer has insufficient resources available or because some files are locked by other applications. You may have to restart your computer before Opera will start again.`

![Opera startup error](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows/opera-startup-error.png)\

*Opera startup error*

Well, rebooting did not help. Not even reinstalling Opera (and then rebooting). What did help is running command prompt as administrator. So, instead of *Start > Search programs and files > cmd > Enter*, right click *cmd* and select *Run as administrator*.

![Run command prompt as administrator](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows/cmd-as-administrator.png)\

*Run command prompt as administrator*

On Windows XP I got `This application has failed to start because the application configuration is incorrect. Reinstalling the application may fix this problem` error message. Well, rebooting did not help. Not even reinstalling Opera (and then rebooting). I am stuck at the moment.

Finally, let's drive Opera (on 7 and Vista):

    >irb

    > require "watir-webdriver"
    => true

    > browser = Watir::Browser.new :opera
    => #<Watir::Browser:0x..fef436832 url="http://www.google.hr/" title="Google">

    > browser.goto "watir.com"
    => "http://watir.com/"

![watir-webdriver gem drives Opera 11.50 on Windows 7](https://github.com/zeljkofilipin/watirbook/raw/master/images/installation/windows/webdriver-opera.png)\

*watir-webdriver gem drives Opera 11.50 on Windows 7*





### JRuby with pik ###

> *Feel free to skip JRuby chapter. At the moment, it is not used later in the book. I left it here in case I decide to write about Celerity gem.*

You thought there is only one Ruby implementation out there? You were wrong. Until now, I only talked about Ruby, like there is only one, but there are a few of them. As far as Watir is concerned you will meet only one more, JRuby.

If you already have Ruby installed, an easy way to install JRuby is with pik gem.

    >gem install pik --no-ri --no-rdoc
    (...)
    Successfully installed pik-0.2.8
    1 gem installed

Now you have to install pik executable with `pik_install`. You should install it in a folder that is in your path, but not in `ruby\bin`. Check directories that are in your path with `path`:

    >path
    PATH=C:\Ruby187\bin;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem

I can not install in `C:\Ruby187\bin`, and I do not want to mess with `C:\WINDOWS`. I will install to `C:\pik`. I just have to add that to path, `pik_install C:\pik` will create the folder automatically.

Start > My computer > right click > Properties > Advanced > Environment Variables > System Variables > Path > Edit > Variable value: > add `;C:\pik` to the end > OK > OK > OK

Check if `C:\pik` is added to Path with `path`. Make sure you open new command prompt, if you have one already opened it will not see the change.

    C:\Documents and Settings\zeljko>path
    PATH=C:\Ruby187\bin;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\pik

Everything looks fine. You can create the folder from command line:

    C:\Documents and Settings\zeljko>pik_install C:\pik
    Thank you for using pik.
    mkdir -p C:\pik
    mkdir -p C:\Documents and Settings\zeljko/.pik
    Installing to C:\pik
    (...)

And now to install JRuby:

    C:\Documents and Settings\zeljko>pik install jruby
    ** Downloading:  http://jruby.org.s3.amazonaws.com/downloads/1.6.0/jruby-bin-1.6.0.zip
    (...)
    Cannot find Java 1.5 or higher.

    There was an error.
     Error: private method `gsub' called for nil:NilClass

      in: pik/commands/command.rb:124:in `get_version'
      in: pik/commands/add_command.rb:23:in `add'
      in: pik/commands/add_command.rb:13:in `execute'
      in: pik/implementations.rb:91:in `after_install'
      in: pik/commands/install_command.rb:27:in `execute'
      in: pik_runner:33

Looks like we have to install Java separately. Download it from [java.com/download/](http://www.java.com/en/download/index.jsp). Let's try instaling JRuby now:

    C:\Documents and Settings\zeljko>pik install jruby
    ** Downloading:  http://jruby.org.s3.amazonaws.com/downloads/1.6.0/jruby-bin-1.6.0.zip
    (...)
    ** Adding:  160: jruby 1.6.0 (ruby 1.8.7 patchlevel 330) (2011-03-15 f3b6154) (Java HotSpot(TM) Client VM 1.6.0_24) [Windows XP-x86-java]
     Located at:  C:\Documents and Settings\zeljko\.pik\rubies\JRuby-160\bin

This time no errors. Now, tell pik to use JRuby:

    C:\Documents and Settings\zeljko>pik use jruby

\newpage

