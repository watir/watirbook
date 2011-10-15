# Collections

Watir gem (tested with version 2.0.2) supports following HTML element collections:

    Areas
    Buttons
    CheckBoxes
    Dds
    Dels
    Divs
    Dls
    Dts
    Ems
    FileFields
    Fonts
    Forms
    Frames
    H1s
    H2s
    H3s
    H4s
    H5s
    H6s
    HTMLElements
    Hiddens
    Images
    InputElementCollections
    Inses
    Labels
    Links
    Lis
    Maps
    Metas
    Ols
    Pres
    Ps
    Radios
    SelectLists
    Spans
    Strongs
    TableCells
    TableRows
    Tables
    TextFields
    Uls

You can even do stuff with all elements of a particular kind on a page. If you want to display `href` attributes of all links in the page, this will do it:

    browser.links.each do |link|
      puts link.href
    end

\newpage

