-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NUMBER30
   -- tests on infix "@+"

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
         n1 := from_integer(0)
         assert((n1 @+ 0).is_equal(n1))
         n2 := from_integer(1)
         assert((n1 @+ 1).is_equal(n2))
         n1 := from_integer(Maximum_integer)
         n2 := from_integer(Maximum_integer)
         n2 := n2 @+ 1000
         assert(n2.is_equal(n1 @+ 1000))
         n1 := n1 @+ 2000
         assert(n1.is_equal(n2 @+ 1000))
         assert(n1.is_equal(n1 @+ 0))
         n1 := from_string("1/5")
         n2 := from_string("12/10")
         assert(n2.is_equal(n1 @+ 1))
         n2 := from_string("-4/5")
         assert(n1.is_equal(n2 @+ 1))
      end



end -- class TEST_NUMBER30
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
