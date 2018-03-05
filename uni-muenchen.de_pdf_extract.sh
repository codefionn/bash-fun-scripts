#!/bin/bash
# Dieses Script  erwartet ein Argument:
#  1. Argument: Webseite
#

if ! [ $# -eq 1 ] ; then
	echo "uni-muenchen.de_pdf_extract.sh [link]"
	exit 1
fi

# Last update: 29.01.2018 (DD.MM.YYYY)

# Save the page where the pdf is being saved
PAGE_CHILD=$(curl -sSL $1  | grep pdf | awk '/href=/ { print $2 }' | head -n 1 | awk -F 'href=' ' { print $2 }' | awk -F '\"' ' { print $2 }')

# Save the parent of the current page
PAGE_PARENT=$(echo $1 | awk -F '/' ' { for (i=1; i<NF;i++) { printf $i ; printf "/" } } ')

echo ${PAGE_PARENT}${PAGE_CHILD}
