#!/bin/bash

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2)}')
cpu_temp=$(cat /sys/class/thermal/thermal_zone*/temp 2>/dev/null | sort -n | tail -1)
cpu_temp=$((cpu_temp / 1000))

read gpu_usage gpu_temp <<<$(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,noheader,nounits | tr ', ' ' ')

printf " %s%%  %s°C   %s%%  %s°C" "$cpu_usage" "$cpu_temp" "$gpu_usage" "$gpu_temp"
