#!/bin/bash
# Bash script for purging binlogs

while getopts t:n: flag
do
    case ${flag} in
        t) sati="${OPTARG}";;
        n) binlog_name="${OPTARG}";;
    esac
done

if [[ -n $sati ]]; then
        last_n_hours="$(date -d ${sati}' hours ago' '+%Y-%m-%d %T')"
        mysql --execute="PURGE BINARY LOGS BEFORE '${last_n_hours}';"
    elif [[ -n $binlog_name ]]; then
        mysql --execute="PURGE BINARY LOGS TO '${binlog_name}';"
    else
        echo "ERROR: No argument"
     exit 1
fi
