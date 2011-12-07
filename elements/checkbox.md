# Checkbox

*You do not need internet access if you want to follow examples in this chapter. All examples in this chapter are tried on Mac OS 10.7.2, Firefox 8.0.1 Ruby 1.9.3p0, RubyGems 1.8.12 and watir-webdriver 0.3.9.*

Did you read *Link* chapter? If you did not, please read it first. I explained a lot of basics there. If you did read it, good job. Continue with the good work.

Checkbox's HTML can look like this:

    <input type="checkbox">

You can access the it with:

     browser.checkbox(how, what)

The *how* part can be (alphabetically): `after?`, `class`, `css`, `html`, `id`, `index`, `name`, `title`, `xpath` and multiple attributes.

Since I have gone into great detail there how to access links in the *Link* chapter, I will assume that you are familiar with all that stuff, and here I will just talk about things that are different for checkboxes. Take a look at *Checkbox* table in *Reference* chapter for more examples.

Create a simple HTML file with only one checkbox in it. Open your favorite text editor, enter the following line in it and save it as `checkbox.htm`:

    <input type="checkbox" id="click-me">

You can `click`, `set` or `clear` a checkbox.

## Click

Clicking the checkbox will change it's state. If it was checked, it will become unchecked and vice versa.

    browser.checkbox(:id => "click-me").click

## Set

If you want to make sure checkbox is checked, you can use `set`:

    browser.checkbox(:id => "click-me").set

## Clear

If you want to make sure checkbox is unchecked, you can use `clear`:

    browser.checkbox(:id => "click-me").clear

\newpage

