-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class EZMQ_SOCKET_ZMQ

inherit
   EZMQ_SOCKET
      undefine
         default_create
      end

insert
   EZMQ_ZMQ
      undefine
         is_equal
      end

feature {ANY}
   endpoint: EZMQ_ENDPOINT
   is_connected: BOOLEAN

   input_event: like input_event_memory
         -- Only useful for event loops by using its event descriptor
      do
         Result := input_event_memory
         if Result = Void then
            create Result.make(Current)
            input_event_memory := Result
         end
      end

   hash_code: INTEGER
      do
         Result := socket.hash_code
      end

   is_valid: BOOLEAN
      do
         Result := socket.is_not_null
      end

   send (message: ABSTRACT_STRING; flags: EZMQ_FLAGS)
      local
         s: STRING; r: INTEGER
      do
         s := once ""
         s.make_from_string(message)

         r := zmq_send(socket, s.to_external, s.count, flags.flags)
         if r /= 0 then
            send_error_action.call([r, Current, message, flags])
         end
      end

   receive (capacity: INTEGER; flags: EZMQ_FLAGS)
      local
         r: INTEGER
      do
         last_received := once ""
         last_received.clear_count
         last_received.with_capacity(capacity)

         r := zmq_receive(socket, last_received.to_external, capacity + 1, flags.flags)
         if r /= 0 then
            receive_error_action.call([r, Current, capacity, flags])
         end
      end

   last_received: STRING

   disconnect
      local
         r: INTEGER
      do
         is_connected := False
         r := zmq_disconnect(socket, endpoint.to_external)
         if r /= 0 then
            disconnect_error_action.call([r, Current])
         else
            r := zmq_close(socket)
            if r /= 0 then
               disconnect_error_action.call([r, Current])
            end
         end
      end

feature {EZMQ_SOCKET_INPUT}
   fd: INTEGER
      do
         Result := zmq_socket_fd(socket)
      end

   can_read: BOOLEAN
      local
         e: EZMQ_EVENT
      do
         Result := e.Pollin.is_set(zmq_socket_events(socket))
      end

   can_write: BOOLEAN
      local
         e: EZMQ_EVENT
      do
         Result := e.Pollout.is_set(zmq_socket_events(socket))
      end

feature {EZMQ_POLLABLE}
   register (hub: EZMQ_HUB)
      do
         if is_valid then
            hub.register_socket(Current, socket)
         end
      end

feature {EZMQ_HUB}
   register_pollitems (pollitems: EZMQ_ZMQ_POLLITEMS; a_event: EZMQ_EVENT)
      do
         if is_valid then
            pollitems.set(socket, a_event)
         end
      end

feature {}
   make0 (a_type: like type; a_endpoint: like endpoint)
      require
         a_type.is_valid
         a_endpoint /= Void
      do
         if context.is_null then
            start_context
         end
         socket := zmq_socket(context, a_type.type)
         if is_valid then
            type := a_type
            endpoint := a_endpoint
         end
      ensure
         is_valid implies type = a_type
         is_valid implies endpoint = a_endpoint
      end

   socket: POINTER
   input_event_memory: EZMQ_SOCKET_INPUT

invariant
   is_valid implies endpoint /= Void

end -- class EZMQ_SOCKET_ZMQ
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
