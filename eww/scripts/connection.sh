#!/bin/bash

connection=$(nmcli con show | sed -n 2p)

if [[ $connection == *"wifi"* ]] 
then 
  conn_name=$(echo "$connectioon" | cut -d " " -f1)
  echo "$conn_name "
elif [[ $connection == *"ethernet"* ]]
then
  echo "󰈀"
  else
  echo "󰖪"
fi
