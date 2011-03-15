# Watir in Five Minutes

`An example would be handy right about now` Brian Marick would say. Five minutes from now, you will be crazy about Watir. If not, maybe it is not the right tool for you. Even then, if you continue reading the book, I hope you will grow to like it the more you know about it.

In the rest of the book, I will explain all Watir functionality in great (maybe even painful) detail, but for now, I just want to show off a few cool features to get you excited about it.

I still remember how pleasantly surprised I was the first time I saw Watir at work. I installed it, and in a few hours I was able to create a script that would log me into the web application I was testing. Since you have this book you will be able to log into your web site in minutes, not hours.

If you are familiar with Ruby, I am sure you already think IRB is one of the greatest tools for learning a new Ruby library.

If you are new to Ruby, you are probably thinking: `What is this IRB thing?`

IRB (in this case) does not stand for `International Rugby Board` or `Immigration or Refugee Board` (of Canada). It stands for `Interactive Ruby Shell`. Think of it as a shell that knows Ruby (as the name says).

To start IRB, just type `irb` in command line. You will see something like this (on Mac):

    $ irb
    >> 

Now you can enter any Ruby command and you will immediately get a result. We will start with telling Ruby that we want to use a library called Watir.

If you are on Windows, and would like to drive Internet Explorer, type this:

    require "watir"

If you are on a Mac, and would like to drive Safari, type this:

    require "safariwatir"

On any platform, if you would like to drive Firefox:

    require "firewatir"

You should see something like this:

    > require "safariwatir"
    => true

Every Ruby command returns something. `=> true` is what is returned after `require "safariwatir"`. There are two parts in the returned line. `=>` looks like an arrow, it tells you `Ruby returned this`. `true` is what is actually returned. When `true` is returned, it usually means that everything is fine.

Unless I say differently, just ignore what is returned.

And now the magic starts. With just one command you will open a browser.

Internet Explorer:

    browser = Watir::IE.new

Firefox:

    browser = FireWatir::Firefox.new

Safari:

    browser = Watir::Safari.new

When I saw the browser magically appearing for the first time, only one thought crossed my mind: `Cool!`

Please open just one browser. It will be enough. You can play with other browsers later. All code that follows should work no matter which browser you have opened. Some features are not implemented for all browsers, and I will explicitly say it when we get to such a feature.

Output should be similar to this:

    >> browser = Watir::Safari.new
    => #<Watir::Safari:0x605054 @scripter=#<Watir::AppleScripter:0x604cd0 @typing_lag=0.08, @document=app("/Applications/Safari.app").documents[1], @appname="Safari", @js=#<Watir::JavaScripter:0x604d48>, @app=app("/Applications/Safari.app")>>

As I said earlier, you can ignore `#<Watir::Safari:0x605054...>`. Opening Safari returned the browser as an object, and this is textual representation of the object. I hope it will be changed to something less verbose in the near future.

Just opening a browser is cool, but not so useful. Watir can do much more. For example, it can navigate the browser to any site. I will use http://www.pragprog.com in this example. I suggest that you literally follow the example, and then try a few sites yourself.

So, go to http://www.pragprog.com:

    >> browser.goto "http://www.pragprog.com"
    => nil

And http://www.pragprog.com opens. Magic, isn't it?

Controlling the browser is really useful but, as I am sure you already know, there is more to testing than just performing the actions. You have to check what happened after the action. What happens when I enter a URL in browser address bar, when I click a link or a button, when I enter some text in a text field or select something from select box...?

This is the first time we will perform a check. It is also the first time we will take a look what Ruby returns after the command. Let's check if the browser really opened http://www.pragprog.com.

    >> browser.url
    => "http://www.pragprog.com/"

It really works! Ruby returned a string (the thing in double quotes, remember?) that contains the text from the browser address bar.

Time to click on a link. It is easy to explicitly say which link to click on. Right now I want to click on a link with the text `Books` (it gets just a bit more complicated if there are two links with the same text on the page, but we will deal with that later).

Before we really click on the link, I want to show off one of Watir's killer features. It is called `flash`. Real world web applications are complex, and sometimes when you are developing a new test or debugging an existing one, you want to make sure you are interacting with the correct element. Try this:

    >> browser.link(:text, "Books").flash
    => nil

Link should flash. Itss background color changes to yellow a few times (this feature is available only for Internet Explorer at the moment. Other drivers should get it soon). Isn't that cool? I use it all the time when I present Watir at conferences. I think Watir is just great for presentations. It is very visual.

It is time to really click the link:

    >> browser.link(:text, "Books").click
    => nil

This time, let's check the page title.

    >> browser.title
    => "The Pragmatic Bookshelf | Our Titles"

We got back the string with the page title.

