-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class SOCKET_INPUT_OUTPUT_STREAM
   --
   -- A stream backed by a socket. You cannot directly create such a stream; instead, use ACCESS.stream for
   -- an outbound connection; for an inbound connection, the stream is automatically created by the
   -- SOCKET_SERVER and passed to its handlers.
   --

inherit
   TERMINAL_INPUT_OUTPUT_STREAM
      redefine
         can_read_character, can_read_line, filtered_read_available_in, filtered_read_line_in, valid_last_character
      end

insert
   SOCKET_HANDLER
   STRING_HANDLER

feature {ANY}
   is_connected: BOOLEAN
      do
         Result := socket.is_connected
      end

   is_remote_connected: BOOLEAN
      do
         Result := socket.is_remote_connected
      end

   can_read_character: BOOLEAN
         -- Can be ''temporarily'' False because the socket does not yet have available data
      do
         if socket.sync then
            Result := is_connected
         else
            if delay_read then
               delayed_read
            end
            Result := not end_of_stream or else in_buffer.valid_index(next_index)
         end
      end

   can_read_line: BOOLEAN
      do
         Result := can_read_character
      end

   can_unread_character: BOOLEAN
      do
         if delay_read then
            delayed_read
         end
         if is_remote_connected then
            Result := index > in_buffer.lower or else beginning_of_stream
         end
      end

   valid_last_character: BOOLEAN
      do
         if delay_read then
            delayed_read
         end
         if is_remote_connected then
            Result := in_buffer.valid_index(index) or else beginning_of_stream
         end
      end

   end_of_input: BOOLEAN
      do
         Result := not is_connected
      end

   disconnect
      deferred
      end

   when_disconnect (handler: PROCEDURE[TUPLE[SOCKET_INPUT_OUTPUT_STREAM]])
      do
         if disconnect_handlers = Void then
            create disconnect_handlers.with_capacity(2)
         end
         disconnect_handlers.add_last(handler)
      end

   error: STRING
      do
         Result := socket.error
      end

   set_blocking
         -- set blocking read mode for the socket
      do
         socket.set_sync(True)
      end

   set_nonblocking
         -- set non blocking read mode for the socket
      do
         socket.set_sync(False)
      end

feature {}
   delay_read: BOOLEAN

   delayed_read
      require
         delay_read
      do
         delay_read := False
         if is_remote_connected then
            ensure_read
            index := next_index
         end
      ensure
         not delay_read
      end

feature {FILTER_INPUT_STREAM}
   filtered_read_character
      do
         if delay_read then
            delayed_read
         end
         delay_read := True
      end

   filtered_unread_character
      do
         index := index - 1
      end

   filtered_last_character: CHARACTER
      do
         if delay_read then
            delayed_read
         end
         Result := in_buffer.item(index)
      end

   filtered_read_line_in (buffer: STRING)
      do
         -- Redefined not to take can_read_character into account since it is temporary
         from
            filtered_read_character
         until
            end_of_input or else not valid_last_character or else filtered_last_character = '%N'
         loop
            inspect
               filtered_last_character
            when '%R' then
               filtered_read_character
               if not end_of_input and then filtered_last_character /= '%N' then
                  buffer.extend('%R')
                  buffer.extend(filtered_last_character)
                  filtered_read_character
               end
            when '%N' then
            else
               buffer.extend(filtered_last_character)
               filtered_read_character
            end
         end
      end

   filtered_read_available_in (buffer: STRING; limit: INTEGER)
      local
         i, n: INTEGER
      do
         if delay_read then
            delayed_read
         end
         if is_remote_connected then
            index := next_index
            n := in_buffer.count - index + 1
            if limit < n then
               n := limit
            end
            buffer.ensure_capacity(buffer.count + n)
            from
               i := 0
            until
               i >= n
            loop
               buffer.extend(in_buffer.item(i + index))
               i := i + 1
            end
            index := index + n
         end
      end

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      do
         out_buffer.add_last(c)
         if out_buffer.count >= 1472 then
            filtered_flush
         end
      end

   filtered_flush
      do
         if not out_buffer.is_empty then
            socket.write(out_buffer)
            out_buffer.clear_count
         end
      end

