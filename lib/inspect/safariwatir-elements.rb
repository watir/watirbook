# get a list of all HTML elements supported by safariwatir gem

require "safariwatir"
require "./subclasses_of"

puts subclasses_of(Watir::Container::HtmlElement, "Watir::Container")
