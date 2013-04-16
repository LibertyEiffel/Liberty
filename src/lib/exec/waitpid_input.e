-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class WAITPID_INPUT
   --
   -- A specific input stream that gathers child process exit status.
   -- It must be created at most once.
   --
   -- If this stream is created then exiting children will send data in this channel.
   --
   -- Each child sends exactly one line, containing the child pid and its exit status separated by a space.
   --

inherit
   TERMINAL_INPUT_STREAM
      redefine
         can_unread_character, can_disconnect, valid_last_character
      end

insert
   SINGLETON

create {ANY}
   make

feature {ANY}
   is_connected: BOOLEAN is True
   can_disconnect: BOOLEAN is False

   disconnect is
      do
         check False end
      end

   can_unread_character: BOOLEAN is
      do
         Result := index > 0
      end

   valid_last_character: BOOLEAN is
      do
         Result := index <= upper
      end

   end_of_input: BOOLEAN is False

feature {FILTER}
   filtered_descriptor: INTEGER is
      do
         Result := basic_exec_waitpid_fd
      end

   filtered_has_descriptor: BOOLEAN is True

   filtered_stream_pointer: POINTER is
      do
         check False end
      end

   filtered_has_stream_pointer: BOOLEAN is False

   filtered_read_character is
      do
         if index < upper then
            index := index + 1
         else
            read_buffer
         end
      end

   filtered_unread_character is
      do
         index := index - 1
      end

   filtered_last_character: CHARACTER is
      do
         Result := buffer.item(index)
      end

feature {}
   make is
      do
         buffer := buffer.calloc(128)
      end

   buffer: NATIVE_ARRAY[CHARACTER]
   index, upper: INTEGER

   read_buffer is
      do
         upper := basic_exec_waitpid_read_buffer(buffer.to_external) - 1
         index := 0
      end

   basic_exec_waitpid_read_buffer (data: POINTER): INTEGER is
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_waitpid_read_buffer"
         }"
      end

   basic_exec_waitpid_fd: INTEGER is
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_waitpid_fd()"
         }"
      end

invariant
   upper >= -1
   index.in_range(0, upper+1)

end -- WAITPID_INPUT
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
