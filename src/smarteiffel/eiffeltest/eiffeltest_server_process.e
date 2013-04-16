-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class EIFFELTEST_SERVER_PROCESS

insert
   PROCESS_WAIT
      rename
         in as waitpid_in,
         job as waitpid_job
      redefine
         default_create
      end

feature {}
   default_create is
      do
         process := Void
         cmd := Void
         cleanup := Void
      end

feature {EIFFELTEST_SERVER_RUN_TESTS}
   id: INTEGER is
      do
         Result := process.id
      end

   is_finished: BOOLEAN is
      do
         Result := process.is_finished
      end

   on_done (a_status: INTEGER) is
      do
         check
            process.is_finished
            a_status = process.status
         end
         if cleanup /= Void then
            cleanup.call([a_status])
         end
      end

   on_timeout is
      local
         pid: INTEGER
      do
         --| **** TODO: cross-platform
         pid := process.id
         c_inline_h("#include <signal.h>%N")
         c_inline_c("kill(_pid, 9);%N")
         if cleanup /= Void then
            cleanup.call([-1])
         end
      end

   set (a_cmd: like cmd; a_cleanup: like cleanup): like Current is
      require
         not running
      do
         cmd := a_cmd
         cleanup := a_cleanup
         Result := Current
      ensure
         Result.cmd = a_cmd
         Result.cleanup = a_cleanup
         not Result.running
      end

   run: like Current is
      require
         not running
      do
         waitpid_job.trigger(1000) --| **** intentionally short for test, obviously needs to be changed
         process := process_factory.execute_command_line(cmd)
         Result := Current
      ensure
         Result.running
      end

feature {EIFFELTEST_SERVER_PROCESS}
   process: PROCESS
   cmd: STRING
   cleanup: PROCEDURE[TUPLE[INTEGER]]

   process_factory: PROCESS_FACTORY is
      once
         Result.set_direct_input(True)
         Result.set_direct_output(True)
         Result.set_direct_error(True)
      end

end -- class EIFFELTEST_SERVER_PROCESS
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
-- Copyright(C) 2013: Cyril ADRIAN <cyril.adrian@gmail.com>
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
