require_relative "element"

def element
  {
  action: false,

  after: {
    element: %{browser.a(:after? => #{string("a", :id)})},
    html:    %{#{html}<br>#{html_id}<br>#{html}}},

  alt: false,

  class: {
    html:   html_class,
    regexp: regexp("a", :class),
    string: string("a", :class)},

  css: {
    html:   html_id,
    string: %{browser.a(:css => "[id=click-me]")}},

  element_by_xpath:{
    html:   html_id,
    string: %{browser.element_by_xpath("//a[@id='click-me']")}},

  for: false,

  href: {
    html:   html,
    regexp: regexp("a", :href),
    string: %{browser.a(:href => "clicked.htm")}},

  html: {
    html:   %{<a href="clicked.htm" onclick="new Ajax.Request('007')">click me</a><br><a href="clicked.htm" onclick="new Ajax.Request('42')">click me</a>},
    regexp: %{browser.a(:html => /007/)},
    string: %{TODO}},

  id: {
    html:   html_id,
    regexp: regexp("a", :id),
    string: string("a", :id)},

  index: {
    html:     html,
    none: %{browser.a},
    integer:  %{browser.a(:index => 0)}},

  method: false,

  name: {
    html:   html_name,
    regexp: regexp("a", :name),
    string: string("a", :name)},

  src: false,

  text: {
    html:   html,
    regexp: regexp("a", :text),
    string: string("a", :text)},

  title: {
    html:   html_title,
    regexp: regexp("a", :title),
    string: string("a", :title)},

  url: {
    html:   html,
    regexp: regexp("a", :url),
    string: %{browser.a(:url => "clicked.htm")}},

  value: false,

  xpath:{
    html:   html_id,
    string: %{browser.a(:xpath => "//a[@id='click-me']")}},

  multiple_attributes: {
    hash: %{browser.a(:text => "click-me", :index => 1)},
    html: html_double},

  collection: {
    none: %{browser.as.each {|a| puts a.text}},
    html:    html_double}
  }
end
def html(attribute = nil)
  html = %{<a href="clicked.htm"#{attribute}>click-me</a>}
end

if __FILE__ == $0
  create_html("a", body)
end
