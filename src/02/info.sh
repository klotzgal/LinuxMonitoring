#bin/bash/

info() {
    # echo "$(lsof -a -p $$ -d 0,1,2)"
if [ -n "$1" ]
then
    exec 1>$1
fi

echo "HOSTNAME = $(hostname)"
echo "TIMEZONE = $(timedatectl | grep zone | awk '{print $3}')"
echo "USER = $(whoami)"
echo "OS = $(uname -sr)" 
echo "DATE = $(date "+%d %B %Y %H:%M:%S")" 
echo "UPTIME = $(uptime -p)"
echo "UPTIME_SEC = $(cat /proc/uptime | awk '{print $1}')" 
echo "IP = $(ifconfig | grep "inet " | awk '{if (NR == 1)  print $2}')"
echo "MASK = $(ifconfig | grep "netmask" | awk '{if (NR == 1) print $4}')"
echo "GATEWAY = $(ip r | awk '{if (NR == 1) print $3}')"
echo "RAM_TOTAL = $(free | grep "Mem" | awk '{printf "%.3f GB\n", $2 / 1024 / 1024}')"
echo "RAM_USED = $(free | grep "Mem" | awk '{printf "%.3f GB\n", $3 / 1024 / 1024}')"
echo "RAM_FREE = $(free | grep "Mem" | awk '{printf "%.3f GB\n", $4 / 1024 / 1024}')"
echo "SPACE_ROOT = $(df / -m | awk '{if (NR == 2) printf "%.2f MB\n", $2}')"
echo "SPACE_ROOT_USED = $(df / -m | awk '{if (NR == 2) printf "%.2f MB\n", $3}')"
echo "SPACE_ROOT_FREE = $(df / -m | awk '{if (NR == 2) printf "%.2f MB\n", $4}')"

exec 1>/dev/tty
}

# info log.txt
# info