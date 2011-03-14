# Link

Let's take a closer look at one element. I think you will use links the most, so it would be just fair to start there.

Usually, you can recognize a link on a web page because it's text is underlined:

    Programming Ruby: The Pragmatic Programmers' Guide, Second Edition

HTML code of a link could look something like this:

    <a href="http://www.pragprog.com/titles/ruby/programming-ruby">Programming Ruby: The Pragmatic Programmers' Guide, Second Edition</a>

You could access the link in a lot of ways (alphabetically):

    after?
    class
    href
    url
    html
    id
    index
    name
    text
    xpath

and multiple attributes.

Since this link has text and href attribute, we will start there.

## Text

For this example, we are interested only in the text of the link.

    <a>Programming Ruby: The Pragmatic Programmers' Guide, Second Edition</a>

### Text and String

Let's start with the original Watir way, `link` method accepting two parameters. The first parameter is a symbol, the second one is a string. You will know something is a symbol because it starts with a colon, like `:text`. For now, consider symbol to be nothing more than a string written in a strange way.

    browser.link(:text, "Programming Ruby: The Pragmatic Programmers' Guide, Second Edition").click

`link` method also accepts a hash. Hash consists of two parts, key and value. In this case the key is a symbol and the value is a string. Between them is that familiar arrow from IRB.

    browser.link(:text => "Programming Ruby: The Pragmatic Programmers' Guide, Second Edition").click

So, the only thing that is different between the two ways is that in the first example there is a comma between symbol and string, and in the second example there is and arrow. Later, I will explain why the arrow is introduced.

There is also a slightly more verbose way to write a hash (please notice curly braces):

    browser.link({:text => "Programming Ruby: The Pragmatic Programmers' Guide, Second Edition"}).click

In all examples we have used a string to locate the link. We could do that because we knew the complete text of the link.

### Text and Regular expression

If you know only a portion of a string, you can use regular expression.

For now, think of regular expression as a portion of a string with a strange syntax. It looks like this: `/Programming Ruby/`. Please notice slashes.

When would you use regular expression? For example, you want to click a discussion by title, but the title changes form `On Dogs (1)` to `On Dogs (2)` after the first reply is posted.

You could not use `"On Dogs"` to locate the link, because link text is `On Dogs (1)` and Watir will complain that it could not find it.

You could use `"On Dogs (1)"` to locate the link the first time, but when link text changes to `On Dogs (2)`, Watir will no longer be able to find the link.

In that case, you could say to Watir: `Well, I know the portion of the string.` and it will happily look at all strings until it finds the one that matches the portion you have provided.

In our example, we will use `/Programming Ruby/`. To click a link that has `Programming Ruby` in text, use one of the following (for now we do not care if there is any text before or after `Programming Ruby`):

    browser.link(:text, /Programming Ruby/).click
    browser.link(:text => /Programming Ruby/).click
    browser.link({:text => /Programming Ruby/}).click

## Href

For this example, let's look only at link's href attribute.

    <a href="http://www.pragprog.com/titles/ruby/programming-ruby"></a>

### Href and String

If you know the full value of link's href attribute, you could use `:href` symbol and a string to click the link. One of these should do it:

    browser.link(:href, "http://www.pragprog.com/titles/ruby/programming-ruby").click
    browser.link(:href => "http://www.pragprog.com/titles/ruby/programming-ruby").click
    browser.link({:href => "http://www.pragprog.com/titles/ruby/programming-ruby"}).click

### Href and Regular Expression

If you know only a portion of href attribute, you will still use `:href` to locate the link, but this time with a regular expression instead of a string:

    browser.link(:href, /programming-ruby/).click
    browser.link(:href => /programming-ruby/).click
    browser.link({:href => /programming-ruby/}).click

## URL

Since href attribute points to an URL, you can use `:url` instead of `:href`. We will use the same HTML as in the previous example:

    <a href="http://www.pragprog.com/titles/ruby/programming-ruby"></a>

### URL and String

One of these would click the above link if you know the entire value of link's href attribute:

    browser.link(:url, "http://www.pragprog.com/titles/ruby/programming-ruby").click
    browser.link(:url => "http://www.pragprog.com/titles/ruby/programming-ruby").click
    browser.link({:url => "http://www.pragprog.com/titles/ruby/programming-ruby"}).click

### URL and Regular Expression

One of these would click the above link if you know only the portion of link's href attribute:

    browser.link(:url, /programming-ruby/).click
    browser.link(:url => /programming-ruby/).click
    browser.link({:url => /programming-ruby/}).click

## ID

According to HTML specification, almost all HTML elements can have an id, and each id should be unique on the page. Uniqueness makes ids very convenient for us. All other element attributes can appear more than once on the page and Watir will locate only the first element with a specific attribute, and maybe you want the second or the third one. (There is workaround for that problem, keep on reading.)

So, if the link had an id attribute, like this:

    <a id="programming-ruby"></a>

we could access it using `:id`.

### ID and String

If you know the entire id:

    browser.link(:id, "programming-ruby").click
    browser.link(:id => "programming-ruby").click
    browser.link({:id => "programming-ruby"}).click

### ID and Regular Expression

If you know the portion of id:

    browser.link(:id, /programming-ruby/).click
    browser.link(:id => /programming-ruby/).click
    browser.link({:id => /programming-ruby/}).click

## Name

Another attribute that almost all HTML elements can have is `name`. It is not supposed to be unique on the page. It is very common that elements that are somehow related on the page have the same name.

If the link had a name attribute:

    <a name="programming-ruby"></a>

### Name and String

If you know the entire name:

    browser.link(:name, "programming-ruby").click
    browser.link(:name => "programming-ruby").click
    browser.link({:name => "programming-ruby"}).click

