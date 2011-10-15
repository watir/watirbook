# Link

*You will need internet access if you want to follow examples in this chapter.*

*All examples in this chapter are tried on Ruby 1.9.2p290, RubyGems 1.8.11:*

- *Mac OS 10.6.8:*

>  - *Firefox 7.0.1 and watir-webdriver 0.3.5*
>  - *Safari 5.1 and safariwatir 0.4.0*

- *Microsoft Windows 7 Professional 32-bit, Service Pack 1, Internet Explorer 9 and watir 2.0.2*

Let's take a closer look at one HTML element. Links are probably the most popular of all HTML elements, so it would be just fair to start there. Usually, you can recognize a link on a web page because it's text is underlined.

There are two ways of accessing the link, `browser.link` and `browser.a`. Both of them do the same thing, but `browser.a` is not supported in older Watir gems. Since `browser.link` works everywhere, we will use it in this example.

You could access the link in a lot of ways (alphabetically): `after?`, `class`, `css`, `href`, `html`, `id`, `index`, `name`, `text`, `url`, `xpath` and multiple attributes.

Examples:

    browser.link(:after? => browser.link(:text => "buy"))
    browser.link(:class => "header")
    browser.link(:css => "a test")
    browser.link(:href => "http://watir.com")
    browser.link(:html => /test/)
    browser.link(:id => "footer")
    browser.link(:index => 1)
    browser.link(:name => "sidebar)
    browser.link(:text => "click me")
    browser.link(:url => /watir/)
    browser.link(:xpath => "//a[@href='http://watir.com/']/").click

and multiple attributes:

    browser.link(:text => "click me", index => 2)

First, create a simple HTML file with only one link in it. Open your favorite text editor, enter the following line in it and save it as `link.htm`:

    <a href="http://watir.com/">click me</a>

You can save the file anywhere, but I suggest that you save it to desktop, it will be easy to find there. Double click the file and it should open in your default browser, in my case Firefox.

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

Open Firefox browser:

    browser = Watir::Browser.new :ff
    => #<Watir::Browser:0x2b6d7f970192e212 url="about:blank" title="">

Go to `link.htm`:

    browser.goto "file:///Users/zeljko/Desktop/link.htm"
    => "file:///Users/zeljko/Desktop/link.htm"

We are ready now to play with the link.





## Text

We will start with accessing the link via `text`, since it is the most common way of accessing links. Our link looks like this:

    <a href="http://watir.com/">click me</a>

There is two ways to access the link, using the exact `text`, and only part of the `text`.



### Text and String

Since we know the exact `text` of the link, we can click it using string. But before we click the link, let's flash it, just to make sure we are interacting with the right link:

    browser.link(:text, "click me").flash
    => 10

Let's finally click the link:

    browser.link(:text, "click me").click
    => []

Watir home page (*watir.com*) should open. Tell the browser to go back to `link.htm`, we have more exercises to finish there:

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

    > browser.link(:text => /click/).flash
    => 10

    > browser.link(:text => /click/).click
    => []

Of course, tell the browser to go back to `link.htm` with `browser.back`. From now on, each time *watir.com* opens, tell the browser to go back to `link.htm`.

    browser.back
    => ""





## Href

For this example, let's look only at the link's `href` attribute.

    <a href="http://watir.com/">click me</a>



### Href and String

If you know the full value of link's `href` attribute, you could use string to click the link. Of course, flash the link first, to see if everything works, then click it.

    browser.link(:href => "http://watir.com/").flash
    => 10

    browser.link(:href => "http://watir.com/").click
    => []

Did you remember to tell tell the browser to go back to `link.htm` with `browser.back`?

    browser.back
    => ""



### Href and Regular Expression

If you know only a portion of `href` attribute, you will still use `href` to locate the link, but this time with a regular expression instead of a string. The usual story: flash, click, back to `link.htm`.

    browser.link(:href => /watir/).flash
    => 10

    browser.link(:href => /watir/).click
    => []

    browser.back
    => ""





## URL

`url` is alias for `href`. So, everything I said about `href` is true for `url` also. Well, not everything. If you try any of the following with watir-webdriver:

    browser.link(:url => "http://watir.com/").flash
    browser.link(:url => "http://watir.com/").click

    browser.link(:url => /watir/).flash
    browser.link(:url => /watir/).click

you would get this error message:

    Watir::Exception::MissingWayOfFindingObjectException:
    invalid attribute: :url
    ...

Watir-webdriver wants to tell you that it does not support accessing links via `url` attribute. Other gems support it. Since it is just an alias for `href`, I would recommend that you use `href` everywhere.





## ID

According to the HTML specification, almost all HTML elements can have an `id`, and each `id` should be unique on the page. Uniqueness makes `id` very convenient for us. All other element attributes can appear more than once on the page and Watir will locate only the first element with the specified attribute, and maybe you want the second or the third one. (There is a workaround for that problem, keep on reading.)

Open `link.htm` in your favorite text editor and change the text to this, and save the file:

    <a href="http://watir.com/" id="watir-home-page">click me</a>

Refresh the page in the browser to make sure the latest version of `link.htm` is loaded:

    browser.refresh
    => []



### ID and String

If you know the entire id:

    browser.link(:id => "watir-home-page").flash
    => 10

    browser.link(:id => "watir-home-page").click
    => []

    browser.back
    => ""



### ID and Regular Expression

Sometimes `ids` on a page are automatically generated by the framework developers use, so `ids` are different every time a page is opened. Usually the portion of `id` stays the same. For example, it changes from `user007` to `user42` to `user123`. It is obvious that `user` part of the `id` is the same every time, so you can use that.

If our example, we will use `/watir/`.

    browser.link(:id => /watir/).flash
    => 10

    browser.link(:id => /watir/).click
    => []

    browser.back
    => ""





## Name

Another attribute that almost all HTML elements can have is `name`. It is not supposed to be unique on the page. It is very common that elements that are somehow related on the page have the same `name`. Change `link.htm` to this, and reload the page in the browser:

    <a href="http://watir.com/" name="watir-home-page">click me</a>

    browser.refresh
    => []



### Name and String

If you know the entire `name`:

    browser.link(:name => "watir-home-page").flash
    => 10

    browser.link(:name => "watir-home-page").click
    => []

    browser.back
    => ""



### Name and Regular expression

If you know the portion of `name`:

    browser.link(:name => /watir/).flash
    => 10

    browser.link(:name => /watir/).click
    => []

    browser.back
    => ""





## Class

It is also very common for an HTML element to have a `class` attribute. Change `link.htm` to this, and reload the page in the browser:

    <a href="http://watir.com/" class="watir-home-page">click me</a>

    browser.refresh
    => []



### Class and String

If you know the entire `class`:

    browser.link(:class => "watir-home-page").flash
    => 10

    browser.link(:class => "watir-home-page").click
    => []

    browser.back
    => ""



### Class and Regular Expression

If you know the portion of `class`:

    browser.link(:class => /watir/).flash
    => 10
    
    browser.link(:class => /watir/).click
    => []

    browser.back
    => ""





## Index



### Explicit Index

If the element does not have any attributes that would differentiate it from the other links on the page, but you know the link's position on the page, you could use it's `index`. In this example, it is the first link.

    browser.link(:index => 0).flash
    => 10

    browser.link(:index => 0).click
    => []

    browser.back
    => ""

Do you see anything strange in the above code? Take a look. I will wait.

Maybe you have noticed that this is the first time we did not use a string (double quotes around the text, remember?) or a regular expression (slashes around the text). We have used just the number one. Such numbers are called integers. Watir uses integers only with `index`.

Please note that watir and watir-webdriver gems counts from 0 (0, 1, 2...). That is called zero-based indexing. Safariwatir counts from 1 (1, 2, 3...). That is called one-based indexing. (Watir gem used one-based indexing until versinon 2.0.) It is usual in programming that the first element is the number zero (hence zero-based indexing).



### Implicit Index

This will do the same thing.

    browser.link.flash
    => 10

    browser.link.click
    => []

    browser.back
    => ""

So, if you do not provide any arguments to `link` method, it will just click the first link it finds. It is very useful.

It is time for and example. If you know that the link is the first (or even the only) link inside a specific div:

    <div id="42">
      <a href="http://watir.com/">click me</a>
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

Sometimes the only way to identify the element is to say that it should be after another element. Take a look at this example:

    <a href="http://watir.com/">click me</a>
    <a href="http://watir.com/" id="watir-home-page">click me</a>
    <a href="http://watir.com/">click me</a>

Save the above HTML as `link.htm`, and reload the page in the browser:

    browser.refresh
    => []

This will flash the first link, but we want to flash the third one:

    browser.link(:href => /watir/).flash

One of the ways you could do it is, but looks like watir-webdriver does not support `after`:

    browser.link(:after? => browser.link(:id => "watir-home-page")).flash
    TypeError: expected one of [String, Regexp],
    got #<Watir::Anchor:0x3308eea0e6878cb6 located=false
    selector={:id=>"watir-home-page", :tag_name=>"a"}>:Watir::Anchor
    ...

We told Watir that we want to click a link after a div that has `id` attribute set to `watir-home-page`. I rarely use it, but there are times when it is really handy.

Do you see something strange in the above code? This is the first time we have used a page element as the second parameter (instead of string, regular expression or integer).





## HTML

If the link you want to access does not have any usual attributes that could uniquely identify it, Watir can handle that too. For example, you need to click the second link:

    <a onclick="new Ajax.Request('007')">click me</a>
    <a onclick="new Ajax.Request('42')">click me</a>

One of the really elegant ways to do it is by using `html`:

    browser.link(:html => /007/).click

In above example, we have used a regular expression as the second parameter, but I am sure you have already gotten used to them. I am also sure you are already convinced that regular expressions are very useful.





## CSS

Not written yet.





## XPath

XPath was not in Watir from the beginning. It was added by Angrez Singh. He also created Watir's Firefox driver. Aidy Lewis moved Watir's XPath implementation from REXML to Nokogiri, and now it is faster. XPath is really powerful. Most times you can just use `html`, but if it does not solve the problem, try XPath.

If you have a link:

    <a href="http://watir.com/">click me</a>

You could click it with:

    browser.link(:xpath => "//a[@href='http://watir.com/']/").click

Another way, especially useful if the element you are trying to access in not directly supported by Watir:

    browser.element_by_xpath("//a[@href='http://watir.com/']/").click

At the moment, you can use XPath to access elements located in a frame, but you can not use XPath to access the frame itself. In another words, this would work:

    browser.frame(:name => "one").link(:xpath => "//a[@href='http://watir.com/']/").click

but this would not:

    browser.frame(:xpath => "//frame[@name='one']/")





## Multiple Attributes

Accessing an element using multiple attributes was not in Watir from the start. This is a killer feature, as you will see. For example, if you have two completely identical links on the same page, and you want to click the second one:

      <a href="http://watir.com/">click me</a>
      <a href="http://watir.com/">click me</a>

you could do it like this:

    browser.link(:text => "click me", :index => 1).click

The above code will click the second link with text `click me`.





## Collections

You can even do stuff with all elements of a particular kind on a page. If you want to display `href` attributes of all links in the page, this will do it:

    browser.links.each do |link|
      puts link.href
    end





## Nested Elements





### Simple Nesting

Sometimes the only way to uniquely identify a link is to specify one or more of its parent elements. How would you click the second link in this example?

    <div id="one">
      <a href="http://watir.com/">click me</a>
    </div>
    <div id="two">
      <a href="http://watir.com/">click me</a>
    </div>

This will click on the first link, but we want to click on the second one:

    browser.link(:text => "click me").click

This will work, but it is really fragile:

    browser.link(:index => 1).click

If in further development a link (or more) is added between the two links we have so far, the code above will click on whatever link was the second, and that is not what we want.

Let's make it less fragile.

We know that the second link is a child element of a `div` with an `id` attribute. This is the solution to the problem:

    browser.div(:id => "two").link(:text => "click me").click

Isn't that just so elegant?! Read it. First there is a browser, inside it there is the div, and inside the div is our link.

The above solution is not the only one. This will work too:

    browser.div(:id => "two").link(:index => 0).click

This time we told Watir that we want it to click the first link in a specific div.

There are endless options how to click on an element on a page, and this book will try to teach you all of them.





### More nesting

If for some reason you want to be very specific about where the element is located in the page, Watir can handle that too. For example, if you had something like this:

    <div id="one">
      <div id="two">
        <a href="http://watir.com/">click me</a>
      </div>
    </div>

You could click the link with:

    browser.div(:id => "one").div(:id => "two").link(:text => "click me").click

So, there is a browser, then a div, another div and the link we are looking for.

The nesting can go as deep as you like.

\newpage

