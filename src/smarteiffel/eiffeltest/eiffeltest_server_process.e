-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class EIFFELTEST_SERVER_PROCESS

insert
   LOGGING
      redefine
         default_create, copy, is_equal
      end
   PROCESS_WAIT
      rename
         in as waitpid_in,
         job as waitpid_job
      redefine
         default_create, copy, is_equal
      end

feature {}
   default_create is
      do
         process := Void
         cleanup := Void
         cmd := Void
      end

feature {ANY}
   copy (other: like Current) is
      do
         process := other.process
         cleanup := other.cleanup
         cmd := other.cmd
      end

   is_equal (other: like Current): BOOLEAN is
      do
         Result := process = other.process
            and then cleanup = other.cleanup
            and then cmd = other.cmd
      end

feature {EIFFELTEST_SERVER_RUN_TESTS}
   id: INTEGER is
      require
         is_running
      do
         Result := process.id
      end

   is_finished: BOOLEAN is
      require
         is_running
      do
         Result := process.is_finished
      end

   on_done (a_status: INTEGER) is
      local
         status: INTEGER
      do
         log.info.put_line(once "Server #(1): timeboxed command finished: #(2)" # port.out # cmd)
         process.wait
         status := process.status
         check
            process.is_finished
            a_status = status
         end
         if cleanup /= Void then
            cleanup.call([a_status])
         end
      end

   on_timeout is
      local
         pid, status: INTEGER
      do
         log.info.put_line(once "Server #(1): timeboxed command timed out: #(2)" # port.out # cmd)
         --| **** TODO: cross-platform
         pid := process.id
         c_inline_h("#include <signal.h>%N")
         c_inline_c("kill(_pid, 15);%N")
         log.info.put_line(once "Server #(1): timeboxed command killed: #(2)" # port.out # pid.out)
         process.wait
         status := process.status
         if cleanup /= Void then
            cleanup.call([-1])
         end
      end

   set (a_port: like port; a_cmd: like cmd; a_cleanup: like cleanup) is
      require
         a_port > 0
         not is_set
         not is_running
      do
         log.info.put_line(once "Server #(1): preparing timeboxed command: #(2)" # a_port.out # a_cmd)
         port := a_port
         cmd := a_cmd
         cleanup := a_cleanup
      ensure
         port = a_port
         cmd = a_cmd
         cleanup = a_cleanup
         is_set
         not is_running
      end

   run is
      require
         is_set
         not is_running
      local
         split: FAST_ARRAY[STRING]
      do
         log.info.put_line(once "Server #(1): now running timeboxed command: #(2)" # port.out # cmd)
         create split.make(0)
         cmd.split_in(split)
         waitpid_job.trigger(1000) --| **** intentionally short for test, obviously needs to be changed
         process := process_factory.execute(split.first, split)
      ensure
         is_running
      end

feature {EIFFELTEST_SERVER_RUN_TESTS, EIFFELTEST_SERVER_PROCESS}
   cmd: STRING

   is_running: BOOLEAN is
      do
         Result := process /= Void
      end

   is_set: BOOLEAN is
      do
         Result := port > 0
      end

feature {EIFFELTEST_SERVER_PROCESS}
   process: PROCESS
   cleanup: PROCEDURE[TUPLE[INTEGER]]
   port: INTEGER

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
