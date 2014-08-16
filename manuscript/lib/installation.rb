require "selenium-webdriver"
browser = Selenium::WebDriver.for :firefox
browser.get "http://watir.com"
