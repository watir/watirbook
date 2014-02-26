# Ruby Tools

TODO

You will be writing a lot of Ruby code. It is beyond scope of this book to teach Ruby, so if you are not familiar with it, you should read a [book or two](https://www.ruby-lang.org/en/documentation/) about it. You should also get familiar with Ruby tools like [IRB](https://en.wikipedia.org/wiki/Interactive_Ruby_Shell) (Interactive Ruby Shell), [RubyGems](http://rubygems.org/), [Bundler](http://bundler.io), [RDoc](http://rdoc.info/), [RVM](http://rvm.io) (Ruby Version Manager) and [The Ruby Toolbox](https://www.ruby-toolbox.com).

## RVM (Ruby Version Manager)

On Mac and Linux you can install and use multiple versions of Ruby at the same time using [RVM](http://rvm.io) (Ruby Version Manager).

A> ## RVM on Ubuntu
A>
A> On Ubuntu, first you have to install `curl`:
A>
A>     $ sudo apt-get install curl
A>     ...
A>
A> Then, you have to configure *Terminal*. Go to *Terminal > Edit > Profile Preferences*.
A>
A> ![PhantomJS](https://raw.github.com/watir/watirbook/master/images/main/terminal_profile_preferences.png)
A>
A> Select *Title and Command* tab, check *Run command as a login shell* checkbox and then click *Close* button.
A>
A> ![PhantomJS](https://raw.github.com/watir/watirbook/master/images/main/terminal_title_and_command.png)
A>
A> In case of trouble see [RVM documentation on Terminal](https://rvm.io/integration/gnome-terminal).

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
