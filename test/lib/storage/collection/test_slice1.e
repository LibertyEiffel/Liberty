-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_SLICE1

insert
   EIFFELTEST_TOOLS
   
create {}
   make

feature {ANY}
   make
      local
         model2: FAST_ARRAY[INTEGER]; model3: ARRAY[INTEGER]
      do
         test({ARRAY[INTEGER] 1, << 1, 2, 3, 4 >> })
         create model2.from_collection({ARRAY[INTEGER] 1, << 1, 2, 3, 4 >> })
         test(model2)
         create model3.make(-2, 1)
         model3.put(1, -2)
         model3.put(2, -1)
         model3.put(3, 0)
         model3.put(4, 1)
         test(model3)
      end

   test (model: COLLECTION[INTEGER])
      local
         a: ARRAY[INTEGER]; fa: FAST_ARRAY[INTEGER]; ll: LINKED_LIST[INTEGER]; l2l: TWO_WAY_LINKED_LIST[INTEGER]
      do
         create a.from_collection(model)
         test1(a)
         create fa.from_collection(model)
         test1(fa)
         create ll.from_collection(model)
         test1(ll)
         create l2l.from_collection(model)
         test1(l2l)
      end

feature {}
   test1 (model: COLLECTION[INTEGER])
      local
         slice: like model
      do
         slice := model.slice(model.lower, model.lower)
         assert(slice.last = 1)
         slice := model.slice(model.lower, model.lower + 1)
         assert(slice.first = 1)
         assert(slice.last = 2)
         slice := model.slice(model.lower + 1, model.lower + 1)
         assert(slice.first = 2)
         slice := model.slice(model.lower + 1, model.lower + 2)
         assert(slice.first = 2)
         assert(slice.last = 3)
         slice := model.slice(model.upper, model.upper)
         assert(slice.last = 4)
         slice := model.slice(model.upper - 1, model.upper)
         assert(slice.first = 3)
         assert(slice.last = 4)
         slice := model.slice(model.lower, model.upper)
         assert(slice.is_equal(model))
         slice := model.slice(model.lower, model.lower - 1)
         assert(slice.is_empty)
         slice := model.slice(model.upper, model.upper - 1)
         assert(slice.is_empty)
      end

end -- class TEST_SLICE1
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
