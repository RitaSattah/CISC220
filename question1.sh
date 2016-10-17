#!/bin/bash
ipa=$(ifconfig | grep -e "inet addr:" | awk '{print $2}' | awk -F ":" '{print $2}')

for i in $ipa; do
    if [[ $i == 127* ]]; then
        echo "Local IP is:" $i ;
    elif [[ $i == 192.168* || $i == 10* ]] ; then
        echo "Private IP is:" $i ;
    else
        echo $i "Public IP" ;
    fi
done

