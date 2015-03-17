-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class BIJECTIVE_DICTIONARY_TESTER[V_, K_]

inherit
   BIJECTIVE_DICTIONARY[V_, K_]

insert
   EIFFELTEST_TOOLS
      undefine is_equal
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

   fast_has_value (v: V_): BOOLEAN
      local
         i: INTEGER
      do
         Result := tested.has_value(v)
         from
            i := ref.lower
         until
            i > ref.upper or else v = ref.item(i)
         loop
            i := i + 1
         end
         assert(Result = (i <= ref.upper))
      end

   capacity: INTEGER
      do
         Result := tested.capacity.min(ref.capacity)
      end

   key_at (v: V_): K_
      local
         i: INTEGER
      do
         Result := tested.key_at(v)
         from
            i := ref.lower
         until
            val_safe_equal(v, ref.item(i))
         loop
            i := i + 1
         end
         assert(Result = ref.key(i))
      end

   fast_at (k: K_): V_
      do
         Result := tested.fast_at(k)
         assert(Result = ref.fast_at(k))
      end

   item (i: INTEGER): V_
      do
         Result := tested.item(i)
         -- No assertion here
      end

   fast_key_at (v: V_): K_
      local
         i: INTEGER
      do
         Result := tested.fast_key_at(v)
         from
            i := ref.lower
         until
            v = ref.item(i)
         loop
            i := i + 1
         end
         assert(Result = ref.key(i))
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
         same_dictionaries
      end

   has_value (v: V_): BOOLEAN
      local
         i: INTEGER
      do
         Result := tested.has_value(v)
         from
            i := ref.lower
         until
            i > ref.upper or else val_safe_equal(v, ref.item(i))
         loop
            i := i + 1
         end
         assert(Result = (i <= ref.upper))
      end

feature {}
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
      local
         i: INTEGER; v: V_; k: K_
      do
         assert(ref.count = tested.count)
         from
            i := ref.lower
         until
            i > ref.upper
         loop
            v := ref.item(i)
            k := ref.key(i)
            assert(tested.fast_has(k))
            assert(tested.fast_at(k) = v)
            i := i + 1
         end
         from
            i := tested.lower
         until
            i > tested.upper
         loop
            v := tested.item(i)
            k := tested.key(i)
            assert(ref.fast_has(k))
            assert(ref.fast_at(k) = v)
            i := i + 1
         end
      end

   ref: ARRAY_DICTIONARY[V_, K_]

   tested: BIJECTIVE_DICTIONARY[V_, K_]

end -- class BIJECTIVE_DICTIONARY_TESTER
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
