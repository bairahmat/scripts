contpatt="[\]$"
#patt1="err"
#patt2="asd"

patt1="err"
patt2="asd"
patt3="use"
nopatt="fgh"
#patt1="\$(STAGING_DIR)"
#patt2="\$(TARGET_DIR)"
sect_start="$patt1\|$patt2"
sect_stop="$patt1\|$patt2"

find -mindepth 2 -type f -name "*.mk" | \
while read file; do
#    sh /bin/_find_file_section.sh -c -n -e -x "$file" "$sect_start" "$sect_stop"
    sh _find_file_section.sh -c -n -e "$file" "^define" "^endef"
#done | sh _find_format_pattern.sh -c "$contpatt" "$patt1" "$patt2"
#done | sh _find_format_pattern97.sh -c -q -a -1 "$contpatt" "$patt1" "$patt2" "$patt3"
#done | sh _find_format_pattern80.sh -c -q "$contpatt" "$patt1" "$patt1" "$patt2" "$patt3"
#done | sh _find_format_pattern.sh -c -q -a -d "$nopatt" "$contpatt" "$patt1" "$patt2" "$patt3"
#done | sh _find_format_pattern.sh -q -l -j -x "$patt1"
#done | sh _find_format_pattern.sh -c -q -l "$contpatt" "$patt1"
done #| sh _find_format_pattern.sh -d -x "NCURSES" "\$(TARGET_DIR)" "\$(INSTALL)"
#done | sh _find_format_pattern.sh -c -q -j "$contpatt" "$patt1" "$patt1" "$patt3"
#done | sh _find_format_pattern.sh -c -P -I -- '[\\]$' "err" "$patt3"
#done | sh _find_format_pattern.sh -q -l -x "$patt2"
#done | sh _find_format_pattern.sh -c -q -l "$contpatt" "$patt2"
#done | sh _find_format_pattern.sh -c -q -l -j "$contpatt" "$patt2"
#done | sh _find_format_pattern.sh -c -d "$contpatt" "$patt2" "$patt1" "$patt3"
