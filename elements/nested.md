# Nested Elements





## Simple Nesting

Sometimes the only way to uniquely identify a link is to specify one or more of its parent elements. How would you click the second link in this example?

    <div id="one">
      <a href="clicked.htm">click me</a>
    </div>
    <div id="two">
      <a href="clicked.htm">click me</a>
    </div>

This will click on the first link, but we want to click on the second one:

    browser.a(:text => "click me").click

This will work, but it is really fragile:

    browser.a(:index => 1).click

If in further development a link (or more) is added between the two links we have so far, the code above will click on whatever link was the second, and that is not what we want.

Let's make it less fragile.

We know that the second link is a child element of a `div` with an `id` attribute. This is the solution to the problem:

    browser.div(:id => "two").link(:text => "click me").click

Isn't that just so elegant?! Read it. First there is a browser, inside it there is the div, and inside the div is our link.

The above solution is not the only one. This will work too:

    browser.div(:id => "two").link(:index => 0).click

This time we told Watir that we want it to click the first link in a specific div.

There are endless options how to click on an element on a page, and this book will try to teach you all of them.





## More nesting

If for some reason you want to be very specific about where the element is located in the page, Watir can handle that too. For example, if you had something like this:

    <div id="one">
      <div id="two">
        <a href="clicked.htm">click me</a>
      </div>
    </div>

You could click the link with:

    browser.div(:id => "one").div(:id => "two").link(:text => "click me").click

So, there is a browser, then a div, another div and the link we are looking for.

The nesting can go as deep as you like.



