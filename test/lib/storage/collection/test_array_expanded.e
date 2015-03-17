-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_ARRAY_EXPANDED

create {}
   make

feature {ANY}
   a: ARRAY[INTEGER]

   c1, c2, c3, cv: INTEGER

   i: INTEGER

   make
      local
         zero: INTEGER
      do
         c1 := 31
         c2 := 32
         c3 := 33
         create a.make(1, 0)
         assert(a.lower = 1)
         assert(a.upper = 0)
         assert(a.count = 0)
         assert(a.is_empty)
         a.make(1, 1)
         assert(a.count = 1)
         assert(a.lower = 1)
         assert(a.upper = 1)
         assert(a.item(1) = 0)
         create a.make(1, 4)
         assert(a.count = 4)
         from
            i := 1
         until
            i > a.count
         loop
            assert(a.item(i) = 0)
            i := i + 1
         end
         create a.make(-1, -2)
         assert(a.count = 0)
         a.add_last(c1)
         assert(a.count = 1)
         assert(a.item(-1) = c1)
         a := {ARRAY[INTEGER] 1, << c1 >> }
         assert(a.count = 1)
         assert(a.item(1) = c1)
         a.add_last(c2)
         assert(a.count = 2)
         assert(a.item(1) = c1)
         assert(a.item(2) = c2)
         create a.make(1, 3)
         a.put(c2, 2)
         assert(a.is_equal({ARRAY[INTEGER] 1, << zero, c2, 0 >> }))
         a.put(67, 2)
         assert(a.is_equal({ARRAY[INTEGER] 1, << zero, 67, 0 >> }))
         a.make(1, 3)
         assert(a.is_equal({ARRAY[INTEGER] 1, << 0, zero, 0 >> }))
         create a.make(2, 2)
         a.force(c1, 1)
         assert(a.is_equal({ARRAY[INTEGER] 1, << c1, 0 >> }))
         a.force(c3, 3)
         assert(a.is_equal({ARRAY[INTEGER] 1, << c1, 0, c3 >> }))
         a := {ARRAY[INTEGER] 1, << 1, 2, 3, 4 >> }
         assert(a.first_index_of(1) = 1)
         assert(a.first_index_of(1).is_equal(1.to_integer_32))
         assert(a.first_index_of(3) = 3)
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_ARRAY_EXPANDED: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            -- std_output.put_string("yes%N");
         end
      end

   cpt: INTEGER

end -- class TEST_ARRAY_EXPANDED
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
