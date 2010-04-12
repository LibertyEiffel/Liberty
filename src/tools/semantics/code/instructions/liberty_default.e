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
class LIBERTY_DEFAULT

insert
	LIBERTY_POSITIONABLE
	LIBERTY_REACHABLE

create {LIBERTY_TYPE_BUILDER_TOOLS, LIBERTY_DEFAULT}
	make

feature {ANY}
	instruction: LIBERTY_INSTRUCTION

feature {LIBERTY_CONDITIONAL, LIBERTY_INSPECT}
	specialized_in (a_type: LIBERTY_ACTUAL_TYPE_IMPL): like Current is
		local
			i: like instruction
		do
			i := instruction.specialized_in(a_type)
			if i = instruction then
				Result := Current
			else
				create Result.make(i, position)
			end
		end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			instruction.mark_reachable_code(mark)
		end

feature {}
	make (a_instruction: like instruction; a_position: like position) is
		require
			a_instruction /= Void
			a_position /= Void
		do
			instruction := a_instruction
			position := a_position
		ensure
			instruction = a_instruction
			position = a_position
		end

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_DEFAULT_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_default(Current)
		end

invariant
	instruction /= Void

end
