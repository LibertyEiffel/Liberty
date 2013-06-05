#!/bin/bash

export plain=${plain:-FALSE}
if [ x$1 = x-plain ]; then
    plain=TRUE
fi

root=$(cd $(dirname $(readlink -f $0))/..; pwd)
DOC_ROOT=${DOC_ROOT:-$root/website/doc}
export DOC_ROOT
export LOG=$DOC_ROOT/build_doc$(date +'-%Y%m%d-%H%M%S').log

. $root/work/tools.sh

title Cleanup
rm -rf $DOC_ROOT/build_doc-*.log $DOC_ROOT/api

title Building
eval $(
    while read section remote; do
        echo sedoc_url_$section=http://doc.liberty-eiffel.org/api/$section
        echo sedoc_rem_$section=$remote
    done <<EOF
libraries   liberty:lib
smarteiffel tools
wrappers    liberty:wrappers
liberty     liberty:tools
tutorial    tutorial
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
    progress 30 $i $n $section
    s=$DOC_ROOT/api/$section
    test -d $s || mkdir -p $s
    cd $s
    run se doc -verbose -title "Section:\\\\ $section" -short_title "$section" \
        -wiki_prefix "http://wiki.liberty-eiffel.org/" \
        -menu_separator '"\\|\\ "' -ariadne_separator '"\\>\\ "' \
        -menu "http://www.gnu.org/software/liberty-eiffel/" '"GNU"' \
        -menu "http://www.liberty-eiffel.org" '"Liberty\\ Eiffel"' \
        -menu "http://et.liberty-eiffel.org" '"Automated\\ Tests"' \
        -menu "http://wiki.liberty-eiffel.org" '"Wiki"' \
        -menu "https://savannah.gnu.org/projects/liberty-eiffel/" '"Savannah\\ project"' \
        -menu "http://doc.liberty-eiffel.org" '"Documentation"' \
        -js "$root/resources/eiffeldoc/eiffeldoc.js" -css "$root/resources/eiffeldoc/eiffeldoc.css" \
        -prune test -prune Local $args
done

status=$(grep '^se failed with status' $LOG | awk 'BEGIN {i = 0} {if (NF > 0) {i += $NF} else {i++}} END {printf("%d\n", i)}')

progress 30 $n $n "Finished with status $status."
echo
exit $status
