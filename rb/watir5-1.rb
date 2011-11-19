require "watir-webdriver"
browser = Watir::Browser.new :ff
browser.goto "http://www.google.com/"
browser.url
browser.a(:text => "Google.com in English").click
browser.a(:text => "Images").click
browser.title
browser.text_field(:name => "q").set "book"
browser.button(:value => "Search Images").click
browser.images.size
browser.close
