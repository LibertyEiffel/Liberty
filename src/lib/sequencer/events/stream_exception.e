-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class STREAM_EXCEPTION
   --
   -- Event: some exception occur on the stream
   --

inherit
   EVENT_DESCRIPTOR

create {STREAM}
   make

feature {EVENTS_SET}
   expect (events: EVENTS_SET)
      do
         events.when_exception(stream)
         set_expected(events)
      end

   occurred (events: EVENTS_SET): BOOLEAN
      do
         Result := events.is_exception(stream)
      end

feature {}
   stream: STREAM

   make (a_stream: like stream)
      require
         not is_expected
         a_stream /= Void
         a_stream.is_connected
         a_stream.has_descriptor
      do
         stream := a_stream
      ensure
         stream = a_stream
      end

end -- class STREAM_EXCEPTION
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
