#!/usr/bin/env bash

# One Argument expected:
# 1. Argument: GitHub profile name

if ! [ $# -eq 1 ] ; then
	echo "github.com_profile_repositories.sh [profile name]"
	exit 1
fi

curl -sSL "https://github.com/$1?tab=repositories" | grep -A1 'itemprop="name codeRepository"' | awk '/<\/a>/ { print $1 } ' | awk -F '</a>' '{ print $1 }'

