-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_UNIQUE

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   u5, u6, u7: INTEGER unique

   u1: INTEGER unique

   u2: INTEGER unique

   u3, u4: INTEGER unique

   make
      local
         aux_unique1: AUX_UNIQUE1
      do
         do_it
         create aux_unique1
         aux_unique1.do_it
         assert(aux_unique1.u1 = u1)
         assert(aux_unique1.u2 = u2)
         assert(aux_unique1.u3 = u3)
         assert(aux_unique1.u4 = u4)
      end

   do_it
      do
         assert(u1 > 0)
         assert(u1 /= u2)
         assert(u1 /= u3)
         assert(u1 /= u4)
         assert(u2 > 0)
         assert(u2 /= u1)
         assert(u2 /= u3)
         assert(u2 /= u4)
         assert(u3 > 0)
         assert(u3 /= u1)
         assert(u3 /= u2)
         assert(u3 /= u4)
         assert(u4 > 0)
         assert(u4 /= u1)
         assert(u4 /= u2)
         assert(u4 /= u3)
         assert(u4 = u3 + 1)
         assert(u7 = u5 + 2)
      end

end -- class TEST_UNIQUE
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
