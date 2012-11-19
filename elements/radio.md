# Radio

*You do not need internet access if you want to follow examples in this chapter. All examples in this chapter are tried on Mac OS 10.7.2, Firefox 8.0.1 Ruby 1.9.3p0, RubyGems 1.8.12 and watir-webdriver 0.3.9.*

Did you read *Link* chapter? If you did not, please read it first. I explained a lot of basics there. If you did read it, good job. Continue with the good work.

Radio button's HTML can look like this:

    <input type="radio">

You can access the it with:

     browser.radio(how, what)

The *how* part can be (alphabetically): `after?`, `class`, `css`, `html`, `id`, `index`, `name`, `title`, `xpath` and multiple attributes.

Since I have gone into great detail there how to access links in the *Link* chapter, I will assume that you are familiar with all that stuff, and here I will just talk about things that are different for radio buttons. Take a look at *Radio* table in *Reference* chapter for more examples.

Create a simple HTML file with only one radio button in it. Open your favorite text editor, enter the following line in it and save it as `radio.htm`:

    <input type="radio" id="click-me">

You can `click`, `set` or `clear` a radio button.

## Click

Clicking the radio button will select it.

    browser.radio(:id => "click-me").click

## Set

Setting the radio button does the exactly same thing as `click`, selects the radio button:

    browser.radio(:id => "click-me").set

## Clear

If you want to deselect radio button, use `clear`:

    browser.radio(:id => "click-me").clear

I am getting this error message:

    NoMethodError: undefined method `clear' for
      #<Watir::Radio:0x00000100f8bb18>

Looks like watir-webdriver gem does not support `clear` with radio buttons. I am pretty sure watir gem supports it.

\newpage

