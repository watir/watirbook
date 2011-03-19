# Installation

Installation is not complicated, but unfortunately, it is not trivial either.

I have already said that Watir is "just" a piece of software written in Ruby, so to install it, you have to install Ruby first. Since both Ruby and Watir are available on Windows, Mac and Linux. Each of them has several releases (or in case of Linux, both distributions and released) currently in use, I will cover what I think is the relevant ones. Ruby has two relevant releases, 1.8.7 and 1.9.2. At the moment Watir works only on 1.8.7.

I am installing everything in VMware Fusion (Version 3.1.2 332101) virtual machines, except Mac OS, since it does not want to be virtualized. Host machine for VMware Fusion is MacBook Pro, Mac OS X 10.6.6, processor 2.4 GHz Intel Core 2 Duo, Memory 4 GB 667 MHz DDR2 SDRAM.

## Windows XP

Machine is a clean installation of Microsoft Windows XP Professional, Version 2002, Service Pack 3, 512 MB RAM. Fully patched, except it left Internet Explorer on version 6.

### Ruby

As I said, if you do not have Ruby installed, you have to install it. To check if Ruby is installed, open command prompt (Start > Run... > type cmd > Enter) and type `ruby -v`. (It means: "Ruby, please tell me your version". Ruby is really polite, it likes when you say please.) If you get something like this, you do not have Ruby installed:

    C:\Documents and Settings\zeljko>ruby -v
    'ruby' is not recognized as an internal or external command,
    operable program or batch file.

Download the latest Ruby 1.8.7 from http://rubyinstaller.org/downloads. At the moment it is Ruby 1.8.7-p334 and it is approximately 10 MB. Execute the file. You can leave all settings at default values, except at the *Installation Destination and Optional Tasks* screen check both *Add Ruby executables to your PATH* and *Associate .rb and .rbw files with this Ruby installation* checkboxes. Installation should take you just a few seconds.

Let's check if Ruby is installed. You will have to open another command prompt, because the one you have opened does not see Ruby.

    C:\Documents and Settings\zeljko>ruby -v
    ruby 1.8.7 (2011-02-18 patchlevel 334) [i386-mingw32]

Ruby says it is version 1.8.7, and some other stuff we do not care about at the moment.

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
    Fetching: win32-api-1.4.8-x86-mingw32.gem (100%)
    Fetching: windows-api-0.4.0.gem (100%)
    Fetching: windows-pr-1.1.3.gem (100%)
    Fetching: win32-process-0.6.5.gem (100%)
    Fetching: xml-simple-1.0.14.gem (100%)
    Fetching: rake-0.8.7.gem (100%)
    Fetching: hoe-2.9.1.gem (100%)
    Fetching: s4t-utils-1.0.4.gem (100%)
    Fetching: builder-3.0.0.gem (100%)
    Fetching: user-choices-1.1.6.1.gem (100%)
    Fetching: commonwatir-1.8.0.gem (100%)
    Fetching: firewatir-1.8.0.gem (100%)
    Fetching: nokogiri-1.4.4.1-x86-mingw32.gem (100%)
    Fetching: watir-1.8.0.gem (100%)
    Successfully installed win32-api-1.4.8-x86-mingw32
    Successfully installed windows-api-0.4.0
    Successfully installed windows-pr-1.1.3
    Successfully installed win32-process-0.6.5
    Successfully installed xml-simple-1.0.14
    Successfully installed rake-0.8.7
    Successfully installed hoe-2.9.1
    Successfully installed s4t-utils-1.0.4
    Successfully installed builder-3.0.0
    Successfully installed user-choices-1.1.6.1
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

Watir.com should open in Internet Explorer.

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
    Fetching: xml-simple-1.0.14.gem (100%)
    Fetching: rake-0.8.7.gem (100%)
    Fetching: hoe-2.9.1.gem (100%)
    Fetching: s4t-utils-1.0.4.gem (100%)
    Fetching: builder-3.0.0.gem (100%)
    Fetching: user-choices-1.1.6.1.gem (100%)
    Fetching: commonwatir-1.8.0.gem (100%)
    Fetching: firewatir-1.8.0.gem (100%)
    Successfully installed xml-simple-1.0.14
    Successfully installed rake-0.8.7
    Successfully installed hoe-2.9.1
    Successfully installed s4t-utils-1.0.4
    Successfully installed builder-3.0.0
    Successfully installed user-choices-1.1.6.1
    Successfully installed commonwatir-1.8.0
    Successfully installed firewatir-1.8.0
    8 gems installed

