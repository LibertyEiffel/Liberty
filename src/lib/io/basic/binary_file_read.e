-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class BINARY_FILE_READ
   -- This class allow to read a file on the disk as a binary file
   -- (ie. file containing bytes). If you need to read a file which
   -- contain text, then consider using TEXT_FILE_READ.

inherit
   BINARY_INPUT_STREAM
   TERMINAL_INPUT_STREAM
   FILE_STREAM

insert
   PLATFORM

create {ANY}
   make, with_buffer_size, connect_to

feature {ANY}
   connect_to (new_path: ABSTRACT_STRING) is
         -- Open binary file for reading.
         -- The stream is positioned at the beginning of the file.
         --
         -- See also `make', `with_buffer_size'.
      do
         filtered_stream_pointer := binary_file_read_open(new_path.to_external)
         if filtered_stream_pointer.is_not_null then
            set_path(new_path)
            end_of_input := False
            if capacity = 0 then
               buffer := buffer.calloc(4096)
               capacity := 4096
            end
            buffer_position := 0
            buffer_size := 0
         end
      ensure then
         is_connected implies not end_of_input
      end

   disconnect is
      do
         io_fclose(filtered_stream_pointer)
         path := Void
      end

   can_unread_character: BOOLEAN is
      do
         Result := buffer_position > 0
      end

   read_byte is
      do
         filtered_read_character
      end

   last_byte: INTEGER is
      do
         Result := filtered_last_character.code
      ensure
         Result.in_range(Minimum_character_code, Maximum_character_code)
      end

   read_integer_16_native_endian is
      local
         c1, c2: CHARACTER
      do
         if buffer_position >= buffer_size then
            fill_buffer
         end
         c1 := buffer.item(buffer_position)
         buffer_position := buffer_position + 1
         if buffer_position >= buffer_size and then not end_of_input then
            fill_buffer
         end
         c2 := buffer.item(buffer_position)
         buffer_position := buffer_position + 1
         last_integer_16 := as_16_ne(c1, c2)
      end

   read_integer_16_big_endian is
      do
         if buffer_position >= buffer_size then
            fill_buffer
         end
         last_integer_16 := buffer.item(buffer_position).code |<< 8
         buffer_position := buffer_position + 1
         if buffer_position >= buffer_size and then not end_of_input then
            fill_buffer
         end
         last_integer_16 := last_integer_16 | buffer.item(buffer_position).code
         buffer_position := buffer_position + 1
      end

   read_integer_16_little_endian is
      do
         if buffer_position >= buffer_size then
            fill_buffer
         end
         last_integer_16 := buffer.item(buffer_position).code
         buffer_position := buffer_position + 1
         if buffer_position >= buffer_size and then not end_of_input then
            fill_buffer
         end
         last_integer_16 := last_integer_16 | (buffer.item(buffer_position).code |<< 8)
         buffer_position := buffer_position + 1
      end

   last_integer_16: INTEGER

   read_integer_32_native_endian is
      local
         old_integer_16, i1, i2: INTEGER
      do
         old_integer_16 := last_integer_16
         read_integer_16_native_endian
         i1 := last_integer_16
         read_integer_16_native_endian
         i2 := last_integer_16
         last_integer_32 := as_32_ne(i1.to_integer_16, i2.to_integer_16)
         last_integer_16 := old_integer_16
      end

   read_integer_32_big_endian is
      do
         if buffer_position >= buffer_size then
            fill_buffer
         end
         last_integer_32 := buffer.item(buffer_position).code.to_integer_32 |<< 24
         buffer_position := buffer_position + 1
         if buffer_position >= buffer_size and then not end_of_input then
            fill_buffer
         end
         last_integer_32 := last_integer_32 | (buffer.item(buffer_position).code.to_integer_32 |<< 16)
         buffer_position := buffer_position + 1
         if buffer_position >= buffer_size and then not end_of_input then
            fill_buffer
         end
         last_integer_32 := last_integer_32 | (buffer.item(buffer_position).code |<< 8)
         buffer_position := buffer_position + 1
         if buffer_position >= buffer_size and then not end_of_input then
            fill_buffer
         end
         last_integer_32 := last_integer_32 | buffer.item(buffer_position).code
         buffer_position := buffer_position + 1
      end

   read_integer_32_little_endian is
      do
         if buffer_position >= buffer_size then
            fill_buffer
         end
         last_integer_32 := buffer.item(buffer_position).code
         buffer_position := buffer_position + 1
         if buffer_position >= buffer_size and then not end_of_input then
            fill_buffer
         end
         last_integer_32 := last_integer_32 | (buffer.item(buffer_position).code |<< 8)
         buffer_position := buffer_position + 1
         if buffer_position >= buffer_size and then not end_of_input then
            fill_buffer
         end
         last_integer_32 := last_integer_32 | (buffer.item(buffer_position).code.to_integer_32 |<< 16)
         buffer_position := buffer_position + 1
         if buffer_position >= buffer_size and then not end_of_input then
            fill_buffer
         end
         last_integer_32 := last_integer_32 | (buffer.item(buffer_position).code.to_integer_32 |<< 24)
         buffer_position := buffer_position + 1
      end

   last_integer_32: INTEGER_32

   end_of_input: BOOLEAN

   seek (new_offset: INTEGER_64) is
         -- Next read will start at position `new_offset', counted from
         -- the begining of the file.
         --
         -- See also `offset'.
      require
         new_offset >= 0
         not is_filtered
      local
         error: INTEGER
      do
         error := io_fseek (filtered_stream_pointer, new_offset)
         buffer_position := 0
         buffer_size := 0
      ensure
         offset = new_offset
      end

   offset: INTEGER_64 is
         -- The `offset' that will be used for the next read.
         --
         -- See also `seek'.
      require
         not is_filtered
      do
         Result := io_ftell (filtered_stream_pointer) - buffer_size + buffer_position
      end

