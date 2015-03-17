-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_AGENT63
   -- Report from Philippe Ribet
   -- As TUPLE is not expanded, this example should work.

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   loop_stack: LOOP_STACK

   counter: INTEGER

   make
      do
         create loop_stack.make
         init(3)
         loop_stack.run
      end

   init (repeat: INTEGER)
      local
         update: SIMPLE_PERIODIC_JOB
      do
         counter := repeat
         create update.set_work(agent foo([repeat]), Void, 1, 0.1)
         loop_stack.add_job(update)
      end

   foo (repeat: TUPLE[INTEGER]): BOOLEAN
      do
         assert(repeat.first = counter)
         counter := counter - 1
         repeat.set_first(repeat.first - 1)
         Result := repeat.first > 0
      end

end -- class TEST_AGENT63
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
