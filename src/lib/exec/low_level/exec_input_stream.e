-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class EXEC_INPUT_STREAM
        -- Common ancestor of EXEC_INPUT_STREAM_WIN32 and EXEC_INPUT_STREAM_POSIX

inherit
   TERMINAL_INPUT_STREAM

insert
   EXEC_STREAM

feature {ANY}
   can_unread_character: BOOLEAN

   end_of_input: BOOLEAN

   is_connected: BOOLEAN

   disconnect
      deferred
      end

feature {}
   has_unread_character: BOOLEAN

   unread_buffer: CHARACTER

   swap_unread_buffer
      local
         tmp_buffer: CHARACTER
      do
         tmp_buffer := unread_buffer
         unread_buffer := filtered_last_character
         filtered_last_character := tmp_buffer
      ensure
         unread_buffer = old filtered_last_character
         filtered_last_character = old unread_buffer
      end

feature {FILTER}
   filtered_read_character
      local
         i: INTEGER
      do
         if has_unread_character then
            has_unread_character := False
            swap_unread_buffer
            end_of_input := False
         else
            unread_buffer := filtered_last_character
            i := basic_exec_get_character(handle)
            if i = -1 then
               end_of_input := True
            else
               filtered_last_character := i.to_character
               end_of_input := False
            end
         end
         can_unread_character := not end_of_input
      end

   filtered_unread_character
      do
         has_unread_character := True
         can_unread_character := False
         swap_unread_buffer
      end

   filtered_last_character: CHARACTER

   filtered_descriptor: INTEGER
           deferred
           end

   filtered_has_descriptor: BOOLEAN deferred end

   filtered_stream_pointer: POINTER deferred end

   filtered_has_stream_pointer: BOOLEAN deferred end

feature {PROCESS}
   make (a_process: like process)
      require
         a_process /= Void
         process /= Void implies process = a_process
      do
         can_unread_character := False
         end_of_input := False
         has_unread_character := False
         process := a_process
         create_pipe
         if pipe.is_not_null then
            handle := basic_exec_get_in_handle(pipe)
            is_connected := True
         end
      end

   process: PROCESS

feature {}
   handle: POINTER

   basic_exec_get_in_handle (a_pipe: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_win32_get_in_handle"
         }"
      end

   basic_exec_get_character (handle_: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_win32_get_character"
         }"
      end

   basic_exec_close (handle_: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_win32_close"
         }"
      end

end -- class EXEC_INPUT_STREAM_WIN32
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
