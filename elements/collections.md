# Collections

You can even do stuff with all elements of a particular kind on a page. If you want to display `href` attributes of all links in the page, this will do it:

    browser.as.each do |link|
      puts link.href
    end

\newpage

