# get a list of all HTML elements supported by watir gem
# from http://wiki.openqa.org/display/WTR/HTML+Elements+Supported+by+Watir

require 'watir/ie'

def is_subclass_of_watir_element? klass
  while klass = klass.superclass
    return true if klass == Watir::Element
  end
end

elements = []

ObjectSpace.each_object(Class) {|klass| elements << klass.to_s.sub("Watir::", "") if is_subclass_of_watir_element?(klass)}

puts elements.sort