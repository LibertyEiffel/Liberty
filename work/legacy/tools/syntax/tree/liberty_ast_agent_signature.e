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
class LIBERTY_AST_AGENT_SIGNATURE

inherit
   LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
   make

feature {LIBERTY_AST_HANDLER}
   has_return_type: BOOLEAN is
      do
         Result := (count = 3 or else count = 6)
         check
            Result = nodes.last.name.is_equal(once "Type_Definition")
         end
      end

   return_type: LIBERTY_AST_TYPE_DEFINITION is
      require
         has_return_type
      do
         Result ::= nodes.last
      end

   has_parameters: BOOLEAN is
      do
         Result := (count = 4 or else count = 6)
         check
            Result = (count > 2) and then nodes.item(2).name.is_equal(once "Declaration*")
         end
      end

   parameters: EIFFEL_LIST_NODE is
      require
         has_parameters
      do
         Result ::= nodes.item(2)
      end

feature {ANY}
   count: INTEGER is
      do
         Result := nodes.count
      end

   name: STRING is "Agent_Signature"

feature {}
   possible_counts: SET[INTEGER] is
      once
         Result := {AVL_SET[INTEGER] << 1, 3, 4, 6 >> }
      end

end
