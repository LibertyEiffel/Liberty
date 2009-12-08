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
class LIBERTY_CONDITIONAL

inherit
	LIBERTY_INSTRUCTION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	conditions: TRAVERSABLE[LIBERTY_CONDITION] is
		do
			Result := conditions_list
		ensure
			Result = conditions_list
		end

	else_clause: LIBERTY_DEFAULT

feature {LIBERTY_TYPE_BUILDER}
	add_condition (a_condition: LIBERTY_CONDITION) is
		do
			conditions_list.add_last(a_condition)
		ensure
			conditions.last = a_condition
		end

	set_else_clause (a_else_clause: like else_clause) is
		do
			else_clause := a_else_clause
		ensure
			else_clause = a_else_clause
		end

feature {}
	make (a_position: like position) is
		require
			a_position /= Void
		do
			create {FAST_ARRAY[LIBERTY_CONDITION]} conditions_list.with_capacity(4)
			position := a_position
		ensure
			position = a_position
		end

	conditions_list: COLLECTION[LIBERTY_CONDITION]

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_CONDITIONAL_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_conditional(Current)
		end

invariant
	conditions_list /= Void

end
