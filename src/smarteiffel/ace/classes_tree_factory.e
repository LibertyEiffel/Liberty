-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class CLASSES_TREE_FACTORY

insert
   GLOBALS

feature {ACE}
   universe: UNIVERSE
      once
         create Result.make
      end

feature {CLASSES}
   classes (distance: INTEGER; system_path, path, name: STRING; loadpath: LOADPATH; discard_silently: BOOLEAN): CLASSES
      require
         not name.is_empty
         string_aliaser.registered_one(name)
         not path.is_empty
         string_aliaser.registered_one(path)
         universe.classes_notation.is_absolute_path(path)
         system_path /= Void implies file_tools.file_exists(system_path)
      do
         Result := classes_memory.reference_at(path)
         if Result = Void then
            if system_path /= Void and then file_tools.is_directory(system_path) then
               if not universe.has_physical_cluster(system_path) then
                  create {CLASSES_TREE} Result.make(distance, name, path, system_path)
               elseif not discard_silently then
                  error_handler.append(once "Duplicate directory")
                  if loadpath /= Void then
                     error_handler.append(once " in ")
                     error_handler.append(loadpath.path)
                  end
                  error_handler.append(once ": ")
                  error_handler.append(path)
                  error_handler.print_as_warning
               end
            else
               create {LOADPATH} Result.make(distance, name, path, system_path, loadpath, discard_silently)
            end
            classes_memory.add(Result, path)
         elseif not discard_silently then
            error_handler.append(once "Classes path set more than once")
            if loadpath /= Void then
               error_handler.append(once " in ")
               error_handler.append(loadpath.path)
            end
            error_handler.append(once ": ")
            error_handler.append(path)
            error_handler.print_as_warning
         end
      end

feature {}
   file_tools: FILE_TOOLS

   classes_memory: DICTIONARY[CLASSES, STRING]
      once
         create {HASHED_DICTIONARY[CLASSES, STRING]} Result.make
      end

end -- class CLASSES_TREE_FACTORY
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
