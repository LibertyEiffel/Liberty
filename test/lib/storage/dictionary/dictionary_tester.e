-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class DICTIONARY_TESTER[V_, K_]

inherit
   DICTIONARY[V_, K_]

insert
   EIFFELTEST_TOOLS
      undefine copy, is_equal
      end

create {ANY}
   test

feature {ANY}
   reference_at (k: K_): V_
      do
         Result := tested.reference_at(k)
         assert(Result = ref.reference_at(k))
      end

   fast_reference_at (k: K_): V_
      do
         Result := tested.fast_reference_at(k)
         assert(Result = ref.fast_reference_at(k))
      end

   internal_key (k: K_): K_
      do
         Result := tested.internal_key(k)
         assert(Result = ref.internal_key(k))
      end

   add (v: V_; k: K_)
      do
         tested.add(v, k)
         ref.add(v, k)
         same_dictionaries
      end

   fast_has (k: K_): BOOLEAN
      do
         Result := tested.fast_has(k)
         assert(Result = ref.fast_has(k))
      end

   has (k: K_): BOOLEAN
      do
         Result := tested.has(k)
         assert(Result = ref.has(k))
      end

   remove (k: K_)
      do
         tested.remove(k)
         ref.remove(k)
         same_dictionaries
      end

   clear_count
      do
         tested.clear_count
         ref.clear_count
         same_dictionaries
      end

   clear_count_and_capacity
      do
         tested.clear_count_and_capacity
         ref.clear_count_and_capacity
         same_dictionaries
      end

   capacity: INTEGER
      do
         Result := tested.capacity.min(ref.capacity)
      end

   fast_at (k: K_): V_
      do
         Result := tested.fast_at(k)
         assert(Result = ref.fast_at(k))
      end

   fast_remove (k: K_)
      do
         tested.fast_remove(k)
         ref.fast_remove(k)
         same_dictionaries
      end

   item (i: INTEGER): V_
      do
         Result := tested.item(i)
         -- No assertion here
      end

   fast_put (v: V_; k: K_)
      do
         tested.fast_put(v, k)
         ref.fast_put(v, k)
         same_dictionaries
      end

   put (v: V_; k: K_)
      do
         tested.put(v, k)
         ref.put(v, k)
         same_dictionaries
      end

   at (k: K_): V_
      do
         Result := tested.at(k)
         assert(Result = ref.at(k))
      end

   key (i: INTEGER): K_
      do
         Result := tested.key(i)
         -- No assertion here
      end

   count: INTEGER
      do
         Result := tested.count
         assert(Result = ref.count)
      end

   get_new_iterator_on_keys: ITERATOR[K_]
      do
         create {ITERATOR_ON_DICTIONARY_KEYS[V_, K_]} Result.make(Current)
      end

feature {}
   make
      do
         clear_count
      end

   test (tested_: like tested)
      local
         i: INTEGER
      do
         tested := tested_
         create ref.with_capacity(tested.capacity)
         from
            i := tested.lower
         until
            i > tested.upper
         loop
            ref.put(tested.item(i), tested.key(i))
            i := i + 1
         end
      end

   same_dictionaries
      do
         included_in(ref, tested)
         included_in(tested, ref)
      end

   included_in (a, b: DICTIONARY[V_, K_])
      local
         i: INTEGER; v: V_; k: K_
      do
         assert(a.count = b.count)
         from
            i := a.lower
         until
            i > a.upper
         loop
            v := a.item(i)
            k := a.key(i)
            assert(b.fast_has(k))
            assert(b.fast_at(k) = v)
            i := i + 1
         end
      end

   ref: ARRAY_DICTIONARY[V_, K_]

   tested: DICTIONARY[V_, K_]

end -- class DICTIONARY_TESTER
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
