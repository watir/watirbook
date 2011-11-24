require "./rb/create_element_table"

def element
  {
  action: false,

  after: {
    element: %{browser.button(:after? => #{string("button", :id)}).flash},
    html:    %{#{html}<br>#{html_id}<br>#{html}}},

  alt: {
    html:   %{<input type="image" alt="click-me">},
    regexp: regexp("button", :alt),
    string: string("button", :alt)},

  class: {
    html:   html_class,
    regexp: regexp("button", :class),
    string: string("button", :class)},

  css: {
    html:   html_id,
    string: %{browser.button(:css => "[id=click-me]").click}},

  element_by_xpath:{
    html:   html_id,
    string: %{browser.element_by_xpath("//button[@id='click-me']").click}},

  for: false,

  href: false,

  html: {
    html:   %{<button onclick="new Ajax.Request('007')">click me</a><br><button onclick="new Ajax.Request('42')">click me</a>},
    regexp: %{browser.button(:html => /007/).click},
    string: %{TODO}},

  id: {
    html:   html_id,
    regexp: regexp("button", :id),
    string: string("button", :id)},

  index: {
    html:     html,
    none: %{browser.button.click},
    integer:  %{browser.button(:index => 0).click}},

  method: false,

  name: {
    html:   html_name,
    regexp: regexp("button", :name),
    string: string("button", :name)},

  src: {
    html:   %{<input type="image" src="click-me.png">},
    regexp: regexp("button", :src),
    string: %{browser.button(:src => "click-me.png").click}},

  text: {
    html:   html,
    regexp: regexp("button", :text),
    string: string("button", :text)},

  title: {
    html:   html_title,
    regexp: regexp("button", :title),
    string: string("button", :title)},

  url: false,

  value:  {
    html:   html_class,
    regexp: regexp("button", :value),
    string: string("button", :value)},

  xpath:{
    html:   html_id,
    string: %{browser.button(:xpath => "//a[@id='click-me']").click}},

  multiple_attributes: {
    hash: %{browser.button(:text => "click-me", :index => 1).click},
    html: html_double},

  collection: {
    none: %{browser.buttons.each {|button| puts button.text}},
    html:    html_double}
  }
end
def html(attribute = nil)
  %{<button#{attribute}>click-me</button>}
end

if __FILE__ == $0
  create_html("button", body)
end
