-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_CLIENT_SOCKET
   --
   -- Pools and sends commands to an eiffeltest server
   --

inherit
   JOB

create {ANY}
   make

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET) is
      do
         if busy then
            events.expect(channel.event_can_read)
         else
            events.expect(channel.event_can_write)
         end
      end

   is_ready (events: EVENTS_SET): BOOLEAN is
      do
         if busy then
            Result := events.event_occurred(channel.event_can_read)
         else
            Result := events.event_occurred(channel.event_can_write)
         end
      end

   continue is
      do
         if busy then
            channel.read_line_in(reply)
            if channel.is_connected then
               reply.extend('%N')
            else
               callback.call([port, command, reply])
               reply := Void
               command := Void
            end
         elseif commands.is_empty then
            done := True
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
         done := False
      end

feature {ANY}
   server_running: BOOLEAN is
      do
         Result := channel /= Void and then channel.is_connected
      end

   server_start is
      local
         factory: PROCESS_FACTORY
         args: FAST_ARRAY[STRING]
         arg: ABSTRACT_STRING
      do
         factory.set_direct_input(False)
         factory.set_direct_output(False)
         factory.set_direct_error(False)

         proc := factory.execute("se", {FAST_ARRAY[STRING] << "test_server", port.out >> })

         if proc.is_connected then
            proc.wait
         end
      end

   call (a_command: like command) is
      require
         server_running
         not a_command.is_empty
      do
         commands.add_last(command)
      end

feature {}
   make (a_port: like port; a_callback: like callback) is
      require
         a_callback /= Void
      do
         port := a_port
         callback := a_callback
         create access.make(create {IPV4_ADDRESS}.make(127,1,42,13), port, True)
         create commands.make(1, 0)
      ensure
         port = a_port
         callback = a_callback
      end

   port: INTEGER
   access: TCP_ACCESS
   command, reply: STRING

   commands: RING_ARRAY[STRING]

   callback: PROCEDURE[TUPLE[INTEGER, STRING, STRING]]

   channel: like channel_memory is
      do
         if proc /= Void and then not proc.is_finished then
            Result := channel_memory
            if Result = Void or else not Result.is_connected then
               Result := access.stream
               channel_memory := Result
            end
         end
      end

   channel_memory: SOCKET_INPUT_OUTPUT_STREAM

   busy: BOOLEAN is
      do
         Result := reply /= Void
      end

   proc: PROCESS

invariant
   access /= Void
   callback /= Void
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
