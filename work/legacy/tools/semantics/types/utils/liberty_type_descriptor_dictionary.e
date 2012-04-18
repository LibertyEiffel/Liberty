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
class LIBERTY_TYPE_DESCRIPTOR_DICTIONARY[E_]
   --
   -- This dictionary helps supporting keys whose equality definition changes.
   --

inherit
   DICTIONARY[E_, LIBERTY_TYPE_DESCRIPTOR]
   LIBERTY_TYPE_DESCRIPTOR_CHANGE_LISTENER
      undefine
         out_in_tagged_out_memory, copy, is_equal
      end

creation {LIBERTY_UNIVERSE}
   make, with_capacity

feature {ANY}
   add (e: E_; td: LIBERTY_TYPE_DESCRIPTOR) is
      do
         dico.add(e, td)
         td.add_change_listener(Current)
      end

   put (e: E_; td: LIBERTY_TYPE_DESCRIPTOR) is
      do
         dico.put(e, td)
         td.add_change_listener(Current)
      end

   fast_put (e: E_; td: LIBERTY_TYPE_DESCRIPTOR) is
      do
         dico.fast_put(e, td)
         td.add_change_listener(Current)
      end

   remove (td: LIBERTY_TYPE_DESCRIPTOR) is
      do
         dico.remove(td)
         td.remove_change_listener(Current)
      end

   fast_remove (td: LIBERTY_TYPE_DESCRIPTOR) is
      do
         dico.fast_remove(td)
         td.remove_change_listener(Current)
      end

   has (td: LIBERTY_TYPE_DESCRIPTOR): BOOLEAN is
      do
         Result := dico.has(td)
      end

   at (td: LIBERTY_TYPE_DESCRIPTOR): E_ is
      do
         Result := dico.at(td)
      end

   reference_at (td: LIBERTY_TYPE_DESCRIPTOR): E_ is
      do
         Result := dico.reference_at(td)
      end

   fast_has (td: LIBERTY_TYPE_DESCRIPTOR): BOOLEAN is
      do
         Result := dico.fast_has(td)
      end

   fast_at (td: LIBERTY_TYPE_DESCRIPTOR): E_ is
      do
         Result := dico.fast_at(td)
      end

   fast_reference_at (td: LIBERTY_TYPE_DESCRIPTOR): E_ is
      do
         Result := dico.fast_reference_at(td)
      end

   clear_count is
      do
         dico.clear_count
      end

   clear_count_and_capacity is
      do
         dico.clear_count_and_capacity
      end

   count: INTEGER is
      do
         Result := dico.count
      end

   capacity: INTEGER is
      do
         Result := dico.capacity
      end

   item (index: INTEGER): E_ is
      do
         Result := dico.item(index)
      end

   key (index: INTEGER): LIBERTY_TYPE_DESCRIPTOR is
      do
         Result := dico.key(index)
      end

   new_iterator_on_keys: ITERATOR[LIBERTY_TYPE_DESCRIPTOR] is
      do
         Result := dico.new_iterator_on_keys
      end

   internal_key (td: LIBERTY_TYPE_DESCRIPTOR): LIBERTY_TYPE_DESCRIPTOR is
      do
         Result := dico.internal_key(td)
      end

feature {LIBERTY_TYPE_DESCRIPTOR}
   on_type_descriptor_changed (td: LIBERTY_TYPE_DESCRIPTOR) is
      local
         i: INTEGER
         e: E_
      do
         -- avoid duplicates
         e := dico.fast_reference_at(td)
         from
            i := lower
         until
            i > upper
         loop
            if td.same_as(dico.key(i)) then
               check
                  e.is_equal(dico.item(i))
               end
               dico.fast_remove(dico.key(i))
            else
               i := i + 1
            end
         end
      end

feature {}
   with_capacity (c: INTEGER) is
      require
         c >= 0
      do
         create dico.with_capacity(c)
      end

   make is
      do
         create dico.make
      end

   dico: HASHED_DICTIONARY[E_, LIBERTY_TYPE_DESCRIPTOR]

invariant
   dico /= Void

end
