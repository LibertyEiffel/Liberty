-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class FILTERABLE
   --
   -- The ability to be filtered (typically a stream of characters).
   --

insert
   ANY

feature {ANY}
   is_connected: BOOLEAN
         -- True if the stream is connected. Only in that case can data be transferred via this stream.
      deferred
      end

   disconnect
         -- Try to disconnect the stream. Note that it *does not* ensure that the stream will effectively be
         -- disconnected (some terminal streams, for instance, are always connected) but the feature can be
         -- used to "shake off" filters.
      require
         is_connected
         can_disconnect
      deferred
      ensure
         not is_filtered
      end

   is_filtered: BOOLEAN
         -- True if some filter is using this stream as backend. Use that filter instead.
      do
         Result := filter /= Void
      end

   detach
         -- Shake off the filter.
      deferred
      ensure
         not is_filtered
      end

   can_disconnect: BOOLEAN
         -- True if the stream can be safely disconnected (without data loss, etc.)
      require
         is_connected
      deferred
      end

feature {FILTER}
   set_filter (a_filter: like filter)
         -- Used by the filter itself to get attached
      require
         a_filter /= Void
      do
         filter := a_filter
      ensure
         filter = a_filter
      end

   filter: FILTER
         -- The filter that uses this stream as backend

   filtered_descriptor: INTEGER
         -- Find the descriptor of the terminal stream... Filters do not have descriptors of their own
      require
         is_connected
         filtered_has_descriptor
      deferred
      end

   filtered_has_descriptor: BOOLEAN
         -- True if the underlying terminal stream has a descriptor
      require
         is_connected
      deferred
      end

   filtered_stream_pointer: POINTER
         -- Find the pointer of the terminal stream... Filters do not have pointers of their own
      require
         is_connected
         filtered_has_stream_pointer
      deferred
      end

   filtered_has_stream_pointer: BOOLEAN
         -- True if the underlying terminal stream has a pointer
      require
         is_connected
      deferred
      end

end -- class FILTERABLE
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
