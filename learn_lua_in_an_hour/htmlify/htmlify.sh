#!/bin/bash

echo '<ul>' > contents.html

# This concatenates postamble.html to the end of the filename given as $1.
# If $2 is present, then it's used to replace the %end_js line in postamble.html;
# if it's absent, then that line is replaced with a blank line.
add_postamble() {
  if [ -z "$2" ]; then
    # No 2nd arg; replace %end_js with nothing.
    cat postamble.html | sed 's/%end_js//' >> $1
  else
    # Yes 2nd arg; replace %end_js with it.
    cat postamble.html | awk '/%end_js/ { system("cat '"$2"'"); } !/%end_js/ { print $0; }' >> $1
  fi
}

for md_file in ../*.md; do
  # Extract the title.
  title=$(cat $md_file | awk '/^## / { print $0 }' | cut -f4- -d' ')

  filename=$(basename $md_file)
  lastfile=$outfile
  outfile=${filename%%.md}.html

  if [[ ! -z "$lastfile" ]]; then
    # Finish up the previous file, including a next link.
    echo '<a href="'$outfile'" style="float:right">Next</a>' >> $lastfile

    # This next bit is very specific for now. If I reuse this script for
    # other scripts, this would be some good code to generalize.
    if [ "$lastfile" == "part17.html" ]; then
      add_postamble "$lastfile" "linenumbers.js"
    else
      add_postamble "$lastfile"
    fi
  fi

  echo htmlifying $filename $title
  echo '  <li><a href="learn_lua_in_an_hour/'$outfile'">'$title'</a></li>' >> contents.html

  # Write out the preamble with the title.
  cat preamble.html | sed 's/%title/'"$title"'/' > $outfile

  # Write out the body minus the title.
  cat $md_file | awk '(begin == 1) { print $0 } /^## / { begin = 1 }' | markdown_py >> $outfile

done

# The last file still needs a postamble.
add_postamble "$outfile"

echo '</ul>' >> contents.html

echo Done!
