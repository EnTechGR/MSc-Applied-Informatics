#!/bin/bash

#===============================================================================
#
#          FILE: ap23011_4.sh
# 
#         USAGE: ./ap23011_4.sh 
# 
#   DESCRIPTION: This shell script reads data from a source file named "access.log" or
#                prompts for download. The -i flag returns the 10 ips with the most requests while
#                the -c flag return each ip with the country code.
# 
#       OPTIONS: -i -c -h
#  REQUIREMENTS: access.log file
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Marinos Kouvaras (ap23011), ap23011@hua.gr
#  ORGANIZATION: ---
#       CREATED: 14/1/2023
#      REVISION: v1
#===============================================================================

# Variable for our data.
SOURCE_FILE=./access.log

# This strips off the pathname info from the scriptname,
# ("$0"), leaving just the last (filename) part:
SCRIPTNAME=${0##*/}

# Create a here document.
help()
{
   cat <<-EOF
	$SCRIPTNAME: Show data from ./access.log file
    -h for help
    -i for the 10 ips with the most calls
    -c for displaying also the country code of each ip
	...
	EOF
}

# This function checks if there is the source file otherwise it downloads it.
test_file () {
    if [ ! -f $SOURCE_FILE ]; then
        read -p "Source file does not exist, do you want to download it? Y/N " OPTION
        if [[ $OPTION == "Y" || $OPTION == "y" ]]
        then
            echo "Downloading..."
            curl -s https://gitlab.com/atsadimas/operating-systems/-/raw/master/exercises/basic-commands/access.log -o access.log
            echo "File downloaded"
        else [[ $OPTION == "N" || $OPTION == "n" ]]
            help
            exit
        fi
    fi
}

# Create a function for the 10 ips with the most calls.
top_ips () {
    #Get the ip field from the data, sort it, find and count the unique values, sort them in reverse and print the 10 first of them.
    echo "$( awk '{print $1}' $SOURCE_FILE | sort -k 1n | uniq -c | sort -nr | head -n 10 )"
}

# Create a function to return the country code for each ip
country_ip () {
    #Save in the variable the result from the top_ips function
    RESULT=$(top_ips)
    #Get only the ips
    IP_ADRESSES=$(echo "$RESULT" | awk '{print $2}')
    #Start a loop
    for ip_addr in $IP_ADRESSES
    do
        #use the api to get the json data and then return the country code
        echo "$ip_addr"" -->"$(echo $(curl -s "https://ipapi.co/"${ip_addr}"/json/" | jq '.country_code'))
    done
}

# Check if no argument pass and print help
if [[ $# -eq 0 ]] ; then
    help
    exit
fi

while getopts ":ich" OPTION; do
    case $OPTION in
        i) # -i (ip) option
        test_file
        top_ips
        exit;;
        c)
        test_file
        country_ip
        exit;;
        h) # -h option
        help
        exit;;
        \?) # if a wrong argument is passed
        help
        exit;;
    esac
done
