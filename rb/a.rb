require "./rb/create_element_table"

def element
  {
  action: false,

  after: {
    element: %{browser.a(:after? => #{string(:id)}).flash},
    html:    %{#{html}<br>#{html_id}<br>#{html}}},

  alt: false,

  class: {
    html:   html_class,
    regexp: regexp(:class),
    string: string(:class)},

  css: {
    html:   html_id,
    string: %{browser.a(:css => "[id=click-me]").click}},

  element_by_xpath:{
    html:   html_id,
    string: %{browser.element_by_xpath("//a[@id='click-me']").click}},

  for: false,

  href: {
    html:   html,
    regexp: regexp(:href),
    string: %{browser.a(:href => "clicked.htm").click}},

  html: {
    html:   %{<a href="clicked.htm" onclick="new Ajax.Request('007')">click me</a><br><a href="clicked.htm" onclick="new Ajax.Request('42')">click me</a>},
    regexp: %{browser.a(:html => /007/).click},
    string: %{TODO}},

  id: {
    html:   html_id,
    regexp: regexp(:id),
    string: string(:id)},

  index: {
    html:     html,
    none: %{browser.a.click},
    integer:  %{browser.a(:index => 0).click}},

  method: false,

  name: {
    html:   html_name,
    regexp: regexp(:name),
    string: string(:name)},

  src: false,

  text: {
    html:   html,
    regexp: regexp(:text),
    string: string(:text)},

  title: {
    html:   html_title,
    regexp: regexp(:title),
    string: string(:title)},

  url: {
    html:   html,
    regexp: regexp(:url),
    string: %{browser.a(:url => "clicked.htm").click}},

  value: false,

  xpath:{
    html:   html_id,
    string: %{browser.a(:xpath => "//a[@id='click-me']").click}},

  multiple_attributes: {
    hash: %{browser.a(:text => "click me", :index => 1).click},
    html: html_double},

  collection: {
    none: %{browser.as.each {|a| puts a.text}},
    html:    html_double}
  }
end
def html(attribute = nil)
  html = %{<a href="clicked.htm"#{attribute}>click me</a>}
end

if __FILE__ == $0
  create_html(body)
end
