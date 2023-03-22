#bin/bash/
. ./info.sh

save() {
read -p "Do you want to save the information to a file: (Y/N)" res
    if [ "$res" == "Y" ] || [ "$res" == "y" ] 
    then
        info "$(date "+%d_%m_%y_%H_%S").status"
    fi
}

main() {
    info
    save
}

main