To drive Firefox, it has to be installed. You can get it at http://www.mozilla.com/en-US/firefox. Current version is 3.6. You also need Firefox extension that allows firewatir gem to control Firefox. Go to http://watir.com/installation/ and click link *Windows plugin for Firefox 3.6* if you have Firefox 3.6, or appropriate link if you have other version. (There is no plugin for Firefox 4. Watir-webdriver gem can drive Firefox 4.) Firefox will say *Firefox prevented this site (watir.com) from asking you to install software on your computer.* Click button *Allow* and then *Install Now*. Firefox will now say *Restart Firefox to complete your changes.* Click button *Restart Firefox*. Close Firefox when it restarts.

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

### Firefox, Chrome and Internet Explorer with watir-webdriver gem

I think watir-webdriver gem is the future of Watir. It can drive Firefox, Chrome and Internet Explorer.

After you have installed Ruby and upgraded RubyGems, install [RubyInstaller Development Kit (DevKit)][DevKit]. Current version is DevKit-tdm-32-4.5.1-20101214-1400-sfx.exe. Execute the file and when it asks where to extract, say to `C:\Ruby187\bin` if you have installed Ruby into `C:\Ruby187`. I guess every folder that is in your path will do.

Problems again. You will probably get the error message for `gem install watir-webdriver` or `gem install watir-webdriver --no-ri --no-rdoc`:

    C:\Documents and Settings\zeljko>gem install watir-webdriver --no-ri --no-rdoc
    ERROR:  While executing gem ... (ArgumentError)
        marshal data too short

[DevKit]: http://rubyinstaller.org/downloads/

## Windows Vista
## Windows 7
## Mac OS X 10.5

It was easier for me to install Mac OS to a real machine instead to a virtual one, because Mac OS does not want to be virtualized.

Host machine is Mac mini, processor 2 GHz Intel Core 2 Duo, memory 4 GB 1067 MHz DDR3. 

## Mac OS X 10.6
## Ubuntu Linux 10.10

Machine is a clean installation of Ubuntu Linux 10.10, 512 MB RAM, fully patched.

### Ruby

Let's see if Ubuntu comes with Ruby installed. Open Terminal (Applications > Accessories > Terminal) and type `ruby -v`:

    zeljko@ubuntu:~$ ruby -v
    The program 'ruby' is currently not installed.  You can install it by typing:
    sudo apt-get install ruby

Install it with `sudo apt-get install ruby``:

    zeljko@ubuntu:~$ sudo apt-get install ruby
    [sudo] password for zeljko: 
    Reading package lists... Done
    (...)
    ldconfig deferred processing now taking place

Check the version with `ruby -v`:

    zeljko@ubuntu:~$ ruby -v
    ruby 1.8.7 (2010-06-23 patchlevel 299) [i686-linux]

### RubyGems

Let's see the version of RubyGems we got with Ruby with `gem -v`:

    zeljko@ubuntu:~$ gem -v
    The program 'gem' can be found in the following packages:
     * rubygems1.8
     * rubygems1.9.1
    Try: sudo apt-get install <selected package>

Looks like we did not get any version installed. Install rubygems1.8 with `sudo apt-get install rubygems1.8`:

    zeljko@ubuntu:~$ sudo apt-get install rubygems1.8
    Reading package lists... Done
    (...)
    Setting up rubygems1.8 (1.3.7-2) ...

Ask RubyGems for it's version with `gem -v`:

    zeljko@ubuntu:~$ gem -v
    1.3.7

### Firefox with firewatir gem

Install firewatir gem with `sudo gem install firewatir`:

    zeljko@ubuntu:~$ sudo gem install firewatir
    ERROR:  Error installing firewatir:
      hoe requires RubyGems version >= 1.4. Try 'gem update --system' to update RubyGems itself.

Done for now. I will have to install at least RubyGems from source, 1.3.7 version is just too old.

### Firefox and Chrome with watir-webdriver gem

\newpage

