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
deferred class LIBERTY_EXPRESSION

insert
	LIBERTY_POSITIONABLE
	LIBERTY_TAGGED
	VISITABLE

feature {ANY}
	result_type: LIBERTY_TYPE is
		require
			is_result_type_set
		deferred
		ensure
			Result /= Void
		end

	is_result_type_set: BOOLEAN is
		deferred
		end

	is_agent_call: BOOLEAN is False

invariant
	is_result_type_set implies (result_type /= Void or else is_agent_call)

end
