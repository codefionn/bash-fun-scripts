#!/usr/bin/env bash
# Printing (using pspdftool and cups)

# Prints double side sheets
# Meaning: First the odd ones and then the even ones
# Arguments: First argument should be the file to print

if [[ -z "$1" ]] ; then
  echo "File to print should have been specified as first argument" 1>&2
  return
fi

if ! [ -f "$1" ] ; then
  echo "File $1 doesn't exist" 1>&2
  return
fi

# Create tmp dir
! [ -d ".$1" ] && mkdir ".$1"

# CD to tmp dir
cd ".$1"

if ! pdftoppm "../$1" "img" -png -rx 300 -ry 300 -aa yes; then
  cd ..
  echo "Failed to convert file to images" 1>&2
  return
fi

pages=`ls -1 | wc -l`

echo "Pages to print: $pages"

# Print odd pages
i=0
for f in $(ls -1v) ; do
  echo $((i%2))
  if [ $((i%2)) -eq 0 ] ; then
    # An odd page
    lp "$f"
  fi

  ((++i))
done

echo "Printed odd pages, now come the even ones"
read -p "Take pages turn them around and put them into the paper slot again and type ENTER"

i=1
for f in $(ls -1v) ; do
  if [ $((i%2)) -eq 0 ] ; then
    # An even page
    lp "$f"
  fi

  ((++i))
done

echo "Done printing"
# Remove tmp dir
cd ..
rm -r ".$1"
