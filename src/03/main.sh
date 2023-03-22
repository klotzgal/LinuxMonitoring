#bin/bash/
. ./lib.sh

main() {
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
    info $1 $2 $3 $4
fi
}

main $1 $2 $3 $4


