-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class SOCKET_IMPL

inherit
   SOCKET

insert
   STRING_HANDLER
   SOCKET_HANDLER
   SOCKET_PLUG_IN
   RECYCLABLE
   DISPOSABLE

feature {SOCKET_HANDLER}
   is_connected, is_remote_connected: BOOLEAN
   error: STRING

   read
      do
         if delay_read then
            delayed_read
         end
         delay_read := True
         if not is_remote_connected then
            disconnect
         end
      end

   last_read: STRING
      do
         if delay_read then
            delayed_read
         end
         Result := last_delayed_read
         if not is_remote_connected then
            disconnect
         end
      end

   write (data: STRING)
      local
         dummy: INTEGER
      do
         dummy := net_write(fd, data.count, data.storage)
         error := last_error
         if error /= Void then
            disconnect
         end
      end

   disconnect
      do
         is_remote_connected := False
         net_shutdown(fd)
         net_disconnect(fd)
         is_connected := False
         fire_disconnected
      end

   clear
      do
         if disconnected_listeners /= Void then
            disconnected_listeners.clear_count
         end
      end

   fd: INTEGER

   set_sync (a_sync: like sync)
      do
         sync := a_sync
         if a_sync then
            buffer_size := 1
         else
            buffer_size := default_buffer_size
         end
      end

   sync: BOOLEAN

feature {}
   connect (a_fd: like fd)
      do
         if a_fd >= 0 then
            is_connected := True
            is_remote_connected := True
            fd := a_fd
         else
            error := last_error
         end
         delay_read := False
      end

   buffer_size: like default_buffer_size
   delay_read: BOOLEAN

   delayed_read
      require
         is_connected
         delay_read
      local
         count: INTEGER
      do
         last_delayed_read.resize(buffer_size)
         count := net_read(fd, buffer_size, last_delayed_read.storage.to_external, sync)
         if count < 0 then
            if net_last_error_try_again then
               count := 0
               last_delayed_read.clear_count
               debug ("socket")
                  std_error.put_line(once "error while reading from socket: #(1) (will retry)" # last_error)
               end
            else
               error := once ""
               error.make_from_string(once "Error #(1): #(2)" # net_last_error_number.out # last_error)
               debug ("socket")
                  std_error.put_line(once "error while reading from socket: #(1)" # error)
               end
               disconnect
            end
         elseif count = 0 and then sync then
            debug ("socket")
               std_error.put_line(once "error while reading from socket: socket was disconnected")
            end
            is_remote_connected := False
         end
         if count > 0 then
            last_delayed_read.resize(count)
            error := last_error
            if error /= Void then
               disconnect
               debug ("socket")
                  std_error.put_line(once "error while reading from socket: #(1)" # error)
               end
            else
               debug ("socket")
                  std_error.put_line(once "read socket: %"#(1)%"" # last_delayed_read)
               end
            end
         end
         delay_read := False
      ensure
         not delay_read
      end

   last_delayed_read: STRING

invariant
   sync implies buffer_size = 1
   last_delayed_read /= Void

end -- class SOCKET_IMPL
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
