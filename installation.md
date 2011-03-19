# Installation

Installation is not complicated, but unfortunately, it is not trivial either.

I have already said that Watir is "just" a piece of software written in Ruby, so to install it, you have to install Ruby first. Since both Ruby and Watir are available on Windows, Mac and Linux. Each of them has several releases (or in case of Linux, both distributions and released) currently in use, I will cover what I think is the relevant ones. Ruby has two relevant releases, 1.8.7 and 1.9.2. At the moment Watir works only on 1.8.7.

## Windows XP

As I said, if you do not have Ruby installed, you have to install it. To check if Ruby is installed, open command prompt (Start > Run... > type cmd > Enter) and type `ruby -v`. (It means: "Ruby, please tell me your version". Ruby is really polite, it likes when you say please.) If you get something like this, you do not have Ruby installed:

    C:\Documents and Settings\zeljko>ruby -v
    'ruby' is not recognized as an internal or external command,
    operable program or batch file.

Download the latest Ruby 1.8.7 from http://rubyinstaller.org/downloads. At the moment it is Ruby 1.8.7-p334 and it is approximately 10 MB. Execute the file. You can leave all settings at default values, except at the *Installation Destination and Optional Tasks* screen check both *Add Ruby executables to your PATH* and *Associate .rb and .rbw files with this Ruby installation* checkboxes. Installation should take you just a few seconds.

Let's check if Ruby is installed. You will have to open another command prompt, because the one you have opened does not see Ruby.

    C:\Documents and Settings\zeljko>ruby -v
    ruby 1.8.7 (2011-02-18 patchlevel 334) [i386-mingw32]

Ruby says it is version 1.8.7, and some other stuff we do not care about at the moment.

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

### Internet Explorer

Let's try to open Internet Explorer with `browser = Watir::Browser.new`:

    irb(main):005:0> browser = Watir::Browser.new
    => #<Watir::IE:0x31d1858 url="about:blank" title="">

A window with Internet Explorer should open. Let's tell it to go to watir.com with `browser.goto "watir.com"`, and that will be all for now:

    irb(main):006:0> browser.goto "watir.com"
    => 2.218779

Watir.com should open in Internet Explorer.

\newpage

