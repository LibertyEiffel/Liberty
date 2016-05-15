#!/usr/bin/env bash

if [[ x$1 != x ]]; then
    if [ ! -f $1 ]
    then
        echo "the file '$1' does not exist"
        exit 1
    fi
    if [[ "$1" == *tar.gz ]]
    then
       DIR=${1%.*}
       DIR=${DIR%.*}
    else
        echo "filename shall end with .tar.gz and contain one directory with the same name as the filename (without .tar.gz)"
        exit 1
    fi
    echo "expecting $DIR"
    
    tar -zxvf $1 --exclude ".gitignore" --exclude-vcs --exclude ".travis.yml" --exclude "$DIR/misc" --exclude "$DIR/config" --exclude "test" --exclude "$DIR/website" --exclude "$DIR/work/debug" --exclude "$DIR/work/et" --exclude "$DIR/work/legacy" --exclude "$DIR/work/packaging" --exclude "$DIR/work/vim" --exclude "$DIR/work/libertyeiffel_ssh.tar.gz.enc" 
    
    mv $1 $1.bak
    tar -cvzf $1 $DIR
    
else
    echo "pass .tar.gz of the complete gitrepo as arguemnt"
    echo "you may get it from http://git.savannah.gnu.org/cgit/liberty-eiffel.git"
    echo
    echo "Note: this fill is modified by this script"
    exit 1
fi
