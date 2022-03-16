-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ORDERED_DICTIONARY[V_, K_ -> HASHABLE]
   --
   -- Used by INI_PARSER to be sure that the key iterator wanders through the
   -- key set in the order in which they were added.
   --

inherit
   HASHED_DICTIONARY[V_, K_]
      redefine put, add, new_iterator_on_keys, create_with_capacity, copy, clear_count, clear_count_and_capacity
      end

create {ANY}
   make, with_capacity

feature {ANY}
   put (v: V_; k: K_)
      do
         if has(k) then
            Precursor(v, k)
         else
            add(v, k)
         end
      end

   copy (other: like Current)
      local
         i: INTEGER
      do
         clear_count
         from
            if capacity < other.count then
               with_capacity(other.count + 1)
            elseif capacity = 0 then
               make
            end
            i := 1
         until
            i > other.count
         loop
            add(other.item(i), other.key(i))
            i := i + 1
         end
      end

   clear_count
      do
         Precursor
         ordered_keys.clear_count
      end

   clear_count_and_capacity
      do
         Precursor
         ordered_keys.clear_count_and_capacity
      end

   add (v: V_; k: K_)
      do
         Precursor(v, k)
         ordered_keys.add_last(k)
      end

   new_iterator_on_keys: ITERATOR[K_]
      do
         Result := ordered_keys.new_iterator
      end

feature {}
   create_with_capacity (medium_size: INTEGER)
      do
         Precursor(medium_size)
         create ordered_keys.with_capacity(medium_size)
      end

   ordered_keys: FAST_ARRAY[K_]

invariant
   count = ordered_keys.count

end -- class ORDERED_DICTIONARY
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
