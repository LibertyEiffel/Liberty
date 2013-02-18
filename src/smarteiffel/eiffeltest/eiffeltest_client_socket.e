-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_CLIENT_SOCKET

inherit
   JOB

create {ANY}
   make

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET) is
      do
         events.expect(channel.can_read)
      end

   is_ready (events: EVENTS_SET): BOOLEAN is
      do
         Result := events.event_occurred(channel.can_read)
      end

   continue is
      do
         channel.read_line_in(reply)
         if channel.is_connected then
            reply.extend('%N')
         else
            callback.call([port, command, reply])
            reply := Void
            command := Void
         end
      end

   done: BOOLEAN is
      do
         Result := not busy
      end

   restart is
      do
         reply := ""
         channel.put_line(command)
         channel.flush
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
         proc: PROCESS; arg: ABSTRACT_STRING
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
         server_is_ready
         is_ready
         not a_command.is_empty
      do
         command := a_command
      ensure
         done
         not is_ready
      end

   is_ready: BOOLEAN is
      do
         Result := not busy and then command = Void
      ensure
         Result implies done
      end

   server_is_ready: BOOLEAN is
      do
         Result := server_running and then not busy
      ensure
         Result implies done
      end

feature {}
   make (a_port: like port; a_callback: like callback) is
      require
         a_callback /= Void
      do
         port := a_port
         callback := a_callback
         create access.make(create {IPV4_ADDRESS}.make(127,1,42,13), port, True)
         channel := access.stream
      ensure
         port = a_port
         callback = a_callback
      end

   port: INTEGER
   access: TCP_ACCESS
   command, reply: STRING

   callback: PROCEDURE[TUPLE[INTEGER, STRING, STRING]]

   channel: like channel_memory is
      do
         Result := channel_memory
         if Result = Void or else not Result.is_connected then
            Result := access.stream
            channel_memory := Result
         end
      end

   channel_memory: SOCKET_INPUT_OUTPUT_STREAM

   busy: BOOLEAN is
      do
         Result := reply /= Void
      end

invariant
   access /= Void
   callback /= Void

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
