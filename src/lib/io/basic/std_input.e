-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class STD_INPUT
   --
   -- To use the standard input file. As for UNIX, the default standard input is the keyboard.
   --
   -- Note: only one instance of this class should be necessary.  Access it through ANY.std_input.
   --
   -- See also STANDARD_STREAMS, STD_INPUT_OUTPUT
   --

inherit
   TERMINAL_INPUT_STREAM
      redefine
         filtered_read_line_in, dispose
      end

insert
   STRING_HANDLER
   REDIRECTION_TOOLS
      rename
         restore_default as restore_default_input
      redefine
         restore_default_input
      end

create {ANY}
   make

feature {ANY}
   is_connected: BOOLEAN True

   end_of_input: BOOLEAN

   disconnect
      do
         filter := Void
      end

feature {}
   make
      do
         buffer := buffer.calloc(4096)
         capacity := 4096
      end

feature {ANY}
   can_unread_character: BOOLEAN
      do
         Result := not unread_character_flag
      end

feature {FILTER_INPUT_STREAM}
   filtered_read_character
      do
         std_output.flush
         unread_character_flag := False
         if buffer_position >= buffer_size then
            fill_buffer
         end
         filtered_last_character := buffer.item(buffer_position)
         buffer_position := buffer_position + 1
         end_of_input := end_reached
      end

   filtered_unread_character
      do
         unread_character_flag := True
         end_of_input := False
         buffer_position := buffer_position - 1
      end

   filtered_last_character: CHARACTER

   filtered_read_line_in (str: STRING)
      local
         i: INTEGER; stop: BOOLEAN; old_count, new_count: INTEGER; initial_count: INTEGER
      do
         std_output.flush
         from
            initial_count := str.count
         until
            stop
         loop
            -- search %N in buffer
            from
               i := buffer_position
            until
               i >= buffer_size or else buffer.item(i) = '%N'
            loop
               i := i + 1
            end
            -- block copy (but copy_slice copies char by char...)
            if i > buffer_position then
               old_count := str.count
               new_count := old_count + i - buffer_position
               if str.capacity < new_count then
                  str.resize((old_count * 2).max(new_count))
               end
               str.storage.slice_copy(old_count, buffer, buffer_position, i - 1)
               str.set_count(new_count)
            end
            -- next buffer if needed
            if i < buffer_size and then buffer.item(i) = '%N' then
               stop := True
               buffer_position := i + 1
               if str.count > initial_count and then str.last = '%R' then
                  str.remove_last
                  -- UNIX uses the Line Feed character (ASCII character 10) to
                  -- denote the end of a line. DOS uses the Carriage Return
                  -- followed by the Line Feed character (ASCII character 13
                  -- & ASCII character 10) instead.
               end
            else
               if not end_reached then
                  fill_buffer
               end
               stop := end_reached
            end
         end
         unread_character_flag := False
         end_of_input := end_reached
      end

feature {}
   buffer: NATIVE_ARRAY[CHARACTER]

   end_reached: BOOLEAN

   buffer_position, buffer_size: INTEGER

   capacity: INTEGER

   unread_character_flag: BOOLEAN

   fill_buffer
      local
         last: CHARACTER
      do
         if buffer_size > 0 then
            last := buffer.item(buffer_size - 1)
         end
         buffer_size := read_stdin(buffer, 4096)
         buffer_position := 0
         if buffer_size <= 0 then
            end_reached := True
            buffer.put(last, 0)
            -- needed for unread_character service
            --if buffer_size = -1 => exception ?
            buffer_size := 1
            buffer_position := 1
         end
      end

feature {FILTER}
   filtered_descriptor: INTEGER
      do
         Result := sequencer_descriptor(stdin)
      end

   filtered_has_descriptor: BOOLEAN True

   filtered_stream_pointer: POINTER
      do
         Result := stdin
      end

   filtered_has_stream_pointer: BOOLEAN True

feature {STREAM_HANDLER}
   redirect_from (file_name: STRING)
         -- Redirect standard input to come from `file_name' instead of the default standard input.
         --
         -- See also `redirection_succeeded'
      do
         redirect(open_descriptor_for_read(file_name.to_external))
      end

   restore_default_input
         -- Restore standard input to come from the default standard input.
      do
         Precursor
      end

feature {}
   flush
         -- Discard any characters remaining in the input buffer.
      do
         buffer_position := buffer_size
      end

   read_stdin (buf: NATIVE_ARRAY[CHARACTER]; size: INTEGER): INTEGER
         -- return size read or 0 if end of input (-1 on error => exception ?)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "read_stdin"
         }"
      end

   stdin: POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "stdin"
         }"
      end

   dispose
      do
         check
            std_input = Current
         end
         -- Nothing to dispose for `std_input'.
      end

end -- class STD_INPUT
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
