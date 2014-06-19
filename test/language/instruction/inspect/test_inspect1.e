-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_INSPECT1

create {}
   make

feature {ANY}
   u1, u2: INTEGER unique

   aux_inspect1: AUX_INSPECT1

   aux_inspect2: AUX_INSPECT2

   make
      do
         do_it
         create aux_inspect1
         aux_inspect1.do_it
         create aux_inspect2
         aux_inspect2.do_it
      end

   do_it
      local
         i: INTEGER
      do
         i := u1
         inspect
            i
         when u1 then
         when u2 then
            std_output.put_string("TEST_INSPECT1: ERROR # 1%N")
         end
         inspect
            i
         when u1 then
         when u2 then
            std_output.put_string("TEST_INSPECT1: ERROR # 2%N")
         else
            std_output.put_string("TEST_INSPECT1: ERROR # 3%N")
         end
         inspect
            i
         when u2 then
            std_output.put_string("TEST_INSPECT1: ERROR # 4%N")
         else
         end
      end

end -- class TEST_INSPECT1
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
