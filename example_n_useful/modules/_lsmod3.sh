find /sys/devices -name modalias -print0 | xargs -r -0 cat | xargs -r -i modprobe -R "{}" 2> /dev/null | \
    sort -u | \
while read line; do
    PARMS=`modinfo "$line" | grep "^parm:"` && echo -ne "****$line****\n$PARMS\n\n"
done
