-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class PATH_NAME_NOTATION

inherit
   DIRECTORY_NOTATION
   PATH_JOINER
      redefine
         join_directory, join_file
      end

feature {ANY} -- DIRECTORY_NOTATION interface
   to_parent_directory (some_path: STRING)
      do
         --*** PATH_NAME and DIRECTORY_NOTATION differ on corner cases, which is why this implementation is 
         --*** not as straightforward as expected.
         tmp1.make_from_string(some_path)
         if tmp1.is_empty then
            -- Make it even emptier
            tmp1.make_empty
         else
            if tmp1.last.is_empty then
               tmp1.remove_last
            end
            if not tmp1.is_empty then
               tmp1.remove_last
            end
         end
         some_path.copy(tmp1.to_string)
         if not some_path.is_empty then
            to_directory_path(some_path)
         end
      end

   to_subdirectory_with (parent_path, entry_name: STRING)
      local
         ds: STRING
      do
         --*** PATH_NAME and DIRECTORY_NOTATION differ on corner cases, which is why this implementation is 
         --*** not as straightforward as expected.
         tmp1.make_from_string(parent_path)
         if tmp1.is_empty then
            ds := tmp1.drive_specification
            if ds /= Void and then not ds.is_empty then
               tmp2.make_root
               tmp2.join_to(tmp1)
            end
         end
         tmp1.start_join(Void, 0)
         tmp1.join_directory(entry_name)
         tmp1.end_join
         parent_path.copy(tmp1.to_string)
         to_directory_path(parent_path)
      end

   to_file_path_with (parent_path, file_name: STRING)
      local
         ds: STRING
      do
         --*** PATH_NAME and DIRECTORY_NOTATION differ on corner cases, which is why this implementation is 
         --*** not as straightforward as expected.
         tmp1.make_from_string(parent_path)
         if tmp1.is_empty then
            ds := tmp1.drive_specification
            if ds /= Void and then not ds.is_empty then
               tmp2.make_root
               tmp2.join_to(tmp1)
            end
         end
         tmp1.start_join(Void, 0)
         tmp1.join_file(file_name)
         tmp1.end_join
         parent_path.copy(tmp1.to_string)
      end

   to_subpath_with (parent_path, subpath: STRING)
      do
         tmp1.make_from_string(parent_path)
         tmp2.make_from_string(subpath)
         tmp1.join(tmp2)
         parent_path.copy(tmp1.to_string)
      end

   can_map_drive (source_notation: DIRECTORY_NOTATION; drive: STRING): BOOLEAN
      do
         Result := True
      end

   to_root (source_notation: DIRECTORY_NOTATION; drive: STRING)
      do
         -- *** `source_notation' is not taken into account
         tmp1.make_empty
         tmp1.start_join(drive, 1)
         tmp1.end_join
         drive.copy(tmp1.to_string)
      end

   to_default_root (directory: STRING)
      do
         tmp1.make_root
         directory.copy(tmp1.to_string)
      end

   to_current_directory (directory: STRING)
      do
         tmp1.make_current
         directory.copy(tmp1.to_string)
      end

   is_absolute_path (path: STRING): BOOLEAN
      do
         tmp1.make_from_string(path)
         Result := tmp1.is_absolute
      end

   is_valid_path (a_path: STRING): BOOLEAN
      do
         Result := tmp1.is_valid_path(a_path)
      end

   is_valid_directory_path (a_path: STRING): BOOLEAN
      do
         Result := tmp1.is_valid_path(a_path)
         if Result then
            tmp1.make_from_string(a_path)
            Result := tmp1.is_valid_directory
         end
      end

   is_valid_file_name (name: STRING): BOOLEAN
      do
         Result := tmp1.is_valid_file_name(name)
      end

   to_short_name_in (buffer, path: STRING)
      do
         tmp1.make_from_string(path)
         buffer.copy(tmp1.short_name)
      end

feature {DIRECTORY_NOTATION}
   to_notation (path: STRING; destination: DIRECTORY_NOTATION): STRING
      local
         pnn: PATH_NAME_NOTATION
      do
         if pnn ?:= destination then
            pnn ::= destination
            tmp2.make_from_string(path)
            Result := pnn.from_path_name(tmp2)
         else
            destination_notation := destination
            current_path := path
            tmp1.make_from_string(path.twin)
            tmp1.join_to(Current)
            Result := current_path
         end
      end

feature {PATH_JOINER}
   start_join (drive: STRING; absoluteness: INTEGER)
      do
         -- *** some information about absoluteness is lost
         if absoluteness = 0 then
            -- *** `drive' is not taken into account
            destination_notation.to_current_directory(current_path)
         elseif destination_notation.can_map_drive(Current, drive) then
            current_path.copy(drive)
            destination_notation.to_root(Current, current_path)
         else
            destination_notation.to_default_root(current_path)
         end
      end

   join_directory (element: STRING)
      do
         destination_notation.to_subdirectory_with(current_path, element)
      end

   join_up
      do
         -- *** Sometimes, we must actually join ".." or its 
         -- equivalent instead
         destination_notation.to_parent_directory(current_path)
      end

   join_file (element: STRING)
      do
         destination_notation.to_file_path_with(current_path, element)
      end

   join_element (element: STRING)
      do
         destination_notation.to_subpath_with(current_path, element)
      end

   join_extension (an_extension: STRING)
      do
         --*** Not a very good idea
         current_path.extend('.')
         current_path.append(an_extension)
      end

   end_join
      do
      end

   join_error: BOOLEAN False

feature {PATH_NAME_NOTATION}
   from_path_name (other: PATH_NAME): STRING
      require
         other /= tmp1
      do
         tmp1.make_empty
         other.join_to(tmp1)
         Result := tmp1.to_string
      end

feature {}
   tmp1, tmp2: PATH_NAME
      deferred
      ensure
         tmp1 /= tmp2
      end

   current_path: STRING

   destination_notation: DIRECTORY_NOTATION

end -- class PATH_NAME_NOTATION
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
