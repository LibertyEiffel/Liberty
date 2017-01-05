-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class FILE_STREAM
   --
   -- Common parent class to all the file-related streams. Provides a common
   -- connection interface to the "real" files of the operating system.
   --

inherit
   STREAM

feature {ANY}
   path: STRING
         -- Not Void when connected to the corresponding file on the disk.

   is_connected: BOOLEAN
         -- Is this file connected to some file of the operating system?
      do
         Result := path /= Void
      ensure
         definition: Result = (path /= Void)
      end

   connect_to (new_path: ABSTRACT_STRING)
         -- Try to connect to an existing file of the operating system.
      require
         not is_connected
         not_malformed_path: not new_path.is_empty
      deferred
      ensure
         is_connected implies path.same_as(new_path.out)
      end

feature {}
   set_path (new_path: ABSTRACT_STRING)
      do
         if path = Void then
            path := new_path.out
         else
            lock_tagged_out
            tagged_out_memory.clear_count
            new_path.out_in_tagged_out_memory
            path.copy(tagged_out_memory)
            unlock_tagged_out
         end
      ensure
         path.same_as(new_path.out)
      end

invariant
   is_connected implies path /= Void

end -- class FILE_STREAM
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
