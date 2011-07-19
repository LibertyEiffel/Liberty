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
class LIBERTY_AST_LOOP

inherit
   LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
   make

feature {LIBERTY_AST_HANDLER}
   from_clause: LIBERTY_AST_FROM is
      do
         Result ::= nodes.item(0)
      end

   invariant_clause: LIBERTY_AST_INVARIANT is
      do
         Result ::= nodes.item(1)
      end

   variant_clause: LIBERTY_AST_VARIANT is
      do
         Result ::= nodes.item(2)
      end

   expression: LIBERTY_AST_EXPRESSION is
      do
         Result ::= nodes.item(4)
      end

   instructions: EIFFEL_LIST_NODE is
      do
         Result ::= nodes.item(6)
      end

feature {ANY}
   count: INTEGER is 8

   name: STRING is "Loop"

feature {}
   possible_counts: SET[INTEGER] is
      once
         Result := {AVL_SET[INTEGER] << 8 >> }
      end

end
