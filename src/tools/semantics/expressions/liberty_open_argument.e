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
class LIBERTY_OPEN_ARGUMENT

inherit
	LIBERTY_EXPRESSION

create {LIBERTY_TYPE_BUILDER}
	make, set_result_type

feature {ANY}
	result_type: LIBERTY_TYPE

	is_result_type_set: BOOLEAN is
		do
			Result := result_type /= Void
		end

feature {LIBERTY_TYPE_BUILDER}
	set_result_type (a_result_type: like result_type) is
		require
			a_result_type /= Void
		do
			result_type := a_result_type
		ensure
			is_result_type_set
			result_type = a_result_type
		end

feature {}
	make is
		do
		end

end
