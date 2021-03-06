#!/bin/bash

if [ "$#" -ne 4 ]; then
    echo "error: need 4 parameters. "
    exit 1
fi

client_path=$1
client_param=$2
client_num=$3
client_interval=$4

client_dir=$(dirname $client_path)
client_exe=$(basename $client_path)

echo "client_dir: $client_dir"
echo "client_param: $client_param"
echo "client_exe: $client_exe"
echo "client_num: $client_num"

NUMBER_REGEX='^[0-9]+$'

if ! [[ $client_num =~ $NUMBER_REGEX ]] ; then
    echo "Invalid client num."
    exit 1
fi

cd $client_dir

for i in $(seq $client_num); do
    echo "Start client $i"
    # note that Unreal will refuse to run as ROOT
    sudo -u ubuntu nohup ./$client_exe $client_param > /dev/null 2>&1 &
    sleep $client_interval
done
