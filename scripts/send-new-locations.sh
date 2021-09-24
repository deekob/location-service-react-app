#!/bin/bash

LAT=54.607868
LONG=-5.926437

# Basic while loop
while [ true ]
    do
        echo 'starting...'
        DEVICENAME="$2"
        TIME=$(date +%s)


        UPDATE="DeviceId=$DEVICENAME,Position=$LONG,$LAT,SampleTime=$TIME"

        echo "$UPDATE"

        aws location \
            batch-update-device-position \
            --tracker-name $1 \
            --updates $UPDATE

        LAT=$(echo "$LAT" | awk '{print $1 - 0.1}')
        LONG=$(echo "$LONG" | awk '{print $1 + 0.1}')
        sleep 10
    done

echo All done