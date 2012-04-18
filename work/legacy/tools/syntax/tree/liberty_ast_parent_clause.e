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
class LIBERTY_AST_PARENT_CLAUSE

inherit
   LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
   make

feature {LIBERTY_AST_HANDLER}
   has_clauses: BOOLEAN is
      do
         Result := count = 5
      end

   rename_clause: LIBERTY_AST_PARENT_RENAME is
      require
         has_clauses
      do
         Result ::= nodes.item(0)
      end

   export_clause: LIBERTY_AST_PARENT_EXPORT is
      require
         has_clauses
      do
         Result ::= nodes.item(1)
      end

   undefine_clause: LIBERTY_AST_PARENT_UNDEFINE is
      require
         has_clauses
      do
         Result ::= nodes.item(2)
      end

   redefine_clause: LIBERTY_AST_PARENT_REDEFINE is
      require
         has_clauses
      do
         Result ::= nodes.item(3)
      end

feature {ANY}
   count: INTEGER is
      do
         Result := nodes.count
      end

   name: STRING is "Parent_Clause"

feature {}
   possible_counts: SET[INTEGER] is
      once
         Result := {AVL_SET[INTEGER] << 0, 1, 5 >> }
      end

end
