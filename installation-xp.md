## Windows XP

Machine is a clean installation of Microsoft Windows XP Professional, Version 2002, Service Pack 3, 512 MB RAM. Fully patched, except it left Internet Explorer on version 6.

### Ruby

As I said, if you do not have Ruby installed, you have to install it. To check if Ruby is installed, open command prompt (Start > Run... > type cmd > Enter) and type `ruby -v`. (It means: "Ruby, please tell me your version". Ruby is really polite, it likes when you say please.) If you get something like this, you do not have Ruby installed:

    C:\Documents and Settings\zeljko>ruby -v
    'ruby' is not recognized as an internal or external command,
    operable program or batch file.

Download the latest Ruby 1.8.7 from http://rubyinstaller.org/downloads. At the moment it is Ruby 1.8.7-p334 and it is approximately 10 MB. Execute the file.

![Ruby installation][xp-ruby-install]

You can leave all settings at default values, except at the *Installation Destination and Optional Tasks* screen check both *Add Ruby executables to your PATH* and *Associate .rb and .rbw files with this Ruby installation* checkboxes. Installation should take you just a few seconds.

Let's check if Ruby is installed. You will have to open another command prompt, because the one you have opened does not see Ruby.

    C:\Documents and Settings\zeljko>ruby -v
    ruby 1.8.7 (2011-02-18 patchlevel 334) [i386-mingw32]

Ruby says it is version 1.8.7, and some other stuff we do not care about at the moment.

[xp-ruby-install]: images/xp-ruby-install.jpg

### RubyGems

Software written in Ruby is usually distributed as RubyGems (colloquial name is gem), Ruby package manager. Sometimes Ruby installations do not have the latest versions of RubyGems, so we will first update it. RubyGems is also a gem, (a bit recursive, right?) and we can ask it for it's version with `gem -v`.

    C:\Documents and Settings\zeljko>gem -v
    1.5.2

You should update it with `gem update --system`:

    C:\Documents and Settings\zeljko>gem update --system
    Updating rubygems-update
    Fetching: rubygems-update-1.6.2.gem (100%)
    Successfully installed rubygems-update-1.6.2
    Installing RubyGems 1.6.2
    RubyGems 1.6.2 installed
    (...)

Ask RubyGems again for it's version:

    C:\Documents and Settings\zeljko>gem -v
    1.6.2

### Internet Explorer with watir gem

Let's install Watir, finally. It is also done from the command line, the command is `gem install watir`. I prefer to add `--no-ri --no-rdoc` options, because I do not use either ri (Ruby Index) or RDoc (Ruby Documentation), and it cuts installation time to one third. So, if you want ri or Rdoc, use `gem install watir`, else use `gem install watir --no-ri --no-rdoc`.

    C:\Documents and Settings\zeljko>gem install watir --no-ri --no-rdoc
    (...)
    Fetching: commonwatir-1.8.0.gem (100%)
    Fetching: firewatir-1.8.0.gem (100%)
    Fetching: nokogiri-1.4.4.1-x86-mingw32.gem (100%)
    Fetching: watir-1.8.0.gem (100%)
    (...)
    Successfully installed commonwatir-1.8.0
    Successfully installed firewatir-1.8.0
    Successfully installed nokogiri-1.4.4.1-x86-mingw32
    Successfully installed watir-1.8.0
    14 gems installed

As you can see, Watir depends on quite a few gems, but you do not have to think about it, RubyGems installed them all for you.

You have installed drivers for Internet Explorer and Firefox. Let's see if everything is installed. For now we will use Watir from IRB (Interactive Ruby Shell), and later we will create a script. To run IRB, type `irb` in command prompt:

    C:\Documents and Settings\zeljko>irb
    irb(main):001:0>

In short, IRB is a command line that understands Ruby. Let's ask it how much is 1+1. Type `1+1` and press enter:

    irb(main):001:0> 1+1
    => 2

Isn't it smart? :)

