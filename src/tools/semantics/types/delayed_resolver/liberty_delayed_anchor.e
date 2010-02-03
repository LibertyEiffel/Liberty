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
class LIBERTY_DELAYED_ANCHORED

inherit
	LIBERTY_DELAYED_RESOLVER

creation {LIBERTY_TYPE_BUILDER_TOOLS}
	make

feature {ANY}
	out_in_tagged_out_memory is
		do
			if can_resolve then
				resolved.out_in_tagged_out_memory
			else
				tagged_out_memory.append(once "like ")
				anchor.out_in_tagged_out_memory
			end
		end

	hash_code: INTEGER is
		do
			Result := full_name_memory.hash_code
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := other = Current
		end

feature {LIBERTY_DELAYED_TYPE}
	can_resolve: BOOLEAN is
		do
			Result := anchor.result_type.is_actual_type_set
		end

	resolved: LIBERTY_ACTUAL_TYPE is
		do
			Result := anchor.result_type.actual_type
		end

	full_name: FIXED_STRING is
		do
			Result := full_name_memory
		end

feature {}
	make (a_anchor: like anchor) is
		require
			a_anchor /= Void
		do
			anchor := a_anchor
			full_name_memory := (once "like " + a_anchor.name).intern
		ensure
			anchor = a_anchor
		end

	anchor: LIBERTY_ENTITY
	full_name_memory: FIXED_STRING

invariant
	anchor /= Void

end -- class LIBERTY_DELAYED_ANCHORED
