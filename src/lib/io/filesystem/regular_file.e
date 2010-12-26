-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class REGULAR_FILE

inherit
   FILE

creation {ANY}
   make

feature {ANY}
   name: FIXED_STRING
   path: FIXED_STRING

   is_directory: BOOLEAN is False
   is_regular: BOOLEAN is True

   as_directory: DIRECTORY is
      do
         check False end
      end

   as_regular: REGULAR_FILE is
      do
         Result := Current
      end

   exists: BOOLEAN

feature {ANY} -- Text stream access
   read: INPUT_STREAM is
         -- Returns a stream connected for reading the file. If the read stream is not connected anymore,
         -- connects it again.
         -- Always returns the same object.
      require
         not is_writing
      do
         if read_memory = Void then
            create read_memory.connect_to(path.out)
         elseif not read_memory.is_connected then
            read_memory.connect_to(path.out)
         end
         Result := read_memory
      ensure
         is_reading
      end

   is_reading: BOOLEAN is
      do
         Result := read_memory /= Void and then read_memory.is_connected
      end

   write: OUTPUT_STREAM is
         -- Returns a stream connected for writing to the file. If the write stream is not connected anymore,
         -- connects it again.
         -- Always returns the same object.
      require
         not is_reading
      do
         if write_memory = Void then
            create write_memory.connect_to(path.out)
         elseif not write_memory.is_connected then
            write_memory.connect_to(path.out)
         end
         Result := write_memory
      ensure
         is_writing
      end

   append: OUTPUT_STREAM is
         -- Returns a stream connected for appending to the file. If the write stream is already conencted,
         -- use `write' instead.
         -- Always returns the same object.
      require
         not is_reading
         not is_writing
      do
         if write_memory = Void then
            create write_memory.connect_for_appending_to(path.out)
         else
            write_memory.connect_for_appending_to(path.out)
         end
         Result := write_memory
      ensure
         is_writing
      end

   is_writing: BOOLEAN is
      do
         Result := write_memory /= Void and then write_memory.is_connected
      end

feature {}
   make (a_file_path: ABSTRACT_STRING) is
      do
         path := a_file_path.intern
         basic_directory.compute_short_name_of(path)
         name := basic_directory.last_entry.intern
      end

   read_memory: TEXT_FILE_READ
   write_memory: TEXT_FILE_WRITE

end -- class REGULAR_FILE
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
