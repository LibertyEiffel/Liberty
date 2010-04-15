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
class LIBERTY_ASSIGNMENT_FORCED

inherit
	LIBERTY_ASSIGNMENT

create {LIBERTY_TYPE_BUILDER_TOOLS, LIBERTY_ASSIGNMENT_FORCED}
	make

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_ASSIGNMENT_FORCED_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_assignment_forced(Current)
		end

	specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
		local
			w: like writable
			e: like expression
		do
			w := writable.specialized_in(a_type)
			e := expression.specialized_in(a_type)
			if w = writable and then e = expression then
				Result := Current
			else
				create Result.make(w, e, position)
			end
		end

end
