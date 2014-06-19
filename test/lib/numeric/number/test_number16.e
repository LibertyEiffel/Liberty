-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NUMBER16
   -- tests on fractions...
   -- small_fraction

insert
   EIFFELTEST_TOOLS
   NUMBER_TOOLS

create {}
   make

feature {ANY}
   make
      local
         n1, n2, n3, n4, n5, n6: NUMBER
      do
         n1 := from_integer(1)
         n2 := from_integer(2)
         n3 := from_string("8/4")
         n4 := from_string("3/5")
         n5 := from_string("2/5")
         n6 := from_string("13/5")
         -- comparaisons
         assert(n2.is_equal(n3))
         assert((n4 + n5).is_equal(n1))
         assert((n3 + n4).is_equal(n6))
         -- simplification
         n1 := from_string("21/3")
         n2 := from_string("38836/5548")
         assert(n1.is_equal(n2))
         assert(not (n1 @* -1).is_equal(n2))
      end



end -- class TEST_NUMBER16
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
