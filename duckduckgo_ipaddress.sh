#!/usr/bin/env bash
curl --data "q=ip+address" -sSL https://duckduckgo.com/html | grep "Your IP address" | awk '{ print $5 }'
