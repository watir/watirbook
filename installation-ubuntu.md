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

