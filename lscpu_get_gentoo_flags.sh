#!/bin/bash

# Doesn't require any arguments

if ! ((which "lscpu" 1> /dev/null) 2> /dev/null) ; then
	echo "Requires lscpu command"
	exit 1
fi 

echo 'Paste this in your /etc/portage/make.conf. E.g. with "lscpu_get_gentoo_flags.sh > /etc/portage/make.conf"' 1>&2

printf '\nCPU_FLAGS_X86="'
echo $(lscpu | awk -F ' ' '/Flags:/ { for(i=2;i<NF;i++) printf $i " " ; printf $NF ; printf "\"" } ')

