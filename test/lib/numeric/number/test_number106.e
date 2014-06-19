-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NUMBER106
   --
   -- Test of depassement of INTEGER_64_NUMBER capacity
   -- during a multiplication between a small integer
   -- and an integer which is symbolised by a large integer
   -- Result is a BIG_INTEGER_NUMBER
   --

insert
   EIFFELTEST_TOOLS
   ANY
   PLATFORM

create {}
   make

feature {ANY}
   make
      local
         n1, n2, m1, m2: NUMBER
      do
         n1 := nt.from_integer_64(Maximum_integer_64) @+ 1
         assert(n1.is_integer_general_number)
         assert(not n1.is_integer_64)
         n2 := nt.from_integer_64(5)
         m1 := n1 * n2
         m2 := n2 * n1
         assert(m1.is_integer_general_number)
         assert(not m1.is_integer_64)
         assert(m1.is_positive)
         assert(m2.is_equal(m1))
         n2 := nt.from_integer_64(-5)
         m1 := n1 * n2
         m2 := n2 * n1
         assert(m1.is_integer_general_number)
         assert(not m1.is_integer_64)
         assert(not m1.is_positive)
         assert(m2.is_equal(m1))
         n1 := nt.from_integer_64(Minimum_integer_64) @- 1
         assert(n1.is_integer_general_number)
         assert(not n1.is_integer_64)
         n2 := nt.from_integer_64(5)
         m1 := n1 * n2
         m2 := n2 * n1
         assert(m1.is_integer_general_number)
         assert(not m1.is_integer_64)
         assert(not m1.is_positive)
         assert(m2.is_equal(m1))
         n2 := nt.from_integer_64(-5)
         m1 := n1 * n2
         m2 := n2 * n1
         assert(m1.is_integer_general_number)
         assert(not m1.is_integer_64)
         assert(m1.is_positive)
         assert(m2.is_equal(m1))
      end



   nt: NUMBER_TOOLS

end -- class TEST_NUMBER106
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
