#!/bin/bash

echo '<ul>' > contents.html

for md_file in ../*.md; do
  # Extract the title.
  title=$(cat $md_file | awk '/^## / { print $0 }' | cut -f4- -d' ')

  filename=$(basename $md_file)
  lastfile=$outfile
  outfile=${filename%%.md}.html

  if [[ ! -z $lastfile ]]; then
    # Finish up the previous file, including a next link.
    echo '<a href="'$outfile'" style="float:right">Next</a>' >> $lastfile
    cat postamble.html >> $lastfile
  fi

  echo htmlifying $filename $title
  echo '  <li><a href="learn_lua_in_an_hour/'$outfile'">'$title'</a></li>' >> contents.html

  # Write out the preamble with the title.
  cat preamble.html | sed 's/%title/'"$title"'/' > $outfile

  # Write out the body minus the title.
  cat $md_file | awk '(begin == 1) { print $0 } /^## / { begin = 1 }' | markdown_py >> $outfile

done

# The last file still needs a postamble.
cat postamble.html >> $outfile

echo '</ul>' >> contents.html

echo Done!
