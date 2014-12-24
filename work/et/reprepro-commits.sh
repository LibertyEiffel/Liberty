#!/bin/bash

cd $HOME/Liberty
status=0
count=0

if [[ -d website/apt/staging ]]; then
    for pkg in website/apt/staging/*.{deb,dsc}; do
        type=${pkg##*.}
        if [[ -e $pkg ]]; then
            if reprepro --basedir website/apt include$type commits $pkg; then
                count=$((count + 1))
                rm $pkg
            else
                echo "Could not deploy $pkg"
                status=$(($status + 1))
            fi
        fi
    done
fi

if [[ $count != 0 || $status != 0 ]]; then
    echo "Deploy count: $count"
    echo "Error count:  $status"
fi

exit $status
