-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class TIMEOUT_EVENT
   --
   -- Event: a timeout occurred
   --

inherit
   TIME_EVENT

create {TIME_EVENTS}
   make

feature {TIME_EVENTS}
   set_timeout (timeout_ms: like timeout)
         -- `timeout_ms' is the max time in milliseconds to wait when the EVENTS_SET.wait begins.
      require
         not is_expected
         timeout >= 0
      do
         timeout := timeout_ms
      ensure
         timeout = timeout_ms
      end

feature {EVENTS_SET}
   expect (events: EVENTS_SET)
      do
         events.after(timeout)
         set_expected(events)
      end

   occurred (events: EVENTS_SET): BOOLEAN
      do
         Result := True --|*** OK??
      end

feature {}
   timeout: INTEGER

   make
      do
      end

end -- class TIMEOUT_EVENT
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