To use Watir in IRB or script, we first have to tell Ruby that we want to use it, with `require "watir"`. (Make sure you require `watir` and not `Watir`. I will explain later.)

    irb(main):002:0> require "watir"
    LoadError: no such file to load -- watir
            from (irb):2:in `require'
            from (irb):2

Ruby complains with `no such file to load`. It want so tell you that it does not know nothing about Watir. It happens a lot, so I wanted to let you know how to fix it. Simply, type `require "rubygems"` and then `require "watir"`.

    irb(main):003:0> require "rubygems"
    => true
    irb(main):004:0> require "watir"
    => true

Let's try to open Internet Explorer with `browser = Watir::Browser.new`:

    irb(main):005:0> browser = Watir::Browser.new
    => #<Watir::IE:0x31d1858 url="about:blank" title="">

A window with Internet Explorer should open. Let's tell it to go to watir.com with `browser.goto "watir.com"`, and that will be all for now:

    irb(main):006:0> browser.goto "watir.com"
    => 2.218779

![Internet Explorer 6 opened with Watir from IRB on Windows XP][xp-ie-irb]

Watir.com should open in Internet Explorer.

[xp-ie-irb]: images/xp-ie-irb.jpg

### Firefox with firewatir gem

If you are still in the IRB (command prompt starts with `irb`), type `exit` to return to normal command prompt.

    irb(main):007:0> exit
    C:\Documents and Settings\zeljko>

If you have already installed watir gem, firewatir got installed with it. You can always check which gems are installed with `gem list`. 

    C:\Documents and Settings\zeljko>gem list

    *** LOCAL GEMS ***

    builder (3.0.0)
    commonwatir (1.8.0)
    firewatir (1.8.0)
    hoe (2.9.1)
    nokogiri (1.4.4.1 x86-mingw32)
    rake (0.8.7)
    rubygems-update (1.6.2)
    s4t-utils (1.0.4)
    user-choices (1.1.6.1)
    watir (1.8.0)
    win32-api (1.4.8 x86-mingw32)
    win32-process (0.6.5)
    windows-api (0.4.0)
    windows-pr (1.1.3)
    xml-simple (1.0.14)

If you only want to know if firewatir is installed, you can ask for it specifically with `gem list firewatir`. It is usefull when you have a lot of gems installed.

    C:\Documents and Settings\zeljko>gem list firewatir

    *** LOCAL GEMS ***

    firewatir (1.8.0)

Great, firewatir is here.

If you have only installed Ruby and updated RubyGems (and did not install watir gem), you will get this:

C:\Documents and Settings\zeljko>gem list

    *** LOCAL GEMS ***

    rubygems-update (1.6.2)

    C:\Documents and Settings\zeljko>gem list firewatir

    *** LOCAL GEMS ***

You do not have to install watir gem to drive Firefox. Watir gem drives Internet Explorer. We will install firewatir gem to drive Firefox with `gem install firewatir`:

    C:\Documents and Settings\zeljko>gem install firewatir --no-ri --no-rdoc
    (...)
    Fetching: commonwatir-1.8.0.gem (100%)
    Fetching: firewatir-1.8.0.gem (100%)
    (...)
    Successfully installed commonwatir-1.8.0
    Successfully installed firewatir-1.8.0
    8 gems installed

To drive Firefox, it has to be installed. You can get it at http://www.mozilla.com/en-US/firefox. Current version is 3.6.

You also need Firefox extension that allows firewatir gem to control Firefox. Go to http://watir.com/installation/ and click link *Windows plugin for Firefox 3.6* if you have Firefox 3.6, or appropriate link if you have other version. (There is no plugin for Firefox 4. Watir-webdriver gem can drive Firefox 4.)

![Firefox prevented this site (watir.com) from asking you to install software on your computer.][xp-firefox-jssh]

Firefox will say *Firefox prevented this site (watir.com) from asking you to install software on your computer.* Click button *Allow* and then *Install Now*.

![Install Now][xp-firefox-jssh-install]

Firefox will now say *Restart Firefox to complete your changes.* Click button *Restart Firefox*. Close Firefox when it restarts.

![Restart Firefox][xp-firefox-restart]

This was a bit complicated then installing driver for Internet Explorer. Let's see if everything works. Open IRB with `irb`:

    C:\Documents and Settings\zeljko>irb
    irb(main):001:0>

Let Ruby know you want to use RubyGems and firewatir gem:

    irb(main):001:0> require "rubygems"
    => true
    irb(main):002:0> require "firewatir"
    => true

Time to open Firefox with `browser = Watir::Browser.new`.

You can also require watir gem to drive Firefox (if you have watir gem installed), but in that case, you have to tell it that `browser = Watir::Browser.new` should open Firefox, because by default it will open Internet Explorer.

    C:\Documents and Settings\zeljko>irb
    irb(main):001:0> require "rubygems"
    => true
    irb(main):002:0> require "watir"
    => true
    irb(main):003:0> Watir::Browser.default = "firefox"
    => "firefox"
    irb(main):004:0> browser = Watir::Browser.new

If you get error message like this, then you are out of luck. I have tried every fix I could find online and could not get it fixed. I will try again later.

    irb(main):003:0> browser = Watir::Browser.new
    Watir::Exception::UnableToStartJSShException: Unable to connect to machine :
      127.0.0.1 on port 9997. Make sure that JSSh is properly installed and
      Firefox is running with '-jssh' option
    from C:/Ruby187/lib/ruby/gems/1.8/gems/firewatir-1.8.0/lib/firewatir/firefox.rb:
      156:in `set_defaults'
    from C:/Ruby187/lib/ruby/gems/1.8/gems/firewatir-1.8.0/lib/firewatir/firefox.rb:
      43:in `initialize'
    from C:/Ruby187/lib/ruby/gems/1.8/gems/commonwatir-1.8.0/lib/watir/browser.rb:
      65:in `new'
    from C:/Ruby187/lib/ruby/gems/1.8/gems/commonwatir-1.8.0/lib/watir/browser.rb:
      65:in `new'
    from (irb):3

[xp-firefox-jssh]: images/xp-firefox-jssh.jpg
[xp-firefox-jssh-install]: images/xp-firefox-jssh-install.jpg
[xp-firefox-restart]: images/xp-firefox-restart.jpg

### Firefox, Chrome and Internet Explorer with watir-webdriver gem

I think watir-webdriver gem is the future of Watir. It can drive Firefox, Chrome and Internet Explorer.

After you have installed Ruby and upgraded RubyGems, install [RubyInstaller Development Kit (DevKit)][DevKit]. Current version is DevKit-tdm-32-4.5.1-20101214-1400-sfx.exe. Execute the file and when it asks where to extract, say to `C:\Ruby187\bin` if you have installed Ruby into `C:\Ruby187`. I guess every folder that is in your path will do.

Problems again. You will probably get the error message for `gem install watir-webdriver` or `gem install watir-webdriver --no-ri --no-rdoc`:

    C:\Documents and Settings\zeljko>gem install watir-webdriver --no-ri --no-rdoc
    ERROR:  While executing gem ... (ArgumentError)
        marshal data too short

[DevKit]: http://rubyinstaller.org/downloads/

\newpage

