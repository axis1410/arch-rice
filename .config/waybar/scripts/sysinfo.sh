#!/bin/bash
STATE_FILE="/tmp/waybar_sysinfo_mode"

if [ "$1" = "toggle-temp" ]; then
	current=$(cat "$STATE_FILE" 2>/dev/null || echo "0")
	[ "$current" = "1" ] && echo "0" >"$STATE_FILE" || echo "1" >"$STATE_FILE"
	pkill -SIGRTMIN+8 waybar
	exit 0
fi

if [ "$1" = "toggle-mem" ]; then
	current=$(cat "$STATE_FILE" 2>/dev/null || echo "0")
	[ "$current" = "2" ] && echo "0" >"$STATE_FILE" || echo "2" >"$STATE_FILE"
	pkill -SIGRTMIN+8 waybar
	exit 0
fi

mode=$(cat "$STATE_FILE" 2>/dev/null || echo "0")

# Gather all data upfront
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2)}')
cpu_temp=$(cat /sys/class/thermal/thermal_zone*/temp 2>/dev/null | sort -n | tail -1)
cpu_temp=$((cpu_temp / 1000))
gpu_usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | tr -d ' ')
gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits | tr -d ' ')
mem_used=$(free -h | awk '/^Mem:/{print $3}')
mem_total=$(free -h | awk '/^Mem:/{print $2}')
mem_pct=$(free | awk '/^Mem:/{printf "%d", $3/$2*100}')
disk_used=$(df -h / | awk 'NR==2{print $3}')
disk_total=$(df -h / | awk 'NR==2{print $2}')
disk_pct=$(df / | awk 'NR==2{print $5}' | tr -d '%')

case "$mode" in
1) text="CPU ${cpu_temp}°C  GPU ${gpu_temp}°C" ;;
2) text="MEM ${mem_used}/${mem_total}  DISK ${disk_used}/${disk_total}" ;;
*) text="CPU ${cpu_usage}%  GPU ${gpu_usage}%" ;;
esac

tooltip="CPU Usage:  ${cpu_usage}%\nCPU Temp:   ${cpu_temp}°C\n \nGPU Usage:  ${gpu_usage}%\nGPU Temp:   ${gpu_temp}°C\n \nMemory:     ${mem_used} / ${mem_total}  (${mem_pct}%)\nDisk (/):   ${disk_used} / ${disk_total}  (${disk_pct}%)"

printf '{"text": "%s", "tooltip": "%s"}\n' "$text" "$tooltip"
