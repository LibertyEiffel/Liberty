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
class LIBERTY_AST_REQUIRE_ELSE

inherit
   LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
   make

feature {LIBERTY_AST_HANDLER}
   is_require_else: BOOLEAN
      do
         Result := count = 2 and then nodes.last.name.is_equal(once "KW else")
      end

   is_require_then: BOOLEAN
      do
         Result := count = 2 and then nodes.last.name.is_equal(once "KW then")
      end

feature {ANY}
   count: INTEGER
      do
         Result := nodes.count
      end

   name: STRING "Require_Else"

feature {}
   possible_counts: SET[INTEGER]
      once
         Result := {AVL_SET[INTEGER] << 1, 2 >> }
      end

end
