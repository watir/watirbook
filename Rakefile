task :default => [:pdf]

task :merge do
  `cat LICENSE.md README.md prerequisites.md about.md installation/installation.md installation/windows.md installation/mac.md installation/ubuntu.md watir-in-five-minutes.md link.md about_extended.md > watirbook1.md`
  `sed s_https://github.com/zeljkofilipin/watirbook/raw/master/__ watirbook1.md > watirbook2.md`
  `sed s_watir-logo-web_watir-logo_ watirbook2.md > watirbook.md`
end

task :pdf => [:merge] do
  `markdown2pdf --toc watirbook.md -o watirbook-0-7.pdf`
end
