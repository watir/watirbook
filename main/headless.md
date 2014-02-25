# Headless

I have noticed a lot of confusion about headless testing, but it really noting special. The confusion may be caused because the term *headless* is a bit vague. In the context of driving a browser, *headless* means you can drive a real browser but without seeing anything on the machine.


There are two ways to run browser in a headless mode that I am aware of. One is to use a headless browser like [PhantomJS](http://phantomjs.org/). That option is available on all major operating systems. Another option is using [Xvfb](https://en.wikipedia.org/wiki/Xvfb) (X virtual framebuffer) and [Headless](https://github.com/leonid-shevtsov/headless) gem, but that works only on Linux.

## PhantomJS

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
