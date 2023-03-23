#bin/bash/
. ./lib.sh

palitra=(white red green blue purple black)

valid() {
for i in $1 $2 $3 $4; do
    if [[ $i < 1 || $i > 6 ]] 
    then
        echo "Неверный аргумент. Вводите числа от 1 до 6"
        exit 1
    fi
done

if [ $# != 4 ] 
then
    echo "Неверное число параметров"

elif [ $1 -eq $2 ] || [ $3 -eq $4 ]
then 
    echo "Цвет текста и фона совпадает. Попробуйте ещё раз"

else
    return 1
fi
}

read_config() {
    . colors.conf
	export c1=$column1_background
    if [ -z $c1 ]; then c1="default"; else mass[0]=$c1; fi
	export c2=$column1_font_color
    if [ -z $c2 ]; then c2="default"; else mass[1]=$c2; fi
	export c3=$column2_background
    if [ -z $c3 ]; then c3="default"; else mass[2]=$c3; fi
	export c4=$column2_font_color
    if [ -z $c4 ]; then c4="default"; else mass[3]=$c4; fi

    # for ((i = 0; i < 4; i++)) do
    #     if mass[$i]
    # done
}

print_config() {
    echo "\nColumn 1 background = ${mass[0]} (${palitra[c1 - 1]})"
    echo "Column 1 font color = ${mass[1]} (${palitra[c2 - 1]})"
    echo "Column 2 background = ${mass[2]} (${palitra[c3 - 1]})"
    echo "Column 2 font color = ${mass[3]} (${palitra[c4 -1 ]})"
}

default_config() {
    if [ $1 = "default" ]; then c1=6; mass[0]=$1; fi
    if [ $2 = "default" ]; then c2=1; mass[1]=$2; fi
    if [ $3 = "default" ]; then c3=2; mass[2]=$3; fi
    if [ $4 = "default" ]; then c4=4; mass[3]=$4; fi
}

main() {
    read_config
    default_config $c1 $c2 $c3 $c4
    valid $c1 $c2 $c3 $c4
    if [ $? == 1 ] 
    then
        info $c1 $c2 $c3 $c4
        print_config
    fi
}

main $c1 $c2 $c3 $c4
