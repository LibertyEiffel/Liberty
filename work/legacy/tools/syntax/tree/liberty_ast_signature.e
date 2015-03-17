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
class LIBERTY_AST_SIGNATURE

inherit
   LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
   make

feature {LIBERTY_AST_HANDLER}
   feature_names: EIFFEL_LIST_NODE
      do
         Result ::= nodes.item(0)
      end

   has_result_type: BOOLEAN
      do
         Result := count = 3 or else count = 6
         check
            Result implies nodes.last.name.is_equal(once "Type_Definition")
         end
      end

   result_type: LIBERTY_AST_TYPE_DEFINITION
      require
         has_result_type
      do
         Result ::= nodes.last
      end

   has_parameters: BOOLEAN
      do
         Result := count >= 4
         check
            Result implies nodes.item(2).name.is_equal(once "Declaration*")
         end
      end

   parameters: EIFFEL_LIST_NODE
      require
         has_parameters
      do
         Result ::= nodes.item(2)
      end

feature {ANY}
   count: INTEGER
      do
         Result := nodes.count
      end

   name: STRING "Signature"

feature {}
   possible_counts: SET[INTEGER]
      once
         Result := {AVL_SET[INTEGER] << 1, 3, 4, 6 >> }
      end

end
