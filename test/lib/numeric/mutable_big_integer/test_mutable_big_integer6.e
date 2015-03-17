-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_MUTABLE_BIG_INTEGER6
   --
   -- Testing `hash_code' and `copy'.
   --

insert
   ANY
   PLATFORM

create {}
   make

feature {}
   dictionary1: HASHED_DICTIONARY[MUTABLE_BIG_INTEGER, INTEGER_64]

   dictionary2: HASHED_DICTIONARY[INTEGER_64, MUTABLE_BIG_INTEGER]

   make
      local
         mbi1, mbi2, mbi3: MUTABLE_BIG_INTEGER; v1, v2: INTEGER_64
      do
         create dictionary1.make
         create dictionary2.make
         v1 := Maximum_integer_64
         create mbi1.from_integer_64(v1)
         dictionary1.put(mbi1, v1)
         dictionary2.put(v1, mbi1)
         assert(dictionary1.reference_at(v1) = mbi1)
         assert(dictionary2.at(mbi1) = v1)
         v2 := Minimum_integer_64
         create mbi2.from_integer_64(v2)
         dictionary1.put(mbi2, v2)
         dictionary2.put(v2, mbi2)
         assert(dictionary1.reference_at(v1) = mbi1)
         assert(dictionary2.at(mbi1) = v1)
         assert(dictionary1.reference_at(v2) = mbi2)
         assert(dictionary2.at(mbi2) = v2)
         mbi3 := mbi1.twin
         assert(mbi1.is_equal(mbi3))
         mbi3.from_integer(2)
         assert(not mbi1.is_equal(mbi3))
         mbi1.from_integer(2)
         assert(mbi1.is_equal(mbi3))
         mbi1.swap_with(mbi3)
         assert(mbi1.is_equal(mbi3))
         mbi3.from_integer(6)
         assert(not mbi1.is_equal(mbi3))
         mbi1.from_integer(6)
         assert(mbi1.is_equal(mbi3))
      end

   count: INTEGER

   assert (b: BOOLEAN)
      do
         count := count + 1
         if not b then
            sedb_breakpoint
            io.put_string("TEST_MUTABLE_BIG_INTEGER6 : ERROR Test # ")
            io.put_integer(count)
            io.put_string("%N")
         end
      end

end -- class TEST_MUTABLE_BIG_INTEGER6
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
