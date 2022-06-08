-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_EXCEPTIONS19
   -- From: alanz@ElectroSolv.co.za (Alan Zimmerman)

insert
   EXCEPTIONS
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         sub1: AUX_EXCEPTION19SUB; sub2: AUX_EXCEPTION19SUB; counter: INTEGER
      do
         create {AUX_EXCEPTION19SUB1} sub1.make
         create {AUX_EXCEPTION19SUB2} sub2.make
         inspect
            counter
         when 0 then
            call_sub(sub1)
         when 1 then
            call_sub(sub2)
         else
         end
         assert(counter = 2)
      rescue
         counter := counter + 1
         assert(counter.in_range(1, 2))
         retry
      end

   call_sub (sub: AUX_EXCEPTION19SUB)
      do
         sub.cause_exception
      end

end -- class TEST_EXCEPTIONS19
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
