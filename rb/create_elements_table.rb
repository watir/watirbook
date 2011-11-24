def data
  [
  # element, collection, default html, watir-webdriver element, watir element, safariwatir element, watir-webdriver collection, watir collection, safariwatir collection
  [:a, :as, true, true, true, true, true, false, false],
  [:abbr, :abbrs, true, true, false, false, true, false, false],
  [:address, :addresses, true, true, false, false, true, false, false],
  [:area, :areas, true, true, true, true, true, true, false],
  [:article, :articles, true, true, false, false, true, false, false],
  [:aside, :asides, true, true, false, false, true, false, false],
  [:audio, :audios, true, true, false, false, true, false, false],
  [:b, :bs, true, true, false, false, true, false, false],
  [:base, :bases, true, true, false, false, true, false, false],
  [:bdi, :bdis, true, true, false, false, true, false, false],
  [:bdo, :bdos, true, true, false, false, true, false, false],
  [:blockquote, :blockquotes, true, true, false, false, true, false, false],
  [:body, :bodys, true, true, false, false, true, false, false],
  [:br, :brs, true, true, false, false, true, false, false],
  [:button, :buttons, true, true, true, true, true, true, false],
  [:canvas, :canvases, true, true, false, false, true, false, false],
  [:caption, :captions, true, true, false, false, true, false, false],
  [:checkbox, :checkboxes, false, true, true, true, true, true, false],
  [:cite, :cites, true, true, false, false, true, false, false],
  [:code, :codes, true, true, false, false, true, false, false],
  [:col, :cols, true, true, false, false, true, false, false],
  [:colgroup, :colgroups, true, true, false, false, true, false, false],
  [:command, :commands, true, true, false, false, true, false, false],
  [:datalist, :datalists, true, true, false, false, true, false, false],
  [:dd, :dds, true, true, true, true, true, true, false],
  [:del, :dels, true, true, true, false, true, true, false],
  [:details, :detailses, true, true, false, false, true, false, false],
  [:dfn, :dfns, true, true, false, false, true, false, false],
  [:div, :divs, true, true, true, true, true, true, false],
  [:dl, :dls, true, true, true, true, true, true, false],

  [:dt, :dts, true, true, true, true, true, true, false],
  [:element, :elements, false, true, true, false, true, false, false],
  [:element_by_xpath, :elements_by_xpath, false, true, true, false, true, false, false],
  [:em, :ems, true, true, true, true, true, true, false],
  [:embed, :embeds, true, true, false, false, true, false, false],
  [:fieldset, :fieldsets, true, true, false, false, true, false, false],
  [:figcaption, :figcaptions, true, true, false, false, true, false, false],
  [:figure, :figures, true, true, false, false, true, false, false],
  [:file_field, :file_fields, false, true, true, true, true, true, false],
  [:font, :fonts, true, true, true, false, true, true, false],
  [:footer, :footers, true, true, false, false, true, false, false],
  [:form, :forms, true, true, true, true, true, true, false],
  [:frame, :frames, true, true, true, true, true, true, false],
  [:h1, :h1s, true, true, true, false, true, true, false],
  [:h2, :h2s, true, true, true, false, true, true, false],
  [:h3, :h3s, true, true, true, false, true, true, false],
  [:h4, :h4s, true, true, true, false, true, true, false],
  [:h5, :h5s, true, true, true, false, true, true, false],
  [:h6, :h6s, true, true, true, false, true, true, false],
  [:head, :heads, true, true, false, false, true, false, false],
  [:header, :headers, true, true, false, true, true, false, false],
  [:hgroup, :hgroups, true, true, false, false, true, false, false],
  [:hidden, :hiddens, false, true, true, false, true, true, false],
  [:hr, :hrs, true, true, false, false, true, false, false],
  [:html, :htmls, true, true, false, false, true, false, false],
  [:i, :is, true, true, false, false, true, false, false],
  [:iframe, :iframes, true, true, true, true, true, false, false],
  [:image, :images, false, true, true, true, true, true, false],
  [:img, :imgs, true, true, true, true, true, true, false],
  [:input, :inputs, true, true, true, true, true, false, false],

  [:ins, :inses, true, true, true, false, true, true, false],
  [:kbd, :kbds, true, true, false, false, true, false, false],
  [:keygen, :keygens, true, true, false, false, true, false, false],
  [:label, :labels, true, true, true, true, true, true, false],
  [:legend, :legends, true, true, false, false, true, false, false],
  [:li, :lis, true, true, true, true, true, true, false],
  [:link, :links, false, true, true, true, true, true, false],
  [:map, :maps, true, true, true, true, true, true, false],
  [:mark, :marks, true, true, false, false, true, false, false],
  [:menu, :menus, true, true, false, false, true, false, false],
  [:meta, :metas, true, true, true, false, true, true, false],
  [:meter, :meters, true, true, false, false, true, false, false],
  [:nav, :navs, true, true, false, false, true, false, false],
  [:noscript, :noscripts, true, true, false, false, true, false, false],
  [:object, :objects, true, true, false, false, true, false, false],
  [:ol, :ols, true, true, true, true, true, true, false],
  [:optgroup, :optgroups, true, true, false, false, true, false, false],
  [:option, :options, true, true, false, true, true, false, false],
  [:output, :outputs, true, true, false, false, true, false, false],
  [:p, :ps, true, true, true, true, true, true, false],
  [:param, :params, true, true, false, false, true, false, false],
  [:pre, :pres, true, true, true, true, true, true, false],
  [:progress, :progresses, true, true, false, false, true, false, false],
  [:q, :qs, true, true, false, false, true, false, false],
  [:radio, :radios, false, true, true, true, true, true, false],
  [:rp, :rps, true, true, false, false, true, false, false],
  [:rt, :rts, true, true, false, false, true, false, false],
  [:ruby, :rubies, true, true, false, false, true, false, false],
  [:s, :ss, true, true, false, false, true, false, false],
  [:samp, :samps, true, true, false, false, true, false, false],

  [:script, :scripts, true, true, false, false, true, false, false],
  [:section, :sections, true, true, false, false, true, false, false],
  [:select, :selects, true, true, true, true, true, false, false],
  [:select_list, :select_lists, false, true, true, true, true, true, false],
  [:small, :smalls, true, true, false, false, true, false, false],
  [:source, :sources, true, true, false, false, true, false, false],
  [:span, :spans, true, true, true, true, true, true, false],
  [:strong, :strongs, true, true, true, true, true, true, false],
  [:style, :styles, true, true, false, false, true, false, false],
  [:sub, :subs, true, true, false, false, true, false, false],
  [:summary, :summaries, true, true, false, false, true, false, false],
  [:sup, :sups, true, true, false, false, true, false, false],
  [:table, :tables, true, true, true, true, true, true, false],
  [:tbody, :tbodys, true, true, true, false, true, false, false],
  [:td, :tds, true, true, true, true, true, true, false],
  [:text_field, :text_fields, false, true, true, true, true, true, false],
  [:textarea, :textareas, true, true, true, true, true, false, false],
  [:tfoot, :tfoots, true, true, false, false, true, false, false],
  [:th, :ths, true, true, false, false, true, false, false],
  [:thead, :theads, true, true, false, false, true, false, false],
  [:time, :times, true, true, false, false, true, false, false],
  [:title, :titles, true, true, false, false, true, false, false],
  [:tr, :trs, true, true, true, true, true, true, false],
  [:track, :tracks, true, true, false, false, true, false, false],
  [:u, :us, true, true, false, false, true, false, false],
  [:ul, :uls, true, true, true, true, true, true, false],
  [:var, :vars, true, true, false, false, true, false, false],
  [:video, :videos, true, true, false, false, true, false, false],
  [:wbr, :wbrs, true, true, false, false, true, false, false]
  ]
