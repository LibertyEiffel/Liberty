-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LOADPATH

inherit
   CLUSTERS

create {CLASSES_TREE_FACTORY}
   make

feature {ANY}
   to_string: STRING
      do
         Result := once ""
         Result.copy(path)
      end

feature {LOADPATH, CLASSES_TREE_FACTORY}
   name: STRING

   path: STRING

feature {} -- Open loadpath files
   connect (a_system_path: STRING; loadpath: LOADPATH): TEXT_FILE_READ
      local
         sp: like a_system_path
      do
         if connected.has(path) then
            error_cycle
         end
         if a_system_path /= Void then
            sp := a_system_path
         else
            sp := classes_path_to_system_path(path)
         end
         if files.is_empty then
            create Result.make
         else
            Result := files.last
            check
               not Result.is_connected
            end
            files.remove_last
         end
         echo.tfr_connect(Result, sp)
         if Result.is_connected then
            connected.put(Result, path)
         else
            error_handler.append(once "Unknown loadpath")
            if loadpath /= Void then
               error_handler.append(once " in ")
               error_handler.append(loadpath.path)
            else
               error_handler.append(once " (not in a loadpath)")
            end
            error_handler.append(once ": %"")
            error_handler.append(path)
            error_handler.append(once "%" (resolved as %"")
            error_handler.append(sp)
            error_handler.append(once "%").")
            error_handler.print_as_warning
            Result := Void
         end
      ensure
         Result = Void or else not files.fast_has(Result)
         Result = Void or else Result.is_connected
         Result = Void or else Result.path.same_as(a_system_path)
         Result = Void or else connected.at(path) = Result
      end

   disconnect (in: TEXT_FILE_READ)
      require
         in.is_connected
         not files.fast_has(in)
         connected.at(in.path) = in
      do
         connected.remove(in.path)
         in.disconnect
         files.add_last(in)
      ensure
         not in.is_connected
         files.fast_has(in)
         connected.fast_occurrences(in) = 0
      end

   files: FAST_ARRAY[TEXT_FILE_READ]
      once
         create Result.make(0)
      end

   connected: DICTIONARY[TEXT_FILE_READ, STRING]
      once
         create {HASHED_DICTIONARY[TEXT_FILE_READ, STRING]} Result.make
      end

   error_cycle
      do
         error_handler.append(once "Cycle detected:%N")
         show_cycle(Current)
         error_handler.print_as_fatal_error
      end

   show_cycle (tree: CLASSES)
      local
         p: CLUSTERS; l: LOADPATH
      do
         p := tree.parent
         if p = Current then
            error_handler.append(once "%T%"")
            error_handler.append(path)
            error_handler.append(once "%"%N")
         elseif (p /= Void) then
            show_cycle(p)
         end
         if l ?:= tree then
            l ::= tree
            error_handler.append(once "%T%"")
            error_handler.append(l.path)
            error_handler.append(once "%"%N")
         end
      end

   show_name
      do
         echo.put_character('"')
         echo.put_string(path)
         echo.put_character('"')
      end

feature {}
   make (a_distance: like distance; a_name: like name; a_path, a_system_path: like path; loadpath: LOADPATH; discard_silently: BOOLEAN)
      require
         a_distance > 0
         not a_name.is_empty
         not a_path.is_empty
         is_classes_path(a_path)
         classes_notation.is_absolute_path(a_path)
         not (create {FILE_TOOLS}).is_directory(a_path)
         string_aliaser.registered_one(a_path)
      local
         directory_path, loadpath_file: STRING
      do
         distance := a_distance
         name := a_name
         directory_path := strings.new_twin(a_path)
         classes_notation.to_parent_directory(directory_path)
         if a_system_path /= Void then
            loadpath_file := strings.new_twin(a_system_path)
         else
            loadpath_file := strings.new_twin(classes_path_to_system_path(a_path))
         end
         path := a_path
         create classeses.with_capacity(16)
         create_subtree(loadpath_file, directory_path, loadpath, discard_silently)
         strings.recycle(directory_path)
         strings.recycle(loadpath_file)
      end

   create_subtree (loadpath_file, a_path: STRING; loadpath: LOADPATH; discard_silently: BOOLEAN)
      require
         system_notation.is_valid_path(loadpath_file)
         is_classes_path(a_path)
      local
         tfr: TEXT_FILE_READ; entry, a_system_path, system_entry: STRING; i: INTEGER; factory: CLASSES_TREE_FACTORY
         classes: CLASSES; sp, cp: STRING; ft: FILE_TOOLS
      do
         tfr := connect(loadpath_file, loadpath)
         if tfr /= Void then
            from
               i := 1
            until
               tfr.end_of_input
            loop
               tfr.read_line
               if not tfr.last_string.is_empty then
                  entry := once ""
                  entry.copy(tfr.last_string)
                  system_tools.environment_variable_substitution(path, entry)
                  if system_notation.is_absolute_path(entry) and then ft.file_exists(entry) then
                     sp := string_aliaser.string(entry)
                     cp := string_aliaser.string(system_path_to_classes_path(entry))
                  end
                  if sp = Void and then classes_notation.is_absolute_path(entry) then
                     sp := classes_path_to_system_path(entry)
                     if ft.file_exists(sp) then
                        sp := string_aliaser.string(sp)
                        cp := string_aliaser.string(entry)
                     else
                        sp := Void
                     end
                  end
                  if sp = Void then
                     system_entry := strings.new_twin(entry)
                     system_notation.from_notation(classes_notation, system_entry)
                     if a_system_path = Void then
                        a_system_path := strings.new_twin(loadpath_file)
                        system_notation.to_parent_directory(a_system_path)
                     end
                     sp := new_path(system_notation, a_system_path, system_entry)
                     if ft.file_exists(sp) then
                        cp := new_path(classes_notation, a_path, entry)
                     else
                        sp := Void
                     end
                     strings.recycle(system_entry)
                  end
                  if sp = Void then
                     entry.copy(tfr.last_string)
                     sp := classes_path_to_system_path(entry)
                     system_tools.environment_variable_substitution(path, sp)
                     if system_notation.is_absolute_path(sp) and then ft.file_exists(sp) then
                        sp := string_aliaser.string(sp)
                        cp := string_aliaser.string(system_path_to_classes_path(sp))
                     else
                        sp := Void
                     end
                  end
                  if sp = Void then
                     error_handler.append(once "Unknown loadpath in ")
                     error_handler.append(path)
                     error_handler.append(once ": %"")
                     error_handler.append(tfr.last_string)
                     error_handler.append(once "%".")
                     error_handler.print_as_warning
                  else
                     check
                        cp /= Void
                        sp /= Void
                     end
                     classes := factory.classes(1, sp, cp, new_name(entry, i), Current, discard_silently)
                     if classes /= Void and then classes.parent = Void then
                        add_classes(classes)
                     end
                  end
               end
               sp := Void
               cp := Void
               i := i + 1
            end
            tfr.disconnect
            if classeses.is_empty and then not discard_silently then
               error_handler.append(once "Empty loadpath: %"")
               error_handler.append(path)
               error_handler.append(once "%".")
               error_handler.print_as_warning
            end
         end
         if a_system_path /= Void then
            strings.recycle(a_system_path)
         end
      end

   new_path (notation: DIRECTORY_NOTATION; a_path, a_entry: STRING): STRING
      require
         notation.is_valid_path(a_path) --|*** TO BE CHECKED: notation.is_valid_file_name(a_entry)
         not notation.is_absolute_path(a_entry)
      local
         buffer: STRING
      do
         buffer := once ""
         buffer.copy(a_path)
         notation.to_subpath_with(buffer, a_entry)
         Result := string_aliaser.string(buffer)
      ensure
         Result /= Void
         string_aliaser.registered_one(Result)
      end

   new_name (a_name: STRING; index: INTEGER): STRING
      local
         buffer: STRING
      do
         buffer := once ""
         buffer.copy(a_name)
         if buffer.is_empty then
            buffer.add_last('#')
            index.append_in(buffer)
         elseif buffer.has_prefix(once "./") then
            buffer.remove_head(2)
         end
         Result := once ""
         Result.copy(name)
         Result.add_last(':')
         Result.append(buffer)
         Result := string_aliaser.string(Result)
      ensure
         Result /= Void
         string_aliaser.registered_one(Result)
      end

invariant
   distance > 0

end -- class LOADPATH
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
