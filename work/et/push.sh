#!/bin/bash
cd /home/et/Liberty_savannah

{
    git fetch origin
    echo
    for branch in $(git branch | cut -c3-); do
        git checkout $branch
        echo
        git merge --ff-only origin/$branch
    done
} 2> pull.err > ../pull.out

git push github : 2> push.err > ../push.out
