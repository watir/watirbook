# Ruby Tools

TODO

You will be writing a lot of Ruby code. It is beyond scope of this book to teach Ruby, so if you are not familiar with it, you should read a [book or two](https://www.ruby-lang.org/en/documentation/) about it. You should also get familiar with Ruby tools like [IRB](https://en.wikipedia.org/wiki/Interactive_Ruby_Shell) (Interactive Ruby Shell), [RubyGems](http://rubygems.org/), [Bundler](http://bundler.io), [RDoc](http://rdoc.info/), [RVM](http://rvm.io) (Ruby Version Manager) and [The Ruby Toolbox](https://www.ruby-toolbox.com).

## IRB (Interactive Ruby Shell)

I> You do need internet access if you want to follow examples in this chapter. All examples in this chapter are tried on Mac OS X 10.8.5 and Ruby 2.1.1p76 but everything should work on all supported platforms.

Most of the examples in the book are using a Ruby tool called [IRB](https://en.wikipedia.org/wiki/Interactive_Ruby_Shell) (Interactive Ruby Shell). We will not get into technical details here, all you need to know is that it is a shell that executes Ruby commands. Every command executes immediately and returns something. Sometimes you will be interested in the return value, the rest of the time you can ignore it.

T> IRB is a command-line interface (CLI) tool. If you are not familiar with CLI, see *Command-line interface* chapter.

To start IRB, type `irb` in command line. On Mac and Linux, it should look like this:

    $ irb
    2.1.1 :001 >

On Windows, it should look like this:

    >irb
    DL is deprecated, please use Fiddle
    irb(main):001:0>

If you see something slightly different, it is probably fine, if the examples from this chapter work fine. Let's take a look at the output. Mac and Linux have `2.1.1 :001 >` as prompt and Windows has `irb(main):001:0>`. On Mac/Linux, `2.1.1` part is Ruby version. Windows does not display it. Windows has `irb(main)`, so you do not forget you are using IRB. Windows also displays `DL is deprecated, please use Fiddle` warning message. Feel free to ignore it.

`:001` on Mac/Linux and `:001:0` on Windows is line number. If you just press enter/return (depending on your keyboard), you should see something like this.

Mac/Linux:

    $ irb
    2.1.1 :001 >
    2.1.1 :002 >

Windows:

    >irb
    DL is deprecated, please use Fiddle
    irb(main):001:0>
    irb(main):002:0*

Since the part before the `>` or `*` is not important for us at the moment, we will ignore it in the rest of the book. To differentiate between regular CLI and IRB, the book will use `$` for the regular CLI and `>` for IRB. Let me explain that with a couple of examples.

Executing `ls` command in Mac/Linux CLI:

    $ ls
    Book.txt	Gemfile.lock	README.md	VERSION		images		lib		misc
    Gemfile		LICENSE.md	Subset.txt	epub_images	installation	main		old

Executing `1+1` in IRB:

    $ irb

    > 1+1
    => 2

The above IRB example shows that Ruby knows how to calculate sum of two numbers. You can also ask it to output something:

    > puts "wow much output so hip"
    wow much output so hip
     => nil

After outputting the string, Ruby returned `nil`. You can ignore it for now. All you need to know is that it did not complain. Let's try something that will fail:

    > doge
    NameError: undefined local variable or method `doge' for main:Object
    from (irb):7
    from /Users/z/.rvm/rubies/ruby-2.1.1/bin/irb:11:in `<main>'

Looks like Ruby does not know about [Doge meme](http://knowyourmeme.com/memes/doge). Important thing here is to notice how an error message looks like. Let's do something useful now, like nicely formatting output. First, we will create a `doge` variable:

> doge = {dogecoin: "To the moon!", hello: "This is Doge", wow: "much addon", so: "internet"}
=> {:dogecoin=>"To the moon!", :hello=>"This is Doge", :wow=>"much addon", :so=>"internet"}

Then we will try to output is nicely with `pp` library:

    > pp doge
    NoMethodError: undefined method `pp' for main:Object
    from (irb):9
    from /Users/z/.rvm/rubies/ruby-2.1.1/bin/irb:11:in `<main>'

Looks like Ruby does not know about `pp` too. All you need to do to fix the problem is to require the library:

    > require "pp"
    => true

Let's output `doge`, finally:

    > pp doge
    {:dogecoin=>"To the moon!",
    :hello=>"This is Doge",
    :wow=>"much addon",
    :so=>"internet"}
    => {:dogecoin=>"To the moon!", :hello=>"This is Doge", :wow=>"much addon", :so=>"internet"}

[PP](http://ruby-doc.org/stdlib-2.1.1/libdoc/pp/rdoc/PP.html) is a pretty-printer for Ruby objects. It is really useful for outputting bit objects.

T> IRB is not the only Ruby shell. There is [irb Alternatives](https://www.ruby-toolbox.com/categories/irb_Alternatives) category at [The Ruby Toolbox](https://www.ruby-toolbox.com/). The most popular alternative tool is [Pry](https://rubygems.org/gems/pry), but there is another one called [ripl](https://rubygems.org/gems/ripl).

## RVM (Ruby Version Manager)

On Mac and Linux you can install and use multiple versions of Ruby at the same time using [RVM](http://rvm.io) (Ruby Version Manager).

A> ## RVM on Ubuntu
>
> On Ubuntu, first you have to install `curl`:
>
>     $ sudo apt-get install curl
>     ...
>
> Then, you have to configure *Terminal*. Go to *Terminal > Edit > Profile Preferences*.
>
> ![PhantomJS](https://raw.github.com/watir/watirbook/master/images/main/terminal_profile_preferences.png)
>
> Select *Title and Command* tab, check *Run command as a login shell* checkbox and then click *Close* button.
>
> ![PhantomJS](https://raw.github.com/watir/watirbook/master/images/main/terminal_title_and_command.png)
>
> In case of trouble see [RVM documentation on Terminal](https://rvm.io/integration/gnome-terminal).

Then install RVM:

    $ \curl -sSL https://get.rvm.io | bash -s stable
    ...

Open new *Terminal* tab or window. That is important. RVM might not work properly if you do not open new tab/window after installation. Finally, install a recent version of Ruby:

    $ rvm install 2.1.1
    ...

Ask RVM which versions for Ruby are installed:

    $ rvm list

    rvm rubies

       ruby-2.1.0 [ i686 ]
       ruby-2.1.1 [ i686 ]

*Terminal* will not be aware of the Ruby installed via RVM until you explicitly tell it to use it. Try asking the *Terminal* for Ruby version:

    $ ruby -v
    The program 'ruby' can be found in the following packages:
    * ruby1.8
    * ruby1.9.1

See, *Terminal* does not think Ruby is installed. Now, tell RVM you want to use the latest version:

    $ rvm use ruby-2.1.1
    Using /home/z/.rvm/gems/ruby-2.1.1

Ask *Terminal* again for Ruby version:

    $ ruby -v
    ruby 2.1.1p76 (2014-02-24 revision 45161) [i686-linux]

Now it knows about Ruby installed via RVM. You can also ask RVM which Ruby is it using currently:

    $ rvm list

    rvm rubies

       ruby-2.1.0 [ i686 ]
    => ruby-2.1.1 [ i686 ]

    # Default ruby not set. Try 'rvm alias create default <ruby>'.

    # => - current
    # =* - current && default
    #  * - default

Currently used Ruby (ruby-2.1.1) is marked with the arrow (`=>`).

## The Ruby Toolbox

[The Ruby Toolbox](https://www.ruby-toolbox.com) is a really useful site where you can find and compare a lot of libraries. Libraries are grouped in categories. Whatewer you are looking for, it is probably listed there. Some of categories and tools are: [IRB alternatives](https://www.ruby-toolbox.com/categories/irb_Alternatives) (like [Pry](http://pryrepl.org/)), [PDF processing](https://www.ruby-toolbox.com/categories/PDF_Processing) (like [PDF::Reader](http://rubygems.org/gems/pdf-reader)), [image processing](https://www.ruby-toolbox.com/categories/image_processing) (like [Chunky PNG](https://github.com/wvanbergen/chunky_png)), [log analysis](https://www.ruby-toolbox.com/categories/Log_Analysis) (like [logstash](http://logstash.net/)), [dependency management](https://www.ruby-toolbox.com/categories/dependency_management) (like [Bundler](http://bundler.io/)), [acceptance test frameworks](https://www.ruby-toolbox.com/categories/Acceptance_Test_Frameworks) (like [Cucumber](http://cukes.info/)), [browser testing](https://www.ruby-toolbox.com/categories/browser_testing) (like [Selenium](https://rubygems.org/gems/selenium-webdriver)), [distributed testing](https://www.ruby-toolbox.com/categories/distributed_testing) (like [ParallelTests](https://github.com/grosser/parallel_tests)) or [unit test frameworks](https://www.ruby-toolbox.com/categories/testing_frameworks) (like [RSpec](http://rspec.info/)).
