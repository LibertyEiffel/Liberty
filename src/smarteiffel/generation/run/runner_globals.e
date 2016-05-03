-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class RUNNER_GLOBALS

insert
   GLOBALS

feature {}
   frozen runner: RUNNER
      once
         create Result.make
      end

   frozen displayer: RUNNER_DISPLAYER
      once
         create Result.make(std_output)
      end

   frozen user_args: FAST_ARRAY[STRING]
      once
         create Result.make(0)
      end

feature {}
   frozen break
      do
         debug ("run.callstack", "run.data")
            std_output.put_line(once "**************** BREAK ****************")
            std_output.flush
         end
         sedb_breakpoint
      end

   frozen repr (arg: RUNNER_OBJECT): STRING
      do
         if arg = Void then
            Result := once "Void"
         else
            Result := arg.out
         end
      ensure
         Result /= Void
      end

   frozen listrepr (list: TRAVERSABLE[RUNNER_OBJECT]): STRING
      local
         i: INTEGER
      do
         Result := "("
         if list /= Void then
            from
               i := list.lower
            until
               i > list.upper
            loop
               if i > list.lower then
                  Result.append(once ", ")
               end
               Result.append(repr(list.item(i)))
               i := i + 1
            end
         end
         Result.extend(')')
      ensure
         Result /= Void
      end

end -- class RUNNER_GLOBALS
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
