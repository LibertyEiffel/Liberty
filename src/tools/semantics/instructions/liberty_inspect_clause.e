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
	instruction: LIBERTY_INSTRUCTION

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
	make (a_instruction: like instruction) is
		require
			a_instruction /= Void
		do
			instruction := a_instruction
			create {FAST_ARRAY[LIBERTY_INSPECT_SLICE]} values_list.with_capacity(2)
		ensure
			instruction = a_instruction
		end

	values_list: COLLECTION[LIBERTY_INSPECT_SLICE]

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_INSPECT_CLAUSE_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_inspect_clause(Current)
		end

invariant
	instruction /= Void
	values_list /= Void

end
