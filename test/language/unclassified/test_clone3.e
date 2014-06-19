-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_CLONE3
   -- Test feature `set_all_with' of various implementations.

create {}
   make

feature {ANY}
   make
      local
         a: ARRAY[INTEGER]; fa: FAST_ARRAY[INTEGER]; ll: LINKED_LIST[INTEGER]; l2l: TWO_WAY_LINKED_LIST[INTEGER]
      do
         a := model1a.twin
         test(a, model1a)
         a := model2a.twin
         test(a, model2a)
         a := model3a.twin
         test(a, model3a)
         a := model4a.twin
         test(a, model4a)
         fa := model1fa.twin
         test(fa, model1fa)
         fa := model2fa.twin
         test(fa, model2fa)
         fa := model3fa.twin
         test(fa, model3fa)
         fa := model4fa.twin
         test(fa, model4fa)
         ll := model1ll.twin
         test(ll, model1ll)
         ll := model2ll.twin
         test(ll, model2ll)
         ll := model3ll.twin
         test(ll, model3ll)
         ll := model4ll.twin
         test(ll, model4ll)
         l2l := model1l2l.twin
         test(l2l, model1l2l)
         l2l := model2l2l.twin
         test(l2l, model2l2l)
         l2l := model3l2l.twin
         test(l2l, model3l2l)
         l2l := model4l2l.twin
         test(l2l, model4l2l)
      end

feature {}
   model1a: ARRAY[INTEGER]
      once
         Result := {ARRAY[INTEGER] 1, << 6, 7, 8, 9 >> }
      end

   model2a: ARRAY[INTEGER]
      once
         Result := {ARRAY[INTEGER] 1, << 1, 2 >> }
      end

   model3a: ARRAY[INTEGER]
      once
         Result := {ARRAY[INTEGER] 1, << -1, -3, 6, 7, 8, 9 >> }
      end

   model4a: ARRAY[INTEGER]
      once
         create Result.make(2, 1)
      end

   model1fa: FAST_ARRAY[INTEGER]
      once
         create Result.with_capacity(4)
         Result.add_last(6)
         Result.add_last(7)
         Result.add_last(8)
         Result.add_last(9)
      end

   model2fa: FAST_ARRAY[INTEGER]
      once
         create Result.with_capacity(2)
         Result.add_last(1)
         Result.add_last(2)
      end

   model3fa: FAST_ARRAY[INTEGER]
      once
         create Result.with_capacity(6)
         Result.add_last(-1)
         Result.add_last(-3)
         Result.add_last(6)
         Result.add_last(7)
         Result.add_last(8)
         Result.add_last(9)
      end

   model4fa: FAST_ARRAY[INTEGER]
      once
         create Result.make(0)
      end

   model1ll: LINKED_LIST[INTEGER]
      once
         create Result.make
         Result.add_last(6)
         Result.add_last(7)
         Result.add_last(8)
         Result.add_last(9)
      end

   model2ll: LINKED_LIST[INTEGER]
      once
         create Result.make
         Result.add_last(1)
         Result.add_last(2)
      end

   model3ll: LINKED_LIST[INTEGER]
      once
         create Result.make
         Result.add_last(-1)
         Result.add_last(-3)
         Result.add_last(6)
         Result.add_last(7)
         Result.add_last(8)
         Result.add_last(9)
      end

   model4ll: LINKED_LIST[INTEGER]
      once
         create Result.make
      end

   model1l2l: TWO_WAY_LINKED_LIST[INTEGER]
      once
         create Result.make
         Result.add_last(6)
         Result.add_last(7)
         Result.add_last(8)
         Result.add_last(9)
      end

   model2l2l: TWO_WAY_LINKED_LIST[INTEGER]
      once
         create Result.make
         Result.add_last(1)
         Result.add_last(2)
      end

   model3l2l: TWO_WAY_LINKED_LIST[INTEGER]
      once
         create Result.make
         Result.add_last(-1)
         Result.add_last(-3)
         Result.add_last(6)
         Result.add_last(7)
         Result.add_last(8)
         Result.add_last(9)
      end

   model4l2l: TWO_WAY_LINKED_LIST[INTEGER]
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
            std_output.put_string("TEST_CLONE3: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         end
      end

   cpt: INTEGER

end -- class TEST_CLONE3
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
