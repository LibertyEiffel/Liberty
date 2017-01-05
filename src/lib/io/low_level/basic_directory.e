-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class BASIC_DIRECTORY
   --
   -- Very low-level basic tools for file-system directory handling and file path manipulation.  This class
   -- intended to be platform independent as much as possible. In order to remove from the client side the
   -- burden of file path computation, this class tries to compute automatically the system file notation
   -- using argument(s) of some of the very first call(s).  As soon as the system notation has been properly
   -- detected, the result is internally memorized for all objects of type BASIC_DIRECTORY in a common private
   -- buffer. Besides the low-level nature of operations one can found in this class, all file path
   -- manipulations are done in a smart way (except when the system file path notation has not been detected
   -- automatically, which is quite uncommon). As an example, even if the directory separator is internally
   -- detected, this information is _intentionally_ kept private to avoid low-level manipulation from the
   -- client side. Finally, this class is expanded in order to avoid as much as possible memory allocations.
   --
   -- Also consider high level facade class DIRECTORY if you don't want to deal directly with low level
   -- directory streams.
   --

feature {}
   directory_stream: POINTER
         -- This pointer memorize the current directory stream being scanned (used to compute `is_connected').

   current_entry: POINTER
         -- When `is_connected', memorize the current entry in the current  `directory_stream'.

feature {ANY} -- State of `Current' basic directory stream:
   is_connected: BOOLEAN
         -- Is `Current' connected to some directory stream ?
      do
         Result := directory_stream.is_not_null
      end

   end_of_input: BOOLEAN
         -- Is end of input reached ?
      require
         is_connected
      do
         Result := current_entry.is_null
      end

feature {ANY} -- Connect and disconnect:
   connect_to (directory_path: ABSTRACT_STRING)
         -- Try to connect `Current' to some existing `directory_path'. After this call, the client
         -- supposed to use `is_connected' to check that the stream is ready to be used.
      require
         not is_connected
         not directory_path.is_empty
         common_buffer_protection: last_entry /= directory_path
      local
         path_pointer: POINTER
      do
         path_pointer := directory_path.to_external
         directory_stream := directory_open(path_pointer)
         current_entry := directory_stream
         last_entry.clear_count
      ensure
         is_connected implies not end_of_input
      end

   connect_with (some_path: ABSTRACT_STRING)
         -- Try to connect `Current' to some directory using `some_path' which may be either an existing
         -- directory path or some arbitrary file path name. When `some_path' is the path of some readable
         -- existing directory, this directory is opened and the effect of `connect_with' is equivalent to
         -- `connect_to'. When `some_path' is not an existing readable directory path, `connect_with' tries to
         -- open the directory which may contains `some_path' viewed as a file path name. After this call, the
         -- client is supposed to use `is_connected' to check that the stream is ready to be used and the
         -- `last_entry' buffer to know about the corresponding opened directory path. Whatever the result,
         -- `some_path' is left unchanged.
      require
         not is_connected
         not some_path.is_empty
         common_buffer_protection: last_entry /= some_path
      local
         p: POINTER
      do
         connect_to(some_path)
         if is_connected then
            last_entry.copy(some_path.out)
         else
            compute_parent_directory_of(some_path)
            if last_entry.count > 0 then
               p := last_entry.to_external
               directory_stream := directory_open(p)
               current_entry := directory_stream
               if directory_stream.is_null then
                  last_entry.clear_count
               end
            else
               last_entry.clear_count
            end
         end
      ensure
         is_connected implies not end_of_input
      end

   connect_to_current_working_directory
         -- Try to connect `Current' to the current working directory. After this call, the client is supposed
         -- to use `is_connected' to check that the stream is ready to be used and the `last_entry' buffer to
         -- know about the name of the current working directory.
      require
         not is_connected
      local
         path: POINTER
      do
         path := directory_current_working_directory
         if path.is_not_null then
            last_entry.from_external_copy(path)
            directory_stream := directory_open(path)
            current_entry := directory_stream
            if directory_stream.is_null then
               last_entry.clear_count
            else
               if not system_notation_detected then
                  set_notation_using(last_entry)
               end
               system_notation.to_directory_path(last_entry)
            end
         else
            last_entry.clear_count
         end
      ensure
         is_connected implies not end_of_input
      end

   disconnect
         -- Do not forget to call this feature when you have finished with some previously opened directory
         -- stream.
      require
         is_connected
      local
         null: POINTER
      do
         if directory_close(directory_stream) then
            directory_stream := null
            current_entry := null
         end
      ensure
         not is_connected
      end

feature {ANY} -- Scanning:
   last_entry: STRING
         -- Unique global buffer (once object) to get the last information computed by many routines of this
         -- class: `read_entry', `connect_with' `connect_to_current_working_directory',
         -- `compute_parent_directory_of', ...
      once
         create Result.make(256)
      end

   read_entry
         -- Read the next entry name and update `last_entry' and `end_of_input' accordingly.
      require
         is_connected
         not end_of_input
      local
         name: POINTER
      do
         current_entry := directory_read_entry(directory_stream)
         if current_entry.is_not_null then
            name := directory_get_entry_name(current_entry)
            last_entry.from_external_copy(name)
         end
      end

feature {ANY} -- File path handling tools:
   compute_parent_directory_of (some_path: ABSTRACT_STRING)
         -- Using `some_path' (which may be either a file path or a directory path) tries to compute in the
         -- `last_entry' buffer the parent directory of `some_path'. When `some_path' is a path with no parent
         -- directory, the `last_entry' buffer `is_empty' after this call. This operation does not perform any
         -- disk access.
      require
         not some_path.is_empty
         common_buffer_protection: last_entry /= some_path
      do
         if system_notation /= Void then
            last_entry.copy(some_path.out)
            system_notation.to_parent_directory(last_entry)
         else
            set_notation_using(some_path)
            if system_notation /= Void then
               last_entry.copy(some_path.out)
               system_notation.to_parent_directory(last_entry)
            else
               last_entry.clear_count
            end
         end
      end

   compute_subdirectory_with (parent_path, entry_name: ABSTRACT_STRING)
         -- Try to compute in the `last_entry' buffer the new subdirectory path obtained when trying to
         -- concatenate smartly `parent_path' with some `entry_name'. When this fails the `last_entry' buffer
         -- `is_empty' after this call. This operation does not perform any disk access. Whatever the result,
         -- `parent_path' and `entry_name' are left unchanged.
      require
         not parent_path.is_empty
         not entry_name.is_empty
         common_buffer_protection1: last_entry /= parent_path
         common_buffer_protection2: last_entry /= entry_name
      do
         if system_notation /= Void then
            last_entry.copy(parent_path.out)
            system_notation.to_subdirectory_with(last_entry, entry_name.out)
         else
            set_notation_using(parent_path.out)
            if system_notation /= Void then
               last_entry.copy(parent_path.out)
               system_notation.to_subdirectory_with(last_entry, entry_name.out)
            else
               last_entry.clear_count
            end
         end
      end

   compute_file_path_with (parent_path, file_name: ABSTRACT_STRING)
         -- Try to compute in the `last_entry' buffer the new file path obtained when trying to concatenate
         -- smartly `parent_path' with some `file_name'. When this fails the `last_entry' buffer `is_empty'
         -- after this call. This operation does not perform any disk access. Whatever the result,
         -- `parent_path' and `file_name' are left unchanged.
      require
         not parent_path.is_empty
         not file_name.is_empty
         common_buffer_protection1: last_entry /= parent_path
         common_buffer_protection2: last_entry /= file_name
      do
         if system_notation /= Void then
            last_entry.copy(parent_path.out)
            system_notation.to_file_path_with(last_entry, file_name.out)
         else
            set_notation_using(parent_path)
            if system_notation /= Void then
               last_entry.copy(parent_path.out)
               system_notation.to_file_path_with(last_entry, file_name.out)
            else
               last_entry.clear_count
            end
         end
      end

   compute_absolute_file_path_with (path: ABSTRACT_STRING)
         -- Try to compute an absolute path equivalent to `path' and store it in `last_entry'. When this fails
         -- the `last_entry' buffer `is_empty' after this call. This operation does not perform any disk
         -- access.  Whatever the result, `path' is left unchanged.
      require
         valid_path(path)
         common_buffer_protection: last_entry /= path
      do
         if system_notation /= Void then
            last_entry.copy(current_working_directory.out)
            system_notation.to_absolute_path_in(last_entry, path.out)
         else
            set_notation_using(path)
            if system_notation /= Void then
               last_entry.copy(current_working_directory.out)
               system_notation.to_absolute_path_in(last_entry, path.out)
            else
               last_entry.clear_count
            end
         end
      ensure
         last_entry.is_empty or else system_notation.is_absolute_path(last_entry.out)
      end

   compute_short_name_of (path: ABSTRACT_STRING)
         -- Try to find the short name of the file or directory given by its `path' and store it in
         -- `last_entry'. When this fails the `last_entry' buffer `is_empty' after the call. This operation
         -- does not perform any disk access.  Whatever the result, `path' is left unchanged.
      do
         if system_notation /= Void then
            last_entry.copy(current_working_directory.out)
            system_notation.to_short_name_in(last_entry, path.out)
         else
            set_notation_using(path)
            if system_notation /= Void then
               last_entry.copy(current_working_directory.out)
               system_notation.to_short_name_in(last_entry, path.out)
            else
               last_entry.clear_count
            end
         end
      end

   valid_path (path: ABSTRACT_STRING): BOOLEAN
         -- Is the syntax of `path' valid for the system notation?
      do
         if system_notation_detected then
            Result := system_notation.is_valid_path(path.out)
         else
            Result := not path.is_empty
         end
      ensure
         system_notation_detected implies Result = system_notation.is_valid_path(path.out)
         not system_notation_detected implies Result = not path.is_empty
      end

   change_current_working_directory (directory_path: ABSTRACT_STRING)
         -- Try to change the current working directory using some `directory_path'.  When the operation
         -- possible, the `last_entry' buffer is updated with the new current working directory path,
         -- otherwise, when the modification is not possible the `last_entry' buffer `is_empty' after this
         -- call. Whatever the result, `directory_path' is left unchanged.
      require
         not is_connected
         common_buffer_protection1: last_entry /= directory_path
      local
         p: POINTER
      do
         p := directory_path.to_external
         if directory_chdir(p) then
            connect_to_current_working_directory
            if is_connected then
               disconnect
               check
                  not last_entry.is_empty
               end
            else
               last_entry.clear_count
            end
         else
            last_entry.clear_count
         end
      ensure
         not is_connected
      end

   current_working_directory: FIXED_STRING
         -- The current working directory. Always returns the same once STRING.
      local
         path: POINTER; cwd: STRING
      do
         path := directory_current_working_directory
         if path.is_not_null then
            cwd := once ""
            cwd.from_external_copy(path)
            if not system_notation_detected then
               set_notation_using(cwd)
            end
            system_notation.to_directory_path(cwd)
            Result := cwd.intern
         end
      end

   ensure_system_notation
      local
         dummy: BOOLEAN
      once
         dummy := require_system_notation
      ensure
         system_notation /= Void
      end

   require_system_notation: BOOLEAN
         -- Same as `ensure_system_notation', useful for contracts
      once
         Result := current_working_directory /= Void
      ensure
         system_notation /= Void
         Result
      end

feature {ANY} -- Disk modification:
   create_new_directory (directory_path: ABSTRACT_STRING): BOOLEAN
         -- Try to create a new directory using the `directory_path' name.
         -- Returns True on success.
      require
         not is_connected
      local
         p: POINTER
      do
         p := directory_path.to_external
         Result := directory_mkdir(p)
      ensure
         not is_connected
      end

   remove_directory (directory_path: ABSTRACT_STRING): BOOLEAN
         -- Try to remove directory `directory_path' which must be empty.
         -- Returns True on success.
      require
         not is_connected
      local
         p: POINTER
      do
         p := directory_path.to_external
         Result := directory_rmdir(p)
      ensure
         not is_connected
      end

   remove_files_of (directory_path: ABSTRACT_STRING)
         -- Try to remove all files (not subdirectories) of directory specified by `directory_path'.
      require
         not is_connected
      local
         ft: FILE_TOOLS
      do
         connect_to(directory_path)
         if is_connected then
            from
               read_entry
            until
               end_of_input
            loop
               tmp_path.copy(last_entry)
               compute_file_path_with(directory_path, tmp_path)
               tmp_path.copy(last_entry)
               if ft.is_file(tmp_path) then
                  ft.delete(tmp_path)
               end
               read_entry
            end
            disconnect
         end
      ensure
         not is_connected
      end

   remove_recursively (directory_path: ABSTRACT_STRING): BOOLEAN
         -- Try to remove all files and all subdirectories of directory specified by `directory_path'.
      require
         not is_connected
      local
         ft: FILE_TOOLS
      do
         connect_to(directory_path)
         Result := is_connected
         if Result then
            from
               read_entry
            until
               end_of_input
            loop
               if not system_notation.is_current_directory(last_entry) and then not system_notation.is_parent_directory(last_entry) then
                  tmp_path.copy(last_entry)
                  compute_file_path_with(directory_path, tmp_path)
                  tmp_path.copy(last_entry)
                  if ft.is_directory(tmp_path) then
                     disconnect
                     Result := Result and remove_recursively(tmp_path.twin)
                     connect_to(directory_path)
                  else
                     ft.delete(tmp_path)
                  end
               end
               read_entry
            end
            disconnect
         end
         Result := Result and remove_directory(directory_path)
      ensure
         not is_connected
      end

feature {ANY} -- Miscellaneous:
   is_case_sensitive: BOOLEAN
      local
         bd: like Current
      do
         if system_notation = Void then
            -- Try to create system_notation
            bd.connect_to_current_working_directory
            if bd.is_connected then
               if not last_entry.is_empty then
                  set_notation_using(last_entry)
                  if system_notation /= Void then
                     Result := system_notation.is_case_sensitive
                  end
               end
               bd.disconnect
            end
         else
            Result := system_notation.is_case_sensitive
         end
      end

   system_notation: DIRECTORY_NOTATION
      do
         Result := system_notation_buffer.item
      end

feature {DIRECTORY_NOTATION_HANDLER}
   system_notation_buffer: REFERENCE[DIRECTORY_NOTATION]
         -- Unique common buffer to memorize the system path notation.
      once
         create Result
      end

   system_notation_detected: BOOLEAN
      do
         Result := system_notation /= Void
      end

   unix_notation: BOOLEAN
         -- The Unix like file path notation looks like:
         --   /LibertyEiffel/sys/system.se
      do
         Result := {UNIX_DIRECTORY_NOTATION} ?:= system_notation
      end

   windows_notation: BOOLEAN
         -- The Windows like file path notation looks like:
         --   C:\LibertyEiffel\sys\system.se
      do
         Result := {WINDOWS_DIRECTORY_NOTATION} ?:= system_notation
      end

   cygwin_notation: BOOLEAN
         -- The Cygwin like file path notation looks like:
         --   //C/LibertyEiffel/sys/system.se
      do
         Result := {CYGWIN_DIRECTORY_NOTATION} ?:= system_notation
      end

   openvms_notation: BOOLEAN
         -- The VMS file path notation looks like:
         --    DISK:[LibertyEiffel.sys]system.se
         -- The current working directory notation is:
         --    DISK:[]
         -- The equivalent of Unix .. is :
         --    [-]
         -- The equivalent of Unix ../.. is :
         --    [-.-]
         --
      do
         Result := {OPENVMS_DIRECTORY_NOTATION} ?:= system_notation
      end

   set_notation_using (some_path: ABSTRACT_STRING)
         -- Try to detect automatically the file system notation.
      require
         not some_path.is_empty
         not system_notation_detected
      do
         inspect
            some_path.first
         when '/', '.', '~' then
            if some_path.count >= 4 and then some_path.item(2) = '/' and then some_path.item(4) = '/' then
               system_notation_buffer.set_item(create {CYGWIN_DIRECTORY_NOTATION})
            else
               system_notation_buffer.set_item(create {UNIX_DIRECTORY_NOTATION})
            end
         when '\' then
            system_notation_buffer.set_item(create {WINDOWS_DIRECTORY_NOTATION})
         when '[' then
            system_notation_buffer.set_item(create {OPENVMS_DIRECTORY_NOTATION})
         when 'a' .. 'z', 'A' .. 'Z' then
            if some_path.count >= 2 then
               inspect
                  some_path.item(2)
               when ':' then
                  if some_path.count = 2 then
                     system_notation_buffer.set_item(create {WINDOWS_DIRECTORY_NOTATION})
                  elseif some_path.has('\') then
                     system_notation_buffer.set_item(create {WINDOWS_DIRECTORY_NOTATION})
                  elseif some_path.has('/') then
                     system_notation_buffer.set_item(create {CYGWIN_DIRECTORY_NOTATION})
                  end
               when 'a' .. 'z', 'A' .. 'Z' then
                  if some_path.has('[') then
                     system_notation_buffer.set_item(create {OPENVMS_DIRECTORY_NOTATION})
                  elseif some_path.has(':') then
                     if some_path.has('[') then
                        system_notation_buffer.set_item(create {OPENVMS_DIRECTORY_NOTATION})
                     end
                  elseif some_path.has('/') then
                     system_notation_buffer.set_item(create {UNIX_DIRECTORY_NOTATION})
                  elseif some_path.has('\') then
                     --|*** This looks weird <FM-23/03/2005>
                     system_notation_buffer.set_item(create {UNIX_DIRECTORY_NOTATION})
                  end
               else
               end
            end
         else
         end
      end

   reset_notation_using (some_path: ABSTRACT_STRING)
         -- Try to detect automatically the file system notation.
      do
         system_notation_buffer.set_item(Void)
         set_notation_using(some_path)
      end

   reset_notation
      do
         reset_notation_using(current_working_directory)
      end

feature {}
   tmp_path: STRING
      once
         create Result.make(256)
      end

   directory_open (path_pointer: POINTER): POINTER
         -- Try to open some existing directory using `path'. When `Result' `is_not_null', the directory
         -- correctly opened and `Result' is a valid handle for this directory.  Using `Result', one can then
         -- scan the content of the directory using function `basic_directory_read_entry' and
         -- `basic_directory_get_entry_name'. Finally, a `is_not_null' directory must be closed using function
         -- `basic_directory_close'.
      require
         path_pointer.is_not_null
      external "plug_in"
      alias "{
             location: "${sys}/plugins/io"
             module_name: "directory"
             feature_name: "directory_open"
         }"
      end

   directory_read_entry (dirstream: POINTER): POINTER
         -- Read an return a new entry using the directory handle `dirstream' obtained with function
         -- `basic_directory_open'. When there is no more entry, the `Result' becomes `is_null'.
      require
         dirstream.is_not_null
      external "plug_in"
      alias "{
             location: "${sys}/plugins/io"
             module_name: "directory"
             feature_name: "directory_read_entry"
         }"
      end

   directory_get_entry_name (entry: POINTER): POINTER
         -- Read an return a new entry using the directory handle `dirstream' obtained with function
         -- `basic_directory_open'. When there is no more entry, the `Result' becomes `is_null'.
      require
         entry.is_not_null
      external "plug_in"
      alias "{
             location: "${sys}/plugins/io"
             module_name: "directory"
             feature_name: "directory_get_entry_name"
         }"
      end

   directory_close (dirstream: POINTER): BOOLEAN
         -- Try to close some opened `dirstream' directory. A True result indicates that the directory
         -- correctly closed.
      require
         dirstream.is_not_null
      external "plug_in"
      alias "{
             location: "${sys}/plugins/io"
             module_name: "directory"
             feature_name: "directory_close"
         }"
      end

   directory_current_working_directory: POINTER
         -- Try to get the current working directory path.
      external "plug_in"
      alias "{
             location: "${sys}/plugins/io"
             module_name: "directory"
             feature_name: "directory_current_working_directory"
         }"
      end

   directory_chdir (destination: POINTER): BOOLEAN
         -- Try to change the current working directory using `destination'.
      external "plug_in"
      alias "{
             location: "${sys}/plugins/io"
             module_name: "directory"
             feature_name: "directory_chdir"
         }"
      end

   directory_mkdir (directory_path: POINTER): BOOLEAN
         -- Try to create a new directory using `directory_path'.
      external "plug_in"
      alias "{
             location: "${sys}/plugins/io"
             module_name: "directory"
             feature_name: "directory_mkdir"
         }"
      end

   directory_rmdir (directory_path: POINTER): BOOLEAN
         -- Try to remove `directory_path'.
      external "plug_in"
      alias "{
             location: "${sys}/plugins/io"
             module_name: "directory"
             feature_name: "directory_rmdir"
         }"
      end

end -- class BASIC_DIRECTORY
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
