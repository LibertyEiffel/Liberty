-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class UNIX_DIRECTORY_NOTATION
   -- The Unix like file path notation looks like:
   --   /LibertyEiffel/sys/system.se

inherit
   PATH_NAME_NOTATION

feature {ANY}
   is_current_directory (path: STRING): BOOLEAN
      do
         if path.compare(once ".") = 0 or else path.compare(once "./") = 0 then
            Result := True
         elseif path.is_empty then
         elseif path.first /= '/' then
            Result := path.occurrences('.') + path.occurrences('/') = path.count and not path.has_substring(once "..")
         end
      end

   is_parent_directory (path: STRING): BOOLEAN
      local
         pos: INTEGER
      do
         if path.compare(once "..") = 0 or else path.compare(once "../") = 0 then
            Result := True
         elseif path.is_empty then
         elseif path.first /= '/' then
            Result := path.occurrences('.') + path.occurrences('/') = path.count and path.has_substring(once "..")
            if Result then
               pos := path.first_substring_index(once "..")
               Result := Result and path.substring_index(once "..", pos + 2) = 0
            end
         end
      end

   to_directory_path (path: STRING)
      do
         path.extend_unless('/')
      end

feature {ANY}
   is_case_sensitive: BOOLEAN True

feature {}
   tmp1: POSIX_PATH_NAME
      once
         create Result.make_empty
      end

   tmp2: POSIX_PATH_NAME
      once
         create Result.make_empty
      end

end -- class UNIX_DIRECTORY_NOTATION
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
