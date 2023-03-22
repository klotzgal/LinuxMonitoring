#bin/bash/

re1=^[0-9]*$
re2=^[0-9]+[.,]?[0-9]+$

main() {
if   [[ $1 =~ $re1 ]] || [[ $1 =~ $re2 ]] ; then
    echo "некорректный ввод"
else
    echo $1 
fi
}

main $1
