-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_ARRAY_RESIZE

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   ti1, ti2: ARRAY[INTEGER]

   tc1, tc2: ARRAY[CAT]

   c1, c2, c3, c4, c5, c6: CAT

   make
      do
         ti1 := {ARRAY[INTEGER] 1, << 1, 2, 3, 4, 5, 6, 7, 8, 9 >> }
         ti2 := {ARRAY[INTEGER] 1, << 1, 2, 3, 4, 5, 6, 7, 8, 9 >> }
         ti1.resize(2, 9)
         assert(ti1.is_equal(ti2.subarray(2, 9)))
         ti1.resize(2, 8)
         assert(ti1.is_equal(ti2.subarray(2, 8)))
         ti1.resize(3, 7)
         assert(ti1.is_equal(ti2.subarray(3, 7)))
         ti1.resize(1, 9)
         assert(ti1.is_equal({ARRAY[INTEGER] 1, << 0, 0, 3, 4, 5, 6, 7, 0, 0 >> }))
         ti1.resize(1, 10)
         assert(ti1.is_equal({ARRAY[INTEGER] 1, << 0, 0, 3, 4, 5, 6, 7, 0, 0, 0 >> }))
         ti1.make(1, 9)
         assert(ti1.is_equal({ARRAY[INTEGER] 1, << 0, 0, 0, 0, 0, 0, 0, 0, 0 >> }))
         create c1
         create c2
         create c3
         create c4
         create c5
         create c6
         tc1 := {ARRAY[CAT] 1, << c1, c2, c3, c4, c5, c6 >> }
         tc2 := {ARRAY[CAT] 2, << c2, c3, c4, c5, c6 >> }
         tc1.resize(2, 6)
         assert(tc1.is_equal(tc2))
         tc2 := {ARRAY[CAT] 1, << c1, c2, c3, c4, c5, c6 >> }
         assert(tc1.is_equal(tc2.subarray(2, 6)))
         tc1.resize(2, 5)
         assert(tc1.is_equal(tc2.subarray(2, 5)))
         tc1.resize(3, 4)
         assert(tc1.is_equal(tc2.subarray(3, 4)))
         tc1.resize(1, 6)
         assert(tc1.is_equal({ARRAY[CAT] 1, << Void, Void, c3, c4, Void, Void >> }))
         tc1.resize(1, 7)
         assert(tc1.is_equal({ARRAY[CAT] 1, << Void, Void, c3, c4, Void, Void, Void >> }))
         tc1.make(1, 6)
         tc2.clear_all
         assert(tc1.is_equal(tc2))
         tc1 := {ARRAY[CAT] 1, << c1, c2, c3, c4, c5, c6 >> }
         tc2 := tc1.subarray(1, 0)
         assert(tc2.is_empty)
         tc2 := tc1.subarray(3, 2)
         assert(tc2.is_empty)
      end

end -- class TEST_ARRAY_RESIZE
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
