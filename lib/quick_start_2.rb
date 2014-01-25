require "selenium-webdriver"
browser = Selenium::WebDriver.for :firefox
browser.navigate.to "https://www.google.com/"
puts browser.current_url
browser.find_element(link_text: "Google.com").click
browser.find_element(link_text: "Images").click
puts browser.title
browser.find_element(name: "q").send_keys "book"
browser.find_element(name: "btnG").click
puts browser.find_elements(tag_name: "img").size
browser.close
