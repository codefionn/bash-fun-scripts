#!/usr/bin/env bash

function check_for_prog {
    (which $1 > /dev/null) || echo "Program $1 is missing"
}

check_for_prog awk
check_for_prog curl
check_for_prog readlink
check_for_prog pwd
check_for_prog head
check_for_prog printf
check_for_prog ls
check_for_prog lscpu
check_for_prog tr
