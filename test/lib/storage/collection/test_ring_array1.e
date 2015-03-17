-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_RING_ARRAY1

inherit
   ANY

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   rai: RING_ARRAY[INTEGER]

   make
      local
         i: INTEGER
      do
         create rai.make(0, 2)
         assert(rai.count = 3)
         assert(rai.upper = 2)
         assert(rai.lower = 0)
         from
            i := rai.upper
         until
            i < 0
         loop
            assert(rai.item(i) = 0)
            rai.put(i, i)
            i := i - 1
         end
         from
            i := rai.upper
         until
            i < 0
         loop
            assert(rai.item(i) = i)
            i := i - 1
         end
         assert(rai.count = 3)
         rai.clear_count
         assert(rai.count = 0)
         rai.clear_count_and_capacity
         assert(rai.capacity = 0)
      end

end -- class TEST_RING_ARRAY1
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
