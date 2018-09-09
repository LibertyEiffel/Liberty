#!/usr/bin/env bash

# This file is part of Liberty Eiffel.
#
# Liberty Eiffel is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3 of the License.
#
# Liberty Eiffel is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.

# tool to update the copyright year in the Liberty source tree
# usage: cd Liberty work/patch_copyright.sh

export LIBERTY_HOME=$(cd $(dirname $(readlink -f $0))/..; pwd)
export DIRS="src test sys tutorial work"

echo "patching copyright year in $LIBERTY_HOME"

for s in $DIRS; do
    DIR=$LIBERTY_HOME/$s
    echo "working in $DIR"
    # replace "Copy\right *" by "Copy\right (C) *-<current>" if INRIA is not found on the line
    find $DIR -type f -not -name *.el -not -name LICENSE -not -name *.xml -not -name *.dtd -not -name *.html -exec perl -i -ne 's/(.*Copyright)[ ]?(\([cC]\))? ([0-9][0-9][0-9][0-9])-?([0-9][0-9][0-9][0-9])?([ ]*[:]?[ ]+)?([^-](?:(?!INRIA).)*)$/\1 (C) \3-2018: \6/g; print;' {} \;

done
