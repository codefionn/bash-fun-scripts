#!/bin/bash

# User can provide one argument (a directory) or no argument at all (current directory)

USE_DIRECTORY=$(pwd)
if [ $# -eq 1 ] ; then
	USE_DIRECTORY=$1
fi

if ! [ -d $USE_DIRECTORY ] ; then
	echo "'$USE_DIRECTORY' is not an directory"
	exit 1
fi

printf "Files: "
echo $(ls $USE_DIRECTORY -1AF | awk '/^.*[^/]$/ { print "0" }'  | awk ' {} END { print NR }')

printf "Directories: "
echo $(ls $USE_DIRECTORY -1AF | awk '/^.*\/$/ { print "0" }'  | awk ' {} END { print NR }')

