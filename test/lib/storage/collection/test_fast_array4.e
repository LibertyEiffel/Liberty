-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_FAST_ARRAY4

inherit
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         fa2: FAST_ARRAY2[INTEGER]
      do
         create fa2.from_model({ARRAY[ARRAY[INTEGER]] 1, << {ARRAY[INTEGER] 1, << 1, 2, 3 >> }, {ARRAY[INTEGER] 1, << 4, 5, 6 >> } >> })
         assert(fa2.item(0, 0) = 1)
         assert(fa2.item(0, 1) = 2)
         assert(fa2.item(0, 2) = 3)
         assert(fa2.item(1, 0) = 4)
         assert(fa2.item(1, 1) = 5)
         assert(fa2.item(1, 2) = 6)
         create fa2.from_collection2(fa2)
         assert(fa2.item(0, 0) = 1)
         assert(fa2.item(0, 1) = 2)
         assert(fa2.item(0, 2) = 3)
         assert(fa2.item(1, 0) = 4)
         assert(fa2.item(1, 1) = 5)
         assert(fa2.item(1, 2) = 6)
         fa2 := fa2.sub_collection2(0, 1, 0, 1)
         assert(fa2.item(0, 0) = 1)
         assert(fa2.item(0, 1) = 2)
         assert(fa2.item(1, 0) = 4)
         assert(fa2.item(1, 1) = 5)
      end

end -- class TEST_FAST_ARRAY4
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
