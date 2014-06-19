-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NATIVE_ARRAY8

create {}
   make

feature {ANY}
   make
      local
         a, b: NATIVE_ARRAY[ANY]; cat: CAT; dog: DOG
      do
         create cat
         create dog
         a := a.calloc(2)
         -- *** Correctly rejected *** (Dom. nov 10th 2004) *** a.put(cat,0);
         -- *** Correctly rejected *** (Dom. nov 10th 2004) *** a.put(dog,1);
         -- *** Correctly rejected *** (Dom. nov 10th 2004) *** assert(a.item(0) = cat);
         -- *** Correctly rejected *** (Dom. nov 10th 2004) *** assert(a.item(1) = dog);
         a := a.realloc(2, 1024)
         -- *** Correctly rejected *** (Dom. nov 10th 2004) *** assert(a.item(0) = cat);
         -- *** Correctly rejected *** (Dom. nov 10th 2004) *** assert(a.item(1) = dog);
         b := b.calloc(2)
         assert(b.item(0) = Void)
         assert(b.item(1) = Void)
         -- *** Correctly rejected *** (Dom. nov 10th 2004) *** b.put(cat,0);
         -- *** Correctly rejected *** (Dom. nov 10th 2004) *** b.put(dog,1);
         -- *** Correctly rejected *** (Dom. nov 10th 2004) *** assert(b.item(0) = cat);
         -- *** Correctly rejected *** (Dom. nov 10th 2004) *** assert(b.item(1) = dog);
         b := b.realloc(2, 1024)
         -- *** Correctly rejected *** (Dom. nov 10th 2004) *** assert(b.item(0) = cat);
         -- *** Correctly rejected *** (Dom. nov 10th 2004) *** assert(b.item(1) = dog);
         assert(a.fast_memcmp(b, 2))
         assert(a.memcmp(b, 2))
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_NATIVE_ARRAY8: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
            crash
         else
            -- std_output.put_string("Yes%N");
         end
      end

   cpt: INTEGER

end -- class TEST_NATIVE_ARRAY8
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
