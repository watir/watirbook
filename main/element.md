# Element

I> You will need internet access if you want to follow examples in this chapter. All examples in this chapter are tried on Mac OS X 10.8.5, Firefox 27.0.1, Ruby 2.1.0p0 and selenium-webdriver 2.40.0 but everything should work on all supported platforms.

After you had a taste of Selenium in *Getting Started* chapter, it is time to take a closer look at Selenium API. This chapter will get you introduced to the API but it will not cover it entirely. For more information see [Selenium::WebDriver::Element](http://rdoc.info/gems/selenium-webdriver/Selenium/WebDriver/Element) API documentation.

Let's start Firefox and open Google home page:

    $ irb

    > require "selenium-webdriver"
     => true

    > browser = Selenium::WebDriver.for :firefox
    => #<Selenium::WebDriver::Driver:0x..
    f8698791d2bff9778 browser=:firefox>

    > browser.get "http://google.com"
    => ""

Most of the time you will be dealing with page elements, so let's see how to do that. First, you need to find the element on the page, then you usually need to do something with it, like entering text or clicking it. To find the element, use `find_element` method.

    > browser.find_element(name: "q")
    => #<Selenium::WebDriver::Element:...
       id="{25201324-ac0c-8e40-9766-c35aa5b54786}">

There are many options available to find an element.

| How               | Symbol             | Shortcut |
|-------------------|--------------------|----------|
| class name        | :class_name        | :class   |
| css selector      | :css               |          |
| id                | :id                |          |
| link text         | :link_text         | :link    |
| name              | :name              |          |
| partial link text | :partial_link_text |          |
| tag name          | :tag_name          |          |
| xpath             | :xpath             |          |

C> *Table of attributes to find elements*

Looks like we have found the element, but we did not do anything with it yet. Since the element we have found is a text field, let's enter some text into it:

    > browser.find_element(name: "q").send_keys "watir"
    => ""

We can also clear the text field:

    > browser.find_element(name: "q").clear
    => ""

There is a shortcut if you want to find an element via it's `id`. Just provide the `id`:

    > browser["gbqfq"]
    => #<Selenium::WebDriver::Element:...
       id="{fca96529-8bc6-bf4f-8e78-376f037c351a}">

To get the value of any element attribute, use `attribute`. Try a few attributes:

    > browser["gbqfq"].attribute(:name)
    => "q"

    > browser["gbqfq"].attribute(:class)
    => "gbqfif"

    > browser["gbqfq"].attribute(:type)
    => "text"

    > browser["gbqfq"].attribute(:autocomplete)
    => "off"

    > browser["gbqfq"].attribute(:style)
    => "border: medium none; padding: 0px; margin: ...

    > browser["gbqfq"].attribute(:outerHTML)
    => "<input spellcheck=\"false\" dir=\"ltr\" ...

Create a Ruby file from the above IRB session and save it as `element.rb`. Of course, add a `p` in front of a few commands, so the script outputs something.

    require "selenium-webdriver"
    browser = Selenium::WebDriver.for :firefox
    browser.get "http://google.com"
    browser.find_element(name: "q")
    browser.find_element(name: "q").send_keys "watir"
    browser.find_element(name: "q").clear
    browser["gbqfq"]
    p browser["gbqfq"].attribute(:name)
    p browser["gbqfq"].attribute(:class)
    p browser["gbqfq"].attribute(:type)
    p browser["gbqfq"].attribute(:autocomplete)
    p browser["gbqfq"].attribute(:style)
    p browser["gbqfq"].attribute(:outerHTML)

Run the file:

    $ ruby element.rb
    "q"
    "gbqfif"
    "text"
    "off"
    "border: medium none; padding: 0px; margin: 0px;...
    "<input spellcheck=\"false\" dir=\"ltr\" style=...
