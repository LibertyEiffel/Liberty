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

	count: INTEGER is
		do
			Result := elements.count
		end

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

feature {}
	make (a_result_type: like result_type; a_elements: like elements; a_position: like position) is
		require
			a_result_type /= Void
			-- a_result_type is a TUPLE type
			a_elements /= Void
			a_position /= Void
		do
			result_type := a_result_type
			elements := a_elements
			position := a_position
		ensure
			result_type = a_result_type
			elements = a_elements
			position = a_position
		end

	elements: TRAVERSABLE[LIBERTY_EXPRESSION]

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_TUPLE_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_tuple(Current)
		end

invariant
	elements /= Void implies elements.count = count

end
