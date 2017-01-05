-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class FILE_TOOLS
   -- This expanded class gather tools relatives to files such as
   -- file comparison, file renaming, file deletion, file size, file
   -- permissions...
   --
   -- Note this is a facilities class. Files are referenced with
   -- their names (as STRINGs). Consider using functions available in
   -- TEXT_FILE_READ if you are already connected to the file.

insert
   ANY

feature {ANY}
   same_files (path1, path2: ABSTRACT_STRING): BOOLEAN
         -- True if the `path1' file exists and has the very same content as file `path2'.
      require
         path1 /= Void
         path2 /= Void
      do
         tfr1.connect_to(path1)
         if tfr1.is_connected then
            tfr2.connect_to(path2)
            if tfr2.is_connected then
               Result := tfr1.same_as(tfr2)
               check
                  tfr1_closed_by_same_as: not tfr1.is_connected
                  tfr2_closed_by_same_as: not tfr2.is_connected
               end
            else
               tfr1.disconnect
            end
         end
      end

   same_physical_file (path1, path2: ABSTRACT_STRING): BOOLEAN
         -- True if `path1' and `path2' physically refer to the same file (e.g. symlinks to a same file will
         -- return True here)
      require
         path1 /= Void
         path2 /= Void
      do
         Result := io_same_physical_file(path1.to_external, path2.to_external)
      end

   file_exists (path: ABSTRACT_STRING): BOOLEAN
      require
         path /= Void
         path.count > 0
      do
         Result := io_file_exists(path.to_external)
      end

   is_readable (path: ABSTRACT_STRING): BOOLEAN
         -- True if `path' file exists and is either a readable file or an accessible directory.
      require
         path /= Void
      local
         bd: BASIC_DIRECTORY
      do
         if is_directory(path) then
            bd.connect_to(path)
            if bd.is_connected then
               Result := True
               bd.disconnect
            end
         else
            tfr1.connect_to(path)
            if tfr1.is_connected then
               Result := True
               tfr1.disconnect
            end
         end
      end

   is_empty (path: ABSTRACT_STRING): BOOLEAN
         -- True if `path' file exists, is readable and is an empty file.
      require
         path /= Void
         not path.is_empty
      do
         tfr1.connect_to(path)
         if tfr1.is_connected then
            tfr1.read_character
            Result := tfr1.end_of_input
            tfr1.disconnect
         end
      end

   rename_to (old_path, new_path: ABSTRACT_STRING)
         -- Try to change the name or the location of a file.
      require
         old_path /= Void
         new_path /= Void
      local
         p1, p2: POINTER
      do
         if file_exists(new_path) then
            delete(new_path)
         end
         p1 := old_path.to_external
         p2 := new_path.to_external
         last_rename_succeeded := io_rename(p1, p2)
      end

   last_rename_succeeded: BOOLEAN
         -- True if the last call to `rename_to` was successful.

   copy_to (source_path, target_path: ABSTRACT_STRING)
         -- Try to copy the source into the target.
      require
         source_path /= Void
         target_path /= Void
      local
         src, tgt: POINTER
      do
         src := source_path.to_external
         tgt := target_path.to_external
         last_copy_succeeded := io_copy(src, tgt)
      end

   last_copy_succeeded: BOOLEAN
         -- True if the last call to `copy_to` was successful.

   delete (path: ABSTRACT_STRING)
         -- Try to delete the given `path' file.
      require
         path /= Void
      local
         p: POINTER
      do
         p := path.to_external
         last_delete_succeeded := io_remove(p)
      end

   last_delete_succeeded: BOOLEAN
         -- True if the last call to `delete` was successful.

   size_of (path: ABSTRACT_STRING): INTEGER
         -- Total size of file `path' in number of bytes.
         -- When the corresponding file does not exists, the Result is negative.
      require
         path /= Void
         path.count > 0
      local
         p: POINTER
      do
         p := path.to_external
         Result := fstat_st_size(p)
      end

   last_change_of (path: ABSTRACT_STRING): TIME
         -- Of the last modification of `path'.
      require
         path /= Void
         path.count > 0
      local
         p: POINTER; time_memory: INTEGER_64
      do
         p := path.to_external
         time_memory := fstat_st_mtime(p)
         Result.set_time_memory(time_memory)
      end

   is_file (path: ABSTRACT_STRING): BOOLEAN
         -- Is `path' a regular file?
      require
         path /= Void
         path.count > 0
      do
         Result := fstat_st_is_file(path.to_external)
      end

   is_directory (path: ABSTRACT_STRING): BOOLEAN
         -- Is `path' a directory?
      require
         path /= Void
         path.count > 0
      do
         Result := fstat_st_is_dir(path.to_external)
      end

feature {}
   io_remove (path: POINTER): BOOLEAN
         -- To implement `delete'.
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "io_remove"
         }"
      end

   io_rename (old_path, new_path: POINTER): BOOLEAN
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "io_rename"
         }"
      end

   io_copy (source, target: POINTER): BOOLEAN
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "io_copy"
         }"
      end

   io_file_exists (path: POINTER): BOOLEAN
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "io_file_exists"
         }"
      end

   io_same_physical_file (path1, path2: POINTER): BOOLEAN
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "io_same_physical_file"
         }"
      end

   fstat_st_size (path: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "fstat"
         feature_name: "fstat_st_size"
         }"
      end

   fstat_st_mtime (path: POINTER): INTEGER_64
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "fstat"
         feature_name: "fstat_st_mtime"
         }"
      end

   fstat_st_is_file (path: POINTER): BOOLEAN
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "fstat"
         feature_name: "fstat_st_is_file"
         }"
      end

   fstat_st_is_dir (path: POINTER): BOOLEAN
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "fstat"
         feature_name: "fstat_st_is_dir"
         }"
      end

   tfr1: TEXT_FILE_READ
      once
         create Result.make
      end

   tfr2: TEXT_FILE_READ
      once
         create Result.make
      end

   tmp_string: STRING
      once
         create Result.make(256)
      end

end -- class FILE_TOOLS
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
