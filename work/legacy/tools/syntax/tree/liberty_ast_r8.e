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
class LIBERTY_AST_R8

inherit
   LIBERTY_AST_EXPRESSION_REMAINDER[LIBERTY_AST_E8]
      export {LIBERTY_AST_HANDLER}
         expression, remainder
      end

create {LIBERTY_NODE_FACTORY}
   make

feature {LIBERTY_AST_HANDLER}
   is_free_operator: BOOLEAN
      do
         Result := not is_empty
         check
            Result implies nodes.item(0).name.is_equal(once "KW free operator")
         end
      end

   free_operator: LIBERTY_AST_TERMINAL_NODE
      require
         is_free_operator
      do
         Result ::= nodes.first
      end

feature {ANY}
   name: STRING "r8"

end