I want books to be sorted by category, so I have to click `By Category`. It is hard to say how it is implemented by just looking at it. It is the time to fire up your favorite page inspector tool. If you are using Safari on Mac, you already have one installed.

Right click `By Category` and select `Inspect Element` from context menu. This line will be highlighted in Inspector:

    <span>By Category</span>

That means we need to click a span with text `By Category`.

    >> browser.span(:text, "By Category").click
    => nil

Just for a second, take a closer look at two commands that we used to click the link and the span:

    browser.link(:text, "Books"      ).click
    browser.span(:text, "By Category").click

They are almost identical. The string (in double quotes) that we used to identify the link and the span are, of course, different. In the first example there is `link`, in the second one, there is `span`. The rest is the same. That is on purpose. You will appreciate that later.

Let's try to find all Ruby related books. There is a search box. Right click on it and select `Inspect Element` from the context menu. This line will be highlighted in the Inspector:

    <input class="textbox narrow" id="q" name="q" type="text">

So it is a textbox and its id attribute is `q`. If an element has an id attribute, you should use it.

    >> browser.text_field(:id, "q").set "ruby"
    => :missing_value

You can even see how Watir is typing each letter. Watir is just great in impressing people.

To perform the search, we have to click on `Go`. Right click on it and select `Inspect Element`. I guess you already know what to do next. You will see:

    <button class="go" type="submit">

No id this time, but there is a class attribute. Watir is just great with real world web applications. If developers can create an element, Watir will have a way to access it.

    >> browser.button(:class, "go").click
    => nil

This time, let's check a lot of stuff. Is there the text `151 results matching 'ruby'` on the page?

    >> browser.text.include?("151 results matching 'ruby'")
    => true

We asked Ruby if the page text included a string, and it said `true`. It is its cute way of saying `yes`.

Is the text we have entered in the search box at the previous page still there (this feature is not implemented for Safari yet. It works in Internet Explorer and Firefox. It should be implemented for Safari soon)?

    >> browser.text_field(:id, "q").value
    => "ruby"

Ruby returned the text from the text field. It is the same text we entered, so everything is fine.

Let's check if there is a link to `Programming Ruby: The Pragmatic Programmers' Guide, Second Edition`:

    >> browser.link(:text, "Programming Ruby: The Pragmatic Programmers' Guide, Second Edition").exists?
    => true

Well, that was a lot of fun. But you do not want to type into IRB all the time. You want to run the tests and do something else while it runs. As for almost everything else in Ruby and Watir, there is a simple solution. Paste all code you have entered in IRB in a file, and save it with `rb` extension. IRB is used only for development or debugging, so do not paste `irb` as the first line of the file. If you are using Internet Explorer driver you should have this in the file:

    require "watir"
    browser = Watir::IE.new
    browser.goto "http://www.pragprog.com"
    browser.url
    browser.link(:text, "Books").flash
    browser.link(:text, "Books").click
    browser.title
    browser.span(:text, "By Category").click
    browser.text_field(:id, "q").set "ruby"
    browser.button(:class, "go").click
    browser.text.include?("151 results matching 'ruby'")
    browser.text_field(:id, "q").value
    browser.link(:text, "Programming Ruby: The Pragmatic Programmers' Guide, Second Edition").exists?

Save it as `pragprog.rb`. To run it navigate in command prompt to the folder where you have saved it and type `ruby pragprog.rb`.

Go run it. Smile while the browser clicks around.

What is the output in the command prompt? Nothing? Yes, nothing. IRB displays values that Ruby returns, but when you execute it from the command line, nothing is displayed. You have to explicitly say to Ruby that you want them displayed. It is as easy as adding `puts` in front of the command. Modify the script to look like this (you can add puts in front of every command, but you really should not care about what some commands return):

    require "watir"
    browser = Watir::IE.new
    browser.goto "http://www.pragprog.com"
    puts browser.url
    browser.link(:text, "Books").flash
    browser.link(:text, "Books").click
    puts browser.title
    browser.span(:text, "By Category").click
    browser.text_field(:id, "q").set "ruby"
    browser.button(:class, "go").click
    puts browser.text.include?("151 results matching 'ruby'")
    puts browser.text_field(:id, "q").value
    puts browser.link(:text, "Programming Ruby: The Pragmatic Programmers' Guide, Second Edition").exists?

Run the script. This time the output should look like this:

    $ruby pragprog.rb
    http://www.pragprog.com/
    The Pragmatic Bookshelf | Our Titles
    true
    ruby
    true

Later I will show you how to make cool looking reports.

If you want to make the script a bit faster, delete this line:

    browser.link(:text, "Books").flash

It really does not do anything, we just used it for identifying the element while developing the script.

If you are not impressed by now, you probably never will. But wait, it is time to bring on heavy artillery. Let's go deeper.

\newpage

