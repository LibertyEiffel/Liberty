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
class LIBERTY_CAST_EXPRESSION
	--
	-- Used internally to force the expression type, either via conformance or conversion.
	--

inherit
	LIBERTY_EXPRESSION

create {LIBERTY_CALL_PROMOTION, LIBERTY_CAST_EXPRESSION}
	make

feature {ANY}
	expression: LIBERTY_EXPRESSION
	result_type: LIBERTY_TYPE

	specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
		local
			e: LIBERTY_EXPRESSION
		do
			check result_type.specialized_in(a_type) = result_type end
			e := expression.specialized_in(a_type)
			if e = expression then
				Result := Current
			else
				create Result.make(e, result_type)
			end
		end

	is_valid_type (a_expression: like expression; a_result_type: like result_type): BOOLEAN is
		require
			a_expression /= Void
			a_result_type /= Void
			{LIBERTY_ACTUAL_TYPE} ?:= a_result_type.known_type
		local
			actual_type: LIBERTY_ACTUAL_TYPE
		do
			actual_type ::= a_result_type.known_type
			Result := a_expression.result_type.known_type.is_conform_to(actual_type)
				or else a_expression.result_type.known_type.converts_to(actual_type)
		end

	accept (v: VISITOR) is
		local
			v0: LIBERTY_CAST_EXPRESSION_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_cast_expression(Current)
		end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			expression.mark_reachable_code(mark)
		end

feature {}
	make (a_expression: like expression; a_result_type: like result_type) is
		require
			a_expression /= Void
			a_result_type /= Void
			is_valid_type(a_expression, a_result_type)
		do
			expression := a_expression
			result_type := a_result_type
			position := a_expression.position
		ensure
			expression = a_expression
			result_type = a_result_type
			position = a_expression.position
		end

invariant
	is_valid_type(expression, result_type)

end
