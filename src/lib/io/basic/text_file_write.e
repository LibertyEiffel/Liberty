-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class TEXT_FILE_WRITE
   --
   -- Basic output facilities to write a named file on the disk.
   --
   -- Note: most features are common with STD_OUTPUT so you can test your
   --       program first on the screen and then, changing of instance
   --       (STD_OUTPUT/TEXT_FILE_WRITE), doing the same on a file.
   --

inherit
   FILE_STREAM
      redefine out_in_tagged_out_memory
      end
   TERMINAL_OUTPUT_STREAM
      redefine out_in_tagged_out_memory
      end

create {ANY}
   make, connect_to, connect_for_appending_to

feature {ANY}
   flushed_character_count: INTEGER_64
         -- Note that '%N' is counted as one character even if two
         -- bytes are written in the file.

   character_count: INTEGER_64
         -- See also `flushed_character_count'
         -- Note that '%N' is counted as one character even if two
         -- bytes are written in the file.
      require
         is_connected
      do
         Result := flushed_character_count + buffer_position
      end

   connect_to (new_path: ABSTRACT_STRING)
         -- Truncate file to zero length or create text file for writing.
         -- The stream is positioned at the beginning of the file.
      local
         p: POINTER
      do
         p := new_path.to_external
         output_stream := text_file_write_open(p)
         if output_stream.is_not_null then
            set_path(new_path)
            if capacity = 0 then
               buffer := buffer.calloc(4096)
               capacity := 4096
            end
         end
      ensure then
         is_connected implies character_count = 0
      end

   connect_for_appending_to (new_path: ABSTRACT_STRING)
         -- Open for writing. The file is created if it does not exist.
         -- The stream is positioned at the end of the file.
      require
         not is_connected
         not new_path.is_empty
      local
         p: POINTER
      do
         p := new_path.to_external
         output_stream := text_file_write_append(p)
         if output_stream.is_not_null then
            set_path(new_path)
            if capacity = 0 then
               buffer := buffer.calloc(4096)
               capacity := 4096
            end
         end
      ensure
         is_connected implies character_count = 0
      end

   disconnect
      do
         if buffer_position > 0 then
            write_buffer
         end
         io_fclose(output_stream)
         path := Void
         filter := Void
         flushed_character_count := 0
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "{TEXT_FILE_WRITE ")
         tagged_out_memory.append(path)
         tagged_out_memory.extend('}')
      end

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      do
         if buffer_position >= 4096 then
            write_buffer
         end
         buffer.put(c, buffer_position)
         buffer_position := buffer_position + 1
      end

   filtered_flush
      do
         if buffer_position > 0 then
            write_buffer
         end
         io_flush(output_stream)
      ensure
         flushed_character_count = character_count
      end

feature {FILTER}
   filtered_descriptor: INTEGER
      do
         Result := sequencer_descriptor(output_stream)
      end

   filtered_has_descriptor: BOOLEAN True

   filtered_stream_pointer: POINTER
      do
         Result := output_stream
      end

   filtered_has_stream_pointer: BOOLEAN True

feature {}
   buffer: NATIVE_ARRAY[CHARACTER]

   buffer_position: INTEGER

   capacity: INTEGER

   output_stream: POINTER

   make
         -- The new created object is not connected. (See also `connect_to' and
         -- `connect_for_appending_to'.)
      do
         buffer := buffer.calloc(4096)
         capacity := 4096
      ensure
         not is_connected
      end

   write_buffer
      local
         unused_result: INTEGER
      do
         if buffer_position > 0 then
            unused_result := io_fwrite(buffer, buffer_position, output_stream)
            flushed_character_count := flushed_character_count + buffer_position
            buffer_position := 0
         end
      end

   text_file_write_open (path_pointer: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "text_file_write_open"
         }"
      end

   text_file_write_append (path_pointer: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "text_file_write_append"
         }"
      end

   io_fclose (stream: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "io_fclose"
         }"
      end

end -- class TEXT_FILE_WRITE
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
