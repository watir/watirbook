# Button

Did you read *Link* chapter? If you did not, please read it first. I explained a lot of basics there. If you did read it, good job. Continue with the good work.

Button's HTML can look like any of the following:

    <button>
    <input type="button">
    <input type="image">
    <input type="reset">
    <input type="submit">

The most trouble people have with `<input type="image">`. It looks like an image, but Watir sees it as a button.

You can access the button with:

     browser.button(how, what)

The *how* part can be (alphabetically): `after?`, `alt`\*, `class`, `css`, `html`, `id`, `index`, `name`, `src`\*, `text`, `title`, `xpath` and multiple attributes.

\* *only for `<input type="image">`*

Since I have gone into great detail there how to access links in the *Link* chapter and how to access images in *Img* chapter, I will assume that you are familiar with all that stuff, and here I will just talk about things that are different for buttons. Take a look at *Button* table in *Reference* chapter for more examples.



