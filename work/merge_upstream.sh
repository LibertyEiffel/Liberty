#!/bin/bash

cd $(dirname $0)/..

. ./work/tools.sh

list_remotes() {
    git remote | grep -v 'key|origin|master'
}

branch=$(git branch | awk '/^\*/ {print $2}')
n=$(git remote | wc -l)

title "Fetching branches"
i=0
for remote in $(list_remotes); do
    progress 30 $i $n $remote
    git fetch $remote
    i=$((i+1))
done
progress 30 $i $n done.
echo

title "Switching to upstream branch"
git checkout -q upstream/master

title "Merging branches"
i=0
for remote in $(list_remotes); do
    progress 30 $i $n $remote
    git merge -q remotes/$remote/master
    while [ $(git ls-files -u | wc -l) -gt 0 ]; do
        echo
        echo "There were conflicts while merging $remote:"
        git ls-files -u
        echo "Please solve them and press RETURN to continue."
        read
    done
    i=$((i+1))
done
progress 30 $i $n done.
echo

title "Pushing back upstream"
git push upstream

title "Back to branch $branch"
git checkout -q $branch
