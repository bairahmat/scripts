#set -x
IFS=
cont=
ocont=
found=
numpattern1=
foundpt1=
#'[\]$'
#"\$(STAGING_DIR)\|\$(TARGET_DIR)"
#"\$(STAGING_DIR)\|\$(TARGET_DIR)"
#(sh _find_cp_in_mk18.sh; echo "+++") | \
(find -mindepth 2 -type f -name "*.mk" | \
while read line; do
    sh /bin/_find_file_section.sh -n -e -x $line "\$(STAGING_DIR)\|\$(TARGET_DIR)" "\$(STAGING_DIR)\|\$(TARGET_DIR)"
done; echo "+++") | \
while read -r line; do
case "$line" in
---*:[0-9]*)
    [ "$ocont" = 1 ] && [ ! -z "$found" ] && echo "$found"
    NNUM=0
    FILE=`echo "$line" | sed -e 's%^---%%' -e 's%:.*%%'`
    NUM=`echo "$line" | cut -d : -f 2-`
    #[ "$OFILE" != "$FILE" ] && echo "---$FILE" && OFILE="$FILE"
    numpattern1=
    foundpt1=
    found=
    ocont=
;;
+++)
    [ "$ocont" = 1 ] && [ ! -z "$found" ] && echo "$found"
    numpattern1=
    foundpt1=
    found=
    ocont=
;;
*)
    NNUM=$(expr $NNUM + 1)
    LINE=$(echo "$line" | sed 's%[\]$%%')

    [ "$line" != "$(echo "$line" | sed 's%[\]$%%')" ] && cont=1 || cont=

##(patt && patt) || zero variable
    echo "$LINE" | grep -q "\$(STAGING_DIR)" && numpattern1=$(expr $NUM + $NNUM - 1)
    echo "$LINE" | grep -q "\$(TARGET_DIR)" && foundpt1=1

    if [ "$foundpt1" = 1 ]; then
	if [ ! -z "$numpattern1" ]; then
	    found="$FILE:$numpattern1"
	    numpattern1=
	    foundpt1=
	fi
    fi

    if [ -z "$cont" ]; then
	[ ! -z "$found" ] && echo "$found"
	numpattern1=
	foundpt1=
	found=
    fi

    ocont="$cont"
;;
esac
done
