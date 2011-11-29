version = "0-7-1"
type = :paid

task :default => [:pdf, :cleanup]

task :all => [:merge, :pdf, :epub, :mobi, :cleanup]

task :free do
  type = :free
  Rake::Task[:all].invoke
end

task :merge do
  chapters = "LICENSE.md README.md prerequisites.md about.md installation/installation.md installation/windows.md installation/mac.md installation/ubuntu.md watir-in-five-minutes.md"
  chapters << " buy.md" if type == :free
  chapters << " elements/elements.md elements/link.md elements/collections.md elements/nested.md about_extended.md" if type == :paid
  `cat #{chapters} > watirbook-1-#{type}.md`
  `sed s_https://github.com/zeljkofilipin/watirbook/raw/master/__ watirbook-1-#{type}.md > watirbook-2-#{type}.md`
  `sed s_watir-logo-web_watir-logo_ watirbook-2-#{type}.md > watirbook-#{type}.md`
end

task :pdf => [:merge] do
  `markdown2pdf --toc watirbook-#{type}.md -o watirbook-#{version}-#{type}.pdf`
end

task :epub => [:merge] do
  `pandoc --toc --epub-metadata=misc/metadata.xml --epub-cover-image=images/watir-logo.jpg -o watirbook-#{version}-#{type}.epub title.txt watirbook-#{type}.md`
end

task :mobi => [:merge] do
  `/Applications/KindleGen_Mac_i386_v1.2/kindlegen watirbook-#{version}-#{type}.epub`
end

task :html => [:merge] do
  `pandoc  watirbook-#{type}.md -s -o watirbook-#{version}-#{type}.htm`
end

task :pdfkit do
  `pandoc  installation/ubuntu.md -s -o book.htm`
  require "pdfkit"
  kit = PDFKit.new(File.new("book.htm"), :toc => true)
  kit.to_file "book.pdf"
end

task :cleanup do
  `rm watirbook-#{type}.md watirbook-1-#{type}.md watirbook-2-#{type}.md`
end
