-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class SEDB_PROCESS

inherit
   JOB

create {SEDB_RUNNER}
   make

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET)
      do
         debug
            std_error.put_line(once ">> Process " + pid.out + ": prepare")
         end
         ready_read := False
         ready_write := False
         if not command.is_empty then
            events.expect(pipe_in.event_can_write)
         end
         events.expect(pipe_out.event_can_read)
      end

   is_ready (events: EVENTS_SET): BOOLEAN
      do
         if not command.is_empty then
            ready_write := events.event_occurred(pipe_in.event_can_write)
         end
         ready_read := events.event_occurred(pipe_out.event_can_read)
         Result := ready_read or else ready_write
         if not Result then
            std_output.flush
         end
      end

   continue
      do
         if ready_read then
            debug
               std_error.put_line(once ">> Process " + pid.out + ": ready read")
            end
            pipe_out.read_character
            if pipe_out.end_of_input then
               status := status_not_running
            debug
               std_error.put_line(once ">> Process " + pid.out + ": not running")
            end
            else
               status := status_still_running
               if buffered then
                  pipe_tail.extend(pipe_out.last_character)
               else
                  std_output.put_character(pipe_out.last_character)
               end
            end
         end
         if ready_write then
            debug
               std_error.put_line(once ">> Process " + pid.out + ": ready write")
            end
            check
               not command.is_empty
            end
            command_write_failed := False
            pipe_in.put_character(command.item(command_write))
            if not command_write_failed then
               if command_write < command.upper then
                  command_write := command_write + 1
               else
                  command.clear_count
               end
            end
         end
      end

   restart
      do
         status := status_unknown
      end

feature {ANY}
   done: BOOLEAN
      do
         Result := status = status_not_running
      end

feature {SEDB_RUNNER}
   pid: INTEGER

   set_command (a_command: like command)
      require
         a_command /= Void
      do
         command.copy(a_command)
         command.extend('%N')
         command_write := command.lower
      ensure
         command.is_equal(a_command)
      end

   tail: STRING
      do
         Result := once ""
         Result.copy(pipe_tail)
      end

   clear_tail
      do
         pipe_tail.clear_count
      ensure
         tail.is_empty
      end

   set_current (enable: BOOLEAN)
      do
         if enable then
            if buffered then
               std_output.put_string(pipe_tail)
               clear_tail
               buffered := False
            end
         else
            buffered := True
         end
      ensure
         buffered = not enable
      end

   list
      do
         if status /= status_not_running then
            std_output.put_character(' ')
            if buffered then
               std_output.put_character(' ')
            else
               std_output.put_character('*')
            end
            if pipe_tail.is_empty then
               std_output.put_character(' ')
            else
               std_output.put_character('!')
            end
            std_output.put_character(' ')
            std_output.put_integer(pid)
            std_output.put_new_line
         end
      end

   killed
      do
         status := status_not_running
      end

feature {}
   make (a_path: like path; a_pid: like pid)
      require
         not a_path.is_empty
      do
         path := a_path.twin
         pid := a_pid
         status := status_unknown
         pipe_tail := ""
         command := ""
         buffered := True
         create pipe_in.named(path_for(once "in"), agent write_failure)
         create pipe_out.named(path_for(once "out"), agent read_failure)
         if pipe_out.is_connected then
            pipe_out.read_character
            if pipe_out.valid_last_character then
               pipe_tail.extend(pipe_out.last_character)
            end
         else
            status := status_not_running
         end
      ensure
         path.is_equal(a_path)
         pid = a_pid
         status = status_unknown
      end

   path_for (pipe: STRING): STRING
      local
         s: STRING
      do
         s := once ""
         s.clear_count
         pid.append_in(s)
         dir.ensure_system_notation
         dir.compute_file_path_with(path, s)
         s.copy(dir.last_entry)
         dir.compute_file_path_with(s, pipe)
         Result := dir.last_entry
      end

   status: INTEGER
   status_unknown: INTEGER 0
   status_still_running: INTEGER 1
   status_not_running: INTEGER 2

   path: STRING
   command: STRING
   command_write: INTEGER
   command_write_failed: BOOLEAN
   dir: BASIC_DIRECTORY

   pipe_in: PIPE_INPUT
   pipe_out: PIPE_OUTPUT

   ready_read, ready_write: BOOLEAN

   pipe_tail: STRING

   buffered: BOOLEAN

   write_failure (again: BOOLEAN): BOOLEAN
      do
         debug
            std_error.put_line(once ">> Process " + pid.out + once ": write failure")
         end
         check
            not command.is_empty
         end
         command_write_failed := True
         if not again then
            status := status_not_running
         end
         Result := True
      end

   read_failure (again: BOOLEAN): BOOLEAN
      do
         debug
            std_error.put_line(once ">> Process " + pid.out + once ": read failure")
         end
         if not again then
            status := status_not_running
         end
         Result := True
      end

end -- class SEDB_PROCESS
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
