# Collections

You can even do stuff with all elements of a particular kind on a page.

If you have a page that looks like this:

    <a href="http://google.com">google.com</a>
    <a href="http://facebook.com">facebook.com</a>

If you want to display `href` attributes of all links in the page, this will do it:

    browser.as.each do |a|
      puts a.href
    end

When you execute the code, output should be:

    http://google.com/
    http://facebook.com/


`as` is not the only collection of HTML elements that Watir supports. For the rest of the collections, take a look at the table on this page.

| Watir Method | HTML element |
|--------------|--------------|
| areas | `<area>` |
| buttons | `<button> <input type="button"> <input type="image"> <input type="reset"> <input type="submit">` |
| checkboxes | `<input type="checkbox">` |
| dds | `<dd>`  |
| divs | `<div>` |
| dls | `<dl>` |
| dts | `<dt>` |
| ems | `<em>` |
| file_fields | `<input type="file">` |
| forms | `<form>` |
| frames | `<frame> <iframe>` |
| h1s, h2s, h3s, h4s, h5s, h6s | `<h1><h2><h3><h4><h5><h6>` |
| hiddens | `<input type="hidden">` |
| imgs | `<img>` |
| labels | `<label>` |
| lis | `<li>` |
| as | `<a>` |
| maps | `<map>` |
| ps | `<p>` |
| pres | `<pre>` |
| radios | `<input type="radio">` |
| select_lists | `<select>` |
| spans | `<span>` |
| strongs | `<strong>` |
| tables | `<table>` |
| tbodys | `<tbody>` |
| tds | `<td>` |
| trs | `<tr>` |
| text_fields | `<input> <input type="password"> <input type="text"> <textarea>` |
| uls | `<ul>` |
