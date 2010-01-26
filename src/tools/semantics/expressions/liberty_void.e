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
class LIBERTY_VOID

inherit
	LIBERTY_EXPRESSION

create {LIBERTY_TYPE_BUILDER_TOOLS}
	make

feature {ANY}
	result_type: LIBERTY_TYPE

feature {LIBERTY_TYPE_BUILDER_TOOLS}
	set_result_type (a_result_type: like result_type) is
		require
			a_result_type /= Void
		do
			result_type := a_result_type
		ensure
			result_type = a_result_type
		end

feature {}
	make (a_position: like position) is
		require
			a_position /= Void
		do
			position := a_position
		ensure
			position = a_position
		end

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_VOID_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_void(Current)
		end

end
