# Driver

I> You will need internet access if you want to follow examples in this chapter. All examples in this chapter are tried on Mac OS X 10.8.5, Firefox 27.0.1, Ruby 2.1.0p0 and selenium-webdriver 2.40.0 but everything should work on all supported platforms.

In this chapter you will learn how to control the [browser](http://rdoc.info/gems/selenium-webdriver/Selenium/WebDriver/Driver) using Selenium. In Quick Start chapter you have touched two important part of Selenium API, driver and element. In this chapter we will focus on the driver.

The first thing you have to do is to open the browser. According to the documentation, currently supported browsers are Firefox, Internet Explorer, Chrome, Android, iPhone, Opera, PhantomJS, Safari and remote browser. Let's focus on desktop drivers for now. See Mobile chapter on how to drive mobile browsers and Selenium in the Cloud chapter on how to driver remote browsers. How to set up everything is explained in detail in Installation chapter.

| Browser           | Symbol             | Shortcut |
|-------------------|--------------------|----------|
| Chrome            | :chrome            |          |
| Firefox           | :firefox           | :ff      |
| Internet Explorer | :internet_explorer | :ie      |
| Opera             | :opera             |          |
| PhantomJS         | :phantomjs         |          |
| Safari            | :safari            |          |

*Browser/Symbol/Shorcut table*

In this chapter we will use [IRB](https://en.wikipedia.org/wiki/Interactive_Ruby_Shell) (Interactive Ruby Shell). If you are not familiar with it, take a look at Ruby Tools chapter.

You can start Firefox with

    > browser = Selenium::WebDriver.for :firefox
    => #<Selenium::WebDriver::Driver:0x..f8698791d2bff9778 browser=:firefox>

or

    > browser = Selenium::WebDriver.for :ff
    => #<Selenium::WebDriver::Driver:0x..faf203ad50b5b4c08 browser=:firefox>

If you want to drive a different browser, just replace `:firefox` with another symbol.

Let's try a few interesting methods. `get` opens a page:

    > browser.get "http://google.com"
    => ""

`current_url` returns page URL:

    > browser.current_url
    => "https://www.google.hr/?gws_rd=cr&ei=xXjtUr6oAqTL4wTvooCYDQ"

`title` returns page title:

    > browser.title
    => "Google"

`close` closes the current window or the entire browser if there is only one window open.

When you are done with the browser, close it:

    > browser.close
    => ""

`quit` closes the browser:

    > browser.quit
    => nil
