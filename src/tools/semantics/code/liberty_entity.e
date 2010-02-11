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
deferred class LIBERTY_ENTITY
--
-- Anything with a name and a result type.
-- Most entities have a non-Void result type, except procedures.
--
-- See also LIBERTY_WRITABLE
--

inherit
	LIBERTY_POSITIONABLE
		undefine out_in_tagged_out_memory
		end

insert
	LIBERTY_REACHABLE

feature {ANY}
	name: FIXED_STRING is
		deferred
		end

	result_type: LIBERTY_TYPE is
		deferred
		ensure
			-- Result may be Void in the particular case of procedures
		end

invariant
	name /= Void

end
