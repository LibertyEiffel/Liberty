-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_INHERIT6

inherit
   AUX_INHERIT6A
   AUX_INHERIT6B
      undefine foo2
      end
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         a: AUX_INHERIT6A; b: AUX_INHERIT6B
      do
         assert(count = 0)
         foo
         assert(count = 1)
         bar
         assert(count = 3)
         assert(new_count = 0)
         foo2
         assert(count = 3)
         assert(new_count = 5)
         a := Current
         b := Current
         assert(count = 3)
         a.foo
         assert(count = 4)
         a.bar
         assert(count = 6)
         assert(new_count = 5)
         assert(a.new_count = 5)
         a.foo2
         assert(count = 6)
         assert(new_count = 10)
         assert(a.new_count = 10)
         assert(count = 6)
         assert(b.count = 6)
         b.foo
         assert(count = 7)
         assert(b.count = 7)
         b.bar
         assert(b.count = 9)
         assert(new_count = 10)
         b.foo2
         assert(count = 9)
         assert(b.count = 9)
         assert(new_count = 15)
      end

   foo
      do
         count := count + 1
      end

end -- class TEST_INHERIT6
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
