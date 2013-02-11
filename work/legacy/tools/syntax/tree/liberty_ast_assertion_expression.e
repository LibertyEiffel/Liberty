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
class LIBERTY_AST_ASSERTION_EXPRESSION

inherit
   LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
   make

feature {LIBERTY_AST_HANDLER}
   has_expression: BOOLEAN is
      do
         Result := count > 0 and then nodes.first.name.is_equal(once "Expression")
      end

   expression: LIBERTY_AST_EXPRESSION is
      require
         has_expression
      do
         Result ::= nodes.item(0)
      end

feature {ANY}
   count: INTEGER is
      do
         Result := nodes.count
      end

   name: STRING is "Assertion_Expression"

feature {}
   possible_counts: SET[INTEGER] is
      once
         Result := {AVL_SET[INTEGER] << 0, 1 >> }
      end

end
