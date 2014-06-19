-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_REMOVE1

create {}
   make

feature {ANY}
   make
      local
         fa: FAST_ARRAY[INTEGER]; ll: LINKED_LIST[INTEGER]; l2l: TWO_WAY_LINKED_LIST[INTEGER]
      do
         test({ARRAY[INTEGER] 1, << 1, 2, 3, 4, 5 >> })
         fa := {FAST_ARRAY[INTEGER] << 1, 2, 3, 4, 5 >> }
         test(fa)
         ll := {LINKED_LIST[INTEGER] << 1, 2, 3, 4, 5 >> }
         test(ll)
         l2l := {TWO_WAY_LINKED_LIST[INTEGER] << 1, 2, 3, 4, 5 >> }
         test(l2l)
      end

feature {}
   test (c: COLLECTION[INTEGER])
      do
         assert(c.count = 5)
         assert(c.first = 1)
         assert(c.item(c.lower + 1) = 2)
         assert(c.item(c.lower + 2) = 3)
         assert(c.item(c.lower + 3) = 4)
         assert(c.last = 5)
         c.remove(c.lower)
         assert(c.count = 4)
         assert(c.first = 2)
         assert(c.item(c.lower + 1) = 3)
         assert(c.item(c.lower + 2) = 4)
         assert(c.last = 5)
         c.remove(c.upper)
         assert(c.count = 3)
         assert(c.first = 2)
         assert(c.item(c.lower + 1) = 3)
         assert(c.last = 4)
         c.remove(c.lower + 1)
         assert(c.count = 2)
         assert(c.first = 2)
         assert(c.last = 4)
         c.remove(c.upper)
         assert(c.count = 1)
         assert(c.first = 2)
         assert(c.last = 2)
         c.remove(c.upper)
         assert(c.count = 0)
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_REMOVE1: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
            crash
         else
            -- std_output.put_string("Yes%N");
         end
      end

   cpt: INTEGER

end -- class TEST_REMOVE1
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
