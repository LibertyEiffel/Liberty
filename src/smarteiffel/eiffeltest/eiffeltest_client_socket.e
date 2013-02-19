-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_CLIENT_SOCKET
   --
   -- Sends commands to an eiffeltest server
   -- (client-side server facade)
   --

inherit
   JOB

insert
   EIFFELTEST_NETWORK
   GLOBALS

create {ANY}
   make

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET) is
      local
         t: TIME_EVENTS
      do
         if starting then
            starting_timeout := t.timeout(500)
            events.expect(starting_timeout)
         elseif busy then
            events.expect(channel.event_can_read)
         else
            events.expect(channel.event_can_write)
         end
      end

   is_ready (events: EVENTS_SET): BOOLEAN is
      do
         if starting then
            Result := events.event_occurred(starting_timeout)
         elseif busy then
            Result := events.event_occurred(channel.event_can_read)
         else
            Result := events.event_occurred(channel.event_can_write)
         end
      end

   continue is
      do
         if starting then
            if server_running then
               starting := False
               echo.put_line(once "Server #(1) running" # port.out)
            end
         elseif busy then
            channel.read_line_in(reply)
            if channel.is_connected then
               reply.extend('%N')
            else
               on_reply.call([port, command, reply])
               reply := Void
               command := Void
            end
         elseif commands.is_empty then
            set_done(0)
         else
            command := commands.first
            commands.remove_first
            reply := ""
            channel.put_line(command)
            channel.flush
         end
      end

   done: BOOLEAN

   restart is
      do
         check False end
      end

feature {ANY}
   server_running: BOOLEAN is
      do
         Result := channel /= Void and then channel.is_connected
      end

   add_work (a_command: ABSTRACT_STRING) is
      require
         not a_command.is_empty
      do
         commands.add_last(a_command.intern)
      end

feature {}
   make (a_port: like port; a_on_reply: like on_reply; a_on_done: like on_done) is
      require
         a_on_reply /= Void
         a_on_done /= Void
      do
         port := a_port
         on_reply := a_on_reply
         on_done := a_on_done
         create commands.make(1, 0)

         server_start
      ensure
         port = a_port
         on_reply = a_on_reply
         on_done = a_on_done
      end

   process_factory: PROCESS_FACTORY is
      once
         Result.set_direct_input(True)
         Result.set_direct_output(True)
         Result.set_direct_error(True)
      end

   server_start is
      local
         args: FAST_ARRAY[STRING]
      do
         args := {FAST_ARRAY[STRING] << once "test_server", port.out >> }
         if echo.is_verbose then
            args.add_last(once "-verbose")
         end
         proc := process_factory.execute(once "se", args)

         starting := proc.is_connected
         if not starting then
            set_done(-1)
         end
      end

   starting_timeout: EVENT_DESCRIPTOR
   command: FIXED_STRING
   reply: STRING

   commands: RING_ARRAY[FIXED_STRING]

   on_reply: PROCEDURE[TUPLE[INTEGER, FIXED_STRING, STRING]]
   on_done: PROCEDURE[TUPLE[INTEGER, INTEGER]]

   channel: like channel_memory is
      do
         if proc = Void then
            channel_memory := Void
            echo.w_put_line(once "**** Server process #(1) not started" # port.out)
            set_done(-1)
         elseif proc.is_finished then
            channel_memory := Void
            echo.w_put_line(once "**** Server process #(1) exited with status #(2)" # port.out # proc.status.out)
            set_done(proc.status)
         else
            Result := channel_memory
            if Result = Void or else not Result.is_connected then
               Result := access.stream
               channel_memory := Result
            end
         end
      end

   channel_memory: SOCKET_INPUT_OUTPUT_STREAM

   starting: BOOLEAN

   busy: BOOLEAN is
      do
         Result := reply /= Void
      end

   proc: PROCESS

   set_done (status: INTEGER) is
      do
         on_done.call([port, status])
      end

invariant
   access /= Void
   on_reply /= Void
   on_done /= Void
   commands /= Void

end -- class EIFFELTEST_CLIENT_SOCKET
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
