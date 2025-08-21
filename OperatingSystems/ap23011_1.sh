#!/bin/bash

#===============================================================================
#
#          FILE: ap23011_1.sh
# 
#         USAGE: ./ap23011_1.sh 
# 
#   DESCRIPTION: This script returns the files greater than 10MB in your HOME directory.
# 
#       OPTIONS: -d -h
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Marinos Kouvaras (ap23011), ap23011@hua.gr
#  ORGANIZATION: ---
#       CREATED: 16/1/2023
#      REVISION: v1
#=============================================================================== 

#Create a here document.
help()
{
   cat <<-EOF
	$SCRIPTNAME "This script prints the files greater than 10MB in the home directory"
    Syntax: ./ap23011_1.sh [-d | -h]
    -d  returns the files
    -h  prints this help message
    ...
	EOF
}

# Check the arguments passed
while getopts ":h" OPTION; do
    case $OPTION in
        h) # -h option
        help
        exit;;
        \?) # If a wrong argument is passed
        help
        exit;;
    esac
done

#find in depth 1 all the files which have size greater than 10MB and are not secret
RESULT=$(find $HOME -maxdepth 1 -type f -size +10M -not -name ".*" -exec ls -lhS {} \;)
echo "$RESULT"