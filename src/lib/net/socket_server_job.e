-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class SOCKET_SERVER_JOB
   --
   -- Encapsulate the server in a sequencer-aware job.
   --

inherit
   JOB

create {ANY}
   make

feature {ANY}
   when_connect (handler: PROCEDURE[TUPLE[SOCKET_INPUT_OUTPUT_STREAM]])
         -- What to do when connection happens (i.e. some client tries to connect to the server). The
         -- procedure is given the stream connected to the client.
      require
         not done
      do
         connect_handlers.add_last(handler)
      end

   when_shutdown (handler: PROCEDURE[TUPLE[SOCKET_SERVER_JOB]])
         -- Should be more accurately be called `when_shutdown_or_halt'. The agent is called when a shutdown
         -- or a halt of the server occurs.
      require
         not done
      do
         shutdown_handlers.add_last(handler)
      end

   shutdown
         -- Wait for the connections to finish, then stop the server.
         -- No more connections will be accepted.
      require
         not done
      do
         server.shutdown
         handle_shutdown
      ensure
         will_shutdown
      end

   halt
      require
         not done
      do
         server.halt
         handle_shutdown
      ensure
         will_shutdown
      end

   done: BOOLEAN

feature {SERVER}
   will_shutdown: BOOLEAN
      do
         Result := not server.can_connect
      end

feature {}
   handle_shutdown
      require
         will_shutdown
      local
         i, n: INTEGER
      do
         from
            i := shutdown_handlers.lower
            n := shutdown_handlers.upper
         until
            i > n
         loop
            shutdown_handlers.item(i).call([Current])
            i := i + 1
         end
         done := True
      end

feature {LOOP_ITEM} -- The following features are inherited from JOB:
   prepare (events: EVENTS_SET)
      do
         if not will_shutdown then
            events.expect(server.event_connection)
         end
      end

   is_ready (events: EVENTS_SET): BOOLEAN
      do
         if will_shutdown then
            done := True
         else
            Result := events.event_occurred(server.event_connection)
         end
      end

   continue
      local
         stream: SOCKET_INPUT_OUTPUT_STREAM; i, n: INTEGER
      do
         -- on incoming connection only (see `is_ready')
         stream := server.new_stream(read_sync)
         check
            stream.is_connected
         end
         from
            i := connect_handlers.lower
            n := connect_handlers.upper
         until
            i > n
         loop
            connect_handlers.item(i).call([stream])
            i := i + 1
         end
      end

   restart
      do
         -- nothing (yet?)
      end

feature {}
   make (a_server: like server; a_read_sync: like read_sync)
      do
         server := a_server
         read_sync := a_read_sync
         create connect_handlers.with_capacity(2)
         create shutdown_handlers.with_capacity(2)
      end

   server: SOCKET_SERVER

   read_sync: BOOLEAN

   connect_handlers: FAST_ARRAY[PROCEDURE[TUPLE[SOCKET_INPUT_OUTPUT_STREAM]]]

   shutdown_handlers: FAST_ARRAY[PROCEDURE[TUPLE[SOCKET_SERVER_JOB]]]

end -- class SOCKET_SERVER_JOB
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
