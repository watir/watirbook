require "watir-webdriver"
browser = Watir::Browser.new :ff
browser.goto "http://www.google.com/"
browser.url
browser.link(:text => "Google.com in English").click
browser.link(:text => "Images").click
browser.title
browser.text_field(:name => "q").set "book"
browser.button(:value => "Search Images").click
browser.images.size
browser.close
