simple_html_example = %{<a href="clicked.htm">click me</a>}

{ action: false,

  after: {
    element: %{browser.a(:after? => browser.a(:id => "click-me")).flash},
    html:    %{#{simple_html_example}\n<a href="clicked.htm" id="click-me">click me</a>
    #{simple_html_example}}},

  alt: false,

  class: {
    html:   %{<a href="clicked.htm" class="click-me">click me</a>},
    regexp: %{browser.a(:class => /click/).click},
    string: %{browser.a(:class => "click me").click}},

  css: {
    html:   %{<a href="clicked.htm" id="click-me">click me</a>},
    string: %{browser.a(:css => "[id=click-me]").click}},

  for: false,

  href: {
    html:   simple_html_example,
    regexp: %{browser.a(:href => /clicked/).click},
    string: %{browser.a(:href => "clicked.htm").click}},

  html: {
    html:   %{<a href="clicked.htm" onclick="new Ajax.Request('007')">click me</a>\n<a href="clicked.htm" onclick="new Ajax.Request('42')">click me</a>},
    regexp: %{browser.a(:html => /007/).click},
    string: %{TODO}},

  id: {
    html:   %{<a href="clicked.htm" id="click-me">click me</a>},
    regexp: %{browser.a(:id => /click/).click},
    string: %{browser.a(:id => "click-me").click}},

  index: {
    html:     simple_html_example,
    implicit: %{browser.a.click},
    integer:  %{browser.a(:index => 0).click}},

  method: false,

  name: {
    html:   %{<a href="clicked.htm" name="click-me">click me</a>},
    regexp: %{browser.a(:name => /click/).click},
    string: %{browser.a(:name => "click-me").click}},

  src: false,

  text: {
    html:   simple_html_example,
    regexp: %{browser.a(:text => /click/).click},
    string: %{browser.a(:text => "click me")}},

  title: {
    html:   %{<a href="clicked.htm" title="click me">click me</a>},
    regexp: %{browser.a(:title => /click/)},
    string: %{browser.a(:title => "click me")}},

  url: {
    html:   simple_html_example,
    regexp: %{browser.a(:url => /clicked/).click},
    string: %{browser.a(:url => "clicked.htm").click}},

  value: false,

  xpath:{
    element_by_xpath: %{browser.element_by_xpath("//a[@id='click-me']").click},
    html:             %{<a href="clicked.htm" id="click-me">click me</a>},
    xpath:            %{browser.a(:xpath => "//a[@id='click-me']").click}},

  multiple_attributes: {
    hash: %{browser.a(:text => "click me", :index => 1).click},
    html: %{#{simple_html_example}\n#{simple_html_example}}},

  collection: {
    example: %{browser.as.each {|a| puts a.text}},
    html:    %{#{simple_html_example}\n#{simple_html_example}}}}
