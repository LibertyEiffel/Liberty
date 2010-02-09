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
class LIBERTY_DELAYED_TYPE
	--
	-- A type to be resolved later.
	--

inherit
	LIBERTY_TYPE

creation {ANY}
	make

feature {ANY}
	actual_type: LIBERTY_ACTUAL_TYPE

	is_actual_type_set: BOOLEAN

	full_name: FIXED_STRING is
		do
			if is_actual_type_set then
				Result := actual_type.full_name
			else
				Result := delayed_resolver.full_name
			end
		end

	hash_code: INTEGER is
		do
			Result := delayed_resolver.hash_code
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := other = Current
		end

	out_in_tagged_out_memory is
		do
			tagged_out_memory.extend('{')
			to_pointer.append_in(tagged_out_memory)
			tagged_out_memory.extend('#')
			delayed_resolver.out_in_tagged_out_memory
			tagged_out_memory.extend('}')
		end

feature {LIBERTY_ACTUAL_TYPE}
	full_name_in (buffer: STRING) is
		do
			buffer.append(full_name)
		end

feature {LIBERTY_UNIVERSE}
	can_resolve: BOOLEAN is
		require
			not is_actual_type_set
		do
			Result := not export_only and then delayed_resolver.can_resolve
		end

	resolve is
		require
			can_resolve
		do
			actual_type := delayed_resolver.resolved
			is_actual_type_set := True
			fire_actual_type_set
			torch.burn
			if not export_only then
				actual_type.unset_export_only
			end
		ensure
			is_actual_type_set
		end

feature {}
	make (a_delayed_resolver: like delayed_resolver) is
		require
			a_delayed_resolver /= Void
		do
			delayed_resolver := a_delayed_resolver
			lookup.resolver.delayed_types.add_last(Current)
			export_only := True
			create {FAST_ARRAY[LIBERTY_TYPE_LISTENER]} listeners.with_capacity(2)

			debug
				if full_name.is_equal(once "like ( like new_iterator.item)") then
					sedb_breakpoint
				end
			end
		ensure
			delayed_resolver = a_delayed_resolver
			export_only
		end

	delayed_resolver: LIBERTY_DELAYED_RESOLVER
	torch: LIBERTY_ENLIGHTENING_THE_WORLD
	lookup: LIBERTY_TYPE_LOOKUP

invariant
	delayed_resolver /= Void

end -- class LIBERTY_DELAYED_TYPE
