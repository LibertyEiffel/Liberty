-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class DIRECTORY_NOTATION

feature {ANY}
   is_current_directory (path: STRING): BOOLEAN
      deferred
      end

   is_parent_directory (path: STRING): BOOLEAN
      deferred
      end

   to_parent_directory (some_path: STRING)
         -- Tries to compute in `some_path' (which may be either a
         -- file path or a directory path) the parent directory of
         -- `some_path'. When `some_path' is a path with no parent
         -- directory, `some_path' `is_empty' after this call. This
         -- operation does not perform any disk access.
      require
         is_valid_path(some_path)
      deferred
      end

   to_subdirectory_with (parent_path, entry_name: STRING)
         -- Try to compute in `parent_path' the new subdirectory path
         -- obtained when trying to concatenate smartly `parent_path'
         -- with some `entry_name'. When this fails, `parent_path'
         -- `is_empty' after this call. This operation does not
         -- perform any disk access.
      require
         is_valid_path(parent_path)
         is_valid_path(entry_name)
      deferred
      ensure
         entry_name.is_equal(old entry_name.twin)
      end

   to_file_path_with (parent_path, file_name: STRING)
         -- Try to compute in `parent_path' the new file path obtained
         -- when trying to concatenate smartly `parent_path' with
         -- some `file_name'. When this fails, `parent_path'
         -- `is_empty' after this call. This operation does not
         -- perform any disk access.
      require
         is_valid_path(parent_path)
         is_valid_file_name(file_name)
      deferred
      ensure
         file_name.is_equal(old file_name.twin)
      end

   to_subpath_with (parent_path, subpath: STRING)
         -- Try to compute in `parent_path' the new file path obtained
         -- when trying to concatenate smartly `parent_path' with
         -- some `subpath'. When this fails, `parent_path'
         -- `is_empty' after this call. This operation does not
         -- perform any disk access.
      require
         is_valid_directory_path(parent_path)
         is_valid_path(subpath)
         not is_absolute_path(subpath)
      deferred
      ensure
         parent_path.is_empty or else is_valid_path(parent_path)
         parent_path.is_empty or else is_valid_directory_path(parent_path) = old is_valid_directory_path(subpath)
         parent_path.is_empty or else is_absolute_path(parent_path) = old is_absolute_path(parent_path)
      end

   frozen to_absolute_path_in (possible_parent, path: STRING)
         -- If `path' is not absolute, make it so by appending it to
         -- `possible_parent'. Else, overwrite `possible_parent' with
         -- path.
      require
         is_valid_directory_path(possible_parent)
         is_absolute_path(possible_parent)
         is_valid_path(path)
      do
         if not is_absolute_path(path) then
            to_subpath_with(possible_parent, path)
         else
            possible_parent.copy(path)
         end
      ensure
         is_absolute_path(possible_parent)
      end

   to_short_name_in (buffer, path: STRING)
      require
         is_valid_path(path)
         buffer /= Void
      deferred
      end

feature {ANY}
   frozen from_notation (source_notation: DIRECTORY_NOTATION; path: STRING)
         -- Convert `path' from `source_notation' to `Current'
         -- notation. If this fails, then `path' `is_empty' after this
         -- call.
      require
         source_notation.is_valid_path(path)
      local
         tmp: STRING
      do
         tmp := source_notation.to_notation(path, Current)
         if path /= tmp then
            path.copy(tmp)
         end
      ensure
         path.is_empty or else is_valid_path(path)
      end

   can_sanitize (name: STRING): BOOLEAN
      do
         -- Default is to have no sanitizing
      end

   to_valid_file_name (name: STRING)
         -- Sanitize `name' (by removing forbidden characters or
         -- encoding them)
      require
         name /= Void
         not is_valid_file_name(name)
         can_sanitize(name)
      do
         check
            False
         end
      ensure
         is_valid_file_name(name)
      end

   to_directory_path (path: STRING)
         -- Make sure that the given path is a canonical directory
         -- path as would be returned by `to_subdirectory_with'
      require
         path /= Void
         is_valid_path(path)
      deferred
      ensure
         is_valid_directory_path(path)
      end

   can_map_drive (source_notation: DIRECTORY_NOTATION; drive: STRING): BOOLEAN
      deferred
      end

   to_root (source_notation: DIRECTORY_NOTATION; drive: STRING)
         -- Convert `drive' from a drive letter/device name in
         -- `source_notation' to an absolute path in `Current'
         -- notation.
      require
         can_map_drive(source_notation, drive)
      deferred
      ensure
         is_valid_path(drive)
         is_absolute_path(drive)
      end

   to_default_root (directory: STRING)
      deferred
      ensure
         is_valid_path(directory)
         is_absolute_path(directory)
      end

   to_current_directory (directory: STRING)
         -- Put the relative directory representing the current
         -- working directory into directory. Not to be confused with
         -- the absolute path of the current working directory at a
         -- given time. This operation does not perform any disk
         -- access.
      require
         directory /= Void
      deferred
      ensure
         is_valid_path(directory)
         not is_absolute_path(directory)
      end

feature {ANY}
   is_case_sensitive: BOOLEAN
      deferred
      end

   is_valid_path (path: STRING): BOOLEAN
         -- Does `path' represent a syntactically valid file or
         -- directory path? The result does not imply that there
         -- actually a file or directory with that name. This
         -- operation does not perform any disk access.
      deferred
      ensure
         path.is_equal(old path.twin)
         Result implies not path.is_empty
      end

   is_valid_directory_path (path: STRING): BOOLEAN
         -- Does `path' represent a syntactically valid directory
         -- path? For many Systems, there may be no syntactical
         -- difference between file paths and directory paths, in
         -- that case there is no difference between
         -- `is_valid_directory_path' and `is_valid_path'.
      deferred
      ensure
         path.is_equal(old path.twin)
         Result implies is_valid_path(path)
      end

   is_valid_file_name (name: STRING): BOOLEAN
         -- Does `path' only contain valid characters for a file? The
         -- result does not imply that there is actually a file or
         -- directory with that name. Not the same as `is_valid_path':
         -- path separators (/ for unix, \ for windows, ...) are
         -- allowed in paths, but not in file names. This operation
         -- does not perform any disk access.
      deferred
      ensure
         name.is_equal(old name.twin)
         Result implies not name.is_empty
      end

   is_absolute_path (path: STRING): BOOLEAN
         -- Is `path' absolute, i.e. is its meaning independent of
         -- current drive and working directory ? This operation does
         -- not perform any disk access.
      require
         is_valid_path(path)
      deferred
      ensure
         path.is_equal(old path.twin)
      end

feature {DIRECTORY_NOTATION}
   to_notation (path: STRING; destination_notation: DIRECTORY_NOTATION): STRING
      require
         is_valid_path(path)
         destination_notation /= Void
      deferred
      ensure
         path.is_equal(old path.twin)
         Result.is_empty or else destination_notation.is_valid_path(Result)
      end

end -- class DIRECTORY_NOTATION
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
