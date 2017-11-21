cd x11r7
cp Config.in Config.in.tmp
cat Config.in.tmp | \
while read cmd line; do
    case $cmd in
	menu)
	    if [ -z "$menu1" ]; then
		menu1="$line"
	    else
		if [ -z "$menu2" ]; then
		    menu2="$line"
		else
		    if [ -z "$menu3" ]; then
			menu3="$line"
		    else
			if [ -z "$menu4" ]; then
			    menu4="$line"
			else
			    :
			    echo "######error too deep"
			fi
		    fi
		fi
	    fi
	;;
	endmenu)
	    if [ ! -z "$menu4" ]; then
		menu4=
	    else
		if [ ! -z "$menu3" ]; then
		    menu3=
		else
		    if [ ! -z "$menu2" ]; then
			menu2=
		    else
			if [ ! -z "$menu1" ]; then
			    menu1=
			else
			    :
			    echo "######extra endmenu"
			fi
		    fi
		fi
	    fi
	;;
	source)
	;;
	\#*|endif*|if*)
	;;
	comment)
	;;
	depends)
	;;
    esac

    case "$cmd" in
	\#*|if|menu|endmenu|endif|depends|comment|"")
	    continue
	;;
    esac

    if [ -z "$menu4" ]; then
	if [ -z "$menu3" ]; then
	    if [ -z "$menu2" ]; then
		if [ -z "$menu1" ]; then
		    :
		else
		    echo "$menu1 $cmd $line"
		fi
	    else
		echo "$menu2 $cmd $line"
	    fi
	else
	    echo "$menu3 $cmd $line"
	fi
    else
	echo "$menu4 $cmd $line"
    fi
done
