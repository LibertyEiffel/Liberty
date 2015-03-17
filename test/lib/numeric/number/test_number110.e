-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NUMBER110
   --
   -- Test of the NUMBER_TOOLS.is_number parser.
   --

insert
   EIFFELTEST_TOOLS
   
create {}
   make

feature {ANY}
   make
      local
         number: NUMBER
      do
         assert(nt.is_number("1"))
         assert(nt.is_number(" %N1%N  "))
         assert(nt.is_number("2 + 2"))
         assert(nt.is_number("2 + 2 / 7"))
         assert(nt.is_number("2 + 2 ! / 7"))
         assert(not nt.is_number("1 1"))
         assert(not nt.is_number("1) "))
         assert(not nt.is_number("(1"))
         assert(not nt.is_number("("))
         assert(not nt.is_number("d"))
         assert(nt.from_string("1").to_string.is_equal("1"))
         assert(nt.from_string(" %N1%N  ").to_string.is_equal("1"))
         assert(nt.from_string("2 + 2").to_string.is_equal("4"))
         assert(nt.from_string("2 + 2 / 7").to_string.is_equal("16/7"))
         assert(nt.from_string("2 + 2 ! / 7").to_string.is_equal("16/7"))
         number := nt.from_string("2/0")
         assert(number = Void)
         number := nt.from_string("(-2)!")
         assert(number = Void)
      end

   nt: NUMBER_TOOLS

end -- class TEST_NUMBER110
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
