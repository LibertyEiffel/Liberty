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
      redefine mark_reachable_code, is_equal
      end

create {ANY}
   make

feature {ANY}
   known_type: LIBERTY_KNOWN_TYPE

   is_known: BOOLEAN

   full_name: FIXED_STRING is
      do
         if is_known then
            Result := known_type.full_name
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
         full_name.out_in_tagged_out_memory
      end

   specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
      local
         dr: like delayed_resolver
      do
         dr := delayed_resolver.specialized_in(a_type)
         if dr = delayed_resolver then
            Result := Current
         else
            create Result.make(dr)
         end
      end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
   mark_reachable_code (mark: like reachable_mark) is
      local
         old_mark: like reachable_mark
      do
         old_mark := reachable_mark
         Precursor(mark)
         if old_mark < mark and then is_known then
            known_type.mark_reachable_code(mark)
         end
      end

feature {LIBERTY_KNOWN_TYPE}
   full_name_in (buffer: STRING) is
      do
         buffer.append(full_name)
      end

feature {LIBERTY_UNIVERSE}
   can_resolve: BOOLEAN is
      require
         not is_known
      do
         Result := delayed_resolver.can_resolve
      end

   resolve is
      require
         can_resolve
      do
         known_type := delayed_resolver.resolved
         is_known := True
         fire_type_known
         torch.burn
      ensure
         is_known
      end

feature {}
   make (a_delayed_resolver: like delayed_resolver) is
      require
         a_delayed_resolver /= Void
      do
         delayed_resolver := a_delayed_resolver
         lookup.resolver.delayed_types.add_last(Current)
         create {FAST_ARRAY[LIBERTY_TYPE_LISTENER]} listeners.with_capacity(2)
         create result_entity.make(Current, errors.unknown_position)
      ensure
         delayed_resolver = a_delayed_resolver
         not_yet_reachable: not is_reachable
      end

   delayed_resolver: LIBERTY_DELAYED_RESOLVER
   lookup: LIBERTY_TYPE_LOOKUP
   errors: LIBERTY_ERRORS

invariant
   delayed_resolver /= Void
   result_entity /= Void

end -- class LIBERTY_DELAYED_TYPE
