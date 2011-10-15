# get a list of all HTML elements and collections supported by watir-webdriver gem

require "watir-webdriver"
require "./subclasses_of"

puts subclasses_of(Watir::Element, "Watir")
puts
puts subclasses_of(Watir::ElementCollection, "Watir")