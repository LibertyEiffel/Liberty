-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CLASSES_TREE

inherit
   CLUSTERS
      redefine find_physical_cluster, cluster_named, clusters_of, cluster_by_directory_path, class_text_count, loaded_class_count,
         cluster_count, cluster_at, has_class, has_cluster, for_all, for_all_filtered, for_all_clusters, parse_include,
         pretty_in, view_in, get_started
      end

create {CLASSES_TREE_FACTORY}
   make

feature {ANY}
   to_string: STRING
      do
         Result := once ""
         Result.copy(path)
      end

feature {CLUSTERS}
   find_physical_cluster (system_path: STRING): CLUSTER
      local
         ft: FILE_TOOLS
      do
         if ft.same_physical_file(cluster.directory_path, system_path) then
            Result := cluster
         else
            Result := Precursor(system_path)
         end
      end

feature {ACE, CLASSES} -- Searching
   cluster_named (cluster_name: STRING): CLUSTER
      do
         if name = cluster_name then
            Result := cluster
         else
            Result := Precursor(cluster_name)
         end
      end

   clusters_of (class_name: CLASS_NAME; skip: CLASSES; clusters: FAST_ARRAY[CLUSTER]
      distances: FAST_ARRAY[INTEGER]; current_distance: INTEGER)
      local
         sorter: COLLECTION_SORTER[INTEGER]; i: INTEGER
      do
         if cluster.has(class_name.hashed_name) then
            if clusters.is_empty then
               clusters.add_last(cluster)
               distances.add_last(current_distance)
            else
               i := sorter.insert_index(distances, current_distance)
               clusters.add(cluster, i)
               distances.add(current_distance, i)
            end
         end
         Precursor(class_name, skip, clusters, distances, current_distance)
      end

   cluster_by_directory_path (a_path: STRING): CLUSTER
      do
         if path.is_equal(a_path) then
            Result := cluster
         else
            Result := Precursor(a_path)
         end
      end

   class_text_count: INTEGER
      do
         Result := cluster.class_text_count + Precursor
      end

   loaded_class_count: INTEGER
      do
         Result := cluster.loaded_class_count + Precursor
      end

   cluster_count: INTEGER
      do
         Result := 1 + Precursor
      end

   cluster_at (i: INTEGER): CLUSTER
      do
         if i = 1 then
            Result := cluster
         else
            Result := Precursor(i - 1)
         end
      end

   has_class (class_name: HASHED_STRING): BOOLEAN
      do
         Result := cluster.has(class_name) or else Precursor(class_name)
      end

   has_cluster (c: CLUSTER): BOOLEAN
      do
         Result := cluster = c or else Precursor(c)
      end

   for_all (action: PROCEDURE[TUPLE[CLASS_TEXT]])
      do
         cluster.for_all(action)
         Precursor(action)
      end

   for_all_filtered (name_guard: PREDICATE[TUPLE[CLASS_NAME]]; action: PROCEDURE[TUPLE[CLASS_TEXT]])
      do
         cluster.for_all_filtered(name_guard, action)
         Precursor(name_guard, action)
      end

   for_all_clusters (action: PROCEDURE[TUPLE[CLUSTER]])
      do
         action.call([cluster])
         Precursor(action)
      end

feature {ACE, CLUSTERS} -- Liberty Eiffel specific
   parse_include
      do
         cluster.include_parsing
         Precursor
      end

   pretty_in (txt: STRING)
      do
         cluster.pretty_in(txt)
         Precursor(txt)
      end

   view_in (msg: STRING)
      do
         cluster.view_in(msg)
         Precursor(msg)
      end

   get_started (level: INTEGER)
      do
         cluster.get_started(level)
         Precursor(level)
      end

feature {}
   cluster: CLUSTER
         -- The classes in that directory

feature {CLASSES_TREE_FACTORY}
   name: STRING

   path: STRING

feature {}
   make (a_distance: like distance; a_name: like name; a_path, a_system_path: like path)
      require
         a_distance > 0
         not a_name.is_empty
         string_aliaser.registered_one(a_name)
         not a_path.is_empty
         string_aliaser.registered_one(a_path)
         is_classes_path(a_path)
         classes_notation.is_absolute_path(a_path)
         a_system_path = Void implies (create {FILE_TOOLS}).is_directory(classes_path_to_system_path(a_path))
         a_system_path /= Void implies (create {FILE_TOOLS}).is_directory(a_system_path)
      local
         system_path: STRING
      do
         name := a_name
         path := a_path
         distance := a_distance
         create classeses.with_capacity(16)
         if a_system_path /= Void then
            system_path := a_system_path
         else
            system_path := string_aliaser.string(classes_path_to_system_path(a_path))
         end
         cluster := system_cluster(a_name, a_system_path)
      end

   show_name
      do
         echo.put_string(name)
         cluster.show
      end

feature {} -- Avoiding duplicating clusters when they are accessed via different paths:
   system_clusters: HASHED_DICTIONARY[CLUSTER, STRING]
      once
         create Result.make
      end

   system_cluster (a_name, a_system_path: STRING): CLUSTER
      require
         (create {FILE_TOOLS}).is_directory(a_system_path)
         not a_name.is_empty
         string_aliaser.registered_one(a_system_path)
      local
         i: INTEGER; ft: FILE_TOOLS
      do
         Result := system_clusters.reference_at(a_system_path)
         if Result = Void then
            from
               i := system_clusters.lower
            until
               Result /= Void or else i > system_clusters.upper
            loop
               check
                  system_clusters.item(i).directory_path = system_clusters.key(i)
               end
               if ft.same_physical_file(system_clusters.key(i), a_system_path) then
                  Result := system_clusters.item(i)
               end
               i := i + 1
            end
            if Result = Void then
               create Result.make(a_name, a_system_path, Current)
               system_clusters.add(Result, a_system_path)
            end
         end
      ensure
         (create {FILE_TOOLS}).same_physical_file(Result.directory_path, a_system_path)
      end

invariant
   distance > 0

end -- class CLASSES_TREE
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
