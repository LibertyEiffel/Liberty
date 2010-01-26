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
class LIBERTY_ANCHORED_TYPE

inherit
	LIBERTY_ENTITY_TYPE

creation {LIBERTY_TYPE_BUILDER_TOOLS}
	make

feature {ANY}
	anchor: LIBERTY_ENTITY

	type: LIBERTY_ACTUAL_TYPE is
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

	is_equal (other: like Current): BOOLEAN is
		do
			Result := full_name_memory.is_equal(other.full_name_memory)
		end

	out_in_tagged_out_memory is
		do
			tagged_out_memory.append(once "like ")
			anchor.out_in_tagged_out_memory
			if type /= Void then
				tagged_out_memory.append(once " i.e. ")
				type.out_in_tagged_out_memory
			end
		end

feature {LIBERTY_ACTUAL_TYPE}
	full_name_in (buffer: STRING) is
		do
			buffer.append(full_name)
		end

feature {LIBERTY_TYPE_FEATURES_LOADER}
	set_anchor (a_anchor: like anchor) is
		require
			a_anchor /= Void
		do
			anchor := a_anchor
			full_name_memory := (once "like " + a_anchor.name).intern
		ensure
			anchor = a_anchor
		end

feature {}
	make is
		do
		end

feature {LIBERTY_ANCHORED_TYPE}
	full_name_memory: FIXED_STRING

end -- class LIBERTY_ANCHORED_TYPE
