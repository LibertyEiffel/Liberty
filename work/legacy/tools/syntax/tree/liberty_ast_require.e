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
class LIBERTY_AST_REQUIRE

inherit
   LIBERTY_AST_LIST[LIBERTY_AST_ASSERTION]
      redefine
         possible_counts
      end

create {LIBERTY_NODE_FACTORY}
   make

feature {LIBERTY_AST_HANDLER}
   require_else: LIBERTY_AST_REQUIRE_ELSE is
      do
         Result ::= nodes.first
      end

feature {ANY}
   name: STRING is "Require"

feature {}
   possible_counts: SET[INTEGER] is
      once
         Result := {AVL_SET[INTEGER] << 0, 3 >> }
      end

end
