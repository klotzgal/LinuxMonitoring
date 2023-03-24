#bin/bash/

# dir="/Users/klotzgal/Desktop/kl/LinuxMonitoring/"

if [ -n "$1" ]
then
    dir=$1
else
    dir="/var/log/"
fi


total_folders="$(find $dir -type d | wc | awk '{print $1}')"
total_files="$(find $dir -type f | wc | awk '{print $1}')"


echo "Total number of folders (including all nested ones) = $total_folders"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
top_5=$(du -hd 1 ${dir%?} | sort -rh | head -n 5 | awk '{print NR" - "$2"/, "$1}' | column -t)
echo "$top_5"

conf_count="$(find $dir -type f -name "*.conf" | wc | awk '{print $1}')"
text_count="$(find $dir -type f -name "*.txt" | wc | awk '{print $1}')"
exe_count="$(find $dir -type f -executable | wc | awk '{print $1}')"
log_count="$(find $dir -type f -name "*.log" | wc | awk '{print $1}')"
arc_count="$(find $dir -type f -name "*.zip" | wc | awk '{print $1}')"
link_count="$(find $dir -type l | wc | awk '{print $1}')"

echo "Total number of files = $total_files"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $conf_count"
echo "Text files = $text_count"
echo "Executable files = $exe_count"
echo "Log files (with the extension .log) = $log_count"
echo "Archive files = $arc_count"
echo "Symbolic links = $link_count"

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"

top_files=$(find $dir -type f -printf '%p %s\n' | sort -rh | head -n 10)
path=$($top_files | awk '{print $1}')
size=$($top_files | awk '{print $2}')
type=$($path | awk -F . '{if (NF>1) {print $NF}}')

count=1
while read -r str
do
    path=$(echo "$str" | awk '{print $1}')
    size=$(echo "$str" | awk '{print $2}')
    type=$(echo "$str" | awk -F . '{if (NF>1) {print $NF}}')

    echo "count - $path, $size, $type"
    count=$[$count + 1]
done <<< $top_files





echo ""
echo ""
echo "$top_files"
echo ""
echo ""
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
echo ""
echo "Script execution time (in seconds) = "





# find ".." -type f -printf '%p %s\n' | sort -rh | head -n 10 | awk '{print NR " - " $1" " $2 }' | awk -F . '{if (NF>1) {print $NF}}'



