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

inherit
	LIBERTY_TAGGED

insert
	LIBERTY_POSITIONABLE
	LIBERTY_REACHABLE
	VISITABLE

feature {ANY}
	result_type: LIBERTY_TYPE is
		deferred
		ensure
			Result /= Void or else is_agent_call
		end

	is_agent_call: BOOLEAN is False

	specialized_in (a_type: LIBERTY_ACTUAL_TYPE_IMPL): like Current is
		require
			a_type /= Void
		deferred
		ensure
			Result /= Void
		end

end
