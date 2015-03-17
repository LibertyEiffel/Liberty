-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_REMOVE_LAST1

create {}
   make

feature {ANY}
   make
      local
         a: ARRAY[INTEGER]; fa: FAST_ARRAY[INTEGER]; ll: LINKED_LIST[INTEGER]; l2l: TWO_WAY_LINKED_LIST[INTEGER]
      do
         a := {ARRAY[INTEGER] 1, << 1, 2, 3 >> }
         test(a)
         fa := {FAST_ARRAY[INTEGER] << 1, 2, 3 >> }
         test(fa)
         ll := {LINKED_LIST[INTEGER] << 1, 2, 3 >> }
         test(ll)
         l2l := {TWO_WAY_LINKED_LIST[INTEGER] << 1, 2, 3 >> }
         test(l2l)
      end

feature {}
   test (c: COLLECTION[INTEGER])
      do
         assert(c.count = 3)
         assert(c.last = 3)
         c.remove_last
         assert(c.count = 2)
         assert(c.last = 2)
         c.remove_last
         assert(c.count = 1)
         assert(c.last = 1)
         c.remove_last
         assert(c.count = 0)
         assert(c.is_empty)
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_REMOVE_LAST1: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
            crash
         else
            -- std_output.put_string("Yes%N");
         end
      end

   cpt: INTEGER

end -- class TEST_REMOVE_LAST1
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
