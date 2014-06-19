-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NUMBER56
   -- tests on "#>="

insert
   PLATFORM
   NUMBER_TOOLS
   EIFFELTEST_TOOLS
   
create {}
   make

feature {ANY}
   make
      local
         n: NUMBER
      do
         n := from_integer(-1)
         assert(n #>= Minimum_integer.to_real_64)
         assert(n #>= -1)
         n := from_integer(0)
         assert(n #>= -1)
         assert(n #>= 0)
         n := from_integer(Maximum_integer)
         assert(n #>= Maximum_integer.to_real_64)
         n := from_integer_64(Maximum_integer_64)
         assert( n @>= Maximum_integer_64)
         assert( n @<= Maximum_integer_64)
         assert(n #<= Maximum_integer_64.force_to_real_64)
         n := n @+ 1
         assert(n #>= Maximum_integer_64.force_to_real_64)
         n := from_integer_64(Minimum_integer_64)
         assert(n #>= Minimum_integer_64.force_to_real_64)
         n := n @- 1
         assert(not (n #>= Minimum_integer_64.force_to_real_64))
         n := from_string("2/5")
         assert(n #>= 0)
         n := from_string("3/2")
         assert(n #>= 1)
         n := from_string("-1/54")
         assert(n #>= -1)
         n := from_string("2/5")
         assert(n #>= 0.19)
         assert(n #>= 0.2)
         n := from_string("-3/5")
         -- This case does not have the same result in all compilation
         -- modes (cause to the precision lost)
         --       assert(n #>= -0.6)
         assert(n #>= -0.61)
      end

end -- class TEST_NUMBER56
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
