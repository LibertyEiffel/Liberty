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
deferred class LIBERTY_ANCHORED_TYPE

inherit
	LIBERTY_ENTITY_TYPE

creation {LIBERTY_TYPE_BUILDER_TOOLS}
	make

feature {ANY}
	anchor: LIBERTY_ENTITY

	type: LIBERTY_TYPE is
		do
			Result := anchor.result_type.type
		ensure
			Result = anchor.result_type.type
		end

	is_type_set: BOOLEAN is
		do
			Result := anchor.is_result_type_set
		end

	full_name: FIXED_STRING is
		do
			if is_type_set then
				Result := type.full_name
			else
				Result := full_name_memory
			end
		end

	hash_code: INTEGER is
		do
			Result := full_name_memory.hash_code
		end

feature {LIBERTY_TYPE}
	full_name_in (buffer: STRING) is
		do
			buffer.append(full_name)
		end

feature {}
	make (a_anchor: like anchor) is
		do
			anchor := a_anchor
			full_name_memory := once "like " + anchor.name
		ensure
			anchor = a_anchor
		end

	full_name_memory: FIXED_STRING

invariant
	anchor /= Void

end
