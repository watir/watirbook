# get a list of all HTML elements supported by watir gem
# from http://wiki.openqa.org/display/WTR/HTML+Elements+Supported+by+Watir

require 'watir/ie'

def subclass_of?(klass, parent)
  while klass = klass.superclass
    return true if klass == parent
  end
end
def subclasses_of(parent)
  elements = []
  ObjectSpace.each_object(Class) {|klass| elements << klass.to_s.sub("Watir::", "") if subclass_of?(klass, parent)}
  elements.sort
end

puts subclasses_of(Watir::Element)
puts subclasses_of(Watir::ElementCollections)