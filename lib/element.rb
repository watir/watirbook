require "selenium-webdriver"
browser = Selenium::WebDriver.for :firefox
browser.get "http://google.com"
browser.find_element(name: "q")
browser.find_element(name: "q").send_keys "watir"
browser.find_element(name: "q").clear
browser["gbqfq"]
p browser["gbqfq"].attribute(:name)
p browser["gbqfq"].attribute(:class)
p browser["gbqfq"].attribute(:type)
p browser["gbqfq"].attribute(:autocomplete)
p browser["gbqfq"].attribute(:style)
p browser["gbqfq"].attribute(:outerHTML)
