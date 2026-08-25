#!/bin/bash

set -eo pipefail

free_storage=$(system_profiler SPStorageDataType 2>/dev/null | grep -C 5 "Data:" | grep "Free: " | awk -F': ' '{print $2}')
if [ -z "$free_storage" ]; then
    free_storage="unkown"
fi

total_storage=$(system_profiler SPStorageDataType 2>/dev/null | grep -C 5 "Data:" | grep "Capacity: " | awk -F': ' '{print $2}')
if [ -z "$total_storage" ]; then
    total_storage="unkown"
fi

battery=$(system_profiler SPPowerDataType 2>/dev/null | grep "State of Charge" | awk -F': ' '{print $2}')
if [ -z "$battery" ]; then
    battery="unkown"
fi

capacity=$(system_profiler SPPowerDataType 2>/dev/null | grep "Maximum Capacity" | awk -F': ' '{print $2}')
if [ -z "$capacity" ]; then
    capacity="unkown"
fi

echo "Free Storage: "$free_storage""
echo "Total Storage: "$total_storage""
echo "Current Charge: "$battery"%"
echo "Maximum Capacity: "$capacity""