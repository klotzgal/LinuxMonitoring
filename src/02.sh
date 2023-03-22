#bin/bash/


# i=$(hostname)
echo "HOSTNAME = $(hostname)"
echo "TIMEZONE = $(timedatectl | grep zone | awk '{print $3}')"
echo "USER = $(whoami)"
echo "OS = $(uname -sr)" 
echo "DATE = $(date "+%d %B %Y %H:%M:%S")" 
echo "UPTIME = $(uptime -p)"
echo "UPTIME_SEC = $(cat /proc/uptime | awk '{print $1}')" 
# IP = ip-адрес машины в любом из сетевых интерфейсов
# MASK = сетевая маска любого из сетевых интерфейсов в виде: xxx.xxx.xxx.xxx
# GATEWAY = ip шлюза по умолчанию
# RAM_TOTAL = размер оперативной памяти в Гб c точностью три знака после запятой в виде: 3.125 GB
# RAM_USED = размер используемой памяти в Гб c точностью три знака после запятой
# RAM_FREE = размер свободной памяти в Гб c точностью три знака после запятой
# SPACE_ROOT = размер рутового раздела в Mб с точностью два знака после запятой в виде: 254.25 MB
# SPACE_ROOT_USED = размер занятого пространства рутового раздела в Mб с точностью два знака после запятой
# SPACE_ROOT_FREE = размер свободного пространства рутового раздела в Mб с точностью два знака после запятой