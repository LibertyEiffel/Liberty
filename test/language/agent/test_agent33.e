-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_AGENT33
   -- bug from SZ:234:

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         ab: AUX_AGENT33AB; ac: AUX_AGENT33AC; b: AUX_AGENT33B; c: AUX_AGENT33C
      do
         create ab.make
         ab.subscribe(agent rb(?))
         create ac.make
         ac.subscribe(agent rc(?))
         create b
         create c
         ab.publish(b)
         ac.publish(c)
         assert(assert_counter.item = 2)
      end

   rb (b: AUX_AGENT33B)
      do
         assert(assert_counter.item = 0)
      end

   rc (c: AUX_AGENT33C)
      do
         assert(assert_counter.item = 1)
      end

end -- class TEST_AGENT33
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