### Name and Regular expression

If you know the portion of name:

    browser.link(:name, /programming-ruby/).click
    browser.link(:name => /programming-ruby/).click
    browser.link({:name => /programming-ruby/}).click

## Class

It is also very common for an HTML element to have a class attribute:

    <a class="book"></a>

### Class and String

If you know the entire class:

    browser.link(:class, "book").click
    browser.link(:class => "book").click
    browser.link({:class => "book"}).click

### Class and Regular Expression

If you know the portion of class:

    browser.link(:class, /book/).click
    browser.link(:class => /book/).click
    browser.link({:class => /book/}).click

## Index

If you had no way other way, but you knew link's position on the page, you could use index. In this example, it is the first link.

    browser.link(:index, 1).click
    browser.link(:index => 1).click
    browser.link({:index => 1}).click

Do you see anything strange in the above code? Take a look. I will wait.

Maybe you have noticed that this is the first time we did not use a string (double quotes around the text, remember?) or a regular expression (slashes around the text). We have used just the number one. Such numbers are called integers. Watir uses integers only with `:index`.

Please notice that the first link is accessed with the number one (that is called one-based indexing). It is usual in programming that the first element is the number zero (zero-based indexing). Watir will use zero-based indexing in Watir 2.0.

## After

Sometimes the only way to identify the element is to say that it should be after another element. Take a look at this example:

    <a>Programming Ruby</a>
    <div id="one" />
    <a>Programming Ruby</a>

This will click the first link, but we want to click the second one:

    browser.link(:text, "Programming Ruby").click

One of the ways you could do it is:

    browser.link(:after?, browser.div(:id, "one")).click
    browser.link(:after? => browser.div(:id, "one")).click
    browser.link({:after? => browser.div(:id, "one")}).click

We said to Watir that we want to click a link after a div that has `id` attribute set to `one`. I rarely use it, but there are times when it is really handy.

Do you see something strange in the above code? This is the first time we have used a page element as the second parameter (instead of string or regular expression).

## HTML

If the link you want to access does not have any usual attributes that could uniquely identify it, Watir can handle that too. For example, you need to click the second link:

    <a onclick="new Ajax.Request('001')">add</a>
    <a onclick="new Ajax.Request('007')">add</a>

One of the really elegant ways to do it is by using `:html`:

    browser.link(:html, /007/).click
    browser.link(:html => /007/).click
    browser.link({:html => /007/}).click

In above example, we have used regular expression as a second parameter, but I am sure you have already got used to them. I am also sure you are already convinced that regular expressions are very useful.

## XPath

XPath was not in Watir from the beginning. It was added by Angrez Singh. He also created Watir's Firefox driver. Aidy Lewis recently moved Watir's XPath from REXML to Nokogiri, and now it is faster. XPath is really powerful. Most times you can just use `:html`, but if it does not solve the problem, try XPath.

If you have a link:

    <a href="test.htm">click me</a>

You could click it with:

    browser.link(:xpath, "//a[@href='test.htm']/").click
    browser.link(:xpath => "//a[@href='test.htm']/").click
    browser.link({:xpath => "//a[@href='test.htm']/"}).click

Another way, especially useful if the element you are trying to access in not directly supported by Watir:

    browser.element_by_xpath("//a[@href='test.htm']/").click

At the moment, you can use XPath to access elements located in a frame, but you can not use XPath to access the frame itself. In another words, this would work:

    browser.frame(:name, "one").link(:xpath, "//a[@href='test.htm']/").click

but this would not:

    browser.frame(:xpath, "//frame[@name='one']/")

## Nested Elements

### Simple Nesting

Sometimes the only way to uniquely identify a link is to specify one or more of it's parent elements. How would you click the second link in this example?

    <div id="one">
      <a>Programming Ruby</a>
    </div>
    <div id="two">
      <a>Programming Ruby</a>
    </div>

This will click the first link, but we want to click the second one:

    browser.link(:text, "Programming Ruby").click

This will work, but it is really fragile:

    browser.link(:index, 2).click

If in further development a link (or more) is added between the two links we have so far, the code above will click whatever link was the second, and that is not what we want.

Let's make it less fragile.

We know that the second link is a child element of a div with an id. This is the solution to the problem:

    browser.div(:id, "two").link(:text, "Programming Ruby").click

Isn't that just so elegant?! Read it. First there is a browser, inside it there is the div, and inside the div is our link.

The above solution is not the only one. This will work too:

    browser.div(:id, "two").link(:index, 1).click

This time we said to Watir that we want it to click the first link in a specific div.

There are endless options how to click an element on a page, and this book will try to teach you all of them.

### More nesting

If for some reason you want to be very specific about where the element is located in the page, Watir can handle that too. For example, if you had something like this:

    <div id="one">
      <div id="two">
        <a>Programming Ruby</a>
      </div>
    </div>

You could click the link with:

    browser.div(:id, "one").div(:id, "two").link(:text, "Programming Ruby").click

So, there is a browser, then a div, another div and the link we are looking for.

The nesting can go as deep as you like.

## Multiple Attributes

Multiple attributes was also fairly recently added to Watir. It is a killer feature, as you will see. For example, if you have two completely identical links on the same page, and you want to click the second one:

      <a>Programming Ruby</a>
      <a>Programming Ruby</a>

you could do it with one of these:

    browser.link(:text => "Programming Ruby", :index => 2).click
    browser.link({:text => "Programming Ruby", :index => 2}).click

The above code will click the second link with text `Programming Ruby`.

## Collections

You can even do stuff with all elements of a particular kind on a page. If you want to check href attributes of all links in the page, this will do it:

    browser.links.each do |link|
      puts link.href
    end

---

