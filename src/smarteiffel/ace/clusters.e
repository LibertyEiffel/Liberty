-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class CLUSTERS

inherit
   CLASSES

feature {CLUSTERS}
   find_physical_cluster (system_path: STRING): CLUSTER
      local
         i: INTEGER
      do
         from
            i := classeses.lower
         until
            Result /= Void or else i > classeses.upper
         loop
            Result := classeses.item(i).find_physical_cluster(system_path)
            i := i + 1
         end
      end

feature {} -- Tree handling
   add_classes (a_classes: CLASSES)
      -- Object sin: knowing your heirs -- here, LOADPATH and UNIVERSE
      require
         a_classes.parent = Void
      local
         i: INTEGER; done: BOOLEAN
      do
         from
            i := classeses.lower
         until
            done or else i > classeses.upper
         loop
            if classeses.item(i).distance > a_classes.distance then
               classeses.add(a_classes, i)
               done := True
            end
            i := i + 1
         end
         if not done then
            classeses.add_last(a_classes)
         end
         a_classes.set_parent(Current)
      ensure
         a_classes.parent = Current
         classeses.fast_has(a_classes)
      end

feature {ACE, CLASSES} -- Searching
   cluster_named (cluster_name: STRING): CLUSTER
      local
         i: INTEGER
      do
         from
            i := classeses.lower
         until
            Result /= Void or else i > classeses.upper
         loop
            Result := classeses.item(i).cluster_named(cluster_name)
            i := i + 1
         end
      end

   clusters_of (class_name: CLASS_NAME; skip: CLASSES; clusters: FAST_ARRAY[CLUSTER]
      distances: FAST_ARRAY[INTEGER]; current_distance: INTEGER)
      local
         i, child_distance: INTEGER; c: CLASSES
      do
         from
            child_distance := current_distance + distance
            i := classeses.lower
         until
            i > classeses.upper
         loop
            c := classeses.item(i)
            if c /= skip then
               c.clusters_of(class_name, skip, clusters, distances, child_distance)
            end
            i := i + 1
         end
      end

   cluster_by_directory_path (path: STRING): CLUSTER
      local
         i: INTEGER
      do
         from
            i := classeses.lower
         until
            Result /= Void or else i > classeses.upper
         loop
            Result := classeses.item(i).cluster_by_directory_path(path)
            i := i + 1
         end
      end

   class_text_count: INTEGER
      local
         i: INTEGER
      do
         from
            i := classeses.lower
         until
            i > classeses.upper
         loop
            Result := Result + classeses.item(i).class_text_count
            i := i + 1
         end
      end

   loaded_class_count: INTEGER
      local
         i: INTEGER
      do
         from
            i := classeses.lower
         until
            i > classeses.upper
         loop
            Result := Result + classeses.item(i).loaded_class_count
            i := i + 1
         end
      end

   cluster_count: INTEGER
      local
         i: INTEGER
      do
         from
            i := classeses.lower
         until
            i > classeses.upper
         loop
            Result := Result + classeses.item(i).cluster_count
            i := i + 1
         end
      end

   has_class (class_name: HASHED_STRING): BOOLEAN
      local
         i: INTEGER
      do
         from
            i := classeses.lower
         until
            Result or else i > classeses.upper
         loop
            Result := classeses.item(i).has_class(class_name)
            i := i + 1
         end
      end

   has_cluster (c: CLUSTER): BOOLEAN
      local
         i: INTEGER
      do
         from
            i := classeses.lower
         until
            Result or else i > classeses.upper
         loop
            Result := classeses.item(i).has_cluster(c)
            i := i + 1
         end
      end

   for_all (action: PROCEDURE[TUPLE[CLASS_TEXT]])
      local
         i: INTEGER
      do
         from
            i := classeses.lower
         until
            i > classeses.upper
         loop
            classeses.item(i).for_all(action)
            i := i + 1
         end
      end

   for_all_filtered (name_guard: PREDICATE[TUPLE[CLASS_NAME]]; action: PROCEDURE[TUPLE[CLASS_TEXT]])
      local
         i: INTEGER
      do
         from
            i := classeses.lower
         until
            i > classeses.upper
         loop
            classeses.item(i).for_all_filtered(name_guard, action)
            i := i + 1
         end
      end

   for_all_clusters (action: PROCEDURE[TUPLE[CLUSTER]])
      local
         i: INTEGER
      do
         from
            i := classeses.lower
         until
            i > classeses.upper
         loop
            classeses.item(i).for_all_clusters(action)
            i := i + 1
         end
      end

   cluster_at (index: INTEGER): CLUSTER
      local
         i, n, c: INTEGER; classes: CLASSES
      do
         from
            i := classeses.lower
            n := index
         variant
            n
         until
            Result /= Void or else i > classeses.upper
         loop
            classes := classeses.item(i)
            c := classes.cluster_count
            if n <= c then
               Result := classes.cluster_at(n)
               n := 0
            else
               n := n - c
            end
            i := i + 1
         end
      end

feature {ACE, CLUSTERS} -- Liberty Eiffel specific
   parse_include
      local
         i: INTEGER
      do
         from
            i := classeses.lower
         until
            i > classeses.upper
         loop
            classeses.item(i).parse_include
            i := i + 1
         end
      end

   pretty_in (txt: STRING)
      local
         i: INTEGER
      do
         from
            i := classeses.lower
         until
            i > classeses.upper
         loop
            classeses.item(i).pretty_in(txt)
            i := i + 1
         end
      end

   view_in (msg: STRING)
      local
         i: INTEGER
      do
         from
            i := classeses.lower
         until
            i > classeses.upper
         loop
            classeses.item(i).view_in(msg)
            i := i + 1
         end
      end

   get_started (level: INTEGER)
      local
         i: INTEGER
      do
         from
            i := classeses.lower
         until
            i > classeses.upper
         loop
            classeses.item(i).get_started(level)
            i := i + 1
         end
      end

   show (tab: INTEGER)
      local
         i, t: INTEGER
      do
         show_tabs(tab)
         show_name
         if distance > 0 then
            echo.put_string(once " (+")
            echo.put_integer(distance)
            echo.put_string(once ")%N")
         else
            echo.put_new_line
         end
         from
            t := tab + 1
            i := classeses.lower
         until
            i > classeses.upper
         loop
            classeses.item(i).show(t)
            i := i + 1
         end
      end

feature {}
   classeses: FAST_ARRAY[CLASSES]
         -- Sorted by growing distance. Pretty name ain't it :-)

   show_name
      deferred
      end

invariant
   classeses /= Void

end -- class CLUSTERS
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
