-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_MANIFEST_ARRAY8

insert
   EIFFELTEST_TOOLS

create {}
   main

feature {}
   main
      local
         na: NATIVE_ARRAY[AUX_MANIFEST_ARRAY8]; a: ARRAY[AUX_MANIFEST_ARRAY8]; e1, e2: AUX_MANIFEST_ARRAY8
      do
         na := na.calloc(2)
         assert(na.item(0) = e1)
         assert(na.item(1) = e1)
         a := {ARRAY[AUX_MANIFEST_ARRAY8] 1, << e1, e2 >> }
         assert(a.count = 2)
         assert(a.item(1) = e1)
         a.resize(1, 3)
         assert(a.count = 3)
         assert(a.item(1) = e1)
         assert(a.item(2) = e1)
         e2 := a.item(3)
         assert(a.item(3) = e1)
      end

end -- class TEST_MANIFEST_ARRAY8
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
