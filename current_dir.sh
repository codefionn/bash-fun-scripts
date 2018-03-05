#!/usr/bin/env bash

C_DIR0=$(pwd)
C_DIR1=$(readlink -f .)
if [ $C_DIR0 == $C_DIR1 ] ; then
	echo "No links found"
	echo $C_DIR0
	exit 0
fi

printf "Current directory (with links): "
pwd
printf "Current directory (without links): "
readlink -f .
