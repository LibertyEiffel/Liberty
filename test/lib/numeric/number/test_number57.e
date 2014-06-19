-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NUMBER57
   -- tests on "is_odd"

insert
   EIFFELTEST_TOOLS
   ANY
   PLATFORM

create {}
   make

feature {ANY}
   make
      local
         n: NUMBER
      do
         n := nt.from_integer(0)
         assert(not n.is_odd)
         n := nt.from_integer(1)
         assert(n.is_odd)
         n := nt.from_integer(2)
         assert(not n.is_odd)
         n := nt.from_integer(-1)
         assert(n.is_odd)
         n := nt.from_integer(-2)
         assert(not n.is_odd)
         n := nt.from_integer(Maximum_integer)
         n := n @+ 1000
         assert(n.is_odd)
         n := n @+ 1
         assert(not n.is_odd)
         n := nt.from_integer(Minimum_integer)
         n := n @- 1000
         assert(not n.is_odd)
         n := n @- 1
         assert(n.is_odd)
      end



   nt: NUMBER_TOOLS

end -- class TEST_NUMBER57
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
