#!/bin/bash

# Retrieve CPU Statistics using mpstat
all_cpu=$(mpstat -P ALL)

# Extract total usage (from the "all" line, last column)
cpu_usage=$(echo "$all_cpu" | grep all | awk '{print 100 - $NF}' | sed 's/,/./')

# Display the CPU usage percentage
echo "CPU Usage: $cpu_usage%"

# Display total, used, and free memory
free -b | awk 'NR==2 {
	total=$2; used=$3; free=$4;
	printf "Total Memory: %.2f Go\n", total/1024/1024/1024;
	printf "Used Memory: %.2f Go (%.2f%%)\n", used/1024/1024/1024, (used/total)*100;
	printf "Free Memory: %.2f Go (%.2f%%)\n", free/1024/1024/1024, (free/total)*100;
	}'
	
# Display disk usage
df -h / | awk 'NR==2 {
    total=$2; used=$3; free=$4;
    printf "Total Disk: %s\n", total;
    printf "Used Disk: %s (%.2f%%)\n", used, (used/total)*100;
    printf "Free Disk: %s (%.2f%%)\n", free, (free/total)*100;
}' 

# Retrieve top 5 processes by CPU usage
top5_cpu=$(ps -eo %cpu,comm,pid --sort=-%cpu | head -n 6)

# Format and display the top 5 processes by CPU usage
top5_cpu_percent=$(echo "$top5_cpu" | awk 'NR==1 {print "CPU% Process PID"};NR>1 {print $1, $2, $3}')

echo "Top 5 processus par %CPU :"
echo "$top5_cpu_percent"

# Retrieve top 5 processes by memory usage
top5_mem=$(ps -eo %mem,comm,pid --sort=-%mem | head -n 6)

#Format and display the top 5 processes by memory usage
top5_mem_percent=$(echo "$top5_mem" | awk 'NR==1 {print "MEM% Process PID"};NR>1 {print $1, $2, $3}')

echo "Top 5 processus par %MEM :"
echo "$top5_mem_percent"
