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
class LIBERTY_CURRENT

inherit
	LIBERTY_ENTITY
		redefine out_in_tagged_out_memory
		end

create {LIBERTY_TYPE_BUILDER_TOOLS}
	make

feature {ANY}
	name: FIXED_STRING is
		once
			Result := "Current".intern
		end

	out_in_tagged_out_memory is
		do
			tagged_out_memory.append(name)
		end

	result_type: LIBERTY_ACTUAL_TYPE

feature {LIBERTY_REACHABLE_MARKER, LIBERTY_REACHABLE_MARKER_AGENT}
	mark_reachable_code (mark: INTEGER) is
		do
			-- nothing
		end

feature {}
	make (type: like result_type; a_position: like position) is
		require
			type /= Void
			a_position /= Void
		do
			position := a_position
			result_type := type
		ensure
			position = a_position
			result_type = type
		end

invariant
	result_type /= Void

end
