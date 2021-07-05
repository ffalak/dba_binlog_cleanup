#!/bin/bash
# Bash script for purging binlogs

while getopts t:n:l: flag
do
    case ${flag} in
        t) hours="${OPTARG}";;
        n) binlog_name="${OPTARG}";;
        l) list_binlogs="${OPTARG}";;
    esac
done

if [[ -n $hours ]]; then
        last_n_hours="$(date -d ${hours}' hours ago' '+%Y-%m-%d %T')"
        mysql --execute="PURGE BINARY LOGS BEFORE '${last_n_hours}';"
    elif [[ -n $binlog_name ]]; then
        mysql --execute="PURGE BINARY LOGS TO '${binlog_name}';"
    elif [[ -n $list_binlogs ]]; then
        mysql --execute="SHOW BINARY LOGS;"
    else
        echo "ERROR: No argument"
     exit 1
fi
