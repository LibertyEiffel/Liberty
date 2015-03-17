-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_IS_EQUAL_MAP

create {}
   make

feature {ANY}
   make
      local
         c1, c2: COLLECTION[STRING]; d1, d2: HASHED_DICTIONARY[STRING, INTEGER]
      do
         create d1.make
         create d2.make
         d1.put("foo", 1)
         assert(not d1.is_equal(d2)) -- may also be written like "not d1~d2"
         d2.put("foo", 1)
         assert(d1~d2)
         c1 := {FAST_ARRAY[STRING] << "foo", "bar" >> }
         c2 := {FAST_ARRAY[STRING] << "foo", "bar" >> }
         assert(c1~c2)
         create {FAST_ARRAY[STRING]} c1.from_collection(c1)
         create {FAST_ARRAY[STRING]} c2.from_collection(c2)
         assert(c1~c2)
         create {LINKED_LIST[STRING]} c1.from_collection(c1)
         create {LINKED_LIST[STRING]} c2.from_collection(c2)
         assert(c1~c2)
         create {TWO_WAY_LINKED_LIST[STRING]} c1.from_collection(c1)
         create {TWO_WAY_LINKED_LIST[STRING]} c2.from_collection(c2)
         assert(c1~c2)
      end

feature {}
   assert (bool: BOOLEAN)
      do
         cpt := cpt + 1
         if not bool then
            std_output.put_string("TEST_IS_EQUAL_MAP: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
            crash
         end
      end

   cpt: INTEGER

end -- class TEST_IS_EQUAL_MAP
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
