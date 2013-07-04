#!/bin/sh
cd /home/et/Liberty_savannah
git pull > ../pull.out
git push github master 2> push.err > ../push.out
