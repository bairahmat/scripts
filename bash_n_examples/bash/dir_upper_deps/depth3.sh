
find /sys/devices -path "/sys/devices/*" -type f -name "modalias" -printf "%2d/%h\n" | sort -r | cut -d / -f 2- | \
while read DIR; do

    ADIR=/sys/devices/
    RDIR=
    while [ "$ADIR$RDIR" != "$DIR" ]; do
	[ -z "$RDIR" ] && SDIR=${DIR/$ADIR/} || SDIR=${DIR/$ADIR$RDIR\//}
	[ -z "$RDIR" ] && RDIR=${SDIR%%/*} || RDIR=$RDIR/${SDIR%%/*}

	if [ -e "$ADIR$RDIR/modalias" ]; then
	    echo "path=$ADIR$RDIR"
	    echo "modalias=$(< "$ADIR$RDIR/modalias")"
	    MODULE=`modprobe -R "$(< "$ADIR$RDIR/modalias")" 2> /dev/null`
	    [ ! -z "$MODULE" ] && echo "$MODULE" | sed 's/.*/mod=&/'
	    if [ -e "$DIR/driver" ]; then
		cd "$DIR/driver"
		[ -e ./module ] && MOD=`basename "$(readlink ./module)"` && echo "module=$MOD"
	    fi
	fi
    done

    echo
done
