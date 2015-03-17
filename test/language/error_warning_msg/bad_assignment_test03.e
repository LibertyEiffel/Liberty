-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class BAD_ASSIGNMENT_TEST03

create {}
   main

feature {}
   main
      local
         aux1: AUX_ASSIGNMENT_TEST03[AUX_ASSIGNMENT_TEST03_A]
         aux2: AUX_ASSIGNMENT_TEST03[AUX_ASSIGNMENT_TEST03_B]
         aux3: AUX_ASSIGNMENT_TEST03[AUX_ASSIGNMENT_TEST03_C]
         a: AUX_ASSIGNMENT_TEST03_A
         b: AUX_ASSIGNMENT_TEST03_B
         c: AUX_ASSIGNMENT_TEST03_C
      do
         create aux1
         create aux2
         create aux3
         if aux1.get_x /= Void then
         end
         if aux2.get_x /= Void then
         end
         if aux2.get_x /= Void then
         end
         b ?= aux2.get_x
         c ?= aux3.get_x
         c ?= aux1.get_x
      end

end -- class BAD_ASSIGNMENT_TEST03
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
