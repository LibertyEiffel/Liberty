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
   HASHABLE
   LOGGING

create {ANY}
   make

feature {ANY}
   hash_code: INTEGER
      do
         Result := port
      end

   pid: INTEGER
      do
         Result := proc.id
      end

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET)
      local
         t: TIME_EVENTS
      do
         log.trace.put_line(once "Facade #(1): prepare (starting: #(2) -- busy: #(3))" # port.out # starting.out # busy.out)
         if starting then
            timeout := t.timeout(500)
            events.expect(timeout)
         else
            timeout := t.timeout(60_000)
            events.expect(timeout)
            if busy then
               events.expect(channel.event_can_read)
            else
               events.expect(channel.event_can_write)
            end
         end
      end

   is_ready (events: EVENTS_SET): BOOLEAN
      do
         if starting then
            Result := events.event_occurred(timeout)
            log.trace.put_line(once "Facade #(1): starting (timeout: #(2))" # port.out # Result.out)
         elseif busy and then events.event_occurred(channel.event_can_read) then
            Result := True
            log.trace.put_line(once "Facade #(1): can read: #(2)" # port.out # Result.out)
         elseif not busy and then events.event_occurred(channel.event_can_write) then
            Result := True
            log.trace.put_line(once "Facade #(1): can write: #(2)" # port.out # Result.out)
         elseif events.event_occurred(timeout) then
            Result := not busy or else (channel = Void or else not channel.is_connected)
            log.trace.put_line(once "Facade #(1): periodic check (connected: #(2), busy: #(3), channel disconnected: #(4))" # port.out # channel.is_connected.out # busy.out # Result.out)
         else
            check False end
         end
         log.trace.put_line(once " => Facade #(1): is_ready: #(2)" # port.out # Result.out)
      end

   continue
      do
         if starting then
            if channel = Void then
               open_channel
            elseif server_running then
               starting := False
               log.info.put_line(once "Facade #(1): server is running" # port.out)
            else
               log.trace.put_line(once "Facade #(1): server still starting" # port.out)
            end
         elseif busy then
            log.trace.put_line(once "Facade #(1): busy" # port.out)
            if channel.is_connected then
               channel.read_line_in(reply)
            end
            if channel.is_connected then
               log.trace.put_line(once "Facade #(1): busy -- read full line" # port.out)
               reply.extend('%N')
            else
               log.info.put_line(once "Facade #(1): full reply [#(2)] received:%N~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%N#(2)%N~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" # port.out # command # reply)
               on_reply.call([port, command, reply])
               reply := Void
               command := Void
               if channel.is_connected then
                  channel.disconnect -- ???
               end
               if commands.is_empty(Current) then
                  log.info.put_line(once "Facade #(1): no more commands" # port.out)
                  set_done(0)
               else
                  open_channel
               end
            end
         elseif commands.is_empty(Current) then
            log.info.put_line(once "Facade #(1): no more commands" # port.out)
            set_done(0)
         else
            command := commands.item(Current)
            commands.remove(Current)
            log.info.put_line(once "Facade #(1): now executing command: #(2)" # port.out # command)
            if log.is_trace then
               commands.display(log.trace)
            end
            reply := ""
            channel.put_line(command)
            channel.flush
         end
      end

   done: BOOLEAN

   restart
      do
         check False end
      end

feature {ANY}
   server_running: BOOLEAN
      do
         Result := channel /= Void and then channel.is_connected
      end

feature {}
   make (a_port: like port; a_commands: like commands; a_on_reply: like on_reply; a_on_done: like on_done)
      require
         a_commands /= Void
         a_on_reply /= Void
         a_on_done /= Void
      do
         port := a_port
         commands := a_commands

         on_reply := a_on_reply
         on_done := a_on_done

         server_start
      ensure
         port = a_port
         commands = a_commands
         on_reply = a_on_reply
         on_done = a_on_done
      end

   process_factory: PROCESS_FACTORY
      once
         Result.set_direct_input(True)
         Result.set_direct_output(True)
         Result.set_direct_error(True)
      end

   server_start
      local
         args: FAST_ARRAY[STRING]
      do
         args := {FAST_ARRAY[STRING] << once "test_server", port.out >> }
         if log.is_trace then
            args.add_last(once "-debug")
         elseif log.is_info then
            args.add_last(once "-verbose")
         end
         proc := process_factory.execute(once "se", args)

         starting := proc.is_connected
         if not starting then
            set_done(-1)
         end
         log.info.put_line(once "Facade #(1): server starting" # port.out)
      end

   timeout: EVENT_DESCRIPTOR
   command: FIXED_STRING
   reply: STRING

   commands: EIFFELTEST_COMMAND_PROVIDER

   on_reply: PROCEDURE[TUPLE[INTEGER, FIXED_STRING, STRING]]
   on_done: PROCEDURE[TUPLE[INTEGER, INTEGER]]

   open_channel
      require
         channel = Void or else not channel.is_connected
      do
         log.trace.put_line(once "Facade #(1): opening channel" # port.out)
         if proc = Void then
            log.error.put_line(once "Facade #(1): server not started" # port.out)
            set_done(-1)
         elseif proc.is_finished then
            log.error.put_line(once "Facade #(1): server exited with status #(2)" # port.out # proc.status.out)
            set_done(proc.status)
         else
            channel := access.stream
            if channel = Void then
               log.info.put_line(once "Facade #(1): channel not opened" # port.out # channel.is_connected.out)
            else
               log.info.put_line(once "Facade #(1): openned channel, is_connected: #(2)" # port.out # channel.is_connected.out)
            end
         end
      end

   channel: SOCKET_INPUT_OUTPUT_STREAM

   starting: BOOLEAN

   busy: BOOLEAN
      do
         Result := reply /= Void
      end

   proc: PROCESS

   set_done (status: INTEGER)
      do
         log.info.put_line(once "Facade #(1): done: #(2)" # port.out # status.out)
         on_done.call([port, status])
         log.trace.put_line(once "Facade #(1): finished" # port.out)
         done := True
      end

invariant
   access /= Void
   on_reply /= Void
   on_done /= Void
   commands /= Void
   proc /= Void

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
-- Copyright (C) 2013-2017: Cyril ADRIAN <cyril.adrian@gmail.com>
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
