-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CAN_WRITE_DATA_TO_STREAM
   --
   -- Event: some data can be written to `output_stream'
   --

inherit
   EVENT_DESCRIPTOR

create {OUTPUT_STREAM}
   make

feature {EVENTS_SET}
   expect (events: EVENTS_SET)
      do
         events.when_free(output_stream)
         set_expected(events)
      end

   occurred (events: EVENTS_SET): BOOLEAN
      do
         Result := events.is_free(output_stream)
      end

feature {}
   output_stream: OUTPUT_STREAM

   make (a_output_stream: like output_stream)
      require
         not is_expected
         a_output_stream /= Void
         a_output_stream.is_connected
         a_output_stream.has_descriptor
      do
         output_stream := a_output_stream
      ensure
         output_stream = a_output_stream
      end

end -- class CAN_WRITE_DATA_TO_STREAM
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
