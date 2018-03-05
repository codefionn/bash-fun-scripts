#!/usr/bin/env bash

if [ $# -eq 0 ] ; then
	echo "Expected: lines_unix_to_win.sh [input] ([output])"
	echo "If input is equal to a valid file, the file will be taken as input"
	echo "If no output is given, write to standard output"
	exit 1
fi

INPUT=""
OUTPUT=""

if [ -e "$1" ] ; then
	INPUT=$(cat "$1")
else
	INPUT=$1
fi


RESULT=$(echo "$INPUT" | tr '\n' '\n\r')

if [ $# -eq 1 ] ; then
	printf "$RESULT" "\n"
else
	printf "$RESULT" > $2
fi
