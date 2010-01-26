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
class LIBERTY_RESULT

inherit
	LIBERTY_WRITABLE

create {LIBERTY_FEATURE_LOCAL_CONTEXT}
	make

feature {ANY}
	name: FIXED_STRING is
		once
			create Result.make_from_string("Result")
		end

	result_type: LIBERTY_TYPE

	out_in_tagged_out_memory is
		do
			tagged_out_memory.append(once "Result")
		end

feature {}
	make (a_result_type: like result_type; a_position: like position) is
		require
			a_result_type /= Void
			a_position /= Void
		do
			result_type := a_result_type
			position := a_position
		ensure
			result_type = a_result_type
			position = a_position
		end

invariant
	result_type /= Void

end
