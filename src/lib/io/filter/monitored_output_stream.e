-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class MONITORED_OUTPUT_STREAM
   --
   -- An output stream monitor. Monitored data goes to another output stream.
   --
   -- See also MONITORED_INPUT_STREAM
   --

inherit
   FILTER_OUTPUT_STREAM
      rename
         connect_to as reconnect_to
      end

create {ANY}
   connect_to

feature {ANY}
   monitor: OUTPUT_STREAM

feature {}
   local_can_disconnect: BOOLEAN True

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      do
         stream.filtered_put_character(c)
         if monitor.is_connected then
            monitor.put_character(c)
         end
      end

   filtered_flush
      do
         stream.filtered_flush
      end

feature {}
   connect_to (a_stream: like stream; a_monitor: like monitor)
      require
         a_stream /= Void
         a_monitor /= Void
      do
         a_stream.set_filter(Current)
         stream := a_stream
         monitor := a_monitor
      ensure
         stream = a_stream
         monitor = a_monitor
      end

invariant
   stream /= Void
   monitor /= Void

end -- class MONITORED_OUTPUT_STREAM
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
