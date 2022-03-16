-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class EZMQ_SOCKET_INPUT
   --
   -- This fake input "stream" is just used for events triggering by
   -- zmq. Cannot directly read from it (see zmq doc for details).
   --

inherit
   INPUT_STREAM

create {EZMQ_SOCKET_ZMQ}
   make

feature {ANY}
   disconnect
      do
         check False end
      end

   can_disconnect: BOOLEAN False

   can_read_socket: BOOLEAN
      do
         Result := socket.can_read
      end

   can_write_socket: BOOLEAN
      do
         Result := socket.can_write
      end

feature {FILTER}
   filtered_descriptor: INTEGER
      do
         Result := socket.fd
      end

   filtered_has_descriptor: BOOLEAN True

   filtered_stream_pointer: POINTER
      do
         check False end
      end

   filtered_has_stream_pointer: BOOLEAN False

feature {ANY}
   socket: EZMQ_SOCKET_ZMQ

   can_read_character: BOOLEAN False

   can_read_line: BOOLEAN False

   can_unread_character: BOOLEAN False

   valid_last_character: BOOLEAN False

   end_of_input: BOOLEAN True

   is_connected: BOOLEAN then socket.is_connected end

feature {FILTER_INPUT_STREAM}
   filtered_read_character
      do
         check False end
      end

   filtered_unread_character
      do
         check False end
      end

   filtered_last_character: CHARACTER
      do
         check False end
      end

feature {}
   make (s: like socket)
      require
         s /= Void
      do
         socket := s
      ensure
         socket = s
      end

invariant
   socket /= Void

end -- class EZMQ_SOCKET_INPUT
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
