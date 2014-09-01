#!/bin/bash

export plain=${plain:-FALSE}
export zip=${zip:-FALSE}

while [ -n "$1" ]; do
    case $1 in
        -plain)
            plain=TRUE
            ;;
        -zip)
            zip=TRUE
            ;;
        *)
            echo "Unknown argument: $1" >&2
            exit 1
            ;;
    esac
    shift
done

root=$(cd $(dirname $(readlink -f $0))/..; pwd)
DOC_ROOT=${DOC_ROOT:-$root/website/doc}
export DOC_ROOT
export LOG=${LOG:-$DOC_ROOT/build_doc$(date +'-%Y%m%d-%H%M%S').log}

echo "Log is $LOG"
SUMLOG=$LOG

. $root/work/tools.sh

title Cleanup
rm -rf $DOC_ROOT/build_doc-*.log $DOC_ROOT/api

title Building
eval $(
    while read section remote; do
        echo sedoc_url_$section=http://doc.liberty-eiffel.org/api/$section
        echo sedoc_rem_$section=$remote
    done <<EOF
liberty     tools
libraries   liberty_core
smarteiffel smarteiffel
tutorial    tutorial
wrappers    liberty_extra
EOF
)
n=$(typeset | grep ^sedoc_url_ | wc -l)

index=0
typeset | grep ^sedoc_url_ | awk -F= '{print $1}' | awk -F_ '{print $3}' | while read section; do
    echo -n $index $section
    typeset | grep ^sedoc_url_ | awk -F= '{print $1}' | awk -F_ '{print $3}' | while read other; do
        if [ $section != $other ]; then
            echo -n " -remote $(eval echo \$sedoc_rem_${other}) $(eval echo \$sedoc_url_${other})"
        fi
    done
    echo
    index=$((index + 1))
done | while read i section args; do
    export LOG=$DOC_ROOT/build_doc$(date +'-%Y%m%d-%H%M%S')_$section.log
    echo "Log for $section is $LOG" >> $SUMLOG

    progress 30 $i $n $section
    s=$DOC_ROOT/api/$section
    test -d $s || mkdir -p $s
    cd $s
    if run se doc -verbose -title "Section:\\\\ $section" -short_title "$section" \
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
        -prune test -prune Local $args; then

        if [ $zip == TRUE ]; then
            cd $DOC_ROOT/api
            tar cfz ${section}.tgz $section
            rm -rf $section
        fi
    fi

    grep '^se failed with status' $LOG >> $SUMLOG
done
LOG=$SUMLOG
status=$(grep '^se failed with status' $LOG | awk 'BEGIN {i = 0} {if (NF > 0) {i += $NF} else {i++}} END {printf("%d\n", i)}')
progress 30 $n $n "Finished with status $status."
echo
exit $status
