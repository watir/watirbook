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
  `cat #{chapters} > book/watirbook-1-#{version}-#{type}.md`
  `sed s_https://github.com/zeljkofilipin/watirbook/raw/master/__ book/watirbook-1-#{version}-#{type}.md > book/watirbook-2-#{version}-#{type}.md`
  `sed s_watir-logo-web_watir-logo_ book/watirbook-2-#{version}-#{type}.md > book/watirbook-#{version}-#{type}.md`
end

task :pdf => [:merge] do
  `markdown2pdf --toc book/watirbook-#{version}-#{type}.md -o book/watirbook-#{version}-#{type}.pdf`
end

task :epub => [:merge] do
  `pandoc --toc --epub-metadata=misc/metadata.xml --epub-cover-image=images/watir-logo.jpg -o book/watirbook-#{version}-#{type}.epub title.txt book/watirbook-#{version}-#{type}.md`
end

task :mobi => [:merge, :epub] do
  `/Applications/KindleGen_Mac_i386_v1.2/kindlegen book/watirbook-#{version}-#{type}.epub`
end

task :html => [:merge] do
  `pandoc book/watirbook-#{version}-#{type}.md -s -o book/watirbook-#{version}-#{type}.htm`
end

task :pdfkit => [:merge, :html] do
  require "pdfkit"
  kit = PDFKit.new(File.new("watirbook-#{version}-#{type}.htm"), :toc => true)
  kit.to_file "book/watirbook-#{version}-#{type}.pdf"
end

task :cleanup do
  `rm book/*.md`
end
