-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class TEXT_FILE_READ_WRITE
   -- This class allows to read and write a named file on the disk.
   -- Note that opening a file in READ and WRITE mode is not a very
   -- common case and may lead to performance decrease compared to
   -- TEXT_FILE_READ and TEXT_FILE_WRITE performance. Such a file
   -- is both an INPUT_STREAM and an OUTPUT_STREAM.

inherit
   FILE_STREAM
      redefine out_in_tagged_out_memory
      end
   TERMINAL_INPUT_OUTPUT_STREAM
      redefine filtered_read_line_in, out_in_tagged_out_memory
      end

insert
   STRING_HANDLER
      redefine out_in_tagged_out_memory
      end

create {ANY}
   make, connect_to, connect_for_appending_to

feature {ANY}
   connect_to (new_path: ABSTRACT_STRING)
         -- Open for reading and writing. The stream is positioned at the
         -- beginning of the file.
      local
         s: POINTER; tfw: TEXT_FILE_WRITE; exists: BOOLEAN
      do
         if (create {FILE_TOOLS}).is_readable(new_path) then
            exists := True
         else
            create tfw.connect_to(new_path)
            if tfw.is_connected then
               tfw.disconnect
               exists := True
            end
         end
         if exists then
            check
               (create {FILE_TOOLS}).is_readable(new_path)
            end
            s := text_file_read_write_open(new_path.to_external)
            if s.is_not_null then
               stream := s
               set_path(new_path)
            end
         end
      end

   connect_for_appending_to (new_path: ABSTRACT_STRING)
         -- Open for reading and writing. The file is created if it does not
         -- exist. The stream is positioned at the end of the file.
      local
         s: POINTER; tfw: TEXT_FILE_WRITE; exists: BOOLEAN
      do
         if (create {FILE_TOOLS}).is_readable(new_path) then
            exists := True
         else
            create tfw.connect_to(new_path)
            if tfw.is_connected then
               tfw.disconnect
               exists := True
            end
         end
         if exists then
            check
               (create {FILE_TOOLS}).is_readable(new_path)
            end
            s := text_file_read_write_append(new_path.to_external)
            if s.is_not_null then
               stream := s
               set_path(new_path)
            end
         end
      end

   disconnect
      do
         io_fclose(stream)
         path := Void
      end

   can_unread_character: BOOLEAN
      do
         Result := not unread_character_flag
      end

   end_of_input: BOOLEAN
      do
         io_flush(stream)
         Result := io_feof(stream)
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "{TEXT_FILE_READ_WRITE ")
         tagged_out_memory.append(path)
         tagged_out_memory.extend('}')
      end

feature {FILTER_INPUT_STREAM}
   filtered_last_character: CHARACTER

   filtered_read_character
      local
         c: INTEGER
      do
         io_flush(stream)
         c := io_getc(stream)
         if c >= 0 then
            filtered_last_character := c.to_character
         end
         unread_character_flag := False
      end

   filtered_unread_character
      local
         p: POINTER; c: CHARACTER
      do
         p := stream
         c := last_character
         io_ungetc(c, p)
         unread_character_flag := True
      end

   filtered_read_line_in (str: STRING)
      do
         from
            read_character
         until
            end_of_input or else last_character = '%N'
         loop
            str.extend(last_character)
            read_character
         end
      end

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      do
         io_flush(stream)
         io_putc(c, stream)
      end

   filtered_flush
      do
         io_flush(stream)
      end

feature {FILTER}
   filtered_descriptor: INTEGER
      do
         Result := sequencer_descriptor(stream)
      end

   filtered_has_descriptor: BOOLEAN True

   filtered_stream_pointer: POINTER
      do
         Result := stream
      end

   filtered_has_stream_pointer: BOOLEAN True

feature {}
   unread_character_flag: BOOLEAN

   stream: POINTER

   make
         -- The new created object is not connected. (See also `connect_to' and
         -- `connect_for_appending_to'.)
      do
      ensure
         not is_connected
      end

   text_file_read_write_open (a_path_pointer: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "text_file_read_write_open"
         }"
      end

   text_file_read_write_append (a_path_pointer: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "text_file_read_write_append"
         }"
      end

   io_fclose (a_stream_pointer: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "io_fclose"
         }"
      end

   io_feof (a_stream_pointer: POINTER): BOOLEAN
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "io_feof"
         }"
      end

end -- class TEXT_FILE_READ_WRITE
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
