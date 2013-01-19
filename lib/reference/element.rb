def html_class
  html(%{ class="click-me"})
end
def html_double
  %{#{html}<br>#{html}}
end
def html_id
  html(%{ id="click-me"})
end
def html_name
  html(%{ name="click-me"})
end
def html_title
  html(%{ title="click-me"})
end
def regexp(element,how)
  %{browser.#{element}(:#{how} => /click/)}
end
def string(element,how)
  %{browser.#{element}(:#{how} => "click-me")}
end

def create_html(element, body)
  header = %{<!DOCTYPE html><html><head><meta charset="utf-8"><title>#{element} element</title><style type="text/css">table, td {border-style:solid; border-width:1px; border-radius: 10px;}</style></head><body><h1>#{element} element</h1><table><tbody><tr><th>how</th><th>html</th><th>examples</th>}
  footer = "</tbody></table></body></html>"
  table = header + body + footer
  File.open("reference/#{element}.htm", "w") {|file| file.write(table)}
end
def body
  table = ""
  element.each do |how, data|
    if data

      examples = ""
      html = ""
      data.each do |key, value|
        if key == :html
          require "cgi"
          html = CGI::escapeHTML(value).gsub("&lt;br&gt;", "<br>")
        else
          examples << "#{value} <i># #{key}</i><br>"
        end
      end

      table << "<tr><td>#{how}</td><td>#{html}</td><td>#{examples}</td></tr>"
    else
      table << %{<tr><td colspan="3"><em>#{how} not supported</em></td></tr>}
    end
  end
  table
end
