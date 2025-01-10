#!/usr/bin/env bash

# CPU Temp monitor

paste <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp) | column -s $'\t' -t | sed 's/\(.\)..$/.\1°C/' | awk '{print $2}' | tail -n +2 | cut -c 1-2
