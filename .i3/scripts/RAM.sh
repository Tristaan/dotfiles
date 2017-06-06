#!/bin/bash
ram=$(free -m) 
arr=($ram)
max=$(awk "BEGIN {printf \"%.2f\",${arr[7]}/1024}")
cur=$(awk "BEGIN {printf \"%.2f\",${arr[8]}/1024}")
echo "${cur}GB/${max}GB"

