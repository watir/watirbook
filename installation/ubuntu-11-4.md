## Ubuntu Linux 11.04

Not written yet.

![Ubuntu Linux 11.04 default desktop](images/installation/ubuntu-11-04/ubuntu-11-04-desktop.png)\

*Ubuntu Linux 11.04 default desktop*

Machine is a clean installation of Ubuntu Linux 11.04, fully patched, 512 MB RAM.

### Ruby

Let's see if Ubuntu comes with Ruby installed. Open Terminal (Applications > Accessories > Terminal) and type `ruby -v`:

    $ ruby -v
    The program 'ruby' is currently not installed.  You can install it by typing:
    sudo apt-get install ruby

Install it with `sudo apt-get install ruby`:

    $ sudo apt-get install ruby
    (...)
    Setting up libruby1.8 (1.8.7.302-2) ...
    Setting up ruby1.8 (1.8.7.302-2) ...
    Setting up ruby (4.5) ...
    (...)

Check the version with `ruby -v`:

    $ ruby -v
    ruby 1.8.7 (2010-08-16 patchlevel 302) [i686-linux]

Ruby 1.8.7 is pretty good, but 1.9.2 would be better. Since we just want to get Watir installed the easiest possible way, we will user Ruby 1.8.7.

\newpage

