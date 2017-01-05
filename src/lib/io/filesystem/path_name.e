-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class PATH_NAME
   -- Operating system path name

inherit
   PATH_JOINER

feature {ANY} -- Creation/ Initialization
   make_empty
         -- Make a 'null' path
      deferred
      ensure
         is_empty
      end

   make_root
         -- Path to root directory (in current drive)
      deferred
      ensure
         is_absolute
      end

   make_current
         -- Path to current directory (relative). See also `to_absolute'
         -- if you need the absolute current working directory
      deferred
      ensure
         not is_absolute
      end

   make_from_string (s: STRING)
      require
         s /= Void
         s.is_empty or else is_valid_path(s)
      deferred
      ensure
         to_string.is_equal(s)
         (old to_string /= s) implies to_string /= s
      end

   make_from_path_name (pn: PATH_NAME)
      require
         pn /= Void
      do
         make_empty
         pn.join_to(Current)
      end

feature {ANY} -- Constants
   extension_separator: CHARACTER
         -- Character used to separate filenames from extensions
      deferred
      end

   directory_separator: CHARACTER
         -- Character used to separate directories
         -- This character is forbidden in filenames
      deferred
      end

feature {ANY} -- Access
   to_string: STRING
         -- String representation
      deferred
      ensure
         Result /= Void
         Result.is_empty or else is_valid_path(Result)
      end

   drive_specification: STRING
         -- Drive specified by the current path, Void if none
      deferred
      ensure
         Result /= Void implies to_string.has_prefix(Result)
      end

   count: INTEGER
         -- Number of elements in_path
      deferred
      ensure
         Result >= 0
      end

   is_empty: BOOLEAN
         -- Path is null. Note that you can have a null absolute path
         -- (i.e., root) or a null relative path (current directory)
      do
         Result := count = 0
      ensure
         Result = (count = 0)
      end

   last: STRING
         -- Last component (also known as "basename")
      require
         not is_empty
      deferred
      ensure
         Result /= Void
         is_valid_file_name(Result)
      end

   extension: STRING
         -- Path extension (may be empty)
      deferred
      ensure
         is_suffix: to_string.has_suffix(Result)
         is_extension: not Result.is_empty implies Result.first = extension_separator
         is_minimal: Result.occurrences(extension_separator) <= 1
         not Result.has(directory_separator)
         is_empty implies Result.is_empty
      end

   is_absolute: BOOLEAN
         -- absolute path?
      deferred
      end

   as_absolute: like Current
         -- Equivalent absolute path
      do
         Result := twin
         Result.to_absolute
      ensure
         Result.is_absolute
         Result.is_normalized
      end

   is_normalized: BOOLEAN
         -- Has no redundant separators, or redundant up-references
      deferred
      end

   is_valid_path (path: STRING): BOOLEAN
         -- Does `path' represent a syntactically valid file or
         -- directory path? The result does not imply that there
         -- actually a file or directory with that name. This
         -- operation does not perform any disk access.
      require
         path /= Void
      deferred
      ensure
         path.is_equal(old path.twin)
      end

   is_valid_file_name (name: STRING): BOOLEAN
         -- Does `path' only contain valid characters for a file? The
         -- result does not imply that there is actually a file or
         -- directory with that name. Not the same as `is_valid_path':
         -- path separators (/ for unix, \ for windows, ...) are
         -- allowed in paths, but not in file names. This operation
         -- does not perform any disk access.
      require
         name /= Void
      deferred
      ensure
         name.is_equal(old name.twin)
      end

   is_valid_directory: BOOLEAN
         -- Does `Current' represent a syntactically valid directory
         -- path? For many Systems, there may be no syntactical
         -- difference between file paths and directory paths, in
         -- that case `is_valid_directory' is always True.
      deferred
      ensure
         Result or is_valid_file
      end

   is_valid_file: BOOLEAN
         -- Does `Current' represent a syntactically valid directory
         -- path? For many Systems, there may be no syntactical
         -- difference between file paths and directory paths, in
         -- that case `is_valid_file' is always True.
      deferred
      ensure
         Result or is_valid_directory
      end

   is_file: BOOLEAN
         -- Path points to an existing regular file?
      do
         Result := (create {FILE_TOOLS}).is_file(to_string)
      end

   is_directory: BOOLEAN
         -- Path points to an existing directory?
      do
         Result := (create {FILE_TOOLS}).is_directory(to_string)
      end

   infix "+" (other: like Current): like Current
         -- Join with `other' using filesystem semantics
      require
         other /= Void
      do
         Result := twin
         Result.join(other)
      ensure
      -- Result is a fresh instance
      end

   infix "/" (elem: STRING): like Current
         -- Path with `elem' inside current
      require
         elem /= Void
         not elem.has(directory_separator)
      do
         Result := twin
         Result.add_last(elem)
      ensure
      -- Result is a fresh instance
         Result.is_empty = (is_empty and elem.is_empty)
         Result.last.is_equal(elem)
      end

   short_name: STRING
      deferred
      ensure
         Result /= Void
      end

