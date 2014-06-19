-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_JVM23

inherit
   ANY

create {}
   make

feature {ANY}
   make
      do
         foo(1, 2, 'c', Current)
      end

feature {}
   foo (v1, v2: INTEGER; c1: CHARACTER; o1: ANY)
      local
         lv1, lv2: INTEGER; lc1: CHARACTER; lo1: ANY
      do
         check
            lv1 = 0
            lv2 = 0
            lc1 = '%U'
            lo1 = Void
         end
         lv1 := v1
         lv2 := v2
         lc1 := c1
         lo1 := o1
         check
            v1 = lv1
            v2 = lv2
            c1 = lc1
            o1 = lo1
         end
         check
            lc1 = 'c'
            o1 = Current
            v1 = 1
            v2 = 2
         end
         check
            c1 = 'c'
            o1 = Current
            v1 = 1
            v2 = 2
         end
      end

end -- class TEST_JVM23
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
