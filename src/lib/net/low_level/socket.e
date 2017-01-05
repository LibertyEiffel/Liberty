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
   default_buffer_size: INTEGER 8192

   set_sync(a_sync: BOOLEAN)
         -- set blocking mode for reading, True is blocking, False nonblocking
      deferred
      ensure
         sync = a_sync
      end

   sync: BOOLEAN
         -- the blocking mode for reading from the socket, True is blocking, False nonblocking
      deferred
      end

   is_connected: BOOLEAN
      deferred
      ensure
         Result implies is_remote_connected
      end

   is_remote_connected: BOOLEAN
      deferred
      end

   error: STRING
      deferred
      end

   read
      require
         is_connected
      deferred
      end

   last_read: STRING
      require
         is_connected
      deferred
      end

   write (data: STRING)
      require
         is_connected
         data /= Void
      deferred
      end

   disconnect
      require
         is_connected
      deferred
      ensure
         not is_connected
         not is_remote_connected
      end

   clear
      require
         not is_connected
      deferred
      end

   fd: INTEGER
      deferred
      end

   when_disconnected (a_listener: PROCEDURE[TUPLE[SOCKET]])
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

   fire_disconnected
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
   recycle
      do
         clear
      end

feature {} -- really low level
   dispose
      require
         should_not_rely_on_gc: not is_connected
      do
         if is_connected then
            disconnect
         end
      end

end -- class SOCKET
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
