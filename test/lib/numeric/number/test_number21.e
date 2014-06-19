-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NUMBER21
   -- tests on "to_string"

insert
   EIFFELTEST_TOOLS
   PLATFORM
   NUMBER_TOOLS

create {}
   make

feature {ANY}
   make
      local
         n: NUMBER; s: STRING
      do
         n := from_integer(0)
         assert(n.to_string.is_equal("0"))
         n := from_integer(1)
         assert(n.to_string.is_equal("1"))
         n := from_integer(-1)
         assert(n.to_string.is_equal("-1"))
         n := from_integer(Maximum_integer)
         assert(n.to_string.is_equal(Maximum_integer.to_string))
         n := n @* 10
         s := Maximum_integer.to_string
         s.append("0")
         assert(s.is_equal(n.to_string))
         n := from_integer(Minimum_integer)
         assert(n.to_string.is_equal(Minimum_integer.to_string))
         n := n @* 10
         s := Minimum_integer.to_string
         s.append("0")
         assert(s.is_equal(n.to_string))
         n := from_string("6/10")
         assert(n.to_string.is_equal("3/5"))
         n := from_string("-20/10")
         assert(n.to_string.is_equal("-2"))
         n := from_string("3/5")
         assert(n.to_string.is_equal("3/5"))
      end



end -- class TEST_NUMBER21
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
