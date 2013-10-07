#!/bin/bash
cd /home/et/Liberty_savannah
branch=`cat ~/branch`
{
    git fetch origin
    echo
    git checkout $branch
} > ../pull.out
git push github $branch 2> push.err > ../push.out
