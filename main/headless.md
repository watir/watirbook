# Headless

I have noticed a lot of confusion about headless testing, but it really noting special. The confusion may be caused because the term *headless* is a bit vague. In the context of driving a browser, *headless* means you can drive a real browser but without seeing anything on the machine.


There are two ways to run browser in a headless mode that I am aware of. One is to use a headless browser like [PhantomJS](http://phantomjs.org/). Another option is using [Xvfb](https://en.wikipedia.org/wiki/Xvfb) (X virtual framebuffer) and [Headless](https://github.com/leonid-shevtsov/headless) gem, but that works only on Linux.

The advantage of running tests in PhantomJS is that it is supported on all major operating systems. The browser is pretty good, it has the same Selenium API as all other browsers, so the vast majority of the tests developed using another browser will just work. It also has a pretty good JavaScript engine, so even JavaScript heavy pages should work fine. The browser is also faster than other browsers. More speed is always good, but speed improvement depends on a lot of things, so sometimes you will see a lot of improvement, and sometimes just a few percent.

The disadvantage is that the users of your web application are not using PhantomJS to access it, they are using one of the major browsers, so some things will require tweaking the tests or the application. It is also harder to debug failures, since the browse is headless. Fortunately, you can take screen shots and HTML of the page (the entire page or just a relevant part).

The advantage of using Xvfb is that it works with any browser that Selenium can drive. You can delevop the tests using your favorite browser and then run the tests in headless mode with no modifications. The disadvantage is that is it somewhat slower (but not a lot) than PhantomJS and it works only works only on Linux. It does not work on Windows or Mac OS.

## PhantomJS

I> You will need internet access if you want to follow examples in this chapter. All examples in this chapter are tried on Mac OS X 10.8.5, PhantomJS 1.9.7, Ruby 2.1.1p76 and selenium-webdriver 2.40.0 but everything should work on all supported platforms.

If you do not have Ruby, Selenium and PhantomJS already installed, please see *Installation* chapter. If you are not familiar with Selenium API, please see *Quick Start*, *Driver* and *Element* chapters.

All you have to do to drive PhantomJS is to let Selenium know that you want to drive it when starting the browser:

    $ irb

    > require "selenium-webdriver"
     => true

    > browser = Selenium::WebDriver.for :phantomjs
    => #<Selenium::WebDriver::Driver:0x4a9629199067c7c6 browser=:phantomjs>

The rest of the API is the same as for any other browser. For example, go to a page:

    > browser.get "http://google.com"
    => {}

Get it's URL and title:

    > browser.current_url
    => "http://www.google.hr/?gfe_rd=cr&ei=LJwMU_nuAsHe_Aa50IHIAQ"

    > browser.title
    => "Google"

Enter text into the text field and then clear the text field:

    > browser.find_element(name: "q").send_keys "watir"
    => nil

    > browser.find_element(name: "q").clear
    => nil

Play with element attributes:

    >  browser.find_element(name: "q").attribute(:name)
    => "q"

    >  browser.find_element(name: "q").attribute(:class)
    => "lst tiah"

    >  browser.find_element(name: "q").attribute(:type)
    => "text"

    >  browser.find_element(name: "q").attribute(:autocomplete)
    => "off"

When driving Firefox or any of the usual browsers, you are able to see how to page looks like. With PhantomJS you do not see anything, so it is really important to know how to debug problems. Two features are really useful, taking screenshots and getting page HTML.

To take a screenshot, use `save_screenshot` method:

    > browser.save_screenshot "phantomjs.png"
    => #<File:phantomjs.png (closed)>

To get page HTML, use

    > browser.page_source
    => "<!DOCTYPE html><html itemscope=\"\" itemtype=\"http://schema.org/WebPage\">
    <head><meta itemprop=\"image\" content=\"/images/google_favicon_128.png\">
    <title>Google</title><script>
    ...
    </script></body></html>"

To get HTML of just a part of the page, ask for `outerHTML` attribute:

    >  browser.find_element(name: "q").attribute(:outerHTML)
    => "<input autocomplete=\"off\" class=\"lst tiah\" value=\"\"
    title=\"Google pretraživanje\" maxlength=\"2048\" name=\"q\" size=\"57\"
    style=\"color: rgb(0, 0, 0); margin-top: 0px; margin-right: 0px; margin-bottom:
     0px; margin-left: 0px; padding-top: 5px; padding-bottom: 0px;
     padding-left: 6px; vertical-align: top; padding-right: 38px;
     outline-style: none; outline-width: initial; outline-color: initial; \"
     dir=\"ltr\" spellcheck=\"false\">"

At the end, close the browser:

    > browser.quit
    => nil

## Xvfb

I> You will need internet access if you want to follow examples in this chapter. All examples in this chapter are tried on Ubuntu Linux 13.10, Firefox 27.0.1, Ruby 2.1.1p76 and selenium-webdriver 2.40.0 but everything should work on all supported platforms.

W> Xvfb works only on Linux. It does not work on Windows or Mac OS.

If you do not have Firefox, Ruby or Selenium installed, see *Installation* chapter.

Without getting into a lot of technical detail, [Xvfb](https://en.wikipedia.org/wiki/Xvfb) (X virtual framebuffer) is a piece of software that makes is possible to run browsers (and other applications) in a headless mode. It works only on Linux.

Install Xvfb via `apt-get`:

    $ sudo apt-get install xvfb
    ...

Then install `headless` Ruby gem:

    $ gem install headless --no-ri --no-rdoc
    ...

W> ## "To sudo or not to sudo, that is the question..."
>
> On the machine I was using while writing this chapter, Ruby was installed via RVM (Ruby Version Manager). If you are using Ruby that was preinstalled on the computer (as it is on a Mac OS X) or if you have installed Ruby via `apt-get` (on Ubuntu) then you have to add `sudo` in front of `gem`:
>
>     $ sudo gem install headless --no-ri --no-rdoc
>     ...

There are two modes of using *headless* gem, block and object. Block mode will automatically start and destroy headless session. In object mode, you have to explicitly start and destroy the session.

This is an example of block mode (using IRB):

    ﻿$ irb

    > require "headless"
    => true

    > require "selenium-webdriver"
    => true

    > Headless.ly do
    >   browser = Selenium::WebDriver.for :firefox
    >   browser.get "http://google.com"
    >   browser.title
    > end
     => "Google"

This is an example of object mode (using IRB):

    ﻿$ irb

    > require "headless"
    => true

    > require "selenium-webdriver"
    => true

    ﻿> headless = Headless.new
    => #<Headless:0x9e957d8 @display=99, @autopick_display=true,
    @reuse_display=true, @dimensions="1280x1024x24", @video_capture_options={},
    @destroy_at_exit=true>

    > headless.start
    => #<Proc:0x9eaa2b4@/home/z/.rvm/gems/ruby-2.1.1/gems/headless-1.0.1/lib/
    headless.rb:175>

    > browser = Selenium::WebDriver.for :firefox
    => #<Selenium::WebDriver::Driver:0x..f9de848e2 browser=:firefox>

    > browser.get "http://google.com"
    => ""

    > browser.title
    => "Google"

    > headless.destroy
    => ["/tmp/.X99-lock"]

Of course, block and object mode can be used in Ruby files, not just in IRB. Save the following text as `headless_block_mode.rb` file.

    require "headless"
    require "selenium-webdriver"

    Headless.ly do
      browser = Selenium::WebDriver.for :firefox
      browser.get "http://google.com"
      p browser.title
    end

Run the file:

    ﻿$ ruby headless_block_mode.rb
    "Google"

Save the following text as `headless_object_mode.rb` file.

    require "headless"
    require "selenium-webdriver"

    headless = Headless.new
    headless.start

    browser = Selenium::WebDriver.for :firefox
    browser.get "http://google.com"
    p browser.title

    headless.destroy

Run the file:

    ﻿$ ruby headless_object_mode.rb
    "Google"

As usual, you can take screenshots using Selenium API while running tests, even in headless mode. If you do not know how to do that, see *Driver* chapter.

Xvfb has it's own screenshots and video recording API, but it is beyond the scope of this book to cover it. For more information see documentation for [headless](https://github.com/leonid-shevtsov/headless) gem.
