-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_ARRAY_REFERENCE1
   --
   -- Test Reference/ARRAY.
   --

create {}
   make

feature {ANY}
   a, a2: ARRAY[CAT]

   c1, c2, c3, cv: CAT

   i: INTEGER

   a_cat: ARRAY[CAT]

   a_animal: ARRAY[ANIMAL]

   make
      do
         create c1
         create c2
         create c3
         create a.make(1, 0)
         assert(a.lower = 1)
         assert(a.upper = 0)
         assert(a.count = 0)
         assert(a.is_empty)
         a.make(1, 1)
         assert(a.count = 1)
         assert(a.lower = 1)
         assert(a.upper = 1)
         assert(a.item(1) = Void)
         create a.make(1, 4)
         assert(a.count = 4)
         from
            i := 1
         until
            i > a.count
         loop
            assert(a.item(i) = Void)
            i := i + 1
         end
         create a.make(-3, -2)
         assert(a.count = 2)
         assert(not a.is_empty)
         assert(a.lower = -3)
         assert(a.upper = -2)
         a.put(c1, -3)
         a.put(c2, -2)
         assert(a.item(-3) = c1)
         assert(a.item(-2) = c2)
         create a.make(-1, -2)
         assert(a.count = 0)
         assert(a.is_empty)
         assert(a.lower = -1)
         a.add_last(c1)
         assert(a.count = 1)
         assert(a.item(-1) = c1)
         a := {ARRAY[CAT] 1, << c1 >> }
         assert(a.count = 1)
         assert(a.lower = 1)
         assert(a.upper = 1)
         assert(a.item(1) = c1)
         a.add_last(c2)
         assert(a.count = 2)
         assert(a.item(1) = c1)
         assert(a.item(2) = c2)
         create a.make(1, 3)
         a.put(c2, 2)
         create a.make(1, 3)
         a.put(c1, 1)
         a.put(c2, 2)
         a.put(c3, 3)
         assert(a.is_equal({ARRAY[CAT] 1, << c1, c2, c3 >> }))
         a.resize(0, 4)
         assert(a.item(0) = Void)
         assert(a.item(1) = c1)
         assert(a.item(2) = c2)
         assert(a.item(3) = c3)
         assert(a.item(4) = Void)
         a := {ARRAY[CAT] 1, << c1, c2, c3 >> }
         a.resize(0, 4)
         assert(a.item(0) = Void)
         assert(a.item(1) = c1)
         assert(a.item(2) = c2)
         assert(a.item(3) = c3)
         assert(a.item(4) = Void)
         a2 := {ARRAY[CAT] 1, << c1 >> }
         a := a2.twin
         assert(a.count = 1)
         assert(a2.count = 1)
         assert(a.item(1) = c1)
         a2.put(c2, 1)
         assert(a2.item(1) = c2)
         assert(a.item(1) = c1)
         a := {ARRAY[CAT] 1, << c1, c2, c3 >> }
         a2 := a.twin
         assert(a.is_equal(a2))
         a.put(Void, 2)
         assert(not a.is_equal(a2))
         create a.make(1, 3)
         a.put(c2, 2)
         assert(a.is_equal({ARRAY[CAT] 1, << Void, c2, Void >> }))
         a.put(Void, 2)
         assert(not a.is_equal({ARRAY[CAT] 1, << Void, c2, Void >> }))
         a.make(1, 3)
         assert(a.item(1) = Void)
         assert(a.item(2) = Void)
         assert(a.item(3) = Void)
         create a.make(2, 2)
         a.force(c1, 1)
         assert(a.is_equal({ARRAY[CAT] 1, << c1, Void >> }))
         a.force(c3, 3)
         assert(a.is_equal({ARRAY[CAT] 1, << c1, Void, c3 >> }))
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_ARRAY_REFERENCE1 : ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            -- std_output.put_string("Yes%N");
         end
      end

   cpt: INTEGER

end -- class TEST_ARRAY_REFERENCE1
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
