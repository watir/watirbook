# get a list of all HTML elements supported by watir gem
# from http://wiki.openqa.org/display/WTR/HTML+Elements+Supported+by+Watir

require 'watir/ie'

def is_element_subclass? klass
  while klass = klass.superclass
    return true if klass == Watir::Element
  end
end

ObjectSpace.each_object(Class){|c| puts c if is_element_subclass?(c)}