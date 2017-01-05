-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class SEDB_RUNNER

inherit
   JOB

create {SE_DEBUG}
   run

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET)
      local
         t: TIME_EVENTS
      do
         events.expect(std_input.event_can_read)
         events.expect(t.timeout(1000))
      end

   is_ready (events: EVENTS_SET): BOOLEAN
      do
         user_input := events.event_occurred(std_input.event_can_read)
         Result := True
         debug
            if user_input then
               std_error.put_line(once ">> user input")
            else
               std_error.put_line(once ">> timer out")
            end
         end
      end

   continue
      do
         if user_input then
            check_user_input
         else
            check_processes
         end
      end

   done: BOOLEAN

   restart
      do
         check False end
      end

feature {}
   user_input: BOOLEAN
   pid: INTEGER

   check_user_input
      require
         user_input
      local
         command: STRING; i: INTEGER; p: SEDB_PROCESS
      do
         std_input.read_line
         command := std_input.last_string
         if not command.is_empty then
            inspect
               command.first
            when ':' then
               debug
                  std_error.put_line(once ">> Checking extended command")
               end
               if command.count >= 2 then
                  inspect
                     command.item(2)
                  when 'c' then
                     check_processes
                  when 'l' then
                     debug
                        std_error.put_line(once ">> List processes")
                     end
                     from
                        i := processes.lower
                     until
                        i > processes.upper
                     loop
                        processes.item(i).list
                        i := i + 1
                     end
                  when 's' then
                     if pid = 0 then
                        std_output.put_line(once "Please select a pid first.")
                     else
                        debug
                           std_error.put_line(once ">> Interrupting process " + pid.out)
                        end
                        i := pid
                        c_inline_c("kill(_i, SIGINT);")
                     end
                  when 'k' then
                     if pid = 0 then
                        std_output.put_line(once "Please select a pid first.")
                     else
                        debug
                           std_error.put_line(once ">> Terminating process " + pid.out)
                        end
                        i := pid
                        c_inline_c("kill(_i, SIGTERM);")
                     end
                  when 'K' then
                     if not command.is_equal(once ":KILL") then
                        std_output.put_line(once "Unknown command")
                     elseif pid = 0 then
                        std_output.put_line(once "Please select a pid first.")
                     else
                        debug
                           std_error.put_line(once ">> KILLING process " + pid.out)
                        end
                        i := pid
                        c_inline_c("kill(_i, SIGKILL);")
                        processes.at(pid).killed
                     end
                  when '0'..'9' then
                     command.remove_first
                     if command.is_integer then
                        i := command.to_integer
                        p := processes.reference_at(i)
                        if p /= Void then
                           if pid /= 0 then
                              debug
                                 std_error.put_line(once ">> Process " + pid.out + " loses its 'current' status")
                              end
                              processes.at(pid).set_current(False)
                           end
                           pid := i
                           debug
                              std_error.put_line(once ">> Process " + pid.out + " is the new 'current' process")
                           end
                           p.set_current(True)
                        else
                           std_output.put_line(once "Unknown process.")
                        end
                     end
                  when 'q' then
                     die_with_code(0)
                  when '?' then
                     std_output.put_line(once ":c     check the running processes now (or done automatically every second)")
                     std_output.put_line(once ":l     list the running processes")
                     std_output.put_line(once ":<pid> debug the process <pid>")
                     std_output.put_line(once ":s     stops the current process with SIGINT")
                     std_output.put_line(once ":k     kills the current process with SIGTERM")
                     std_output.put_line(once ":KILL  kills the current process with SIGKILL")
                     std_output.put_line(once ":q     quits the debugger")
                     std_output.put_line(once ":?     this help")
                     std_output.put_new_line
                     std_output.put_line(once "All the commands not starting by ':' are sedb commands sent to the process")
                     std_output.put_line(once "currently being debugged.")
                  else
                     std_output.put_line(once "Unknown command")
                  end
               end
            else
               send_command(command)
            end
         else
            send_command(command)
         end
      end

   send_command (command: STRING)
      local
         p: SEDB_PROCESS
      do
         if pid = 0 then
            std_output.put_line(once "Please select a pid first.")
         else
            debug
               std_error.put_line(once "Sending sedb command '" + command + "' to " + pid.out)
            end
            p := processes.at(pid)
            std_output.put_string(p.tail)
            p.clear_tail
            if p.done then
               std_output.put_line(once "That process is not running anymore.")
            else
               p.set_command(command)
            end
         end
      end

   check_processes
      do
         debug
            std_error.put_line(once ">> Checking processes")
         end
         dir.connect_to(path)
         if dir.is_connected then
            from
               dir.read_entry
            until
               dir.end_of_input
            loop
               if dir.last_entry.is_integer then
                  debug
                     std_error.put_line(once ">> Checking " + dir.last_entry)
                  end
                  check_process(dir.last_entry.to_integer)
               end
               dir.read_entry
            end
            dir.disconnect
         end
      end

   check_process (a_pid: INTEGER)
      local
         proc: SEDB_PROCESS
      do
         if not processes.has(a_pid) then
            debug
               std_error.put_line(once ">> New process " + a_pid.out)
            end
            create proc.make(path, a_pid)
            processes.add(proc, a_pid)
            stack.add_job(proc)
         end
      ensure
         processes.at(a_pid).pid = a_pid
      end

feature {}
   run (a_path: like path)
      require
         not a_path.is_empty
      do
         c_inline_h("%N#include <signal.h>%N")
         debug
            std_error.put_line(once ">> Running debug directory " + a_path)
         end
         path := a_path
         create processes.make
         create stack.make
         stack.add_job(Current)
         stack.run
      end

   path: STRING

   stack: LOOP_STACK

   dir: BASIC_DIRECTORY

   processes: AVL_DICTIONARY[SEDB_PROCESS, INTEGER]

   good_pid (proc: SEDB_PROCESS; a_pid: INTEGER): BOOLEAN
      do
         Result := proc.pid = a_pid
      end

invariant
   processes.for_all(agent good_pid(?, ?))

end -- class SEDB_RUNNER
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
