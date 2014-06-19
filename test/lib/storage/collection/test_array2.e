-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_ARRAY2

create {}
   make

feature {ANY}
   a, b: ARRAY2[INTEGER_8]

   make
      local
         i1, i2: INTEGER; v: INTEGER_8
      do
         create a.make(1, 2, 3, 4)
         assert(a.count = 4)
         assert(a.lower1 = 1)
         assert(a.upper1 = 2)
         assert(a.lower2 = 3)
         assert(a.upper2 = 4)
         assert(a.item(1, 3) = 0)
         create a.make(1, 3, 1, 3)
         assert(a.count = 9)
         assert(a.lower1 = 1)
         assert(a.upper1 = 3)
         assert(a.lower1 = 1)
         assert(a.upper2 = 3)
         b := {ARRAY2[INTEGER_8] 1, 3, 1, 3, << 0, 0, 0;
                                                0, 0, 0;
                                                0, 0, 0 >> }
         assert(b.count = 9)
         assert(b.lower1 = 1)
         assert(b.upper1 = 3)
         assert(b.lower1 = 1)
         assert(b.upper2 = 3)
         assert(a.is_equal(b))
         assert(a.is_equal(b))
         from
            a := {ARRAY2[INTEGER_8] 1, 3, 1, 3, << 1, 2, 3;
                                                   4, 5, 6;
                                                   7, 8, 9 >> }
            i1 := a.lower1
            i2 := a.lower2
            v := 1
         until
            v > 9
         loop
            assert(v = a.item(i1, i2))
            v := v + 1
            if i2 = a.upper2 then
               i1 := i1 + 1
               i2 := a.lower2
            else
               i2 := i2 + 1
            end
         end
         from
            b := a.twin
            i1 := a.lower1
            i2 := a.lower2
            v := 1
         until
            v > 9
         loop
            assert(v = a.item(i1, i2))
            assert(v = b.item(i1, i2))
            v := v + 1
            if i2 = a.upper2 then
               i1 := i1 + 1
               i2 := a.lower2
            else
               i2 := i2 + 1
            end
         end
         assert(a.is_equal(b))
         b.put(0, 2, 2)
         assert(not a.is_equal(b))
         a := {ARRAY2[INTEGER_8] 1, 3, 1, 3, << 1, 2, 2;
                                                4, 5, 6;
                                                7, 8, 9 >> }
         assert(a.occurrences(2) = 2)
         assert(a.occurrences(3) = 0)
         assert(a.occurrences(4) = 1)
         assert(a.fast_occurrences(2) = 2)
         assert(a.fast_occurrences(3) = 0)
         assert(a.fast_occurrences(4) = 1)
      end

   assert (bool: BOOLEAN)
      do
         cpt := cpt + 1
         if not bool then
            std_output.put_string("TEST_ARRAY2: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            -- std_output.put_string("Yes%N");
         end
      end

   cpt: INTEGER

end -- class TEST_ARRAY2
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
