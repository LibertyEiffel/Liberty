-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_AGENT54
--
-- From a bug report of Wolfgang Jansen on our mailing list.
-- SZ:490:
--

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         v: INTEGER
      do
         n := 3
         func := agent func_run(n) -- closed_arg=3 at agent creation time
         n := 5
         v := func.item([])  -- uses new value of `n' for closed_arg
         assert(v = 3)

         n := 3
         proc := agent proc_run(n)
         n := 5
         proc.call([])
         assert(n = 3)
      end

   n: INTEGER

   func: FUNCTION[TUPLE, INTEGER]

   func_run (i: INTEGER): INTEGER
      do
         Result := i
      end

   proc: PROCEDURE[TUPLE]

   proc_run (i: INTEGER)
      do
         n := i
      end

end -- TEST_AGENT54
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
