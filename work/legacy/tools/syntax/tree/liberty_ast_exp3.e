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
class LIBERTY_AST_EXP3

inherit
   LIBERTY_AST_EXPRESSION_BINARY[LIBERTY_AST_E3]

create {LIBERTY_NODE_FACTORY}
   make

feature {LIBERTY_AST_HANDLER}
   is_and_then: BOOLEAN
      do
         Result := count = 4
         check
            Result implies nodes.item(1).name.is_equal(once "KW and")
            Result implies nodes.item(2).name.is_equal(once "KW then")
         end
      ensure
         Result implies not is_empty
      end

   is_and: BOOLEAN
      do
         Result := count = 3
         check
            Result implies nodes.item(1).name.is_equal(once "KW and")
         end
      end

feature {ANY}
   name: STRING "e3-exp"

end
