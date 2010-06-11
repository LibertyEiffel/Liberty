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

create {LIBERTY_BUILDER_TOOLS}
	make

create {LIBERTY_CONDITIONAL}
	make_specialized

feature {ANY}
	conditions: TRAVERSABLE[LIBERTY_CONDITION] is
		do
			Result := conditions_list
		ensure
			Result = conditions_list
		end

	else_clause: LIBERTY_DEFAULT

	specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
		local
			i: INTEGER
			c: like conditions_list
			cond: LIBERTY_CONDITION
			e: like else_clause
		do
			from
				c := conditions_list
				i := c.lower
			until
				i > c.upper
			loop
				cond := c.item(i).specialized_in(a_type)
				if cond /= c.item(i) then
					if c = conditions_list then
						c := c.twin
					end
					c.put(cond, i)
				end
				i := i + 1
			end
			if else_clause /= Void then
				e := else_clause.specialized_in(a_type)
			end
			if c = conditions_list and then e = else_clause then
				Result := Current
			else
				create Result.make_specialized(c, e, position)
			end
		end

feature {LIBERTY_BUILDER_TOOLS}
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

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			conditions_marker.mark_reachable_code(mark, conditions)
			if else_clause /= Void then
				else_clause.mark_reachable_code(mark)
			end
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

	make_specialized (a_conditions: like conditions_list; a_else: like else_clause; a_position: like position) is
		require
			a_conditions /= Void
			a_position /= Void
		do
			conditions_list := a_conditions
			else_clause := a_else
			position := a_position
		ensure
			conditions_list = a_conditions
			else_clause = a_else
			position = a_position
		end

	conditions_list: COLLECTION[LIBERTY_CONDITION]

	conditions_marker: LIBERTY_REACHABLE_COLLECTION_MARKER[LIBERTY_CONDITION]

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
