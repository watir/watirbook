#!/bin/sh

# Prepares the book for release at Leanpub
# $ chmod +x github_to_leanpub.sh
# $ ./github_to_leanpub.sh

find . | grep md | while read line;
  do {
    cat $line | sed 's|https:\/\/raw\.github\.com\/watir\/watirbook\/master\/||g' > $line.txt.new
    mv $line.txt.new $line
      (( Lines++ ));
  }
done
