-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class OUTPUT_STREAM
   --
   -- An output stream is a flow of characters that can be written to some destination (be it an Eiffel object or
   -- an external object)
   --

inherit
   STREAM

insert
   OUTPUT_STREAM_TOOLS
   FILTERABLE
      redefine filter
      end

feature {ANY}
   put_character (c: CHARACTER)
      do
         filtered_put_character(c)
      end

   flush
         -- Flushes the pipe. If `is_filtered', calls the filter's
         -- `flush' instead.
      do
         if filter /= Void then
            filter.flush
         else
            filtered_flush
         end
      end

   can_put_character (c: CHARACTER): BOOLEAN
      deferred
      end

   detach
      do
         if filter /= Void then
            filter.do_detach
            filter := Void
         end
         filtered_flush
      end

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      require
         is_connected
         can_put_character(c)
      deferred
      end

   filtered_flush
      require
         is_connected
      deferred
      end

feature {FILTER}
   filter: FILTER_OUTPUT_STREAM

feature {ANY}
   event_can_write: EVENT_DESCRIPTOR
      do
         Result := can_write
         if Result = Void then
            create can_write.make(Current)
            Result := can_write
         end
      end

feature {}
   can_write: CAN_WRITE_DATA_TO_STREAM

   new_url: URL
      do
         create Result.from_stream(Current, False, True)
      end

   as_output_stream: OUTPUT_STREAM
      do
         Result := Current
      end

end -- class OUTPUT_STREAM
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
