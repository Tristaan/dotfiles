#!/bin/bash
while getopts "d:" option; do
 case "${option}" in
 d)
    alacritty --working-directory ${OPTARG} & ;;
 esac
done