feature {FILTER}
   filtered_descriptor: INTEGER
      do
         Result := socket.fd
      end

   filtered_has_descriptor: BOOLEAN True

   filtered_stream_pointer: POINTER
      do
         std_error.put_line("SOCKET_INPUT_OUTPUT_STREAM.filtered_stream_pointer has been called!")
         crash
      end

   filtered_has_stream_pointer: BOOLEAN False

feature {}
   ensure_read
         -- Read some new data from the socket if it is available. Does not read anything if all the already
         -- read data is not yet consumed. Set `next_index' to the index of the next character to be read.
      require
         not delay_read
      local
         last_read: STRING
      do
         if next_index = index then
            -- It means that a real read operation was performed, or the stream is newly connected.
            -- Otherwise, nothing is to be done.
            if in_buffer.valid_index(index + 1) then
               -- not yet all data consumed
               check
                  not end_of_stream
               end
               next_index := index + 1
            elseif socket.is_connected then
               -- read data
               socket.read
               if socket.is_connected then
                  last_read := socket.last_read
                  if last_read.is_empty then
                     end_of_stream := True
                     next_index := index + 1
                  else
                     end_of_stream := False
                     -- Remove all previously read characters but the last one (to be able to unread once).
                     -- Do it in the most efficient way.
                     if in_buffer.count > 0 then
                        beginning_of_stream := False
                        in_buffer.put(in_buffer.last, in_buffer.lower)
                        in_buffer.set_count(1)
                        next_index := in_buffer.lower + 1 -- set out-of-bound next_index to signal can_read_character = False
                     else
                        check
                           beginning_of_stream
                        end
                        next_index := in_buffer.lower
                        -- Small optimization to avoid having a buffer twice too big just because we will keep one
                        -- old character around for unread. Since the buffer is brand new the capacity will be the
                        -- given one:
                        in_buffer.ensure_capacity(socket.default_buffer_size + 1)
                     end
                     in_buffer.append(last_read)
                  end
               else
                  end_of_stream := True
                  next_index := index + 1
               end
            else
               end_of_stream := True
               next_index := index + 1
            end
         end
      ensure
         not beginning_of_stream implies next_index /= in_buffer.lower
         index = old index
      end

   beginning_of_stream: BOOLEAN
         -- We are at the beginning of the stream (for correct implementation of `can_unread_data')

   end_of_stream: BOOLEAN
         -- All the available data was read (but new data may become available if sent by the client)

   next_index: like index
         -- Set by `ensure_read' to the index of the next character to read

feature {}
   fire_disconnect
      require
         not is_connected
      local
         i, n: INTEGER
      do
         if disconnect_handlers /= Void then
            from
               i := disconnect_handlers.lower
               n := disconnect_handlers.upper
            until
               i > n
            loop
               disconnect_handlers.item(i).call([Current])
               i := i + 1
            end
         end
      end

feature {}
   socket: SOCKET
      deferred
      end

   make
         -- Should be called by the creation procedures after the `socket' is set (the assertions ensure just
         -- that)
      require
         called_by_heirs_constructors_only: not is_made
         create_socket_first: socket /= Void
      do
         in_buffer := ""
         out_buffer := ""
         socket.when_disconnected(agent socket_disconnected(?))
         beginning_of_stream := True
         end_of_stream := True
      ensure
         at_beginning: beginning_of_stream and then index = in_buffer.lower - 1
         must_ensure_read: next_index = index
         called_by_heirs: is_made
      end

   socket_disconnected (a_socket: SOCKET)
      require
         a_socket = socket
         not is_connected
      do
         fire_disconnect
      end

   made: BOOLEAN
         -- This flag makes sure that heirs call "make" in their creation procedure(s).

   is_made: BOOLEAN
         -- A trick to be sure that `made' is not alive (therefore not generated) in boost mode.
      do
         Result := made
         made := True
      end

   index: INTEGER
         -- Index of the last read character

   in_buffer: STRING
   out_buffer: STRING

   disconnect_handlers: FAST_ARRAY[PROCEDURE[TUPLE[SOCKET_INPUT_OUTPUT_STREAM]]]

invariant
   socket /= Void
   index >= in_buffer.lower or else (beginning_of_stream and then index = in_buffer.lower - 1)
   init_by_heirs: is_made

end -- class SOCKET_INPUT_OUTPUT_STREAM
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
