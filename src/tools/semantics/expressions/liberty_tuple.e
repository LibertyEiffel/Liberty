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
class LIBERTY_TUPLE

inherit
	LIBERTY_EXPRESSION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	result_type: LIBERTY_TYPE

	is_result_type_set: BOOLEAN is True

	count: INTEGER
			-- size of the tuple

	lower: INTEGER is 1

	upper: INTEGER is
		do
			Result := count
		end

	is_empty: BOOLEAN is
		do
			Result := count = 0
		end

	item (i: INTEGER): LIBERTY_EXPRESSION is
		do
			Result := elements.item(i - lower)
		end

feature {LIBERTY_TYPE_BUILDER}
	add (a_element: LIBERTY_EXPRESSION) is
		require
			a_element /= Void
		do
			elements.add_last(a_element)
		end

feature {}
	make (a_result_type: like result_type; a_count: like count) is
		require
			a_result_type /= Void
			-- a_result_type is a TUPLE type
			a_count >= 0
		do
			result_type := a_result_type
			count := a_count
			create {FAST_ARRAY[LIBERTY_EXPRESSION]} elements.with_capacity(a_count)
		end

	elements: COLLECTION[LIBERTY_EXPRESSION]

end
