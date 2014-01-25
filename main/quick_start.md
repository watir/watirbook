# Quick Start

*You will need internet access if you want to follow examples in this chapter.*

In this chapter I assume you have Ruby, RubyGems, selenium-webdriver gem and Firefox browser installed, since that is the combination available on all operating systems. If you do not have them installed, please see *Installation* chapter.

If you are familiar with Ruby, I am sure you already think IRB is one of the greatest tools for learning a new Ruby library. If you are new to Ruby, you are probably thinking: *What is this IRB thing?* IRB is *Interactive Ruby Shell*. Think of it as a shell that knows Ruby (as the name says).

To start IRB, just type `irb` in command line. You will see something like this:

    $ irb
    >

Now you can enter any Ruby command and you will immediately get a result. We will start with telling Ruby that we want to use selenium-webdriver gem with `require "watir-webdriver"`:

You should see something like this:

    > require "selenium-webdriver"
    => true

Every Ruby command returns something. You should get `=> true` after `require "selenium-webdriver"`. There are two parts in the returned line. The first one is `=>`. It looks like an arrow. It means `Ruby returned this`. The second part is `true`, the thing that is actually returned. When `true` is returned, it usually means that everything is fine. Unless I say differently, just ignore what is returned, for now.

Open Firefox.

    > browser = Selenium::WebDriver.for :firefox
    => #<Selenium::WebDriver::Driver:0x10e1416dd9107ffe browser=:firefox>

As I said earlier, you can ignore `#<Selenium::WebDriver::Driver:...>`. Opening Firefox returned the browser as an object, and this is textual representation of the object.

Just opening a browser is not so useful. Let's open *google.com*. I would suggest that you literally follow the example, and then try a few sites yourself.

So, go to *google.com*:

    > browser.navigate.to "https://www.google.com/"
    => ""

And *google.com* opens. (Since I am in Croatia, *google.hr* opened. If you are not in the US, some other Google site could open.)

Controlling the browser is really useful but, as I am sure you already know, there is more to testing than just performing the actions. You have to check what happened after the action. What happens when I enter a URL in browser address bar, when I click a link or a button, when I enter some text in a text field or select something from select box...?

This is the first time we will perform a check. It is also the first time we will take a look what Ruby returns after the command. Let's check if the browser really opened *google.com*.

    > browser.current_url
    => "https://www.google.hr/?gws_rd=cr&ei=RDrkUrWVJOS24ASbyYCQDQ"

It really works! Ruby returned a string (the thing in double quotes) that contains the text from the browser address bar.

It's time to click on a link. It is easy to explicitly say which link to click on. Right now I want to click on a link with the text *Google.com*. If your browser already opened *google.com*, ignore this step.

    > browser.find_element(link_text: "Google.com").click
    => "ok"

And *google.com* opens. Now that all of us are on literally on the same page, let's click another link:

    > browser.find_element(link_text: "Images").click
    => "ok"

This time, let's check the page title.

    > browser.title
    => "Google Images"

We got back the string with the page title.

Let's search for something. This will enter *book* in search text field:

    > browser.find_element(name: "q").send_keys "book"
    => ""

Maybe you are wondering how I knew the text field had the value of *name* attribute set to *q* (I am talking about `name: "q"`). If you do not know how to inspect pages, read on. I will explain it later.

Now, click the search button:

    > browser.find_element(name: "btnG").click
    => "ok"

Page with search results will open. Let's check how many images are on the page. (You might get a different number, it does not have to be 126.)

    > browser.find_elements(tag_name: "img").size
    => 126

And finally, let's close the browser.

    > browser.close
    => ""

Well, that was a lot of fun. But you do not want to type into IRB all the time. You want to run the tests and do something else while it runs. As for almost everything else in Ruby, there is a simple solution. Paste all code you have entered in IRB in a text file, and save it with *rb* extension. IRB is used only for development or debugging, so do not paste `irb` as the first line of the file. The file should look like this:

    require "selenium-webdriver"
    browser = Selenium::WebDriver.for :firefox
    browser.navigate.to "https://www.google.com/"
    browser.current_url
    browser.find_element(link_text: "Google.com").click
    browser.find_element(link_text: "Images").click
    browser.title
    browser.find_element(name: "q").send_keys "book"
    browser.find_element(name: "btnG").click
    browser.find_elements(tag_name: "img").size
    browser.close

You can use any text editor to edit the file. I use [RubyMine](http://www.jetbrains.com/ruby/) or [Sublime Text](http://www.sublimetext.com/3).

Save the file as `quick_start.rb`. If IRB is still running in your command line, press `ctrl+d` to return to normal command prompt, or open a new command prompt. (To exit from IRB to normal command line, instead of pressing `ctrl+d`, you can also type `quit` or `exit`.) You should remove clicking *Google.com* link if Firefox opens it automatically for you.

To run the file, navigate in command prompt to the folder where you have saved it and run it with `ruby quick_start.rb`:

    $ ruby quick_start.rb

Smile while the browser clicks around.

What is the output in the command prompt? Nothing? Yes, nothing. IRB displays values that Ruby returns, but when you execute Ruby file from the command line, it does not display the values Ruby returns. You have to explicitly say to Ruby that you want them displayed. It is as easy as adding `puts` in front of the command. Add `puts` in front of three lines. Modify the script to look like this. You can add puts in front of every command, but you really do not care about what some commands return:

    require "selenium-webdriver"
    browser = Selenium::WebDriver.for :firefox
    browser.navigate.to "https://www.google.com/"
    puts browser.current_url
    browser.find_element(link_text: "Google.com").click
    browser.find_element(link_text: "Images").click
    puts browser.title
    browser.find_element(name: "q").send_keys "book"
    browser.find_element(name: "btnG").click
    puts browser.find_elements(tag_name: "img").size
    browser.close

Run the script. This time the output should look like this:

    $ ruby quick_start.rb
    https://www.google.hr/?gws_rd=cr&ei=RkLkUvqMIYeH4gTf_oDYBQ
    Google Images
    126

Later I will show you how to make cool looking reports.