feature {FILTER}
   filtered_descriptor: INTEGER is
      do
         Result := sequencer_descriptor(filtered_stream_pointer)
      end

   filtered_has_descriptor: BOOLEAN is True

   filtered_stream_pointer: POINTER

   filtered_has_stream_pointer: BOOLEAN is True

feature {FILTER_INPUT_STREAM}
   filtered_read_character is
      do
         if buffer_position >= buffer_size then
            fill_buffer
         end
         filtered_last_character := buffer.item(buffer_position)
         buffer_position := buffer_position + 1
      end

   filtered_unread_character is
      do
         end_of_input := False
         buffer_position := buffer_position - 1
         filtered_last_character := buffer.item(buffer_position)
      end

   filtered_last_character: CHARACTER

feature {}
   buffer: NATIVE_ARRAY[CHARACTER]

   buffer_position, buffer_size: INTEGER

   capacity: INTEGER

   fill_buffer is
      do
         buffer_size := io_fread(buffer, capacity, filtered_stream_pointer)
         buffer_position := 0
         if buffer_size <= 0 then
            end_of_input := True --if buffer_size = -1 => exception ?
            buffer_size := 1
            buffer_position := 1
         end
      end

   make is
         -- The new created object is not connected. (See also `connect_to'.)
      do
      ensure
         not is_connected
      end

   with_buffer_size(buffer_capacity: INTEGER) is
      do
         buffer := buffer.calloc(buffer_capacity)
         capacity := buffer_capacity
      end

   binary_file_read_open (path_pointer: POINTER): POINTER is
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "binary_file_read_open"
         }"
      end

   io_fclose (stream: POINTER) is
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "io_fclose"
         }"
      end

   io_fseek (path_pointer: POINTER; new_offset: INTEGER_64): INTEGER_32 is
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "io_fseek"
         }"
      ensure
         Result = 0 -- failure otherwise
      end

   io_ftell (path_pointer: POINTER): INTEGER_64 is
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "io_ftell"
         }"
      ensure
         Result >= 0 -- failure otherwise
      end

   as_16_ne (c1, c2: CHARACTER): INTEGER_16 is
      external "built_in"
      end

   as_32_ne (i1, i2: INTEGER_16): INTEGER_32 is
      external "built_in"
      end

end -- class BINARY_FILE_READ
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
