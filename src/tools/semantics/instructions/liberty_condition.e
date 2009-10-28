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
class LIBERTY_CONDITION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	expression: LIBERTY_EXPRESSION

	instructions: TRAVERSABLE[LIBERTY_INSTRUCTION]

feature {}
	make (a_expression: like expression; a_instructions: like instructions) is
		require
			a_expression /= Void
			a_instructions /= Void
		do
			expression := a_expression
			instructions := a_instructions
		ensure
			expression = a_expression
			instructions = a_instructions
		end

invariant
	expression /= Void
	instructions /= Void

end
