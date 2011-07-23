## Windows XP


![Windows XP default desktop](images/installation/windows-xp/windows-xp-desktop.png)\

*Windows XP default desktop*

Machine is a clean installation of Microsoft Windows XP Professional, Version 2002, Service Pack 3, 512 MB RAM. Fully patched, except it left Internet Explorer on version 6.

### Ruby

As I said, if you do not have Ruby installed, you have to install it. To check if Ruby is installed, open command prompt (*Start > Run... > type cmd > Enter*) and type `ruby -v`. (It means: "Ruby, please tell me your version". Ruby is really polite, it likes when you say please.) If you get something like this, you do not have Ruby installed:

    C:\Documents and Settings\zeljko>ruby -v
    'ruby' is not recognized as an internal or external command,
    operable program or batch file.

Download the latest Ruby 1.8.7 from [rubyinstaller.org/downloads](http://rubyinstaller.org/downloads). At the moment it is Ruby 1.8.7-p334 and it is approximately 10 MB. Execute the file.

![Ruby Installation][xp-ruby-install]\

*Ruby Installation*

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

### Firefox, Chrome and Internet Explorer with watir-webdriver gem

I think watir-webdriver gem is the future of Watir. It can drive Firefox, Chrome and Internet Explorer.

Make sure after you have installed Ruby and upgraded RubyGems, and you can install watir-webdriver gem:

    C:\Documents and Settings\zeljko>gem install watir-webdriver --no-ri --no-rdoc
    (...)
    Fetching: selenium-webdriver-0.1.4.gem (100%)
    Fetching: watir-webdriver-0.2.1.gem (100%)
    (...)
    Successfully installed selenium-webdriver-0.1.4
    Successfully installed watir-webdriver-0.2.1
    7 gems installed

Let's see if it can drive Internet Explorer:

    C:\Documents and Settings\zeljko>irb
    irb(main):001:0> require "rubygems"
    => true
    irb(main):002:0> require "watir-webdriver"
    => true
    irb(main):003:0> browser = Watir::Browser.new :ie
    => #<Watir::Browser:0x3293868 url="http://localhost:5555/" title="WebDriver">
    irb(main):004:0> browser.goto "watir.com"
    => "http://watir.com/"

It really can!

![watir-webdriver gem drives Internet Explorer 6 on Windows XP](images/xp-webdriver-ie.jpg)\

*watir-webdriver gem drives Internet Explorer 6 on Windows XP*

Can it drive Firefox? It can! (If you do not have it installed, download it from [mozilla.com/firefox](http://www.mozilla.com/firefox/).)

    C:\Documents and Settings\zeljko>irb
    irb(main):001:0> require "rubygems"
    => true
    irb(main):002:0> require "watir-webdriver"
    => true
    irb(main):003:0> browser = Watir::Browser.new :ff
    => #<Watir::Browser:0x32948d0 url="about:blank" title="">
    irb(main):004:0> browser.goto "watir.com"
    => "http://watir.com/"

![watir-webdriver gem drives Firefox 4 on Windows XP](images/xp-webdriver-ff.jpg)\

*watir-webdriver gem drives Firefox 4 on Windows XP on Windows XP*

Could it be that it can drive Chrome too? Let's find out. (You can get Chrome at [google.com/chrome](http://www.google.com/chrome).)

    C:\Documents and Settings\zeljko>irb
    irb(main):001:0> require "rubygems"
    => true
    irb(main):002:0> require "watir-webdriver"
    => true
    irb(main):003:0> browser = Watir::Browser.new :chrome
    => #<Watir::Browser:0x327e178 url="" title="">
    irb(main):004:0> browser.goto "watir.com"
    => "http://watir.com/"

![watir-webdriver gem drives Chrome 10 on Windows XP](images/xp-webdriver-chrome.jpg)\

*watir-webdriver gem drives Chrome 10 on Windows XP on Windows XP*

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

Ruby complains with `no such file to load`. It means that Ruby does not know anything about that Watir thing. It happens a lot, so I wanted to let you know how to fix it. Simply, type `require "rubygems"` first and then `require "watir"`.

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

![Internet Explorer 6 opened with Watir from IRB on Windows XP][xp-ie-irb]\

*Watir gem drives Internet Explorer on Windows XP*

[xp-ie-irb]: images/xp-ie-irb.jpg

### Firefox with firewatir gem

If you are still in the IRB (command prompt starts with `irb`), type `exit` to return to the normal command prompt.

    irb(main):007:0> exit
    C:\Documents and Settings\zeljko>

If you have already installed watir gem, firewatir got installed with it. You can always check which gems are installed with `gem list`. 

    C:\Documents and Settings\zeljko>gem list

    *** LOCAL GEMS ***

    builder (3.0.0)
    commonwatir (1.8.0)
    firewatir (1.8.0)
    (...)
    watir (1.8.0)
    (...)

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

You do not have to install watir gem to drive Firefox. Watir gem drives Internet Explorer. We will install firewatir gem to drive Firefox with `gem install firewatir --no-ri --no-rdoc`:

    C:\Documents and Settings\zeljko>gem install firewatir --no-ri --no-rdoc
    (...)
    Fetching: commonwatir-1.8.0.gem (100%)
    Fetching: firewatir-1.8.0.gem (100%)
    (...)
    Successfully installed commonwatir-1.8.0
    Successfully installed firewatir-1.8.0
    8 gems installed

To drive Firefox, it has to be installed. You can get it at [mozilla.com/en-US/firefox](http://www.mozilla.com/en-US/firefox). Current version is 3.6.

You also need Firefox extension that allows firewatir gem to control Firefox. Go to [watir.com/installation](http://watir.com/installation/) and click link *Windows plugin for Firefox 3.6* if you have Firefox 3.6, or appropriate link if you have other version. (There is no plugin for Firefox 4. Watir-webdriver gem can drive Firefox 4.)

![Firefox prevented this site (watir.com) from asking you to install software on your computer.][xp-firefox-jssh]\

*Firefox prevented this site (watir.com) from asking you to install software on your computer*

Firefox will say *Firefox prevented this site (watir.com) from asking you to install software on your computer.* Click button *Allow* and then *Install Now*.

![Install Now][xp-firefox-jssh-install]\

*Restart Firefox to complete your changes*

Firefox will now say *Restart Firefox to complete your changes.* Click button *Restart Firefox*. Close Firefox when it restarts.

![Restart Firefox][xp-firefox-restart]\

*Restart Firefox*

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

### JRuby

You thought there is only one Ruby implementation out there? You were wrong. Until now, I only talked about Ruby, like there is only one, but there are a few of them. As far as Watir is concerned you will meet only one more, JRuby.

If you already have Ruby installed, an easy way to install JRuby is with pik gem.

    C:\Documents and Settings\zeljko>gem install pik --no-ri --no-rdoc
    Fetching: pik-0.2.8.gem (100%)
    (...)
    Successfully installed pik-0.2.8
    1 gem installed

Now you have to install pik executable with `pik_install`. You should install it in a folder that is in your path, but not in `ruby\bin`. Check directories that are in your path with `path`:

    C:\Documents and Settings\zeljko>path
    PATH=C:\Ruby187\bin;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem

I can not install in `C:\Ruby187\bin`, and I do not want to mess with `C:\WINDOWS`. I will install to `C:\pik`. I just have to add that to path, `pik_install C:\pik` will create the folder automatically.

Start > My computer > right click > Properties > Advanced > Environment Variables > System Variables > Path > Edit > Variable value: > add `;C:\pik` to the end > OK > OK > OK

![Adding pik folder to Path is piece of cake](images/xp-path.jpg)\

*Adding pik folder to Path is piece of cake*

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

Time to install operawatir, finally:

    C:\Documents and Settings\zeljko>jruby -S gem install operawatir --no-ri --no-rdoc
    (...)
    Fetching: operawatir-0.4-jruby.gem (100%)
    (...)
    Successfully installed operawatir-0.4-java
    10 gems installed

One last thing, you have to install [Microsoft Visual C++ 2010 Redistributable Package (x86)](http://www.microsoft.com/downloads/en/details.aspx?FamilyID=a7b7a05e-6de6-4d3a-a423-37bf0912db84).

### Opera with operawatir gem

Not written yet.

If you do not have Opera installed, you can get it at [opera.com](http://www.opera.com/).

\newpage

