#!/bin/bash

export plain=${plain:-FALSE}
export zip=${zip:-FALSE}
export gdb=${gdb:-FALSE}

declare -a sections=()

declare -A known_sections
known_sections[liberty]=tools:
known_sections[libraries]=liberty_core:
known_sections[smarteiffel]=smarteiffel:
known_sections[tutorial]=tutorial:
known_sections[wrappers]=liberty_extra:
known_sections[staging]=liberty_staging:

while [ -n "$1" ]; do
    case $1 in
        -plain)
            plain=TRUE
            ;;
        -zip)
            zip=TRUE
            ;;
        -gdb)
            gdb=TRUE
            ;;
        -*)
            {
                echo "Unknown option: $1"
                echo
            } >&2
            exit 1
            ;;
        *)
            if [[ -n "${known_sections[$1]}" ]]; then
                sections=("${sections[@]}" "$1")
            else
                {
                    echo "Unknown section: $1"
                    echo
                    echo "Known sections are: ${!known_sections[@]}"
                    echo
                } >&2
                exit 1
            fi
            ;;
    esac
    shift
done

if [[ ${#sections[@]} == 0 ]]; then
    sections=(${!known_sections[@]})
fi

echo "Sections: ${sections[@]}"

root=$(cd $(dirname $(readlink -f $0))/..; pwd)
DOC_ROOT=${DOC_ROOT:-$root/website/doc}
export DOC_ROOT
export SUMLOG=${LOG:-$DOC_ROOT/build_doc$(date +'-%Y%m%d-%H%M%S').log}

echo "Log is $SUMLOG"

. $root/work/tools.sh

title Cleanup
rm -rf $DOC_ROOT/build_doc-*.log $DOC_ROOT/api

title Building

set_sedoc_vars() {
    for section in "${!known_sections[@]}"; do
        echo sedoc_url_$section=http://doc.liberty-eiffel.org/api/$section
        remote=${known_sections[$section]}
        echo sedoc_rem_$section=$remote
    done
}

eval $(set_sedoc_vars)
n=$(typeset | grep ^sedoc_url_ | wc -l)

tty=$(tty)

index=0
for section in "${sections[@]}"; do
    echo -n $index $section
    set_sedoc_vars | grep ^sedoc_url_ | awk -F= '{print $1}' | awk -F_ '{print $3}' | while read other; do
        if [[ $section != $other ]]; then
            echo -n " -remote $(eval echo \$sedoc_rem_${other}) $(eval echo \$sedoc_url_${other})"
        fi
    done
    echo
    index=$((index + 1))
done | while read i section args; do
    export LOG=$DOC_ROOT/build_doc$(date +'-%Y%m%d-%H%M%S')_$section.log
    echo "Log for $section is $LOG" >> $SUMLOG
    echo "Arguments for $section: $args" >> $LOG

    progress 30 $i $n $section
    s=$DOC_ROOT/api/$section
    test -d $s || mkdir -p $s
    cd $s
    declare -a all_args=(-verbose -title "Section:\\\\ $section" -short_title "$section" \
        -wiki_prefix "http://wiki.liberty-eiffel.org/" \
        -menu_separator '"\\|\\ "' -ariadne_separator '"\\>\\ "' \
        -menu "http://www.gnu.org/software/liberty-eiffel/" '"GNU"' \
        -menu "http://www.liberty-eiffel.org" '"Liberty\\ Eiffel"' \
        -menu "http://et.liberty-eiffel.org" '"Automated\\ Tests"' \
        -menu "http://wiki.liberty-eiffel.org" '"Wiki"' \
        -menu "https://savannah.gnu.org/projects/liberty-eiffel/" '"Savannah\\ project"' \
        -menu "http://apt.liberty-eiffel.org" '"Debian\\ packages"' \
        -menu "http://doc.liberty-eiffel.org" '"Documentation"' \
        -js "$root/resources/eiffeldoc/eiffeldoc.js" -css "$root/resources/eiffeldoc/eiffeldoc.css" \
        -prune test -prune Local $args)
    if [[ $gdb == TRUE ]]; then
        cmd=$(se -environment|grep SE_BIN=|awk -F= '{print $2}')/eiffeldoc
        gdb $cmd --args $cmd "${all_args[@]}" <>$tty
    elif run se doc "${all_args[@]}"; then
        if [[ $zip == TRUE ]]; then
            cd $DOC_ROOT/api
            tar cfz ${section}.tgz $section
            if [[ $plain != TRUE ]]; then
                rm -rf $section
            fi
        fi
    fi

    grep '^se failed with status' $LOG >> $SUMLOG
done

export LOG=$SUMLOG
status=$(grep '^se failed with status' $SUMLOG | awk 'BEGIN {i = 0} {if (NF > 0) {i += $NF} else {i++}} END {printf("%d\n", i)}')
progress 30 $n $n "Finished with status $status."
echo
exit $status
