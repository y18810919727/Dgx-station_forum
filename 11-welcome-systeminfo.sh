#!/bin/sh
# 欢迎界面系统信息脚本
USERNAME=`whoami`

# System load
MEMORY1=`free -t -m | grep "Mem" | awk '{print $3" MB";}'`
MEMORY2=`free -t -m | grep "Mem" | awk '{print $2" MB";}'`
GPU=`nvidia-smi --query-gpu=utilization.gpu --format=csv|awk 'BEGIN{ORS="%, "}{if(NR!=1){print $1}}'`
LOAD1=`cat /proc/loadavg | awk {'print $1'}`
LOAD5=`cat /proc/loadavg | awk {'print $2'}`
LOAD15=`cat /proc/loadavg | awk {'print $3'}`
User=`who|awk '{print $1}'|sort|uniq -c|awk 'BEGIN{ORS=","}{print $0}'`

echo "
                    AI  3D
===============================================
 - Username            : $USERNAME
 - GPU usage           : $GPU
 - CPU average         : $LOAD1, $LOAD5, $LOAD15 (1, 5, 15 min)
 - Memory used         : $MEMORY1/ $MEMORY2
 - Current Online User : $User
===============================================
"
