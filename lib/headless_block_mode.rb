require "headless"
require "selenium-webdriver"

Headless.ly do
  browser = Selenium::WebDriver.for :firefox
  browser.get "http://google.com"
  p browser.title
end
