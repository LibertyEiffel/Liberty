-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class MICROSOFT_PATH_NAME
   -- Operating system path name, Microsoft notation (DOS, Win9x, WinNT)

inherit
   UNIXISH_PATH_NAME
      export {MICROSOFT_PATH_NAME}
         path
      redefine copy, is_equal, is_separator, is_valid_file_name, join_element, end_join
      end

create {ANY}
   make_empty, make_root, make_current, make_from_string

feature {ANY} -- Creation
   make_empty
      do
         if path = Void then
            create path.make_empty
            create to_string_cache.make_empty
         else
            path.clear_count
            to_string_cache.clear_count
         end
         drive := no_drive
         valid_cache := True
      ensure then
         drive = no_drive
      end

   make_root
      do
         make_empty
         path.extend(directory_separator)
         valid_cache := False
      ensure then
         to_string.is_equal(once "\")
      end

   make_current
      do
         make_empty
         path.extend('.')
         valid_cache := False
      ensure then
         to_string.is_equal(once ".")
      end

   make_from_string (s: STRING)
      do
         if s = to_string then
         elseif s = path then
            drive := no_drive
            valid_cache := True
         else
            make_empty
            if s.count >= 2 and then s.item(2) = drive_separator then
               drive := s.first
               path.clear_count
               path.append_substring(s, 3, s.count)
            else
               drive := no_drive
               path.copy(s)
            end
            valid_cache := False
         end
      end

feature {ANY} -- Constants
   up_directory: STRING ".."

   this_directory: STRING "."

   extension_separator: CHARACTER '.'

   directory_separator: CHARACTER '\'

   drive_separator: CHARACTER ':'

feature {ANY} -- Access
   to_string: STRING
      do
         if path = Void then
            -- This special case is needed because of the old expression in make_from_string's postcondition.
            make_empty
         end
         if drive = no_drive then
            Result := path
         elseif valid_cache then
            Result := to_string_cache
         else
            Result := to_string_cache
            Result.clear_count
            Result.extend(drive)
            Result.extend(drive_separator)
            Result.append(path)
            valid_cache := True
         end
      end

   drive_specification: STRING
      do
         Result := "X:"
         Result.clear_count
         if drive /= no_drive then
            Result.extend(drive)
            Result.extend(':')
         end
      ensure then
         Result.count = 0 or Result.count = 2
         drive = '%U' = Result.is_empty
         not Result.is_empty implies Result.first = drive
         not Result.is_empty implies Result.item(2) = ':'
      end

   count: INTEGER
      local
         p: INTEGER; sep: BOOLEAN
      do
         from
            p := 1
            sep := True
         until
            p > path.count
         loop
            if not sep and is_separator(path.item(p)) then
               sep := True
            elseif sep and not is_separator(path.item(p)) then
               sep := False
               Result := Result + 1
            end
            p := p + 1
         end
         if sep and Result > 0 then
            -- trailing \
            Result := Result + 1
         end
      end

   last: STRING
      local
         p: INTEGER
      do
         from
            p := path.count
         until
            p = 0 or else is_separator(path.item(p))
         loop
            p := p - 1
         end
         Result := path.substring(p + 1, path.count)
      ensure then
         to_string.has_suffix(Result)
      end

   extension: STRING
      local
         p: INTEGER
      do
         Result := once ""
         p := path.reverse_index_of(extension_separator, path.count)
         if p /= 0 then
            if not path.valid_index(path.reverse_index_of('/', p)) and then not path.valid_index(path.index_of(directory_separator, p)) then
               Result := path.substring(p, path.count)
            end
         end
      end

   is_absolute: BOOLEAN
      do
         Result := not path.is_empty and then is_separator(path.first)
      end

   is_normalized: BOOLEAN
      local
         elem: STRING; scan: STRING
      do
         elem := once "path_element"
         scan := once ""
         scan.copy(to_string)
         -- Some basic checks
         Result := not path.has('/') and then not path.is_empty and then (drive /= no_drive implies not path.has_prefix(once "\\"
         -- UNIX slash not allowed
         -- Empty path is not normalized
         ))
         -- Double slash allowed only without drive
         -- Remove initial slashes
         from
         until
            scan.is_empty or else scan.first /= directory_separator
         loop
            scan.remove_head(1)
         end
         -- Check for trailing slashes, double slashes
         Result := Result and then (scan.is_empty or else scan.last /= directory_separator) and then not scan.has_substring(once "\\")
         -- Remove initial sequences of ".."
         if not is_absolute and Result then
            from
            until
               scan.is_empty or else not scan.has_prefix(up_directory)
            loop
               if scan.count >= 3 and then scan.item(3) = directory_separator then
                  scan.remove_head(3)
               else
                  scan.remove_head(2)
               end
            end
         else
            Result := Result and then not scan.has_prefix(once "..\") and then not scan.is_equal(up_directory)
         end
         -- Make sure that there is no '..' remaining
         Result := Result and then not scan.has_substring(once "\..\") and then not scan.has_suffix(once "\..")
         -- Make sure that there is no '.' remaining except alones
         Result := Result and then not scan.has_substring(once "\.\") and then not scan.has_suffix(once "\.") and then not scan.has_prefix(once ".\")
         Result := Result and then (is_absolute implies not scan.is_equal(this_directory))
      ensure
         Result implies not to_string.has_substring(once "\.\")
         Result implies not to_string.has_suffix(once "\.")
         Result implies not to_string.is_empty
      end

   is_separator (ch: CHARACTER): BOOLEAN
         -- Is `ch' a possible path separator? ( '/'  or '\' )
      do
         Result := ch = '/' or ch = directory_separator
      end

   is_valid_path (a_path: STRING): BOOLEAN
      do
         --|*** Not nearly strict enough <FM-24/03/2003>
         Result := not a_path.is_empty
      end

   is_valid_file_name (elem: STRING): BOOLEAN
      do
         Result := Precursor(elem) and then not elem.has('/')
      end

   exists: BOOLEAN
      --      local
      --         i: FILE_INFORMATION
      do
         crash
         --         i.update (to_string)
         --         Result := i.exists
         -- FIXME: No way to do this
      end

   same_file (other: like Current): BOOLEAN
      --      local
      --         i, j: FILE_INFORMATION
      do
         crash
         --         i.update (to_string)
         --         j.update (other.to_string)
         --         Result := i.exists and then j.exists and then
         --            (i.inode = j.inode) and (i.device = j.device)
         -- FIXME: No way to do this
      end

feature {ANY} -- Operations
   to_absolute
      local
         bd: BASIC_DIRECTORY
      do
         if not is_absolute then
            tmp.copy(Current)
            make_from_string(bd.current_working_directory.out.twin)
            join(tmp)
            tmp.make_empty
         end
         normalize
      end

   normalize
      do
         tmp.copy(Current)
         make_from_path_name(tmp)
         if path.is_empty then
            path.copy(this_directory)
         end
      end

   normalize_case
      do
         drive := drive.to_lower
         path.to_lower
         path.replace_all('/', directory_separator)
         valid_cache := False
      end

   remove_last
      local
         p: INTEGER
      do
         -- Find last separator
         p := path.reverse_index_of('/', path.count).max(path.reverse_index_of(directory_separator, path.count))
         -- Remove all trailing slashes, leaving one if it is root
         from
         until
            p <= 1 or else not is_separator(path.item(p))
         loop
            p := p - 1
         end
         path.keep_head(p)
         valid_cache := False
      ensure then
         (old to_string.twin).has_prefix(to_string)
      end

   add_last (elem: STRING)
      do
         if not path.is_empty and then not is_separator(path.last) then
            path.extend(directory_separator)
         end
         path.append(elem)
         valid_cache := False
      end

   expand_user
      local
         sys: SYSTEM; home: STRING; p: INTEGER
      do
         if drive = no_drive and then not path.is_empty and then path.first = '~' then
            if path.count = 1 or else is_separator(path.item(2)) then
               home := sys.get_environment_variable(once "HOME")
               if home = Void then
                  home := sys.get_environment_variable(once "HOMEPATH")
                  if home /= Void then
                     p := path.first_index_of(directory_separator).min(path.first_index_of('\'))
                     if p = 0 then
                        p := path.count + 1
                     end
                     path.remove_head(p - 1)
                     path.prepend(home)
                     home := sys.get_environment_variable(once "HOMEDRIVE")
                     if home /= Void and not home.is_empty then
                        drive := home.first
                     end
                  end
               else
                  p := path.first_index_of(directory_separator).min(path.first_index_of('\'))
                  if p = 0 then
                     p := path.count + 1
                  end
                  path.remove_head(p - 1)
                  path.prepend(home)
               end
            else
               -- MS paths do not support ~user. Return original path
            end
         end
      end

   expand_shellouts
      do
         not_yet_implemented
      end

feature {ANY} -- Copying, comparison
   copy (other: like Current)
      do
         if Current /= other then
            make_empty
            drive := other.drive
            path.copy(other.path)
            valid_cache := False
         end
      end

   is_equal (other: like Current): BOOLEAN
      do
         -- Note: case insensitive
         Result := drive.same_as(other.drive) and then path.same_as(other.path)
      end

feature {MICROSOFT_PATH_NAME} -- Representation
   drive: CHARACTER
         -- Drive letter, or '%U' if none

feature {PATH_JOINER}
   start_join (a_drive: STRING; absoluteness: INTEGER)
      local
         new_drive: like drive
      do
         inspect absoluteness
         when 0 then
            if a_drive /= Void and then drive = no_drive and then not a_drive.is_empty and then path.is_empty then
               drive := a_drive.first
            end
         when 1 then
            if a_drive /= Void and then not a_drive.is_empty then
               new_drive := a_drive.first
            elseif path.count > 1 or else path.count = 1 and then not is_separator(path.last) then
               new_drive := no_drive
            else
               new_drive := drive
            end
            make_root
            drive := new_drive
         else
            path.make_filled(directory_separator, absoluteness)
            drive := no_drive
         end
         valid_cache := False
      ensure
         not valid_cache
      end

   join_element (element: STRING)
      do
         Precursor(element)
         valid_cache := False
      ensure then
         not valid_cache
      end

   end_join
      local
         dl: like drive
      do
         dl := drive
         Precursor
         drive := dl
      ensure then
         drive = old drive
      end

feature {} -- Representation
   no_drive: CHARACTER '%U'

   to_string_cache: STRING

   valid_cache: BOOLEAN

feature {} -- Internal
   tmp: MICROSOFT_PATH_NAME
      once
         create Result.make_empty
      end

   start_join_to (other: PATH_JOINER): INTEGER
      local
         slash_count: INTEGER
      do
         from
            Result := path.lower
         until
            Result > path.upper or else not is_separator(path.item(Result))
         loop
            Result := Result + 1
         end
         slash_count := Result - path.lower
         if Result <= path.upper then
            other.start_join(drive_specification, slash_count)
         elseif slash_count > 0 or else drive /= no_drive then
            other.start_join(drive_specification, slash_count)
            other.end_join
         end
      end

invariant
   to_string_cache /= Void
   drive = no_drive or drive.is_letter
   valid_cache and drive = no_drive implies to_string.is_equal(path)
   valid_cache and drive /= no_drive implies to_string.is_equal(drive.to_string + ":" + path)

end -- class MICROSOFT_PATH_NAME
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
