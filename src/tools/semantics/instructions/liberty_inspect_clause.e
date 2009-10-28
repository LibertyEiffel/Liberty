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
class LIBERTY_INSPECT_CLAUSE

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	instructions: TRAVERSABLE[LIBERTY_INSTRUCTION]

	values: TRAVERSABLE[LIBERTY_INSPECT_SLICE] is
		do
			Result := values_list
		ensure
			Result = values_list
		end

feature {LIBERTY_TYPE_BUILDER}
	add_value (a_value: LIBERTY_INSPECT_SLICE) is
		require
			a_value /= Void
		do
			values_list.add_last(a_value)
		ensure
			values.last = a_value
		end

feature {}
	make (a_instructions: like instructions) is
		require
			a_instructions /= Void
		do
			instructions := a_instructions
			create {FAST_ARRAY[LIBERTY_INSPECT_SLICE]} values_list.with_capacity(2)
		ensure
			instructions = a_instructions
		end

	values_list: COLLECTION[LIBERTY_INSPECT_SLICE]

invariant
	instructions /= Void
	values_list /= Void

end
