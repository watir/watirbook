# get a list of all HTML elements and collections supported by watir-webdriver gem

def elements_and_collections_pairs(elements, collections)
  elements_and_collections = []
  elements.each do |element|
    collections.each do |collection|
      elements_and_collections << [element, collection] if collection.match /^#{element}.{0,1}s$/
    end
  end
  extras = [[:b, :brs], [:u, :uls]]
  elements_and_collections << [:details, nil]
  elements_and_collections << [:ruby, :rubies]
  elements_and_collections << [:summary, :summaries]

  elements_and_collections << [:checkbox, :checkboxes]
  elements_and_collections << [:element, :elements]
  elements_and_collections << [:element_by_xpath, :elements_by_xpath]
  elements_and_collections << [:file_field, :file_fields]
  elements_and_collections << [:font, :fonts]
  elements_and_collections << [:frame, :frames]
  elements_and_collections << [:hidden, :hiddens]
  elements_and_collections << [:image, :images]
  elements_and_collections << [:link, :links]
  elements_and_collections << [:radio, :radios]
  elements_and_collections << [:select_list, :select_lists]
  elements_and_collections << [:text_field, :text_fields]
  (elements_and_collections - extras).sort
end
def output(name, collection)
  puts "\n#{name}: #{collection.size}"
  puts collection.inspect
end

require "watir-webdriver"

elements = Watir.tag_to_class.keys
output("elements", elements)

container_methods = Watir::Container.instance_methods.sort
output("container_methods", container_methods)

container_methods_without_elements = container_methods - elements
output("container_methods_without_elements", container_methods_without_elements)

elements_and_collections = elements_and_collections_pairs(elements, container_methods_without_elements)
output("elements_and_collections", elements_and_collections)

elements_with_collections = elements_and_collections.collect {|element_and_collection| element_and_collection[0]}
output("elements_with_collections", elements_with_collections)

elements_without_collections = elements - elements_with_collections
output("elements_without_collections", elements_without_collections)

container_methods_without_elements_and_collections = container_methods_without_elements - elements_and_collections.collect {|element_and_collection| element_and_collection[1]}
output("container_methods_without_elements_and_collections", container_methods_without_elements_and_collections)
