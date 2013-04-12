#!/bin/bash

export plain=${plain:-FALSE}
if [ x$1 = x-plain ]; then
    plain=TRUE
fi

root=$(cd $(dirname $(readlink -f $0))/..; pwd)
doc_root=$root/website/doc
export LOG=$doc_root/build_doc$(date +'-%Y%m%d-%H%M%S').log

. $root/work/tools.sh

title Cleanup
rm -rf $doc_root/build_doc-*.log $doc_root/api

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
    s=$doc_root/api/$section
    test -d $s || mkdir -p $s
    cd $s
    run se doc -verbose -title "Section:\\\\ $section" \
        -wiki_prefix "http://wiki.liberty-eiffel.org/" -home_address "http://doc.liberty-eiffel.org/" \
        -js "$root/resources/eiffeldoc/eiffeldoc.js" -css "$root/resources/eiffeldoc/eiffeldoc.css" \
        -prune test -prune Local $args
done

status=$(grep '^se failed with status' $LOG | awk 'BEGIN {i = 0} {i += $NF} END {print i}')

if [ $status -gt 0 ]; then
    progress 30 $n $n Failed.
    echo
    exit $status
fi

progress 30 $n $n Done.
echo
