def elements_and_collections
  [[:a, :as], [:abbr, :abbrs], [:address, :addresses], [:area, :areas], [:article, :articles], [:aside, :asides], [:audio, :audios], [:b, :bs], [:base, :bases], [:bdi, :bdis], [:bdo, :bdos], [:blockquote, :blockquotes], [:body, :bodys], [:br, :brs], [:button, :buttons], [:canvas, :canvases], [:caption, :captions], [:checkbox, :checkboxes], [:cite, :cites], [:code, :codes], [:col, :cols], [:colgroup, :colgroups], [:command, :commands], [:datalist, :datalists], [:dd, :dds], [:del, :dels], [:details, nil], [:dfn, :dfns], [:div, :divs], [:dl, :dls], [:dt, :dts], [:element, :elements], [:element_by_xpath, :elements_by_xpath], [:em, :ems], [:embed, :embeds], [:fieldset, :fieldsets], [:figcaption, :figcaptions], [:figure, :figures], [:file_field, :file_fields], [:font, :fonts], [:footer, :footers], [:form, :forms], [:frame, :frames], [:h1, :h1s], [:h2, :h2s], [:h3, :h3s], [:h4, :h4s], [:h5, :h5s], [:h6, :h6s], [:head, :heads], [:header, :headers], [:hgroup, :hgroups], [:hidden, :hiddens], [:hr, :hrs], [:html, :htmls], [:i, :is], [:iframe, :iframes], [:image, :images], [:img, :imgs], [:input, :inputs], [:ins, :inses], [:kbd, :kbds], [:keygen, :keygens], [:label, :labels], [:legend, :legends], [:li, :lis], [:link, :links], [:map, :maps], [:mark, :marks], [:menu, :menus], [:meta, :metas], [:meter, :meters], [:nav, :navs], [:noscript, :noscripts], [:object, :objects], [:ol, :ols], [:optgroup, :optgroups], [:option, :options], [:output, :outputs], [:p, :ps], [:param, :params], [:pre, :pres], [:progress, :progresses], [:q, :qs], [:radio, :radios], [:rp, :rps], [:rt, :rts], [:ruby, :rubies], [:s, :ss], [:samp, :samps], [:script, :scripts], [:section, :sections], [:select, :selects], [:select_list, :select_lists], [:small, :smalls], [:source, :sources], [:span, :spans], [:strong, :strongs], [:style, :styles], [:sub, :subs], [:summary, :summaries], [:sup, :sups], [:table, :tables], [:tbody, :tbodys], [:td, :tds], [:text_field, :text_fields], [:textarea, :textareas], [:tfoot, :tfoots], [:th, :ths], [:thead, :theads], [:time, :times], [:title, :titles], [:tr, :trs], [:track, :tracks], [:u, :us], [:ul, :uls], [:var, :vars], [:video, :videos], [:wbr, :wbrs]]
end
def create_html(body)
  header = "<html><head><title>HTML elements</title><style type=\"text/css\">.green {background-color:#adff2f;} th {width:5em;}</style></head><body><table border=\"1\"><tbody><tr><th>element</th><th>collection</th><th>html</th><th>watir-webdriver</th><th>watir</th><th>safariwatir</th>"
  footer = "</tbody></table></body></html>"
  table = header + body + footer
  File.open("elements.html", "w") {|file| file.write(table)}
end

def body
  table = ""
  elements_and_collections.each do |element_and_collection|
    element = element_and_collection[0]
    collection = element_and_collection[1]
    table << "<tr><td>#{element}</td><td>#{collection}</td><td>&lt;#{element}&gt;</td><td class=\"green\"></td><td></td><td></td></tr>\n"
  end
  table
end

create_html(body)
