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
   LOGGING
      undefine out_in_tagged_out_memory
      end

insert
   LIBERTY_REACHABLE_MARKED
      undefine out_in_tagged_out_memory, is_equal
      end

feature {ANY}
   known_type: LIBERTY_KNOWN_TYPE is
      require
         is_known
      deferred
      end

   result_entity: LIBERTY_RESULT

   is_known: BOOLEAN is
      deferred
      end

   full_name: FIXED_STRING is
      deferred
      ensure
         Result /= Void
      end

   specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
      deferred
      ensure
         Result /= Void
      end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
   mark_reachable_code (mark: like reachable_mark) is
      do
         if not is_reachable then
            torch.burn
            log.trace.put_string(once "Marked reachable the type: ")
            log.trace.put_line(full_name)
         end
         reachable_mark := mark
      end

feature {LIBERTY_KNOWN_TYPE}
   full_name_in (buffer: STRING) is
      require
         buffer /= Void
      deferred
      end

feature {LIBERTY_TYPE_LISTENER}
   add_listener (a_listener: LIBERTY_TYPE_LISTENER) is
      require
         a_listener /= Void
         not has_listener(a_listener)
      do
         if is_known then
            known_type.add_listener(a_listener)
         else
            listeners.add_last(a_listener)
         end
      ensure
         not is_known implies has_listener(a_listener)
      end

   remove_listener (a_listener: LIBERTY_TYPE_LISTENER) is
      require
         a_listener /= Void
         has_listener(a_listener)
      do
         listeners.remove(listeners.fast_first_index_of(a_listener))
      ensure
         not has_listener(a_listener)
      end

   has_listener (a_listener: LIBERTY_TYPE_LISTENER): BOOLEAN is
      require
         a_listener /= Void
      do
         Result := listeners /= Void and then listeners.fast_has(a_listener)
      end

feature {}
   fire_type_known is
      local
         i: INTEGER
         listener: LIBERTY_TYPE_LISTENER
      do
         from
            i := listeners.lower
         until
            i > listeners.upper
         loop
            listener := listeners.item(i)
            listener.on_type_known(Current)
            if not known_type.has_listener(listener) then
               known_type.add_listener(listener)
            end
            i := i + 1
         end
         listeners := Void
      end

feature {}
   listeners: COLLECTION[LIBERTY_TYPE_LISTENER]
   torch: LIBERTY_ENLIGHTENING_THE_WORLD

invariant
   not is_known implies listeners /= Void

end
