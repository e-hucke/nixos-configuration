#!/bin/sh

output=$(nvidia-smi --query-gpu=utilization.gpu,memory.used,memory.total,temperature.gpu --format=csv,noheader,nounits)

gpu_util=$(echo "$output" | cut -d',' -f1 | tr -d ' ')
mem_used=$(echo "$output" | cut -d',' -f2 | tr -d ' ')
mem_total=$(echo "$output" | cut -d',' -f3 | tr -d ' ')
temp=$(echo "$output" | cut -d',' -f4 | tr -d ' ')

text=" ${gpu_util}% ${temp}°C"
tooltip="GPU Utilization: ${gpu_util}%\nMemory: ${mem_used}MiB / ${mem_total}MiB\nTemperature: ${temp}°C"

class=""
if [ "$temp" -gt 85 ]; then
    class="critical"
elif [ "$temp" -gt 75 ]; then
    class="warning"
fi

printf '{"text":"%s", "tooltip":"%s", "class":"%s"}\n' "$text" "$tooltip" "$class"