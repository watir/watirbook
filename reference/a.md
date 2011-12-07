# A

    <a class="click-me-class" href="clicked.htm" id="click-me-id"
    name="click-me-name" title="click-me-title">click-me-text</a>

----------------- ----------------------------------------------------------
after and element `browser.a(:after? => browser.a(:id => "click-me")).flash`
class and string  `browser.a(:class => "click-me").click`
class and regex   `browser.a(:class => /click/).click`
css and regex     `browser.a(:css => "[id=click-me]").click`
element_by_xpath  `browser.element_by_xpath("//a[@id='click-me']").click`
href and string   `browser.a(:href => "clicked.htm").click`
href and regex    `browser.a(:href => /clicked/).click`
html and regex    `browser.a(:html => /007/).click`
id and string     `browser.a(:id => "click-me").click`
id and regex      `browser.a(:id => /click/).click`
index implicit    `browser.a.click`
index explicit    `browser.a(:index => 0).click`
name and string   `browser.a(:name => "click-me").click`
name and regex    `browser.a(:name => /click/).click`
text and string   `browser.a(:text => "click me").click`
text and regex    `browser.a(:text => /click/).click`
title and string  `browser.a(:title => "click me").click`
title and regex   `browser.a(:title => /click/).click`
url and string    `browser.a(:url => "clicked.htm").click`
url and regex     `browser.a(:url => /clicked/).click`
xpath and string  `browser.a(:xpath => "//a[@id='click-me']").click`
----------------- ----------------------------------------------------------

------------------- ---------------------------------------------------
collection          `browser.as.each {|a| puts a.text}`
multiple attributes `browser.a(:text => "click me", :index => 1).click`
------------------- ---------------------------------------------------

\newpage

