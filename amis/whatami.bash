#!/bin/bash

set -eo pipefail

model=$(system_profiler SPHardwareDataType 2>/dev/null | grep "Model Name" | awk -F': ' '{print $2}')
if [ -z "$model" ]; then
    model="unkown"
fi

chip=$(system_profiler SPHardwareDataType 2>/dev/null | grep "Chip" | awk -F': ' '{print $2}') 
if [ -z "$chip" ]; then
    chip="unkown"
fi

cores=$(system_profiler SPHardwareDataType 2>/dev/null | grep "Cores" | awk -F': ' '{print $2}')
if [ -z "$cores" ]; then
    cores="unknown"
fi

memory=$(system_profiler SPHardwareDataType 2>/dev/null | grep "Memory" | awk -F': ' '{print $2}')
if [ -z "$memory" ]; then
    memory="unknown"
fi

os=$(system_profiler SPSoftwareDataType 2>/dev/null | grep "System Version" | awk -F': ' '{print $2}' | awk -F'(' '{print $1}')
if [ -z "$os" ]; then
    os="unknown"
fi

kernel=$(system_profiler SPSoftwareDataType 2>/dev/null | grep "Kernel Version" | awk -F': ' '{print $2}')
if [ -z "$kernel" ]; then
    kernel="unknown"
fi

name=$(system_profiler SPSoftwareDataType 2>/dev/null | grep "Computer Name" | awk -F': ' '{print $2}')
if [ -z "$name" ]; then
    name="unknown"
fi

uptime=$(system_profiler SPSoftwareDataType 2>/dev/null | grep "Time since boot" | awk -F': ' '{print $2}')
if [ -z "$uptime" ]; then
    uptime="unknown"
fi

display=$(system_profiler SPDisplaysDataType 2>/dev/null | grep "Display Type" | awk -F': ' '{print $2}')
if [ -z "$display" ]; then
    display="unknown"
fi

resolution=$(system_profiler SPDisplaysDataType 2>/dev/null | grep "Resolution:" | awk -F': ' '{print $2}')
if [ -z "$resolution" ]; then
    resolution="unknown"
fi

graphics=$(system_profiler SPDisplaysDataType 2>/dev/null | grep "Chipset Model" | awk -F': ' '{print $2}')
if [ -z "$graphics" ]; then
    graphics="unknown"
fi

graphics_type=$(system_profiler SPDisplaysDataType 2>/dev/null | grep -m 1 "Type:" | awk -F': ' '{print $2}')
if [ -z "$graphics_type" ]; then
    graphics_type="unknown"
fi

gpu_cores=$(system_profiler SPDisplaysDataType 2>/dev/null | grep "Cores" | awk -F': ' '{print $2}')
if [ -z "$gpu_cores" ]; then
    gpu_cores="unknown"
fi

echo "OS: "$os""
echo "Kernel: "$kernel""
echo "Model Name: "$model""
echo "Uptime: "$uptime""
echo "Chip: "$chip""
echo "Cores: "$cores""
echo "Graphics: "$graphics""
echo "Type: "$graphics_type""
echo "Graphic Cores: "$gpu_cores""

echo "Memory: "$memory""
echo "Display: "$display""
echo "Resolution: "$resolution""