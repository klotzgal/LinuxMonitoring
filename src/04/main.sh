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
