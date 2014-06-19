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
class LIBERTY_AST_FEATURE_NAME_OR_ALIAS

inherit
   LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
   make

feature {LIBERTY_AST_HANDLER}
   is_infix: BOOLEAN
      do
         Result := count = 2 and then nodes.first.name.is_equal(once "KW infix")
      ensure
         Result implies not is_regular and then not is_prefix
      end

   is_prefix: BOOLEAN
      do
         Result := count = 2 and then nodes.first.name.is_equal(once "KW prefix")
      ensure
         Result implies not is_regular and then not is_infix
      end

   is_regular: BOOLEAN
      do
         Result := count = 1
      ensure
         Result implies not is_prefix and then not is_infix
      end

   entity_name: LIBERTY_AST_ENTITY_NAME
      require
         is_regular
      do
         Result ::= nodes.item(0)
      end

   free_operator_name: LIBERTY_AST_STRING
      require
         is_prefix or else is_infix
      do
         Result ::= nodes.item(1)
      end

feature {ANY}
   count: INTEGER
      do
         Result := nodes.count
      end

   name: STRING "Feature_Name_Or_Alias"

feature {}
   possible_counts: SET[INTEGER]
      once
         Result := {AVL_SET[INTEGER] << 1, 2 >> }
      end

end
