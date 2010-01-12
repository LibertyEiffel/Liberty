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

insert
	LIBERTY_POSITIONABLE

create {LIBERTY_TYPE_BUILDER_TOOLS}
	make

feature {ANY}
	expression: LIBERTY_EXPRESSION

	instruction: LIBERTY_INSTRUCTION

feature {}
	make (a_expression: like expression; a_instruction: like instruction; a_position: like position) is
		require
			a_expression /= Void
			a_instruction /= Void
			a_position /= Void
		do
			expression := a_expression
			instruction := a_instruction
			position := a_position
		ensure
			expression = a_expression
			instruction = a_instruction
			position = a_position
		end

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_CONDITION_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_condition(Current)
		end

invariant
	expression /= Void

end
