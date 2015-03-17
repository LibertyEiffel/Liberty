-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_DICTIONARY1

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   k1: STRING "k1"
   k2: STRING "k2"
   k3: STRING "k3"
   k4: STRING "k4"

   v1: STRING "v1"
   v2: STRING "v2"
   v3: STRING "v3"
   v4: STRING "v4"

   test (d: DICTIONARY[STRING, STRING])
      local
         k, v: STRING; i: INTEGER; v_list, k_list: ARRAY[STRING]
      do
         assert(d.count = 0)
         assert(d.is_empty)
         assert(not d.has(k1))
         d.put(v1, k1)
         assert(d.count = 1)
         assert(not d.is_empty)
         assert(d.has(k1))
         assert(not d.has(k2))
         assert(d @ k1 = v1)
         assert(d.at(k1) = v1)
         assert(d.at("k1") = v1)
         assert(d.item(1) = v1)
         d.put(v2, k2)
         assert(d.count = 2)
         assert(not d.is_empty)
         assert(d.has("k1"))
         assert(d.has("k2"))
         assert(not d.has("k3"))
         assert(d @ k1 = v1)
         assert(d.at(k2) = v2)
         assert(d.item(1) = v1 or d.item(1) = v2)
         assert(d.item(2) = v1 or d.item(2) = v2)
         assert(d.key_at(v1) = k1)
         assert(d.key_at(v2) = k2)
         d.put(v3, k3)
         d.put(v4, k4)
         from
            v_list := {ARRAY[STRING] 1, << v1, v2, v3, v4 >> }
            k_list := {ARRAY[STRING] 1, << k1, k2, k3, k4 >> }
            i := 1
         invariant
            v_list.count = k_list.count
         variant
            v_list.count - 1
         until
            i > d.count
         loop
            v := d.item(i)
            k := d.key(i)
            v_list.remove(v_list.fast_first_index_of(v))
            k_list.remove(k_list.fast_first_index_of(k))
            i := i + 1
         end
         assert(v_list.is_empty)
         assert(k_list.is_empty)
         from
            v_list := {ARRAY[STRING] 1, << v1, v2, v3, v4 >> }
            k_list := {ARRAY[STRING] 1, << k1, k2, k3, k4 >> }
            i := 1
         invariant
            v_list.count = k_list.count
         variant
            v_list.count
         until
            i > d.count
         loop
            v := d.item(i)
            k := d.key_at(v)
            v_list.remove(v_list.fast_first_index_of(v))
            k_list.remove(k_list.fast_first_index_of(k))
            i := i + 1
         end
         assert(v_list.is_empty)
         assert(k_list.is_empty)
         assert(d.count = 4)
         d.remove(k1)
         assert(d.count = 3)
         d.remove(k2)
         assert(d.count = 2)
         d.remove(k3)
         assert(d.count = 1)
         d.remove(k4)
         assert(d.count = 0)
      end

   make
      do
         test(create {ARRAY_DICTIONARY[STRING, STRING]}.make)
         test(create {HASHED_DICTIONARY[STRING, STRING]}.make)
         test(create {PYTHON_DICTIONARY[STRING, STRING]}.make)
      end

end -- class TEST_DICTIONARY1
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
