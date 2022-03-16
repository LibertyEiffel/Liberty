-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_SERVER_PROCESS

insert
   LOGGING
      redefine
         copy, is_equal
      end
   PROCESS_WAIT
      rename
         in as waitpid_in,
         job as waitpid_job
      redefine
         copy, is_equal
      end
   RECYCLABLE
      redefine
         copy, is_equal
      end

create {EIFFELTEST_SERVER_RUN_TESTS}
   default_create

feature {ANY}
   copy (other: like Current)
      do
         port := other.port
         process := other.process
         cleanup := other.cleanup
         cmd := other.cmd
      end

   is_equal (other: like Current): BOOLEAN
      do
         check
            same_process: port = other.port
         end
         Result := process = other.process
            and then cleanup = other.cleanup
            and then cmd = other.cmd
      end

feature {EIFFELTEST_SERVER_RUN_TESTS}
   id: INTEGER
      require
         is_running
      do
         Result := process.id
      end

   is_finished: BOOLEAN
      require
         is_running
      do
         Result := process.is_finished
      end

   on_done (a_status: INTEGER)
      do
         if not done then
            done := True
            process.wait
            log.info.put_line(once "Server #(1): timeboxed command finished (status #(3)): #(2)" # port.out # cmd # a_status.out)
            if cleanup /= Void then
               cleanup.call([a_status])
            end
         end
      end

   on_timeout
      local
         mypid, pid, status: INTEGER
      do
         if not done then
            done := True
            if process.is_finished then
               status := process.status
               log.info.put_line(once "Server #(1): timeboxed command timed out but finished (status #(3)): #(2)" # port.out # cmd # status.out)
            else
               log.info.put_line(once "Server #(1): timeboxed command timed out: #(2)" # port.out # cmd)
               --| **** TODO: cross-platform
               c_inline_c("_mypid = getpid();%N")
               pid := process.id
               log.trace.put_line(once "Server #(1): killing timeboxed command: #(2) (#(3))" # port.out # pid.out # mypid.out)
               if pid /= mypid then
                  c_inline_h("#include <signal.h>%N")
                  c_inline_c("kill(_pid, 15);%N")
                  process.wait
                  status := process.status
               else
                  log.warning.put_line(once "Server #(1): pid is 0!!" # port.out)
                  status := -1
               end
            end
            if cleanup /= Void then
               cleanup.call([status])
            end
         end
      end

   set (a_port: like port; a_timeout: like timeout; a_cmd: like cmd; a_cleanup: like cleanup)
      require
         a_port > 0
         not is_set
         not is_running
      do
         log.info.put_line(once "Server #(1): preparing timeboxed command: #(2)" # a_port.out # a_cmd)
         port := a_port
         timeout := a_timeout
         cmd := a_cmd
         cleanup := a_cleanup
         done := False
      ensure
         port = a_port
         timeout = a_timeout
         cmd = a_cmd
         cleanup = a_cleanup
         is_set
         not is_running
      end

   run
      require
         is_set
         not is_running
      local
         split: RING_ARRAY[STRING]; c: STRING
         process_factory: PROCESS_FACTORY
      do
         log.info.put_line(once "Server #(1): now running timeboxed command: #(2)" # port.out # cmd)
         create split.make(1, 0)
         cmd.split_in(split)
         waitpid_job.trigger(timeout)
         c := split.first
         split.remove_first
         process_factory.set_direct_input(True)
         process_factory.set_direct_output(True)
         process_factory.set_direct_error(True)
         process := process_factory.execute(c, split)
      ensure
         is_running
      end

feature {EIFFELTEST_SERVER_RUN_TESTS, EIFFELTEST_SERVER_PROCESS}
   cmd: STRING

   is_running: BOOLEAN
      do
         Result := process /= Void
      end

   is_set: BOOLEAN
      do
         Result := port > 0
      end

feature {EIFFELTEST_SERVER_PROCESS}
   process: PROCESS
   cleanup: PROCEDURE[TUPLE[INTEGER]]
   port: INTEGER
   timeout: INTEGER
   done: BOOLEAN

   process_factory_: PROCESS_FACTORY
      once
         Result.set_direct_input(True)
         Result.set_direct_output(True)
         Result.set_direct_error(True)
      end

feature {RECYCLING_POOL}
   recycle
      do
         cmd := Void
         process := Void
         cleanup := Void
         port := 0
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
-- Copyright (C) 2013-2022: Cyril ADRIAN <cyril.adrian@gmail.com>
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
