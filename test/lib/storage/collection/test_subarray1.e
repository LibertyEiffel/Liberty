-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_SUBARRAY1

create {}
   make

feature {ANY}
   make
      local
         model2: FAST_ARRAY[INTEGER_8]; model3: ARRAY[INTEGER_8]
      do
         test({ARRAY[INTEGER_8] 1, << 1, 2, 3, 4 >> })
         create model2.from_collection({ARRAY[INTEGER_8] 1, << 1, 2, 3, 4 >> })
         test(model2)
         create model3.make(-2, 1)
         model3.put(1, -2)
         model3.put(2, -1)
         model3.put(3, 0)
         model3.put(4, 1)
         test(model3)
      end

   test (model: COLLECTION[INTEGER_8])
      local
         a: ARRAY[INTEGER_8]; fa: FAST_ARRAY[INTEGER_8]
      do
         create a.from_collection(model)
         test1_array(a)
         create fa.from_collection(model)
         test1_fast_array(fa)
      end

feature {}
   test1_array (model: ARRAY[INTEGER_8])
      local
         subarray: like model
      do
         subarray := model.subarray(model.lower, model.lower)
         assert(subarray.last = 1)
         assert(subarray.first = 1)
         subarray := model.subarray(model.lower, model.lower + 1)
         assert(subarray.first = 1)
         assert(subarray.last = 2)
         subarray := model.subarray(model.lower + 1, model.lower + 1)
         assert(subarray.first = 2)
         subarray := model.subarray(model.lower + 1, model.lower + 2)
         assert(subarray.first = 2)
         assert(subarray.last = 3)
         subarray := model.subarray(model.upper, model.upper)
         assert(subarray.last = 4)
         subarray := model.subarray(model.upper - 1, model.upper)
         assert(subarray.first = 3)
         assert(subarray.last = 4)
         subarray := model.subarray(model.lower, model.upper)
         assert(subarray.is_equal(model))
         subarray := model.subarray(model.upper, model.upper - 1)
         assert(subarray.is_empty)
      end

   test1_fast_array (model: FAST_ARRAY[INTEGER_8])
      local
         subarray: like model
      do
         subarray := model.subarray(model.lower, model.lower)
         assert(subarray.last = 1)
         assert(subarray.first = 1)
         subarray := model.subarray(model.lower, model.lower + 1)
         assert(subarray.first = 1)
         assert(subarray.last = 2)
         subarray := model.subarray(model.lower + 1, model.lower + 1)
         assert(subarray.first = 2)
         subarray := model.subarray(model.lower + 1, model.lower + 2)
         assert(subarray.first = 2)
         assert(subarray.last = 3)
         subarray := model.subarray(model.upper, model.upper)
         assert(subarray.last = 4)
         subarray := model.subarray(model.upper - 1, model.upper)
         assert(subarray.first = 3)
         assert(subarray.last = 4)
         subarray := model.subarray(model.lower, model.upper)
         assert(subarray.is_equal(model))
         subarray := model.subarray(model.upper, model.upper - 1)
         assert(subarray.is_empty)
      end

feature {}
   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_SUBARRAY1: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            -- std_output.put_string("Yes%N")
         end
      end

   cpt: INTEGER

end -- class TEST_SUBARRAY1
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
