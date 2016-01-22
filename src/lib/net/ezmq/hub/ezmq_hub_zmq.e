-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class EZMQ_HUB_ZMQ
   --
   -- The standard ZMQ implementation of the EZMQ hub
   --

inherit
   EZMQ_HUB

insert
   TIME_HANDLER

create {ANY}
   manifest_creation

feature {ANY}
   is_running: BOOLEAN

   run (data: EZMQ_DATA)
      local
         tmout: INTEGER_64
      do
         is_running := True
         from
            running := True
         until
            not running
         loop
            if timeout = Void then
               tmout := -1
            else
               tmout := timeout.calc.item([Current, data]).time_memory
            end
            pollitems.poll(Current, tmout, data)
         end
         is_running := False
      end

   stop
      local
         t: EZMQ_TYPE; f: EZMQ_FLAGS
         stop_socket: EZMQ_SOCKET_ZMQ_CONNECT
      do
         create stop_socket.make(t.Pair, create {EZMQ_ENDPOINT_ZMQ}.inproc(stop_address))
         stop_socket.send(stop_address, f.None)
         stop_socket.disconnect
      end

feature {EZMQ_SOCKET}
   register_socket (socket: EZMQ_SOCKET; zmq_socket: POINTER)
      do
         sockets.put(socket, zmq_socket)
      end

feature {EZMQ_POLL_INPUT}
   register_input (input: EZMQ_POLL_INPUT)
      do
         check
            not input_actions.has(input.socket)
         end
         input.socket.register_pollitems(pollitems, input.event)
         input_actions.add(input, input.socket)
      end

feature {EZMQ_POLL_OUTPUT}
   register_output (output: EZMQ_POLL_OUTPUT)
      do
         check
            not output_actions.has(output.socket)
         end
         output.socket.register_pollitems(pollitems, output.event)
         output_actions.add(output, output.socket)
      end

feature {EZMQ_POLL_TIMEOUT}
   register_timeout (a_timeout: EZMQ_POLL_TIMEOUT)
      do
         timeout := a_timeout
      end

feature {}
   manifest_semicolon_check: BOOLEAN False

   manifest_make (needed_capacity: INTEGER)
      require
         needed_capacity > 0
      local
         t: EZMQ_TYPE
         stop_socket: EZMQ_SOCKET_ZMQ_BIND
      do
         capacity := needed_capacity

         create pollitems.with_capacity(needed_capacity + 1)
         create sockets.with_capacity(needed_capacity + 1)
         create input_actions.with_capacity(needed_capacity + 1)
         create output_actions.with_capacity(needed_capacity + 1)

         stop_address := "zmq_poller_#(1)" # &to_pointer
         create stop_socket.make(t.Pair, create {EZMQ_ENDPOINT_ZMQ}.inproc(stop_address))
         manifest_put(0, create {EZMQ_POLL_INPUT}.make(stop_socket, agent on_stop(?, ?, ?, ?)))
      end

   manifest_put (index: INTEGER; action: EZMQ_POLLABLE)
      require
         action /= Void
      do
         action.register(Current)
      end

   on_stop (hub: EZMQ_HUB; socket: EZMQ_SOCKET; message: ABSTRACT_STRING; data: EZMQ_DATA): BOOLEAN
      require
         hub = Current
      do
         if message.is_equal(stop_address) then
            running := False
         end
         Result := True
      end

   capacity: INTEGER
   sockets: HASHED_DICTIONARY[EZMQ_SOCKET, POINTER]
   pollitems: EZMQ_ZMQ_POLLITEMS
   timeout: EZMQ_POLL_TIMEOUT
   running: BOOLEAN
   stop_address: ABSTRACT_STRING

   input_actions: HASHED_DICTIONARY[EZMQ_POLL_INPUT, EZMQ_SOCKET]
   output_actions: HASHED_DICTIONARY[EZMQ_POLL_OUTPUT, EZMQ_SOCKET]

   pollitem_on_input (s: POINTER; msg: POINTER; data: EZMQ_DATA)
      local
         message: STRING; socket: EZMQ_SOCKET
      do
         create message.from_external_copy(msg)
         socket := sockets.at(s)
         if not input_actions.at(socket).action.item([Current, socket, message, data]) then
            -- TODO: so what?
         end
      end

   pollitem_on_output (s: POINTER; data: EZMQ_DATA): POINTER
      local
         message: ABSTRACT_STRING; socket: EZMQ_SOCKET
      do
         socket := sockets.at(s)
         message := output_actions.at(socket).action.item([Current, socket, data])
         if message /= Void then
            Result := message.to_external
         end
      end

   pollitem_on_timeout (data: EZMQ_DATA)
      do
         if timeout /= Void then
            if not timeout.action.item([Current, data]) then
               -- TODO: so what?
            end
         end
      end

invariant
   sockets /= Void
   pollitems /= Void
   input_actions /= Void
   output_actions /= Void

end -- class EZMQ_HUB_ZMQ
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
