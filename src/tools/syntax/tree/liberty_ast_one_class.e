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
class LIBERTY_AST_ONE_CLASS

inherit
   LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
   make

feature {LIBERTY_AST_HANDLER}
   class_header: LIBERTY_AST_CLASS_HEADER is
      do
         Result ::= nodes.item(0)
      end

   obsolete_clause: LIBERTY_AST_OBSOLETE is
      do
         Result ::= nodes.item(1)
      end

   inherit_clause: LIBERTY_AST_INHERIT is
      do
         Result ::= nodes.item(2)
      end

   insert_clause: LIBERTY_AST_INSERT is
      do
         Result ::= nodes.item(3)
      end

   creations: EIFFEL_LIST_NODE is
      do
         Result ::= nodes.item(4)
      end

   features: EIFFEL_LIST_NODE is
      do
         Result ::= nodes.item(5)
      end

   invariant_clause: LIBERTY_AST_INVARIANT is
      do
         Result ::= nodes.item(6)
      end

feature {ANY}
   count: INTEGER is 8

   name: STRING is "One_Class"

feature {}
   possible_counts: SET[INTEGER] is
      once
         Result := {AVL_SET[INTEGER] << 8 >> }
      end

end
