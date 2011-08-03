task :default => [:merge_and_pdf]

task :merge_and_pdf, [:version] do |t, args|
  args.with_defaults(:sha => "0.6")
  `bash tools/merge`
  `sed s_https://github.com/zeljkofilipin/watirbook/raw/master/__ watirbook1.md > watirbook2.md`
  `sed s_watir-logo_watir-logo-web_ watirbook2.md > watirbook.md`
  `bash tools/pdf`
end
