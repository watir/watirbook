# Collections

You can even do stuff with all elements of a particular kind on a page. If you want to display `href` attributes of all links in the page, this will do it:

    browser.links.each do |link|
      puts link.href
    end

Watir gem 2.0.2 supports following HTML element collections:

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

Watir-webdriver gem 0.3.5 supports following HTML element collections:

    AnchorCollection
    AppletCollection
    AreaCollection
    AudioCollection
    BRCollection
    BaseCollection
    BaseFontCollection
    BodyCollection
    ButtonCollection
    CanvasCollection
    CheckBoxCollection
    CommandCollection
    DListCollection
    DataListCollection
    DetailsCollection
    DirectoryCollection
    DivCollection
    EmbedCollection
    FieldSetCollection
    FileFieldCollection
    FontCollection
    FormCollection
    FrameCollection
    FrameSetCollection
    HRCollection
    HTMLElementCollection
    HeadCollection
    HeadingCollection
    HiddenCollection
    HtmlCollection
    IFrameCollection
    ImageCollection
    InputCollection
    KeygenCollection
    LICollection
    LabelCollection
    LegendCollection
    MapCollection
    MarqueeCollection
    MediaCollection
    MenuCollection
    MetaCollection
    MeterCollection
    ModCollection
    OListCollection
    ObjectCollection
    OptGroupCollection
    OptionCollection
    OutputCollection
    ParagraphCollection
    ParamCollection
    PreCollection
    ProgressCollection
    QuoteCollection
    RadioCollection
    ScriptCollection
    SelectCollection
    SourceCollection
    SpanCollection
    StyleCollection
    TableCaptionCollection
    TableCellCollection
    TableColCollection
    TableCollection
    TableDataCellCollection
    TableHeaderCellCollection
    TableRowCollection
    TableSectionCollection
    TextAreaCollection
    TextFieldCollection
    TimeCollection
    TitleCollection
    TrackCollection
    UListCollection
    UnknownCollection
    VideoCollection

I could not find any collections that safariwatir gem 0.4.0 supports.

\newpage

