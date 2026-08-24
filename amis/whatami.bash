#!/bin/bash

set -eo pipefail

chip=$(system_profiler SPHardwareDataType 2>/dev/null | grep "Chip" | awk -F': ' '{print $2}') 
if [ -z "$chip" ]; then
    chip="unkown"
fi
echo "$chip"

model=$(system_profiler SPHardwareDataType 2>/dev/null | grep "Model Name" | awk -F': ' '{print $2}')
if [ -z "$model" ]; then
    model="unkown"
fi
echo "$model"

cores=$(system_profiler SPHardwareDataType 2>/dev/null | grep "Cores" | awk -F': ' '{print $2}')
if [ -z "$cores" ]; then
    cores="uknown"
fi
echo "$cores"

memory=$(system_profiler SPHardwareDataType 2>/dev/null | grep "Memory" | awk -F': ' '{print $2}')
if [ -z "$memory" ]; then
    memory="uknown"
fi
echo "$memory"