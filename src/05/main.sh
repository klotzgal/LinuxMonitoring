#bin/bash/
. ./lib.sh

main() {
        if [ -z $1 ]
    then
        echo "Error. Enter the path to the directory"
        exit 1
    fi

    if [ ! -d $1 ]
    then
        echo "Error: No such file or directory"
        exit 1
    fi

    dir=$1
    if [ ${dir:-1} != '/' ]
    then
        dir="$dir/"
    fi
    monitoring $dir
}

main $1