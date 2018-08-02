-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class UNIVERSE

inherit
   CLUSTERS
      undefine is_equal
      end

insert
   SINGLETON

create {CLASSES_TREE_FACTORY}
   make

feature {ANY}
   to_string: STRING "Universe"

feature {ACE}
   add_entry (a_distance: INTEGER; system_path, path, name: STRING; discard_silently: BOOLEAN)
      require
         a_distance > 0
         name /= Void
         string_aliaser.registered_one(name)
         path /= Void
         is_classes_path(path)
         string_aliaser.registered_one(path)
         system_path /= Void implies is_system_path(system_path)
      local
         factory: CLASSES_TREE_FACTORY; classes: CLASSES
      do
         classes := factory.classes(a_distance, system_path, path, name, Void, discard_silently)
         if classes /= Void and then classes.parent = Void then
            add_classes(classes)
         end
      end

feature {CLASSES_TREE_FACTORY}
   has_physical_cluster (system_path: STRING): BOOLEAN
      do
         Result := find_physical_cluster(system_path) /= Void
      end

feature {}
   make
      do
         create classeses.with_capacity(4)
      end

   show_name
      do
         echo.put_string(once "<Universe>")
      end

invariant
   distance = 0
   parent = Void

end -- class UNIVERSE
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
