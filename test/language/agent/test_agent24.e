-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_AGENT24
   -- SZ:122

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   check_int (a: INTEGER)
      do
         assert(expected = a)
      end

   check_aux (a: AUX_AGENT24)
      do
         assert(expected = a.n)
      end

   make
      local
         action: ROUTINE[TUPLE[AUX_AGENT24]]; action2: ROUTINE[TUPLE[INTEGER]]; a: AUX_AGENT24
      do
         action2 := agent check_int(?)
         action := agent check_aux(?)
         a.set_n(666)
         expected := 666
         action.call([a])
         expected := 777
         action2.call([{INTEGER_32 777}])
      end

   expected: INTEGER

end -- class TEST_AGENT24
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
