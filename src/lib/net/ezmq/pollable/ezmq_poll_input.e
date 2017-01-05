-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class EZMQ_POLL_INPUT

inherit
   EZMQ_POLL_INOUT

create {ANY}
   make

feature {EZMQ_HUB}
   register (hub: EZMQ_HUB)
      do
         socket.register(hub)
         hub.register_input(Current)
      end

   action: PREDICATE[TUPLE[EZMQ_HUB, EZMQ_SOCKET, ABSTRACT_STRING, EZMQ_DATA]]

feature {}
   make (a_socket: like socket; a_action: like action)
      require
         a_socket /= Void
         a_action /= Void
      do
         make0(a_socket, event.Pollin)
         action := a_action
      ensure
         socket = a_socket
         action = a_action
         event = event.Pollin
      end

invariant
   action /= Void

end -- class EZMQ_POLL_INPUT
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
