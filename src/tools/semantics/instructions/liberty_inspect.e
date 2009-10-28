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

create {LIBERTY_TYPE_BUILDER}
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

feature {LIBERTY_TYPE_BUILDER}
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
	make (a_expression: like expression) is
		require
			a_expression /= Void
		do
			create {FAST_ARRAY[LIBERTY_INSPECT_CLAUSE]}clauses_list.with_capacity(8)
		ensure
			expression = a_expression
		end

	clauses_list: COLLECTION[LIBERTY_INSPECT_CLAUSE]

invariant
	expression /= Void
	clauses_list /= Void

end
