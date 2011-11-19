# Link

*You do not need internet access if you want to follow examples in this chapter.*

*All examples in this chapter are tried on Ruby 1.9.2p290, RubyGems 1.8.11:*

- *Mac OS 10.6.8: Firefox 8 and watir-webdriver 0.3.9*
- *Microsoft Windows 7 Professional 32-bit, Service Pack 1, Internet Explorer 9 and watir 2.0.4*

*Note: safariwatir does not support a lot of features that are used in this chapter.*

Let's take a closer look at one HTML element. Links are probably the most popular of all HTML elements, so it would be just fair to start there. Usually, you can recognize a link on a web page because it's text is underlined.

There are two ways of accessing the link, `browser.a` and `browser.link`. Both of them do the same thing, but `browser.a` is not supported in older Watir gems and in safariwatir.

You could access the link in a lot of ways (alphabetically): `after?`, `class`, `css`, `href`, `html`, `id`, `index`, `name`, `text`, `url`, `xpath` and multiple attributes.

Examples:

    browser.a(:after? => browser.a(:text => "buy"))
    browser.a(:class => "header")
    browser.a(:css => "[id=click-me]").click
    browser.a(:href => "clicked.htm")
    browser.a(:html => /test/)
    browser.a(:id => "footer")
    browser.a(:index => 1)
    browser.a(:name => "sidebar)
    browser.a(:text => "click me")
    browser.a(:url => /watir/)
    browser.a(:xpath => "//a[@href='clicked.htm']/").click

and multiple attributes:

    browser.a(:text => "click me", index => 2)

To make sure you could do the exercises from this chapter even without internet access, we will create two HTML files, and create a link from one to the other.

First, create a simple HTML file with only one link in it. Open your favorite text editor, enter the following line in it and save it as `link.htm`:

    <a href="clicked.htm">click me</a>

Then create another file, `clicked.htm` and put it in the same folder as `link.htm`. You can put anything in `clicked.htm` file, for example just text `Clicked!`.

You can save the files anywhere (make sure both files are in the same folder), but I suggest that you save it to desktop, it will be easy to find there. Open `link.htm` with Firefox.

![A simple web page with only one link.](https://github.com/zeljkofilipin/watirbook/raw/master/images/link/text.png)\

*A simple web page with only one link.*

Copy URL from the address bar and paste it somewhere safe, in another file, for example. In my case, URL was `file:///Users/zeljko/Desktop/link.htm`, since I have saved the file to my desktop. We will need the URL to open the same HTML page later with Watir. Close the browser.

Open command prompt application and open IRB:

    $ irb
    >

Let IRB know that you plan to use watir-webdriver gem:

    require "watir-webdriver"

The output should look similar to this:

    > require "watir-webdriver"
    => true

If you get something like this, do not panic:

    > require "watir-webdriver"
    LoadError: no such file to load -- watir-webdriver
    from (irb):1:in `require'
    from (irb):1

It just means you have to require RubyGems first. In that case, do this:

    > require "rubygems"
    => true

    > require "watir-webdriver"
    => true

In following code examples, do not type lines that start with `=>` (`=> true` for example). That represents value that Ruby returned. You can ignore those lines, until I say differently.

If you are using watir-webdriver gem, open Firefox browser:

    browser = Watir::Browser.new :ff
    => #<Watir::Browser:0x2b6d7f970192e212 url="about:blank" title="">

Go to `link.htm`:

    browser.goto "file:///Users/zeljko/Desktop/link.htm"
    => "file:///Users/zeljko/Desktop/link.htm"

We are ready now to play with the link.





## Text

We will start with accessing the link via `text`, since it is the most common way of accessing links. Our link looks like this:

    <a href="clicked.htm">click me</a>

There is two ways to access the link, using the exact `text`, and only part of the `text`.



### Text and String


Since we know the exact `text` of the link, we can click it using string. But before we click the link, let's flash it, just to make sure we are interacting with the right link:

    browser.a(:text => "click me").flash
    => 10

Let's finally click the link:

    browser.a(:text => "click me").click
    => []

`clicked.htm` file should open. Tell the browser to go back to `link.htm`, we have more exercises to finish there:

    browser.back
    => ""

Browser should go back to `link.htm`.



### Text and Regular expression

If you know only a portion of a string, you can use regular expressions. For now, think of regular expressions as a string with a strange syntax. It looks like this: `/click/`. Please notice the slashes instead of quotes.

When would you use regular expressions? For example, you want to click on a discussion on a forum by its title, but the title changes form *On Dogs (1)* to *On Dogs (2)* after the first reply is posted.

You could not use `"On Dogs"` to locate the link, because link text is *On Dogs (1)* and Watir will complain that it could not find it.

You could use `"On Dogs (1)"` to locate the link the first time, but when link text changes to *On Dogs (2)*, Watir will no longer be able to find the link.

In that case, you could tell Watir: *Well, I know just one part of the string.* and it will happily look at all strings until it finds the one that matches the portion you have provided.

In our example, we will use `/click/`. First, we will flash the link, and then click it. In this example we do not care if there is any text before or after `click`.

    > browser.a(:text => /click/).flash
    => 10

    > browser.a(:text => /click/).click
    => []

Of course, tell the browser to go back to `link.htm` with `browser.back`. From now on, each time `clicked.htm` opens, tell the browser to go back to `link.htm`.

    browser.back
    => ""





## Href

For this example, let's look only at the link's `href` attribute.

    <a href="clicked.htm">click me</a>



### Href and String

If you know the full value of link's `href` attribute, you could use string to click the link. Of course, flash the link first, to see if everything works, then click it.

    browser.a(:href => "clicked.htm").flash
    => 10

    browser.a(:href => "clicked.htm").click
    => []

Did you remember to tell tell the browser to go back to `link.htm` with `browser.back`?

    browser.back
    => ""



### Href and Regular Expression

If you know only a portion of `href` attribute, you will still use `href` to locate the link, but this time with a regular expression instead of a string. The usual story: flash, click, back to `link.htm`.

    browser.a(:href => /clicked/).flash
    => 10

    browser.a(:href => /clicked/).click
    => []

    browser.back
    => ""





## URL

*Note: watir-webdriver does not support accessing page elements via `url`.*

`url` is alias for `href`. So, everything I said about `href` is true for `url` also. Well, not everything. If you try any of the following with watir-webdriver:

    browser.a(:url => "clicked.htm").flash
    browser.a(:url => "clicked.htm").click

    browser.a(:url => /clicked/).flash
    browser.a(:url => /clicked/).click

you would get this error message:

    Watir::Exception::MissingWayOfFindingObjectException:
    invalid attribute: :url
    ...

Watir-webdriver wants to tell you that it does not support accessing links via `url` attribute. Other gems support it. Since it is just an alias for `href`, I would recommend that you use `href` everywhere.





## ID

According to the HTML specification, almost all HTML elements can have an `id`, and each `id` should be unique on the page. Uniqueness makes `id` very convenient for us. All other element attributes can appear more than once on the page and Watir will locate only the first element with the specified attribute, and maybe you want the second or the third one. (There is a workaround for that problem, keep on reading.)

Open `link.htm` in your favorite text editor and change the text to this, and save the file:

    <a href="clicked.htm" id="click-me">click me</a>

Refresh the page in the browser to make sure the latest version of `link.htm` is loaded:

    browser.refresh
    => []



### ID and String

If you know the entire id:

    browser.a(:id => "click-me").flash
    => 10

    browser.a(:id => "click-me").click
    => []

    browser.back
    => ""



### ID and Regular Expression

Sometimes `ids` on a page are automatically generated by the framework developers use, so `ids` are different every time a page is opened. Usually the portion of `id` stays the same. For example, it changes from `user007` to `user42` to `user123`. It is obvious that `user` part of the `id` is the same every time, so you can use that.

If our example, we will use `/click/`.

    browser.a(:id => /click/).flash
    => 10

    browser.a(:id => /click/).click
    => []

    browser.back
    => ""





## Name

Another attribute that almost all HTML elements can have is `name`. It is not supposed to be unique on the page. It is very common that elements that are somehow related on the page have the same `name`. Change `link.htm` to this, and reload the page in the browser:

    <a href="clicked.htm" name="click-me">click me</a>

    browser.refresh
    => []



### Name and String

If you know the entire `name`:

    browser.a(:name => "click-me").flash
    => 10

    browser.a(:name => "click-me").click
    => []

    browser.back
    => ""



### Name and Regular expression

If you know the portion of `name`:

    browser.a(:name => /click/).flash
    => 10

    browser.a(:name => /click/).click
    => []

    browser.back
    => ""





## Class

It is also very common for an HTML element to have a `class` attribute. Change `link.htm` to this, and reload the page in the browser:

    <a href="clicked.htm" class="click-me">click me</a>

    browser.refresh
    => []



### Class and String

If you know the entire `class`:

    browser.a(:class => "click-me").flash
    => 10

    browser.a(:class => "click-me").click
    => []

    browser.back
    => ""



### Class and Regular Expression

If you know the portion of `class`:

    browser.a(:class => /click/).flash
    => 10

    browser.a(:class => /click/).click
    => []

    browser.back
    => ""





## Index



### Explicit Index

*Note: watir and watir-webdriver use zero-based indexing, safariwatir uses one-based indexing.*

If the link does not have any attributes that would differentiate it from the other links on the page, but you know the link's position on the page, you could use it's `index`. In this example, it is the first link.

    browser.a(:index => 0).flash
    => 10

    browser.a(:index => 0).click
    => []

    browser.back
    => ""

Do you see anything strange in the above code? Take a look. I will wait.

Maybe you have noticed that this is the first time we did not use a string (double quotes around the text, remember?) or a regular expression (slashes around the text). We have used just the number one. Such numbers are called integers. Watir uses integers only with `index`.

Please note that watir and watir-webdriver gems counts from 0 (0, 1, 2...). That is called zero-based indexing. Safariwatir counts from 1 (1, 2, 3...). That is called one-based indexing. (Watir gem used one-based indexing until versinon 2.0.) It is usual in programming that the first element is the number zero (hence zero-based indexing).



### Implicit Index

This will do the same thing.

    browser.a.flash
    => 10

    browser.a.click
    => []

    browser.back
    => ""

So, if you do not provide any arguments to `link` method, it will just click the first link it finds. It is very useful.

It is time for and example. If you know that the link is the first (or even the only) link inside a specific div:

    <div id="42">
      <a href="clicked.htm">click me</a>
    </div>

Save the above HTML as `link.htm`, and reload the page in the browser:

    browser.refresh
    => []

Then try this:

    browser.div(:id => "42").link.flash
    => 10

    browser.div(:id => "42").link.click
    => []

    browser.back
    => ""





## After

*Note: watir-webdriver does not support accessing page elements via `after`.*

Sometimes the only way to identify the element is to say that it should be after another element. Take a look at this example:

    <a href="clicked.htm">click me</a>
    <a href="clicked.htm" id="click-me">click me</a>
    <a href="clicked.htm">click me</a>

Save the above HTML as `link.htm`, and reload the page in the browser:

    browser.refresh
    => []

This will flash the first link, but we want to flash the third one:

    browser.a(:href => /click/).flash

One of the ways you could do it is, but looks like watir-webdriver does not support `after`:

    browser.a(:after? => browser.a(:id => "click-me")).flash
    TypeError: expected one of [String, Regexp],
    got #<Watir::Anchor:0x3308eea0e6878cb6 located=false
    selector={:id=>"click-me", :tag_name=>"a"}>:Watir::Anchor
    ...

We told Watir that we want to click a link after a div that has `id` attribute set to `click-me`. I rarely use it, but there are times when it is really handy.

Do you see something strange in the above code? This is the first time we have used a page element as the second parameter (instead of string, regular expression or integer).





## HTML

*Note: watir-webdriver does not support accessing page elements via `html`.*


If the link you want to access does not have any usual attributes that could uniquely identify it, Watir can handle that too. For example, you need to click the second link:

    <a href="clicked.htm" onclick="new Ajax.Request('007')">click me</a>
    <a href="clicked.htm" onclick="new Ajax.Request('42')">click me</a>

One of the really elegant ways to do it is by using `html`:

    browser.a(:html => /007/).click

In above example, we have used a regular expression as the second parameter, but I am sure you have already gotten used to them. I am also sure you are already convinced that regular expressions are very useful.





## CSS

*Note: watir-webdriver does not support accessing page elements via `css`.*

CSS selectors are a pretty new addition to Watir, but a powerful one.

For example, if you have a link:

    <a href="clicked.htm" id="click-me">click me</a>

you could click it with

    browser.a(:css => "[id=click-me]").click





## XPath

XPath was not in Watir from the beginning. It was added by Angrez Singh. He also created Watir's Firefox driver. Aidy Lewis moved Watir's XPath implementation from REXML to Nokogiri, and now it is faster. XPath is really powerful. Most times you can just use `html`, but if it does not solve the problem, try XPath.

### XPath

If you have a link:

    <a href="clicked.htm">click me</a>

You could click it with:

    browser.a(:xpath => "//a").flash

Or, if you would like to be more explicit:

    browser.a(:xpath => "//a[@href='clicked.htm']/").click

### Element_by_xpath

Another way, especially useful if the element you are trying to access is not supported by Watir:

    browser.element_by_xpath("//a").flash

Or, the more explicit way:

    browser.element_by_xpath("//a[@href='clicked.htm']/").click

### Frames

*Note: note tested.*

At the moment, you can use XPath to access elements located in a frame, but you can not use XPath to access the frame itself. In another words, this would work:

    browser.frame(:name => "one").link(:xpath => "//a[@href='clicked.htm']/").click

but this would not:

    browser.frame(:xpath => "//frame[@name='one']/")





## Multiple Attributes

*Note: watir and watir-webdriver use zero-based indexing, safariwatir uses one-based indexing.*

Accessing an element using multiple attributes was not in Watir from the start. This is a killer feature, as you will see. For example, if you have two completely identical links on the same page:

      <a href="clicked.htm">click me</a>
      <a href="clicked.htm">click me</a>

and you want to click the second one, you could do it like this:

    browser.a(:text => "click me", :index => 1).click

\newpage

