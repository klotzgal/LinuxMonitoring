#bin/bash/
end="\033[0m"

color() {
    local font_color=$1
    local bg_color=$2

    case "$font_color" in
        1) f="\033[97m";;
        2) f="\033[91m";;
        3) f="\033[92m";;
        4) f="\033[96m";;
        5) f="\033[95m";;
        6) f="\033[30m";;
    esac

    case "$bg_color" in
        1) color_string="${f}\033[107m";;
        2) color_string="${f}\033[101m";;
        3) color_string="${f}\033[102m";;
        4) color_string="${f}\033[106m";;
        5) color_string="${f}\033[105m";;
        6) color_string="${f}\033[40m";;
    esac

    echo "$color_string"
}

info() {

printf "$(color $1 $2)HOSTNAME =${end} $(color $3 $4)$(hostname)${end}\n"
printf "$(color $1 $2)TIMEZONE =${end} $(color $3 $4)$(timedatectl | grep zone | awk '{print $3}')${end}\n"
printf "$(color $1 $2)USER =${end} $(color $3 $4)$(whoami)${end}\n"
printf "$(color $1 $2)OS =${end} $(color $3 $4)$(uname -sr)${end}\n" 
printf "$(color $1 $2)DATE =${end} $(color $3 $4)$(date "+%d %B %Y %H:%M:%S")${end}\n" 
printf "$(color $1 $2)UPTIME =${end} $(color $3 $4)$(uptime -p)${end}\n"
printf "$(color $1 $2)UPTIME_SEC =${end} $(color $3 $4)$(cat /proc/uptime | awk '{print $1}')${end}\n" 
printf "$(color $1 $2)IP =${end} $(color $3 $4)$(ifconfig | grep "inet " | awk '{if (NR == 1)  print $2}')${end}\n"
printf "$(color $1 $2)MASK =${end} $(color $3 $4)$(ifconfig | grep "netmask" | awk '{if (NR == 1) print $4}')${end}\n"
printf "$(color $1 $2)GATEWAY =${end} $(color $3 $4)$(ip r | awk '{if (NR == 1) print $3}')${end}\n"
printf "$(color $1 $2)RAM_TOTAL =${end} $(color $3 $4)$(free | grep "Mem" | awk '{printf "%.3f GB\n", $2 / 1024 / 1024}')${end}\n"
printf "$(color $1 $2)RAM_USED =${end} $(color $3 $4)$(free | grep "Mem" | awk '{printf "%.3f GB\n", $3 / 1024 / 1024}')${end}\n"
printf "$(color $1 $2)RAM_FREE =${end} $(color $3 $4)$(free | grep "Mem" | awk '{printf "%.3f GB\n", $4 / 1024 / 1024}')${end}\n"
printf "$(color $1 $2)SPACE_ROOT =${end} $(color $3 $4)$(df / -m | awk '{if (NR == 2) printf "%.2f MB\n", $2}')${end}\n"
printf "$(color $1 $2)SPACE_ROOT_USED =${end} $(color $3 $4)$(df / -m | awk '{if (NR == 2) printf "%.2f MB\n", $3}')${end}\n"
printf "$(color $1 $2)SPACE_ROOT_FREE =${end} $(color $3 $4)$(df / -m | awk '{if (NR == 2) printf "%.2f MB\n", $4}')${end}\n"

}

test() {
    for ((i = 1; i < 7; i++)) do
        for ((j = 1; j < 7; j++)) do
            printf "$(color $i $j)test${end}\n"
        done
        printf "\n"
    done
}