end
def create_html(body)
  header = "<html><head><title>HTML elements</title><style type=\"text/css\">.green {background-color:#adff2f;} .yellow {background-color:yellow;} th {width:5em;}</style></head><body><table border=\"1\"><tbody><tr><th>element</th><th>collection</th><th>html</th><th>watir-webdriver</th><th>watir</th><th>safariwatir</th>"
  footer = "</tbody></table></body></html>"
  table = header + body + footer
  File.open("reference/elements.htm", "w") {|file| file.write(table)}
end

def body(from, to)
  table = ""
  data.each_with_index do |data, i|
    next if i < from
    break if i > to
    element = data[0]
    collection = data[1]
    has_default_html = data[2]
    watir_webdriver_element = data[3]
    watir_element = data[4]
    safariwatir_element = data[5]
    watir_webdriver_collection = data[6]
    watir_collection = data[7]
    safariwatir_collection = data[8]

    empty_cell = "<td></td>"

    default_html = "<td>&lt;#{element}&gt;</td>"
    if has_default_html
      html = default_html
    else
      html = empty_cell
    end

    green_cell = "<td class=\"green\">"
    yellow_cell = "<td class=\"yellow\">"

    gems = [[watir_webdriver_element, watir_webdriver_collection], [watir_element, watir_collection], [safariwatir_element, safariwatir_collection]]
    gem_cells = gems.collect do |gem|
      gem_element = gem[0]
      gem_collection = gem[1]
      if gem_element and gem_collection
        green_cell
      elsif gem_element
        yellow_cell
      elsif gem_collection
        puts "error"
      else
        empty_cell
      end
    end

    table << "<tr><td>#{element}</td><td>#{collection}</td>#{html}#{gem_cells[0]}#{gem_cells[1]}#{gem_cells[2]}</tr>\n"
  end
  table
end

if __FILE__ == $0
  create_html(body(0,200))
end
