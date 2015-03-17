-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NUMBER12
   -- tests between large numbers and integer numbers

insert
   EIFFELTEST_TOOLS
   PLATFORM
   NUMBER_TOOLS

create {}
   make

feature {ANY}
   make
      local
         n1, n2: NUMBER
      do
         n1 := from_integer(Maximum_integer)
         n1 := n1 @+ 1000
         n2 := from_integer(Minimum_integer)
         n2 := n2 @- 1000
         -- is_zero
         assert(not n1.is_zero)
         assert(not n2.is_zero)
         -- is_positive
         assert(n1.is_positive)
         assert(not n2.is_positive)
         -- is_negative
         assert(not n1.is_negative)
         assert(n2.is_negative)
         -- odd
         assert(n1.is_odd)
         assert(not n2.is_odd)
         -- even
         assert(not n1.is_even)
         assert(n2.is_even)
         -- operations
         assert((n1 / n1) @= 1)
         assert((n1 @/ 1).is_equal(n1))
         assert((n1 @// 1).is_equal(n1))
         assert(n1 @\\ 1 @= 0)
         assert(n1.sign = 1)
         assert(n2.sign = -1)
         assert(n1.log > 0)
         assert((n2 @+ 1).abs.is_equal(n1.abs))
         assert(n1.compare(n2) = 1)
         assert(n2.compare(n1) = -1)
         assert(n1.min(n2).is_equal(n2))
         assert(n1.max(n2).is_equal(n1))
      end



end -- class TEST_NUMBER12
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
