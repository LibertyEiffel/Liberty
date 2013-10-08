#!/bin/bash
cd /home/et/Liberty_savannah
branch=`cat ~/branch`
{
    git checkout $branch
    echo
    git pull origin
} > ../pull.out
git push github $branch 2> push.err > ../push.out
