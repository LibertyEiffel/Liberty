-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_AGENT55
   --
   -- From a bug report of Wolfgang Jansen on our mailing list.
   -- SZ:490:
   --

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         v: INTEGER
      do
         n_memory := 3
         func := agent func_run(n)
         assert(n_memory = 4)
         v := func.item([])
         assert(v = 3)
         assert(n_memory = 4)
         proc := agent proc_run(n)
         assert(n_memory = 5)
         proc.call([])
         assert(n_memory = 4)
      end

   n_memory: INTEGER

   n: INTEGER
      do
         Result := n_memory
         n_memory := n_memory + 1
      end

   func: FUNCTION[TUPLE, INTEGER]

   func_run (i: INTEGER): INTEGER
      do
         Result := i
      end

   proc: PROCEDURE[TUPLE]

   proc_run (i: INTEGER)
      do
         n_memory := i
      end

end -- class TEST_AGENT55
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