feature {ANY} -- Operations
   to_absolute
         -- Transform into equivalent absolute path
      deferred
      ensure
         is_absolute
         is_normalized
      end

   normalize_case
         -- Transform into normalized case version (equivalent), with
         -- standard path separators
      deferred
      end

   normalize
         -- Normalize removing double separators, and up-references
      deferred
      ensure
         is_normalized
         old is_normalized implies to_string.is_equal(old to_string.twin)
      end

   remove_last
         -- Remove last component of path (keep the "dirname")
      require
         not is_empty
      deferred
      ensure
      -- (old twin).is_equal (Current / (old last))
      -- assertion above commented because of SE bug
         count = old count - 1
      end

   go_up
         -- Go up by one directory
      deferred
      end

   add_last (elem: STRING)
      require
         elem /= Void
         not elem.has(directory_separator)
      deferred
      ensure
         last.is_equal(elem)
         not_reduced: old count <= count
         may_grow_one: count <= old count + 1
      end

   join (other: PATH_NAME)
         -- Join with `other' using filesystem semantics
      require
         other /= Void
      do
         other.join_to(Current)
      ensure
         (old is_normalized) implies is_normalized
      -- definition: to_string.is_equal (old (Current+other).to_string)
      -- assertion above is commented out because of SE bug
      end

   join_to (other: PATH_JOINER)
      require
         other /= Void
      deferred
      end

   expand_user
         -- Replace an initial "~" or "~user" by user home directory
      deferred
      ensure
         not (old to_string.twin).has_prefix(once "~") implies to_string.is_equal(old to_string.twin)
      end

   expand_variables
         -- Replace substrings of form $name or ${name} with environment
         -- variable values
      local
         p, len: INTEGER; new, varname, subst: STRING; sys: SYSTEM
      do
         new := once ""
         varname := once ""
         subst := once ""
         len := to_string.count
         from
            p := 1
            new.clear_count
            varname.clear_count
         until
            p > len
         loop
            if to_string.item(p) = '$' then
               varname.clear_count
               subst.clear_count
               subst.extend('$')
               p := p + 1
               if p = len then
               elseif to_string.item(p) = '{' then
                  -- ${var}
                  subst.extend('{')
                  from
                     p := p + 1
                  until
                     p > len or else to_string.item(p) = '}'
                  loop
                     varname.extend(to_string.item(p))
                     subst.extend(to_string.item(p))
                     p := p + 1
                  end
                  if p <= len then
                     p := p + 1 -- skip '}'
                     subst.extend('}')
                  else
                     varname.clear_count
                     -- invalid variable
                  end
               else
                  -- $var
                  from
                  until
                     p > len or else not to_string.item(p).is_letter_or_digit
                  loop
                     varname.extend(to_string.item(p))
                     subst.extend(to_string.item(p))
                     p := p + 1
                  end
               end
               if not varname.is_empty and then sys.get_environment_variable(varname) /= Void then
                  subst.copy(sys.get_environment_variable(varname))
               end
               new.append(subst)
            else
               new.extend(to_string.item(p))
               p := p + 1
            end
         end
         to_string.copy(new)
      ensure
         not (old to_string.twin).has('$') implies to_string.is_equal(old to_string.twin)
      end

   expand_shellouts
         -- Replace substrings of form $(command) with execution of
         -- shell commands
      deferred
      ensure
         not to_string.has_substring("$(") implies to_string.is_equal(old to_string.twin)
      end

feature {PATH_JOINER}
   join_up
      do
         go_up
      end

   end_join
      do
         if is_empty and then not is_absolute then
            make_current
         end
      end

feature {}
   tmp: like Current
      deferred
      ensure
         Result /= Void
      end

end -- class PATH_NAME
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
