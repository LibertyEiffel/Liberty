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
class LIBERTY_INSPECT

inherit
	LIBERTY_INSTRUCTION

create {LIBERTY_TYPE_BUILDER_TOOLS}
	make

feature {ANY}
	expression: LIBERTY_EXPRESSION

	clauses: TRAVERSABLE[LIBERTY_INSPECT_CLAUSE] is
		do
			Result := clauses_list
		ensure
			Result = clauses_list
		end

	else_clause: LIBERTY_DEFAULT

feature {LIBERTY_TYPE_BUILDER_TOOLS}
	add_clause (a_clause: LIBERTY_INSPECT_CLAUSE) is
		require
			a_clause /= Void
		do
			clauses_list.add_last(a_clause)
		ensure
			clauses.last = a_clause
		end

	set_else_clause (a_else_clause: like else_clause) is
		do
			else_clause := a_else_clause
		ensure
			else_clause = a_else_clause
		end

feature {}
	make (a_expression: like expression; a_position: like position) is
		require
			a_expression /= Void
			a_position /= Void
		do
			create {FAST_ARRAY[LIBERTY_INSPECT_CLAUSE]} clauses_list.with_capacity(8)
			expression := a_expression
			position := a_position
		ensure
			expression = a_expression
			position = a_position
		end

	clauses_list: COLLECTION[LIBERTY_INSPECT_CLAUSE]

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_INSPECT_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_inspect(Current)
		end

invariant
	expression /= Void
	clauses_list /= Void

end
