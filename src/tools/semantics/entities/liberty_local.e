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
class LIBERTY_LOCAL

inherit
	LIBERTY_WRITABLE

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	name: FIXED_STRING
	result_type: LIBERTY_TYPE

	is_result_type_set: BOOLEAN is True

feature {}
	make (a_name: like name; a_result_type: like result_type) is
		require
			a_name /= Void
			a_result_type /= Void
		do
			name := a_name
			result_type := a_result_type
		ensure
			name = a_name
			result_type = a_result_type
		end

invariant
	name /= Void
	result_type /= Void

end
