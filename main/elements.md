# Elements

TODO

*You will need internet access if you want to follow examples in this chapter.*

*All examples in this chapter are tried on Mac OS X 10.9.1, Firefox 26.0, Ruby 2.1.0p0 and selenium-webdriver 2.39.0 but everything should work on all supported platforms.*

After you had a taste of Selenium in Getting Started chapter, it is time to take a closer look at Selenium API. This chapter will get you introduced to the API but it will not cover the entire API. For more information see [Selenium::WebDriver::Element](http://rdoc.info/gems/selenium-webdriver/Selenium/WebDriver/Element) API documentation.

Most of the time you will be dealing with page elements, so let's see how to do that.

Let's start Firefox and open Google home page:

    > browser = Selenium::WebDriver.for :firefox
    => #<Selenium::WebDriver::Driver:0x5fa557598b4f9fb8 browser=:firefox>

    > browser.get "http://google.com"
    => ""

To find an element via it's `id`, just provide the `id`:

    > browser["gbqfq"]
    => #<Selenium::WebDriver::Element:0x6faea7c65902853c id="{fca96529-8bc6-bf4f-8e78-376f037c351a}">

To get the value of any element attribute, use `attribute`:

    > browser["gbqfq"].attribute(:name)
    => "q"
