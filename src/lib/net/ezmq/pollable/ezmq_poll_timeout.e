-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class EZMQ_POLL_TIMEOUT

inherit
   EZMQ_POLLABLE

create {ANY}
   make

feature {EZMQ_HUB}
   register (hub: EZMQ_HUB)
      do
         hub.register_timeout(Current)
      end

   calc: FUNCTION[TUPLE[EZMQ_HUB, EZMQ_DATA], TIME]
   action: PREDICATE[TUPLE[EZMQ_HUB, EZMQ_DATA]]

feature {}
   make (a_calc: like calc; a_action: like action)
      require
         a_calc /= Void
         a_action /= Void
      do
         calc := a_calc
         action := a_action
      ensure
         calc = a_calc
         action = a_action
      end

invariant
   calc /= Void
   action /= Void

end -- class EZMQ_POLL_TIMEOUT
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
