-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class READY_DESCRIPTION
obsolete "Please use EVENTS_SET instead"

inherit
   EVENTS_SET
      export
         {ANY} after, at, when_data, is_data, when_free, is_free, when_connection, is_connection
      end

create {ANY}
   make

feature {ANY}
   after_from_now (timeout_ms: INTEGER)
         -- `timeout_ms' is the max time in milliseconds to wait from now.
      require
         timeout_ms >= 0
         not queryable
      local
         t: TIME_EVENTS
      do
         expect(t.in_time(timeout_ms))
      end

   when_binary_data (file: BINARY_FILE_READ)
      require
         file /= Void
         file.is_connected
         not queryable
      do
         when_data(file)
      end

   is_binary_data (file: BINARY_FILE_READ): BOOLEAN
      require
         file /= Void
         file.is_connected
         queryable
      do
         Result := is_data(file)
      end

end -- class READY_DESCRIPTION
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
