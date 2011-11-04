def data
  [
  [:a, :as, true, true, true],
  [:abbr, :abbrs, true, false, false],
  [:address, :addresses, true, false, false],
  [:area, :areas, true, true, true],
  [:article, :articles, true, false, false],
  [:aside, :asides, true, false, false],
  [:audio, :audios, true, false, false],
  [:b, :bs, true, false, false],
  [:base, :bases, true, false, false],
  [:bdi, :bdis, true, false, false],
  [:bdo, :bdos, true, false, false],
  [:blockquote, :blockquotes, true, false, false],
  [:body, :bodys, true, false, false],
  [:br, :brs, true, false, false],
  [:button, :buttons, true, true, true],
  [:canvas, :canvases, true, false, false],
  [:caption, :captions, true, false, false],
  [:checkbox, :checkboxes, false, true, true],
  [:cite, :cites, true, false, false],
  [:code, :codes, true, false, false],
  [:col, :cols, true, false, false],
  [:colgroup, :colgroups, true, false, false],
  [:command, :commands, true, false, false],
  [:datalist, :datalists, true, false, false],
  [:dd, :dds, true, true, true],
  [:del, :dels, true, true, false],
  [:details, nil, true, false, false],
  [:dfn, :dfns, true, false, false],
  [:div, :divs, true, true, true],
  [:dl, :dls, true, true, true],
  [:dt, :dts, true, true, true],
  [:element, :elements, false, false, false],
  [:element_by_xpath, :elements_by_xpath, false, false, false],
  [:em, :ems, true, true, true],
  [:embed, :embeds, true, false, false],
  [:fieldset, :fieldsets, true, false, false],
  [:figcaption, :figcaptions, true, false, false],
  [:figure, :figures, true, false, false],
  [:file_field, :file_fields, false, true, true],
  [:font, :fonts, true, false, false],
  [:footer, :footers, true, false, false],
  [:form, :forms, true, true, true],
  [:frame, :frames, true, true, true],
  [:h1, :h1s, true, true, false],
  [:h2, :h2s, true, true, false],
  [:h3, :h3s, true, true, false],
  [:h4, :h4s, true, true, false],
  [:h5, :h5s, true, true, false],
  [:h6, :h6s, true, true, false],
  [:head, :heads, true, false, false],
  [:header, :headers, true, false, true],
  [:hgroup, :hgroups, true, false, false],
  [:hidden, :hiddens, false, false, false],
  [:hr, :hrs, true, false, false],
  [:html, :htmls, true, false, false],
  [:i, :is, true, false, false],
  [:iframe, :iframes, true, true, true],
  [:image, :images, false, true, true],
  [:img, :imgs, true, true, true],
  [:input, :inputs, true, true, true],
  [:ins, :inses, true, true, false],
  [:kbd, :kbds, true, false, false],
  [:keygen, :keygens, true, false, false],
  [:label, :labels, true, true, true],
  [:legend, :legends, true, false, false],
  [:li, :lis, true, true, true],
  [:link, :links, false, true, true],
  [:map, :maps, true, true, true],
  [:mark, :marks, true, false, false],
  [:menu, :menus, true, false, false],
  [:meta, :metas, true, true, false],
  [:meter, :meters, true, false, false],
  [:nav, :navs, true, false, false],
  [:noscript, :noscripts, true, false, false],
  [:object, :objects, true, false, false],
  [:ol, :ols, true, true, true],
  [:optgroup, :optgroups, true, false, false],
  [:option, :options, true, false, true],
  [:output, :outputs, true, false, false],
  [:p, :ps, true, true, true],
  [:param, :params, true, false, false],
  [:pre, :pres, true, true, true],
  [:progress, :progresses, true, false, false],
  [:q, :qs, true, false, false],
  [:radio, :radios, false, true, true],
  [:rp, :rps, true, false, false],
  [:rt, :rts, true, false, false],
  [:ruby, :rubies, true, false, false],
  [:s, :ss, true, false, false],
  [:samp, :samps, true, false, false],
  [:script, :scripts, true, false, false],
  [:section, :sections, true, false, false],
  [:select, :selects, true, true, true],
  [:select_list, :select_lists, false, true, true],
  [:small, :smalls, true, false, false],
  [:source, :sources, true, false, false],
  [:span, :spans, true, true, true],
  [:strong, :strongs, true, true, true],
  [:style, :styles, true, false, false],
  [:sub, :subs, true, false, false],
  [:summary, :summaries, true, false, false],
  [:sup, :sups, true, false, false],
  [:table, :tables, true, true, true],
  [:tbody, :tbodys, true, true, false],
  [:td, :tds, true, true, true],
  [:text_field, :text_fields, false, true, true],
  [:textarea, :textareas, true, true, true],
  [:tfoot, :tfoots, true, false, false],
  [:th, :ths, true, false, false],
  [:thead, :theads, true, false, false],
  [:time, :times, true, false, false],
  [:title, :titles, true, false, false],
  [:tr, :trs, true, true, true],
  [:track, :tracks, true, false, false],
  [:u, :us, true, false, false],
  [:ul, :uls, true, true, true],
  [:var, :vars, true, false, false],
  [:video, :videos, true, false, false],
  [:wbr, :wbrs, true, false, false]
  ]
end
def create_html(body)
  header = "<html><head><title>HTML elements</title><style type=\"text/css\">.green {background-color:#adff2f;} th {width:5em;}</style></head><body><table border=\"1\"><tbody><tr><th>element</th><th>collection</th><th>html</th><th>watir-webdriver</th><th>watir</th><th>safariwatir</th>"
  footer = "</tbody></table></body></html>"
  table = header + body + footer
  File.open("elements.html", "w") {|file| file.write(table)}
end

def body
  table = ""
  data.each do |data|
    element = data[0]
    collection = data[1]
    has_default_html = data[2]
    watir = data[3]
    safariwatir = data[4]

    empty_cell = "<td></td>"

    default_html = "<td>&lt;#{element}&gt;</td>"
    if has_default_html
      html = default_html
    else
      html = empty_cell
    end

    green_cell = "<td class=\"green\">"
    watir_webdriver_cell = green_cell

    if watir
      watir_cell = green_cell
    else
      watir_cell = empty_cell
    end

    if safariwatir
      safariwatir_cell = green_cell
    else
      safariwatir_cell = empty_cell
    end

    table << "<tr><td>#{element}</td><td>#{collection}</td>#{html}#{watir_webdriver_cell}#{watir_cell}#{safariwatir_cell}</tr>\n"
  end
  table
end

create_html(body)
