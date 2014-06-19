-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_HASH_CODE1

insert
   PLATFORM
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         d1: HASHED_DICTIONARY[INTEGER, CHARACTER]; d2: HASHED_DICTIONARY[INTEGER, INTEGER]
         d3: HASHED_DICTIONARY[INTEGER, REAL_32]; d4: HASHED_DICTIONARY[INTEGER, REAL_64]
         d5: HASHED_DICTIONARY[INTEGER, POINTER]; cref: REFERENCE[CHARACTER]; iref: REFERENCE[INTEGER]
         rref: REFERENCE[REAL_32]; dref: REFERENCE[REAL_64]
      do
         create d1.make
         assert(not d1.has('b'))
         d1.put(6, 'b')
         assert(d1.has('b'))
         assert(d1.at('b') = 6)
         assert(not d1.has('a'))
         d1.put(7, 'a')
         assert(d1.has('b'))
         assert(d1.has('a'))
         assert(d1.at('a') = 7)
         create d2.make
         assert(not d2.has(2))
         d2.put(6, 2)
         assert(d2.has(2))
         assert(d2.at(2) = 6)
         assert(not d2.has(1))
         d2.put(7, 1)
         assert(d2.has(2))
         assert(d2.has(1))
         assert(d2.at(1) = 7)
         d2.put(Minimum_integer, Minimum_integer)
         assert(d2.at(Minimum_integer) = Minimum_integer)
         d2.put(Maximum_integer, Maximum_integer)
         assert(d2.at(Maximum_integer) = Maximum_integer)
         create d3.make
         assert(not d3.has({REAL_32 2.0}))
         d3.put(6, {REAL_32 2.0})
         assert(d3.has({REAL_32 2.0}))
         assert(d3.at({REAL_32 2.0}) = 6)
         assert(not d3.has({REAL_32 1.5}))
         d3.put(7, {REAL_32 1.5})
         assert(d3.has({REAL_32 2.0}))
         assert(d3.has({REAL_32 1.5}))
         assert(d3.at({REAL_32 1.5}) = 7)
         d3.put(8, Maximum_real_32)
         assert(d3.at(Maximum_real_32) = 8)
         d3.put(9, Minimum_real_32)
         assert(d3.at(Minimum_real_32) = 9)
         create d4.make
         assert(not d4.has(2.6))
         d4.put(6, 2.6)
         assert(d4.has(2.6))
         assert(d4.at(2.6) = 6)
         assert(not d4.has(1.5))
         d4.put(7, 1.5)
         assert(d4.has(2.6))
         assert(d4.has(1.5))
         assert(d4.at(1.5) = 7)
         d4.put(8, Maximum_real_64)
         assert(d4.at(Maximum_real_64) = 8)
         d4.put(9, Minimum_real_64)
         assert(d4.at(Minimum_real_64) = 9)
         create d5.make
         create cref.set_item('a')
         assert(not d5.has(cref.to_pointer))
         d5.put(1, cref.to_pointer)
         assert(d5.has(cref.to_pointer))
         assert(d5.at(cref.to_pointer) = 1)
         create iref.set_item(1)
         assert(not d5.has(iref.to_pointer))
         d5.put(1, iref.to_pointer)
         assert(d5.has(iref.to_pointer))
         assert(d5.at(iref.to_pointer) = 1)
         create rref.set_item({REAL_32 1.5})
         assert(not d5.has(rref.to_pointer))
         d5.put(1, rref.to_pointer)
         assert(d5.has(rref.to_pointer))
         assert(d5.at(rref.to_pointer) = 1)
         create dref.set_item(1.5)
         assert(not d5.has(dref.to_pointer))
         d5.put(1, dref.to_pointer)
         assert(d5.has(dref.to_pointer))
         assert(d5.at(dref.to_pointer) = 1)
      end

end -- class TEST_HASH_CODE1
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
