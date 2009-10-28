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
class LIBERTY_AST_R1

inherit
	LIBERTY_AST_EXPRESSION_REMAINDER[LIBERTY_AST_E1]

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	is_implies: BOOLEAN is
		do
			Result := not is_empty
			check
				Result implies nodes.first.name.is_equal(once "KW implies")
				not is_empty implies Result
			end
		ensure
			Result implies not is_empty
		end

feature {ANY}
	name: STRING is "r1"

end
