-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class FILE

feature {ANY}
   name: FIXED_STRING
         -- The short name of the file.
      deferred
      end

   path: FIXED_STRING
         -- The file path.
      deferred
      end

   frozen parent: DIRECTORY
      local
         parent_path: STRING
      do
         Result := parent_memory
         if Result = Void then
            basic_directory.compute_parent_directory_of(path)
            if not basic_directory.last_entry.is_empty then
               parent_path := once ""
               parent_path.copy(basic_directory.last_entry)
               create Result.scan(parent_path)
               Result.set_file(name, Current)
               parent_memory := Result
            end
         end
      end

   is_directory: BOOLEAN
      deferred
      end

   is_regular: BOOLEAN
      deferred
      end

   as_directory: DIRECTORY
      require
         is_directory
      deferred
      ensure
         Result = Current
      end

   as_regular: REGULAR_FILE
      require
         is_regular
      deferred
      ensure
         Result = Current
      end

   exists: BOOLEAN
      deferred
      end

feature {DIRECTORY}
   set_parent (a_parent: like parent)
      do
      ensure
         parent = a_parent
      end

feature {}
   parent_memory: DIRECTORY

   basic_directory: BASIC_DIRECTORY
         -- Provide low level access to directories.

invariant
   name /= Void
   path /= Void

end -- class FILE
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
