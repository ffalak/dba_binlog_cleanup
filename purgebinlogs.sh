#!/bin/bash
# Bash script for purging binlogs

while getopts t:n:l flag
do
    case ${flag} in
        t) hours="${OPTARG}";;
        n) binlog_name="${OPTARG}";;
        l) list_binlogs=1;;
    esac
done

mysql_run () {
    mysql --execute="$1"
}

if [[ $hours =~ ^[0-9]{,2}$ && $hours -ne 0 ]]; 
    then
        last_n_hours="$(date -d ${hours}' hours ago' '+%Y-%m-%d %T')"
        mysql_run "PURGE BINARY LOGS BEFORE '${last_n_hours}';"
    elif [[ -n $binlog_name ]]; then
        mysql_run "PURGE BINARY LOGS TO '${binlog_name}';"
    elif [[ -n $list_binlogs ]]; then
        mysql_run "SHOW BINARY LOGS;"
    else
        echo "ERROR: No argument"
        exit 1
fi
