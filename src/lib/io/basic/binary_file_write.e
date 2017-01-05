-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class BINARY_FILE_WRITE
   -- This class allow to write a file on the disk as a binary file
   -- (ie. file containing bytes). If you need to write text in a file,
   -- then consider using TEXT_FILE_WRITE.

inherit
   DISPOSABLE
   BINARY_OUTPUT_STREAM
      redefine
         dispose
      end
   TERMINAL_OUTPUT_STREAM
      redefine
         dispose
      end
   FILE_STREAM
      redefine
         dispose
      end

create {ANY}
   make, connect_to, connect_for_appending_to

feature {ANY}
   connect_to (new_path: ABSTRACT_STRING)
         -- Truncate file to zero length or create binary file for writing.
         -- The stream is positioned at the beginning of the file.
      local
         p: POINTER
      do
         p := new_path.to_external
         output_stream := binary_file_write_open(p)
         if output_stream.is_not_null then
            set_path(new_path)
            if capacity = 0 then
               buffer := buffer.calloc(4096)
               capacity := 4096
            end
            if the_terminal_settings /= Void then
               the_terminal_settings.make(output_stream, Current)
            end
         end
      end

   connect_for_appending_to (new_path: STRING)
         -- Truncate file to zero length or create binary file for writing.
         -- The stream is positioned at the beginning of the file.
      require
         not is_connected
         not new_path.is_empty
      local
         p: POINTER
      do
         p := new_path.to_external
         output_stream := binary_file_write_append(p)
         if output_stream.is_not_null then
            path := new_path
            if capacity = 0 then
               buffer := buffer.calloc(4096)
               capacity := 4096
            end
            if the_terminal_settings /= Void then
               the_terminal_settings.make(output_stream, Current)
            end
         end
      end

   disconnect
      do
         if buffer_position > 0 then
            write_buffer
         end
         fclose(output_stream)
         path := Void
      end

   put_byte (byte: INTEGER)
      do
         if buffer_position >= 4096 then
            write_buffer
         end
         buffer.put(byte.to_character, buffer_position)
         buffer_position := buffer_position + 1
      end

   put_integer_16_native_endian (i: INTEGER_16)
         -- Write in the same order as the machine running this code.
         -- The result is machine dependant.
      do
         if buffer_position >= 4095 or else buffer_position.is_odd then
            write_buffer
         end
         put_16_ne(buffer, i, buffer_position)
         buffer_position := buffer_position + 2
      end

   put_integer_16_big_endian (i: INTEGER_16)
         -- Write `i' in big endian mode.
         -- The result is machine independent.
      do
         if buffer_position >= 4095 or else buffer_position.is_odd then
            write_buffer
         end
         put_16_be(buffer, i, buffer_position)
         buffer_position := buffer_position + 2
      end

   put_integer_16_little_endian (i: INTEGER_16)
         -- Write `i' in little endian mode.
         -- The result is machine independent.
      do
         if buffer_position >= 4095 or else buffer_position.is_odd then
            write_buffer
         end
         put_16_le(buffer, i, buffer_position)
         buffer_position := buffer_position + 2
      end

   put_integer_32_native_endian (i: INTEGER_32)
         -- Write in the same order as the machine running this code.
         -- The result is machine dependant.
      do
         if buffer_position >= 4095 or else buffer_position.is_odd then
            write_buffer
         end
         put_32_ne(buffer, i, buffer_position)
         buffer_position := buffer_position + 4
      end

   put_integer_32_big_endian (i: INTEGER_32)
         -- Write `i' in big endian mode.
         -- The result is machine independent.
      do
         if buffer_position >= 4095 or else buffer_position.is_odd then
            write_buffer
         end
         put_32_be(buffer, i, buffer_position)
         buffer_position := buffer_position + 4
      end

   put_integer_32_little_endian (i: INTEGER_32)
         -- Write `i' in little endian mode.
         -- The result is machine independent.
      do
         if buffer_position >= 4095 or else buffer_position.is_odd then
            write_buffer
         end
         put_32_le(buffer, i, buffer_position)
         buffer_position := buffer_position + 4
      end

   terminal_settings: TERMINAL_SETTINGS
      do
         if the_terminal_settings = Void then
            create the_terminal_settings.make(filtered_stream_pointer, Current)
         end
         Result := the_terminal_settings
      ensure
         valid: Result /= Void
         associated: Result.associated_stream = Current
      end

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      do
         put_byte(c.code)
      end

   filtered_flush
         -- forces a write of unwritten character (write my have been
         -- delayed, flush writes buffered characters)
      do
         if buffer_position > 0 then
            write_buffer
         end
         io_flush(output_stream)
      end

feature {FILTER}
   filtered_descriptor: INTEGER 0
   filtered_has_descriptor: BOOLEAN False

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
   the_terminal_settings: TERMINAL_SETTINGS

   make
         -- The new created object is not connected. (See also `connect_to' and
         -- `connect_for_appending_to'.)
      do
         buffer := buffer.calloc(4096)
         capacity := 4096
      ensure
         not is_connected
      end

   dispose
      require
         disconnect_file_after_use: not is_connected
      do
      end

   write_buffer
      local
         unused_result: INTEGER
      do
         if buffer_position > 0 then
            unused_result := io_fwrite(buffer, buffer_position, output_stream)
            buffer_position := 0
         end
      end

feature {} -- built-ins
   put_16_ne (a_buf: NATIVE_ARRAY[CHARACTER]; i: INTEGER_16; ch_pos: INTEGER)
      external "built_in"
      end

   put_16_le (a_buf: NATIVE_ARRAY[CHARACTER]; i: INTEGER_16; ch_pos: INTEGER)
      external "built_in"
      end

   put_16_be (a_buf: NATIVE_ARRAY[CHARACTER]; i: INTEGER_16; ch_pos: INTEGER)
      external "built_in"
      end

   put_32_ne (a_buf: NATIVE_ARRAY[CHARACTER]; i: INTEGER_32; ch_pos: INTEGER)
      external "built_in"
      end

   put_32_le (a_buf: NATIVE_ARRAY[CHARACTER]; i: INTEGER_32; ch_pos: INTEGER)
      external "built_in"
      end

   put_32_be (a_buf: NATIVE_ARRAY[CHARACTER]; an_i: INTEGER_32; ch_pos: INTEGER)
      external "built_in"
      end

   binary_file_write_open (a_path_pointer: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "binary_file_write_open"
         }"
      end

   binary_file_write_append (a_path_pointer: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "binary_file_write_append"
         }"
      end

   fclose (a_stream_pointer: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "io_fclose"
         }"
      end

end -- class BINARY_FILE_WRITE
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
