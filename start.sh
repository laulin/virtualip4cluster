#! /bin/bash


trap "kill -TERM $PID" SIGINT SIGTERM

/opt/ucarp/run.sh eth0 10.1.0.253 my_secret_share &

PID=$!
wait $PID