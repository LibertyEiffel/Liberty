-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_FROM_COLLECTION1
   -- Test feature `set_all_with' of various implementations.

create {}
   make

feature {ANY}
   make
      local
         a: ARRAY[INTEGER]; fa: FAST_ARRAY[INTEGER]; ll: LINKED_LIST[INTEGER]; l2l: TWO_WAY_LINKED_LIST[INTEGER]
      do
         create a.from_collection(model1)
         test(a, model1)
         a.from_collection(model2)
         test(a, model2)
         a.from_collection(model3)
         test(a, model3)
         a.from_collection(model4)
         test(a, model4)
         create fa.from_collection(model1)
         test(fa, model1)
         fa.from_collection(model2)
         test(fa, model2)
         fa.from_collection(model3)
         test(fa, model3)
         fa.from_collection(model4)
         test(fa, model4)
         create ll.from_collection(model1)
         test(ll, model1)
         ll.from_collection(model2)
         test(ll, model2)
         ll.from_collection(model3)
         test(ll, model3)
         ll.from_collection(model4)
         test(ll, model4)
         create l2l.from_collection(model1)
         test(l2l, model1)
         l2l.from_collection(model2)
         test(l2l, model2)
         l2l.from_collection(model3)
         test(l2l, model3)
         l2l.from_collection(model4)
         test(l2l, model4)
      end

feature {}
   model1: ARRAY[INTEGER]
      once
         Result := {ARRAY[INTEGER] 1, << 6, 7, 8, 9 >> }
      end

   model2: ARRAY[INTEGER]
      once
         Result := {ARRAY[INTEGER] 1, << 1, 2 >> }
      end

   model3: ARRAY[INTEGER]
      once
         Result := {ARRAY[INTEGER] 1, << -1, -3, 6, 7, 8, 9 >> }
      end

   model4: LINKED_LIST[INTEGER]
      once
         create Result.make
      end

   test (c, model: COLLECTION[INTEGER])
      local
         i1, i2: INTEGER
      do
         assert(model.count = c.count)
         from
            i1 := c.lower
            i2 := model.lower
         until
            i2 > model.upper
         loop
            assert(c.item(i1) = model.item(i2))
            i1 := i1 + 1
            i2 := i2 + 1
         end
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_FROM_COLLECTION1: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            -- std_output.put_string("Yes%N");
         end
      end

   cpt: INTEGER

end -- class TEST_FROM_COLLECTION1
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
