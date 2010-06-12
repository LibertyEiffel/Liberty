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
class LIBERTY_EQUALS

inherit
	LIBERTY_COMPARISON

create {LIBERTY_BUILDER_TOOLS, LIBERTY_EQUALS}
	make

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_EQUALS_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_equals(Current)
		end

feature {}
	make_new (a_left: like left; a_right: like right; a_result_type: like result_type; a_position: like position): like Current is
		do
			create Result.make(a_left, a_right, a_result_type, a_position)
		end

end
