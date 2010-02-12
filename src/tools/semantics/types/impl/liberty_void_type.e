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
class LIBERTY_VOID_TYPE
	--
	-- The type of a 'Void' expression unless or before its precise type can be determined
	--

inherit
	LIBERTY_ACTUAL_TYPE
		rename
			make as dont_make
		undefine
			is_equal
		redefine
			full_name, full_name_in,
			has_feature, add_feature,
			is_conform_to, is_non_conformant_child_of, common_parent, add_parent,
			hash_code
		end

insert
	SINGLETON
		undefine out_in_tagged_out_memory
		end

creation {LIBERTY_VOID}
	make

feature {ANY}
	full_name: FIXED_STRING is
		once
			Result := "{Void type}".intern
		end

	hash_code: INTEGER is 20050814

	has_feature (a_feature_name: LIBERTY_FEATURE_NAME): BOOLEAN is
		do
			check not Result end
		end

	is_conform_to (other: LIBERTY_ACTUAL_TYPE): BOOLEAN is
		do
			Result := not other.is_expanded
		end

	is_non_conformant_child_of (other: LIBERTY_ACTUAL_TYPE): BOOLEAN is
		do
			check not Result end
		end

feature {LIBERTY_ACTUAL_TYPE}
	full_name_in (buffer: STRING) is
		do
			buffer.append(full_name)
		end

	common_parent (other: LIBERTY_ACTUAL_TYPE): LIBERTY_ACTUAL_TYPE is
		do
			check False end
		end

feature {LIBERTY_TYPE_BUILDER_TOOLS}
	add_parent (a_parent: LIBERTY_ACTUAL_TYPE; conformant: BOOLEAN) is
		do
			check False end
		end

	add_feature (a_feature: LIBERTY_FEATURE_DEFINITION) is
		do
			check False end
		end

feature {}
	make is
		do
			reachable_mark := 1
			runtime_category := reference_category
		ensure
			is_reachable
		end

invariant
	is_reachable
	conformant_parents.is_empty
	non_conformant_parents.is_empty

end -- class LIBERTY_VOID_TYPE
