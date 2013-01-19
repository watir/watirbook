require_relative "element"

def element
  {
  action: false,

  after: {
    element: %{browser.img(:after? => #{string("img", :id)}).flash},
    html:    %{#{html}<br>#{html_id}<br>#{html}}},

  alt: {
    html:   %{<img alt="click-me">},
    regexp: regexp("img", :alt),
    string: string("img", :alt)},

  class: {
    html:   html_class,
    regexp: regexp("img", :class),
    string: string("img", :class)},

  css: {
    html:   html_id,
    string: %{browser.img(:css => "[id=click-me]").click}},

  element_by_xpath:{
    html:   html_id,
    string: %{browser.element_by_xpath("//img[@id='click-me']").click}},

  for: false,

  href: false,

  html: {
    html:   %{<img onclick="new Ajax.Request('007')"><br><img onclick="new Ajax.Request('42')">},
    regexp: %{browser.img(:html => /007/).click},
    string: %{TODO}},

  id: {
    html:   html_id,
    regexp: regexp("img", :id),
    string: string("img", :id)},

  index: {
    html:     html,
    none: %{browser.img.click},
    integer:  %{browser.img(:index => 0).click}},

  method: false,

  name: {
    html:   html_name,
    regexp: regexp("img", :name),
    string: string("img", :name)},

  src: {
    html:   %{<img src="click-me.png">},
    regexp: regexp("img", :src),
    string: %{browser.img(:src => "click-me.png").click}},

  text: false,

  title: {
    html:   html_title,
    regexp: regexp("img", :title),
    string: string("img", :title)},

  url: false,

  value:  false,

  xpath:{
    html:   html_id,
    string: %{browser.img(:xpath => "//a[@id='click-me']").click}},

  multiple_attributes: {
    hash: %{browser.img(:src => "click-me", :index => 1).click},
    html: html_double},

  collection: {
    none: %{browser.imgs.each {|img| puts img.text}},
    html:    html_double}
  }
end
def html(attribute = nil)
  %{<img src="click-me.png"#{attribute}>}
end

if __FILE__ == $0
  create_html("img", body)
end
