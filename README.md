**Bash script for purging binlogs in MariaDB**
-------------------------------
This is my first script that I created for the purpose of clearing binlogs in MariaDB.

The script is easy to use, it has 2 flags:

`-n` for the name of the binlog you want to delete to; 
	eg. `./purgebinlogs -n mysql-bin.1234`

`-t` for the number of last hours you want to save; 
	eg. `./purgebinlogs -t 8` 
	or `./purgebinlogs -t 24`
	if you want to keep binlogs for the past 8 or 24 hours.

If you have any comments or any advice for me feel free to contact me at my github *(ffalak)* or my email *falak.franjo@nsoft.com*.
