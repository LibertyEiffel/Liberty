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
class LIBERTY_DELAYED_FEATURE_TYPE

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
				tagged_out_memory.append(type.full_name)
				tagged_out_memory.extend('.')
				name.out_in_tagged_out_memory
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
			Result := is_ready and then the_feature.result_type /= Void and then the_feature.result_type.is_actual_type_set
		end

	resolved: LIBERTY_ACTUAL_TYPE is
		do
			Result := the_feature.result_type.actual_type
		end

	full_name: FIXED_STRING is
		do
			Result := full_name_memory
		end

feature {LIBERTY_FEATURE_ENTITY}
	is_ready: BOOLEAN is
		do
			Result := type.has_feature(name) and then type.feature_definition(name).the_feature /= Void
		end

	the_feature: LIBERTY_FEATURE is
		require
			is_ready
		do
			Result := type.feature_definition(name).the_feature
		end

	name: LIBERTY_FEATURE_NAME
	type: LIBERTY_ACTUAL_TYPE

feature {}
	make (a_type: like type; a_name: like name) is
		require
			a_type /= Void
			a_name /= Void
		do
			type := a_type
			name := a_name

			lock_tagged_out
			tagged_out_memory.copy(once "like ")
			a_type.full_name.out_in_tagged_out_memory
			tagged_out_memory.extend('.')
			a_name.out_in_tagged_out_memory
			full_name_memory := tagged_out_memory.intern
			unlock_tagged_out
		ensure
			type = a_type
			name = a_name
		end

	full_name_memory: FIXED_STRING

invariant
	type /= Void
	name /= Void

end -- class LIBERTY_DELAYED_FEATURE_TYPE
