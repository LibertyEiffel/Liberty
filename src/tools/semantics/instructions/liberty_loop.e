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
class LIBERTY_LOOP

inherit
	LIBERTY_INSTRUCTION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	init: LIBERTY_INSTRUCTION
	invariant_clause: LIBERTY_INVARIANT
	variant_clause: LIBERTY_EXPRESSION
	expression: LIBERTY_EXPRESSION
	body: LIBERTY_INSTRUCTION

feature {}
	make (a_init: like init; a_invariant_clause: like invariant_clause; a_variant_clause: like variant_clause; a_expression: like expression; a_body: like body) is
		require
			a_init /= Void
			a_invariant_clause /= Void
			a_variant_clause /= Void
			a_expression /= Void
			a_body /= Void
		do
			init := a_init
			invariant_clause := a_invariant_clause
			variant_clause := a_variant_clause
			expression := a_expression
			body := a_body
		ensure
			init = a_init
			invariant_clause = a_invariant_clause
			variant_clause = a_variant_clause
			expression = a_expression
			body = a_body
		end

invariant
	init /= Void
	invariant_clause /= Void
	variant_clause /= Void
	expression /= Void
	body /= Void

end
