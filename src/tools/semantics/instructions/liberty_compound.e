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
class LIBERTY_COMPOUND

inherit
	LIBERTY_INSTRUCTION
	TRAVERSABLE[LIBERTY_INSTRUCTION]

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	count: INTEGER is
		do
			Result := instructions.count
		ensure then
			Result > 1
		end

	is_empty: BOOLEAN is False

	lower: INTEGER is
		do
			Result := instructions.lower
		end

	upper: INTEGER is
		do
			Result := instructions.upper
		end

	first: LIBERTY_INSTRUCTION is
		do
			Result := instructions.first
		end

	last: LIBERTY_INSTRUCTION is
		do
			Result := instructions.last
		end

	item (i: INTEGER): LIBERTY_INSTRUCTION is
		do
			Result := instructions.item(i)
		end

	new_iterator: ITERATOR[LIBERTY_INSTRUCTION] is
		do
			Result := instructions.new_iterator
		end

feature {}
	make (a_instructions: like instructions) is
		require
			a_instructions.count > 1
		do
			instructions := a_instructions
		ensure
			instructions = a_instructions
		end

	instructions: TRAVERSABLE[LIBERTY_INSTRUCTION]

invariant
	instructions /= Void

end

