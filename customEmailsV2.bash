#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: ./customEmailsV2.bash mm/dd/yyy"
    echo "You must specify a date."
    exit 1
fi
var="$1"
awk -f customEmailsV2.awk -v 'date='$var'' customer.txt
bash ./gcustomEmailsV2.bash
