-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class SOCKET
   --
   -- A low-level socket. Should not be used directly, but only via a SOCKET_INPUT_OUTPUT_STREAM.
   --

insert
   RECYCLABLE
   DISPOSABLE

feature {SOCKET_HANDLER}
   default_buffer_size: INTEGER is 8192

   is_connected: BOOLEAN is
      deferred
      ensure
         Result implies is_remote_connected
      end

   is_remote_connected: BOOLEAN is
      deferred
      end

   error: STRING is
      deferred
      end

   read is
      require
         is_connected
      deferred
      end

   last_read: STRING is
      require
         is_connected
      deferred
      end

   write (data: STRING) is
      require
         is_connected
         data /= Void
      deferred
      end

   disconnect is
      require
         is_connected
      deferred
      ensure
         not is_connected
         not is_remote_connected
      end

   clear is
      require
         not is_connected
      deferred
      end

   fd: INTEGER is
      deferred
      end

   when_disconnected (a_listener: PROCEDURE[TUPLE[SOCKET]]) is
      require
         a_listener /= Void
      do
         if disconnected_listeners = Void then
            create disconnected_listeners.with_capacity(2)
         end
         disconnected_listeners.add_last(a_listener)
      end

feature {} -- socket listeners
   disconnected_listeners: FAST_ARRAY[PROCEDURE[TUPLE[SOCKET]]]

   fire_disconnected is
      local
         i: INTEGER
      do
         if disconnected_listeners /= Void then
            from
               i := disconnected_listeners.lower
            until
               i > disconnected_listeners.upper
            loop
               disconnected_listeners.item(i).call([Current])
               i := i + 1
            end
         end
      end

feature {RECYCLING_POOL}
   recycle is
      do
         clear
      end

feature {} -- really low level
   dispose is
      require
         should_not_rely_on_gc: not is_connected
      do
         if is_connected then
            disconnect
         end
      end

end -- class SOCKET
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
