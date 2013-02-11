-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class CLASSES

insert
   GLOBALS

feature {ANY}
   parent: CLUSTERS
         -- Void only for Universe

   distance: INTEGER
         -- Distance to the parent

   classes_notation: UNIX_DIRECTORY_NOTATION is
         -- Cluster paths are UNIX-like
      once
         create Result
      end

   to_string: STRING is
      deferred
      end

feature {CLUSTERS} -- Tree handling
   set_parent (a_parent: like parent) is
      do
         parent := a_parent
      ensure
         parent = a_parent
      end

feature {CLUSTERS}
   find_physical_cluster (system_path: STRING): CLUSTER is
      deferred
      end

feature {ACE, CLASSES} -- Searching
   cluster_named (cluster_name: STRING): CLUSTER is
      require
         not cluster_name.is_empty
         string_aliaser.registered_one(cluster_name)
      deferred
      ensure
         Result /= Void implies Result.name.is_equal(cluster_name)
      end

   clusters_of (class_name: CLASS_NAME; report_error: BOOLEAN; skip: CLASSES; clusters: FAST_ARRAY[CLUSTER]
      distances: FAST_ARRAY[INTEGER]; current_distance: INTEGER) is
      require
         coherent: clusters.count = distances.count
         obviously: skip /= Current
      deferred
      ensure
         grow_only: clusters.count >= old clusters.count
         still_coherent: clusters.count = distances.count
         all_kept: (old clusters.twin).for_all(agent clusters.fast_has(?))
      end

   cluster_by_directory_path (path: STRING): CLUSTER is
      require
         not path.is_empty
      deferred
      end

   class_text_count: INTEGER is
      deferred
      end

   loaded_class_count: INTEGER is
      deferred
      end

   cluster_count: INTEGER is
      deferred
      end

   cluster_at (i: INTEGER): CLUSTER is
      require
         i.in_range(1, cluster_count)
      deferred
      end

   has_class (class_name: HASHED_STRING): BOOLEAN is
      deferred
      end

   has_cluster (c: CLUSTER): BOOLEAN is
      require
         c /= Void
      deferred
      end

   for_all (action: PROCEDURE[TUPLE[CLASS_TEXT]]) is
      deferred
      end

   for_all_clusters (action: PROCEDURE[TUPLE[CLUSTER]]) is
      deferred
      end

feature {ACE, CLUSTERS} -- Liberty Eiffel specific
   parse_include is
         -- Look for some class(es) to be loaded first because of some "include" option.
      require
         using_ace_file: ace.file_path /= Void
      deferred
      end

   get_started (level: INTEGER) is
      deferred
      end

   pretty_in (txt: STRING) is
         -- When pretty-printing the ACE file
      require
         txt /= Void
      deferred
      end

   view_in (msg: STRING) is
         -- Append in `msg' a viewable version of the Current as well as some other informations to help the
         -- user to fix the problem.
      require
         msg /= Void
      deferred
      end

   show (tab: INTEGER) is
         -- Tree display in verbose mode
      deferred
      end

feature {ACE} -- Path transformation
   is_classes_path (path: STRING): BOOLEAN is
      do
         Result := classes_notation.is_valid_path(path)
      end

   is_system_path (path: STRING): BOOLEAN is
      do
         Result := system_notation.is_valid_path(path)
      end

   system_notation: DIRECTORY_NOTATION is
      once
         basic_directory.ensure_system_notation
         Result := basic_directory.system_notation
      ensure
         Result /= Void
      end

   classes_path_to_system_path (classes_path: STRING): STRING is
      require
         not classes_path.is_empty
         is_classes_path(classes_path)
      do
         Result := once ""
         Result.copy(classes_path)
         system_notation.from_notation(classes_notation, Result)
      ensure
         not Result.is_empty
         is_system_path(Result)
         classes_notation.is_absolute_path(classes_path) implies system_notation.is_absolute_path(Result)
      end

   system_path_to_classes_path (system_path: STRING): STRING is
      require
         not system_path.is_empty
         is_system_path(system_path)
      do
         Result := once ""
         if system_notation.is_absolute_path(system_path) then
            Result.copy(system_path)
         else
            basic_directory.connect_to_current_working_directory
            if basic_directory.is_connected then
               Result.copy(basic_directory.last_entry)
               basic_directory.disconnect
               system_notation.to_subpath_with(Result, system_path)
            else
               -- give up
               Result.copy(system_path)
            end
         end
         classes_notation.from_notation(system_notation, Result)
      ensure
         not Result.is_empty
         is_classes_path(Result)
         system_notation.is_absolute_path(system_path) implies classes_notation.is_absolute_path(Result)
      end

feature {}
   show_tabs (tabs: INTEGER) is
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > tabs
         loop
            echo.put_string(once " | ")
            i := i + 1
         end
         echo.put_string(once " + ")
      end

   basic_directory: BASIC_DIRECTORY

invariant
   distance >= 0

end -- class CLASSES
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
