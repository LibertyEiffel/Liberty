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
deferred class LIBERTY_TYPE
	--
	-- The type referenced in entity definitions
	--

inherit
	HASHABLE
		undefine out_in_tagged_out_memory
		end

feature {ANY}
	actual_type: LIBERTY_ACTUAL_TYPE is
		require
			is_actual_type_set
		deferred
		end

	is_actual_type_set: BOOLEAN is
		deferred
		end

	full_name: FIXED_STRING is
		deferred
		ensure
			Result /= Void
		end

	export_only: BOOLEAN
			-- True if the type is only ever used as an export marker (in feature, creation, or export clauses)

feature {LIBERTY_UNIVERSE, LIBERTY_TYPE_RESOLVER}
	unset_export_only is
		do
			export_only := False
		ensure
			not export_only
		end

feature {LIBERTY_ACTUAL_TYPE}
	full_name_in (buffer: STRING) is
		require
			buffer /= Void
		deferred
		end

end
