-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class C_SPLITTER_SPLIT
   --
   -- Splitting splitters (yes I know...) are heirs of this class.
   --

inherit
   C_SPLITTER

feature {CLEAN}
   should_clean (path_c, file_name: STRING): BOOLEAN
      local
         c: STRING
      do
         c := once ""
         c.copy(file_name)
         if check_and_remove_suffix(c) then
            Result := check_clean(path_c, c)
         end
      end

feature {C_PRETTY_PRINTER}
   write_make_file (out_make: TEXT_FILE_WRITE): BOOLEAN
      local
         ft: FILE_TOOLS; recompile: BOOLEAN; c_name: STRING
         c_files: like c_files_suffixes
      do
         from
            c_files := c_files_suffixes
         until
            c_files.is_off
         loop
            recompile := True
            path_in(tmp_string, c_files.item, c_draft_file_extension)
            path_in(tmp_path, c_files.item, once ".c")
            if ft.is_readable(tmp_string) then
               if ft.same_files(tmp_path, tmp_string) then
                  echo.put_string(once "File %"")
                  echo.put_string(tmp_path)
                  echo.put_string(once "%" not changed.%N")
                  echo.file_removing(tmp_string)
                  recompile := False
               else
                  echo.file_renaming(tmp_string, tmp_path)
                  tmp_path.remove_tail(2)
                  tmp_path.append(system_tools.object_suffix)
                  echo.file_removing(tmp_path)
               end
            end
            if recompile then
               c_name := once "...This is a local once buffer..."
               path_in(c_name, c_files.item, once ".c")
               out_make.put_line(system_tools.c_compiler_command(c_name))
               Result := True
            end
            c_files.next
         end
      end

feature {}
   check_clean (path_c, c: STRING): BOOLEAN
      deferred
      end

   check_and_remove_suffix (c: STRING): BOOLEAN
      do
         if c.has_suffix(once ".c") then
            c.remove_suffix(once ".c")
            Result := True
         elseif c.has_suffix(c_draft_file_extension) then
            c.remove_suffix(c_draft_file_extension)
            Result := True
         elseif c.has_suffix(once ".o") then
            c.remove_suffix(once ".o")
            Result := True
         elseif c.has_suffix(once ".obj") then
            c.remove_suffix(once ".obj")
            Result := True
         end
      ensure
         Result implies c.count < old (c.count)
      end

   backup_tfw_connect (suffix: STRING)
      local
         ft: FILE_TOOLS; real_c_path: STRING
      do
         real_c_path := once "...This is a local once buffer..."
         path_in(real_c_path, suffix, once ".c")
         path_in(tmp_path, suffix, system_tools.object_suffix)
         if ft.is_readable(tmp_path) then
            if ft.is_readable(real_c_path) then
               path_in(real_c_path, suffix, c_draft_file_extension)
            else
               echo.file_removing(tmp_path)
            end
         end
         c_connect(real_c_path)
      end

   connect_out_c
      do
         backup_tfw_connect(current_c_file_suffix)
      end

   current_c_file_suffix: STRING
      deferred
      end

   path_in (str, suffix, ext: STRING)
      require
         ext.first = '.'
      do
         str.copy(c_path)
         str.remove_tail(2)
         str.append(suffix)
         str.append(ext)
      end

   tmp_string: STRING
      once
         create Result.make(256)
      end

   c_files_suffixes: ITERATOR[STRING]
      deferred
      end

   c_draft_file_extension: STRING ".secd" -- Liberty Eiffel C Draft

end -- class C_SPLITTER_SPLIT
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
