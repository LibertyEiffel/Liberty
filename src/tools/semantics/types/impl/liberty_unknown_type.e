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
class LIBERTY_UNKNOWN_TYPE
	--
	-- An unknown type. Should be used only for some unresolved export clients.
	--

inherit
	LIBERTY_TYPE

insert
	SINGLETON
		redefine out_in_tagged_out_memory
		end

creation {LIBERTY_TYPE_RESOLVER}
	make

feature {ANY}
	actual_type: LIBERTY_ACTUAL_TYPE is
		do
		end

	is_actual_type_set: BOOLEAN is False

	full_name: FIXED_STRING

	hash_code: INTEGER is 19741215

	out_in_tagged_out_memory is
		do
			tagged_out_memory.append(once "<unknown type>")
		end

feature {LIBERTY_ACTUAL_TYPE}
	full_name_in (buffer: STRING) is
		do
			buffer.append(full_name)
		end

feature {}
	make (a_full_name: like full_name) is
		require
			a_full_name /= Void
		do
			full_name := a_full_name
		ensure
			full_name = a_full_name
		end

invariant
	full_name /= Void

end
