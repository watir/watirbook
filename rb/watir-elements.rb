# get a list of all HTML elements and collections supported by watir gem

require "watir/ie"
require "./subclasses_of"

puts subclasses_of(Watir::Element)
puts
puts subclasses_of(Watir::ElementCollections)