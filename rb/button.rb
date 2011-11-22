simple_html_example = %{<button>click me</button>}

{ action: false,

  after: {
    element: %{},
    html:    %{}},

  alt: {
    html:   %{},
    regexp: %{},
    string: %{}},

  class: {
    html:   %{<button class="click-me">click me</button>},
    regexp: %{browser.button(:class => /click/).click},
    string: %{browser.button(:class => "click-me").click}},

  css: {
    html:   %{},
    string: %{}},

  for: false,

  href: false,

  html: {
    html:   %{},
    regexp: %{},
    string: %{}},

  id: {
    html:   %{<button id="click-me">click me</button>},
    regexp: %{browser.button(:id => /click/).click},
    string: %{browser.button(:id => "click-me").click}},

  index: {
    html:     simple_html_example,
    implicit: %{browser.button.click},
    integer:  %{browser.button(:index => 0).click}},

  method: false,

  name: {
    html:   %{<button name="click-me">click me</button>},
    regexp: %{browser.button(:name => /click/).click},
    string: %{browser.button(:name => "click-me").click}},

  src: {
    html:   %{},
    regexp: %{},
    string: %{}},

  text: {
    html:   simple_html_example,
    regexp: %{browser.button(:text => /click/).click},
    string: %{browser.button(:text => "click-me").click}},

  title: {
    html:   %{<button title="click-me">click me</button>},
    regexp: %{browser.button(:title => /click/).click},
    string: %{browser.button(:title => "click-me").click}},

  url: {
    html:   %{},
    regexp: %{},
    string: %{}},

  value: {
    html:   %{<button value="click-me">click me</button>},
    regexp: %{browser.button(:value => /click/).click},
    string: %{browser.button(:value => "click-me").click}},

  xpath:{
    element_by_xpath: %{},
    html:             %{},
    xpath:            %{}},

  multiple_attributes: {
    hash: %{},
    html: %{}},

  collection: {
    example: %{},
    html:    %{}}}
