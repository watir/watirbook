require "selenium-webdriver"
browser = Selenium::WebDriver.for :phantomjs
browser.get "http://google.com"
p browser.current_url
p browser.title
browser.find_element(name: "q").send_keys "watir"
browser.find_element(name: "q").clear
p browser.find_element(name: "q").attribute(:name)
p browser.find_element(name: "q").attribute(:class)
p browser.find_element(name: "q").attribute(:type)
p browser.find_element(name: "q").attribute(:autocomplete)
browser.save_screenshot "phantomjs.png"
p browser.page_source
p browser.find_element(name: "q").attribute(:outerHTML)
browser.quit
