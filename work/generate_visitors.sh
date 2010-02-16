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

cd ${0%/*}
p=$(pwd)
p=${p%/*}

cd $p/src/tools/semantics/code/visitors

rm -f *.e *.bak

for type in ASSERTION ENTITY EXPRESSION FEATURE INSTRUCTION; do
    what=$(echo $type | tr '[A-Z]' '[a-z]')
    dir=${what}s
    test $dir == "entitys" && dir=entities

    visitor=liberty_${what}_visitor.e

    echo Generating ${dir}

    cat > $visitor <<EOF
-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
deferred class LIBERTY_${type}_VISITOR
inherit
EOF
    for f in ../${dir}/*.e; do
	if ! grep -q 'deferred class' $f; then
	    f=${f##*/}; f=${f%.e}
	    c=$(echo $f | tr '[a-z]' '[A-Z]')
	    g=${f}_visitor
	    v=$(echo $g | tr '[a-z]' '[A-Z]')
	    cat > ${g}.e <<EOF
-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
deferred class $v
inherit VISITOR
feature {$c}
   visit_$f (v: $c) is deferred end
end
EOF
	    se pretty ${g}.e
	    echo $v >> $visitor
	fi
    done
    echo end >> $visitor

    se pretty $visitor
done

rm -f *.bak
