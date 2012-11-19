# Img

*You do not need internet access if you want to follow examples in this chapter. All examples in this chapter are tried on Mac OS 10.7.2, Firefox 8.0.1 Ruby 1.9.3p0, RubyGems 1.8.12 and watir-webdriver 0.3.9.*

Did you read *Link* chapter? If you did not, please read it first. I explained a lot of basics there. If you did read it, good job. Continue with the good work.

`<img>` tag represents image on the HTML page. It's HTML can look like this:

    <img src="click-me.png">

You can access the image with one of the following:

    browser.img(how, what)
    browser.image(how, what)

The *how* part can be (alphabetically): `after?`, `alt`, `class`, `css`, `html`, `id`, `index`, `name`, `src`, `title`, `xpath` and multiple attributes.

To make sure you could do the exercises from this chapter even without internet access, create a simple HTML file with only one image in it. Open your favorite text editor, enter the following line in it and save it as `img.htm`:

    <img id="click-me" src="red.png"
    onclick="document.getElementById('click-me').src='green.png';">

The `onclick` part makes sure the image changes when clicked, so you can see if the code you are trying out actually works.

Open IRB, require watir-webdriver, open the browser and open `img.htm`. If you do not know how to do that, please read *Link* chapter. I have explained it there. Since I have also gone into great detail there how to access links, I will assume that you are familiar with all that stuff, and here I will just talk about things that are different for images. Take a look at *Img* table in *Reference* chapter for more examples.



## Src

All images have `src` attribute, and you can use it to access the image.

If you know the entire value of `src` attribute, use string to click it:

    browser.img(:src => "red.png").click

If you know the portion of value of `src` attribute, use regular expression to click it:

    browser.img(:src => /red/).click



## Alt

It is very common for an image element to have `alt` attribute. Change `img.htm` to this, save the file and reload the page in the browser:

    <img id="click-me" src="red.png" alt="red image"
    onclick="document.getElementById('click-me').src='red.png';">

If you know the entire value of `alt` attribute, use string to click it:

    browser.img(:alt => "red image").click

If you know the portion of value of `alt` attribute, use regular expression to click it:

    browser.img(:alt => /red/).click



