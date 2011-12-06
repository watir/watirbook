# Button

*You do not need internet access if you want to follow examples in this chapter. All examples in this chapter are tried on Mac OS 10.7.2, Firefox 8.0.1 Ruby 1.9.3p0, RubyGems 1.8.12 and watir-webdriver 0.3.9.*

## HTML tag

Did you read *Link* chapter? If you did not, please read it first. I explained a lot of basics there. If you did read it, good job. Continue with the good work.

Button's HTML can look like any of the following:

    <button>
    <input type="button">
    <input type="image">
    <input type="reset">
    <input type="submit">

The most trouble people have with `<input type="image">`. It looks like an image, but Watir sees it as a button.

You can access the button with `browser.button(how, what)`. The *how* part can be (alphabetically): `after?`, `alt`\*, `class`, `css`, `html`, `id`, `index`, `name`, `src`\*, `text`, `title`, `xpath` and multiple attributes.

\* *only for `<input type="image">`*

To make sure you could do the exercises from this chapter even without internet access, create a simple HTML file with only one button in it. Open your favorite text editor, enter the following line in it and save it as `button.htm`:

    <button id="click-me"
    onclick="document.getElementById('click-me').innerHTML='clicked';">
    click me</button>

The `onclick` part makes sure the button changes it's text from *click me* to *clicked* when clicked, so you can see if the code you are trying out actually works.

Open IRB, require watir-webdriver, open the browser and open `button.htm`. If you do not know how to do that, please read *Link* chapter. I have explained it there. Since I have also gone into great detail there how to access links, I will assume that you are familiar with all that stuff, and here I will just talk about things that are different for buttons. Take a look at *Button* table in *Reference* chapter for more examples.

\newpage

