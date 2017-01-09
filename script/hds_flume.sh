#!/bin/bash

flume_path=/home/software/apache-flume-1.6.0-bin
run_hds_flume="$flume_path/bin/flume-ng agent -n a1 -c $flume_path/conf -f $flume_path/conf/flume-conf.properties"
case $1 in
start)
printf "Starting HDS Flume now...\n"
nohup $run_hds_flume >/dev/null 2>&1 &
printf "HDS Flume is running now!\n"
;;
stop)
printf "Stopping HDS Flume now...\n"
ps xa | grep flume | grep -v grep | awk '{print $1}'| xargs kill -9
printf "HDS Flume is stopped!\n"
;;
restart)
$0 stop
$0 start
;;
status)
check_status=$(ps xa | grep flume | grep -v grep | grep -v status)
if  [ ! -n "$check_status" ] ;then
    printf "Flume isn't running...\n"
else
    printf "Flume is running...\n"
fi
;;
*)
printf "Usage: $0 {start|restart|stop|status}\n"
;;
esac
