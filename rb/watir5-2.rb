require "watir-webdriver"
browser = Watir::Browser.new :ff
browser.goto "http://www.google.com/"
puts browser.url
browser.link(:text => "Google.com in English").click
browser.link(:text => "Images").click
puts browser.title
browser.text_field(:name => "q").set "book"
browser.button(:value => "Search Images").click
puts browser.images.size
browser.close
