require "headless"
require "selenium-webdriver"

headless = Headless.new
headless.start

browser = Selenium::WebDriver.for :firefox
browser.get "http://google.com"
p browser.title

headless.destroy
