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
deferred class LIBERTY_DELAYED_RESOLVER
	--
	-- Design pattern: Strategy. Used by LIBERTY_DELAYED_TYPE to resolve a type.
	--

insert
	HASHABLE
		undefine out_in_tagged_out_memory
		end

feature {LIBERTY_DELAYED_TYPE}
	can_resolve: BOOLEAN is
		deferred
		end

	resolved: LIBERTY_ACTUAL_TYPE is
		require
			can_resolve
		deferred
		ensure
			Result /= Void
		end

end -- class LIBERTY_DELAYED_RESOLVER
