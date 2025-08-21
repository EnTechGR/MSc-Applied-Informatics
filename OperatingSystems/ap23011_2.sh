#!/bin/bash

#===============================================================================
#
#          FILE: ap23011_2.sh
# 
#         USAGE: ./ap23011_2.sh 
# 
#   DESCRIPTION: This script calculates the time of a capital, relative to TZ Europe/Athens, based on the given time and 
#                and the capital.
# 
#       OPTIONS: <time> <timezone> | -h
#  REQUIREMENTS: ---
#          BUGS: Ambiguous timezones i.e. Europe/Istanbul
#         NOTES: TimeZones --> https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
#        AUTHOR: Marinos Kouvaras (ap23011), ap23011@hua.gr
#  ORGANIZATION: ---
#       CREATED: 16/1/2023
#      REVISION: v1
#=============================================================================== 

#Create a here document.
help()
{
   cat <<-EOF
	$SCRIPTNAME "This script calculates the time of a capital, ralative to TZ Europe/Athens, based on the given time and 
    and the capital."
    "Syntax: ./ap23011_2.sh [ <time> <timezone> | -h]"
    example: ./ap23011_2.sh 18:30 "Europe/Minsk" 
    -h for help
    ...
	EOF
}

# Variable time from the first argument past
TIME="$1"
# Variable timezone from the second argument past
TIME_ZONE="$2"

# Call here document if no arguments passed ορ if less than two arguments passed
if [[ $# -eq 0 ]] || [[ $# -lt 2 ]] ; then
    help
    exit 0
fi

# Check the arguments passed in order to execute the correct action
while getopts ":h" OPTION; do
    case $OPTION in
        h) # -h option
            help
            exit;;
        \?)
            help
            exit;;
    esac
done

# Check the current timezone in Athens
if [ "$(date +%Z)" == EET ]; 
then
    # winter time, return the winter timezone of the specified Capital
    echo "Time in "$TIME_ZONE" is $(TZ=$TIME_ZONE date -d $TIME+"EET")"
else
    #summer time, return the summer timezone of the specified Capital
    echo "Time in "$TIME_ZONE" is $(TZ=$TIME_ZONE date -d $TIME+"EEST")"
fi
