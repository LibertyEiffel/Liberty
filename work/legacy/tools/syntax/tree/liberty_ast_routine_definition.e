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
class LIBERTY_AST_ROUTINE_DEFINITION

inherit
   LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
   make

feature {LIBERTY_AST_HANDLER}
   obsolete_clause: LIBERTY_AST_OBSOLETE
      do
         Result ::= nodes.item(0)
      end

   require_clause: LIBERTY_AST_REQUIRE
      do
         Result ::= nodes.item(1)
      end

   execution: LIBERTY_AST_ROUTINE_EXECUTION
      do
         Result ::= nodes.item(2)
      end

   ensure_clause: LIBERTY_AST_ENSURE
      do
         Result ::= nodes.item(3)
      end

   rescue_block: LIBERTY_AST_RESCUE_BLOCK
      do
         Result ::= nodes.item(4)
      end

feature {ANY}
   count: INTEGER 6

   name: STRING "Routine_Definition"

feature {}
   possible_counts: SET[INTEGER]
      once
         Result := {AVL_SET[INTEGER] << 6 >> }
      end

end
