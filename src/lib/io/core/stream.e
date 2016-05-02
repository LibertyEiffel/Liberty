-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class STREAM
   --
   -- A stream of characters.
   --
   -- There are two kinds of streams:
   -- + input streams (see INPUT_STREAM)
   -- + output_streams (see OUTPUT_STREAM)
   --
   -- Streams can:
   -- + be connected (e.g. to some system object)
   -- + be used to read or write characters, only if they are connected
   -- + be filtered (see FILTER)
   --

insert
   RECYCLABLE
   DISPOSABLE

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
      end

   descriptor: INTEGER
         -- Some OS-dependent descriptor. Mainly used by the sequencer library (see READY_CONDITION).
      require
         is_connected
         has_descriptor
      do
         Result := filtered_descriptor
      end

   has_descriptor: BOOLEAN
         -- True if that stream can be associated to some OS-meaningful descriptor.
      require
         is_connected
      do
         Result := filtered_has_descriptor
      end

   can_disconnect: BOOLEAN
         -- True if the stream can be safely disconnected (without data loss, etc.)
      require
         is_connected
      deferred
      end

   frozen url: URL
         -- The URL to this stream as resource
      do
         Result := url_memory
         if Result = Void then
            Result := new_url
            url_memory := Result
         end
      ensure
         not_void: Result /= Void
         always_the_same: Result = url
      end

feature {}
   url_memory: URL

   new_url: URL
      deferred
      ensure
         Result /= Void
      end

feature {STREAM_HANDLER}
   stream_pointer: POINTER
         -- Some Back-end-dependent pointer (FILE* in C, InputStream or OutputStream in Java)
      require
         is_connected
         has_stream_pointer
      do
         Result := filtered_stream_pointer
      end

   has_stream_pointer: BOOLEAN
         -- True if that stream can be associated to some Back-end-meaningful stream pointer.
      require
         is_connected
      do
         Result := filtered_has_stream_pointer
      end

feature {FILTER}
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

feature {ANY}
   event_exception: EVENT_DESCRIPTOR
      do
         Result := stream_exception
         if Result = Void then
            create stream_exception.make(Current)
            Result := stream_exception
         end
      end

feature {}
   stream_exception: STREAM_EXCEPTION

feature {RECYCLING_POOL}
   recycle
      do
         if is_connected then
            disconnect
            check
               -- Because the previous code is just here to catch
               -- non-clean usage of STREAMs:
               disconnect_file_after_use: False
            end
         end
      end

feature {}
   dispose
      do
         if is_connected and then can_disconnect then
            check
               -- Because the previous code is just here to catch
               -- non-clean usage of STREAMs:
               disconnect_file_after_use: False
            end
            disconnect
         end
      end

feature {}
   sequencer_descriptor (file: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "sequencer"
         feature_name: "sequencer_descriptor"
         }"
      end

end -- class STREAM
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
