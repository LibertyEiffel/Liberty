-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class EZMQ_SOCKET

inherit
   HASHABLE

feature {ANY}
   is_equal (other: like Current): BOOLEAN
      do
         Result := other = Current
      end

   type: EZMQ_TYPE

   is_valid: BOOLEAN
      deferred
      end

   send (message: ABSTRACT_STRING; flags: EZMQ_FLAGS)
      require
         is_valid
         is_connected
         type.can_send
         message /= Void
         flags.is_valid
      deferred
      end

   receive (capacity: INTEGER; flags: EZMQ_FLAGS)
      require
         is_valid
         is_connected
         type.can_receive
         capacity > 0
         flags.is_valid
      deferred
      end

   last_received: ABSTRACT_STRING
      require
         is_connected
      deferred
      end

   is_connected: BOOLEAN
      deferred
      end

   disconnect
      require
         is_connected
      deferred
      end

   input_event: EZMQ_SOCKET_INPUT
      deferred
      end

feature {EZMQ_POLLABLE}
   register (hub: EZMQ_HUB)
      deferred
      end

feature {EZMQ_HUB}
   register_pollitems (pollitems: EZMQ_ZMQ_POLLITEMS; a_event: EZMQ_EVENT)
      require
         pollitems /= Void
         a_event.is_valid
      deferred
      end

invariant
   is_valid implies type.is_valid
   is_connected implies is_valid

end -- class EZMQ_SOCKET
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
