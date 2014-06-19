-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_CLUSTER
   --
   -- Clustering rules:
   -- A given directory is a cluster if:
   --
   -- 1. It contains a cluster.rc file.
   -- In that case, that file describes the cluster, giving it a name, a version number, dependencies and
   -- default options (assertion level, debug...)
   -- If the directory also contains a loadpath.se file then that file is used to describe which directories
   -- are part of the cluster itself (see below).
   --
   -- 2. It contains a loadpath.se file.
   -- Each line of the loadpath is a path to either a cluster.rc file, a loadpath.se file, or a directory. In
   -- the latter case, the clustering rules apply. If the given directory contains neither a cluster.rc nor a
   -- loadpath.se file, the directory is considered to belong to the cluster.
   --

insert
   HASHABLE
   LOGGING
      undefine
         is_equal
      end

create {LIBERTY_UNIVERSE}
   make_root

create {LIBERTY_CLUSTER}
   make_from_loadpath, make_from_etc

create {LIBERTY_CLASS_DESCRIPTOR}
   make_void

feature {ANY}
   name: FIXED_STRING
   locations: TRAVERSABLE[FIXED_STRING]
   depth: INTEGER

feature {ANY}
   hash_code: INTEGER

   is_equal (other: like Current): BOOLEAN
      do
         Result := other.locations.is_equal(locations)
      end

   location_of (a_class_name: FIXED_STRING): FIXED_STRING
      do
         Result := class_names.fast_reference_at(a_class_name)
         -- if Result = Void then
         --    Result := find(a_class_name).location_of(a_class_name)
         -- end
      end

   has_parent (a_cluster: LIBERTY_CLUSTER): BOOLEAN
      do
         Result := a_cluster = Current or else (Current /= root and then parent.has_parent(a_cluster))
      end

feature {LIBERTY_UNIVERSE, LIBERTY_TYPE_RESOLVER}
   find (a_class_name: FIXED_STRING): LIBERTY_CLUSTER
      local
         filename: STRING
         new_mark: like find_mark
      do
         filename := once ""
         filename.make_from_string(a_class_name)
         filename.to_lower
         filename.append(once ".e")
         find_mark_counter.increment
         new_mark := find_mark_counter.value
         Result := find_cluster(a_class_name, filename, new_mark)
         if Result = Void and then root /= Current then
            Result := root.find_cluster(a_class_name, filename, new_mark)
         end
      ensure
         Result /= Void implies Result.location_of(a_class_name) /= Void
      end

feature {LIBERTY_CLUSTER}
   find_cluster (a_class_name: FIXED_STRING; a_file_name: STRING; new_mark: like find_mark): LIBERTY_CLUSTER
      local
         i: INTEGER
      do
         if find_mark < new_mark then
            find_mark := new_mark
            from
               i := locations.lower
            until
               Result /= Void or else i > locations.upper
            loop
               if find_here(locations.item(i), a_file_name) then
                  class_names.put(locations.item(i), a_class_name)
                  Result := Current
               end
               i := i + 1
            end
            if Result = Void then
               Result := find_child(a_class_name, a_file_name, new_mark)
            end
         end
      end

   log_cluster_tree (tab: INTEGER)
      require
         tab >= 0
      local
         info: OUTPUT_STREAM; i: INTEGER
      do
         info := log.info
         from
            i := 0
         until
            i = tab
         loop
            info.put_string(once " |  ")
            i := i + 1
         end
         info.put_string(once " +- (")
         info.put_integer(depth)
         info.put_string(once ") ")
         if logged then
            info.put_string(name)
            info.put_line(once " ...")
         else
            info.put_line(name)
            children.do_all(agent {LIBERTY_CLUSTER}.log_cluster_tree(tab + 1))
            logged := True
         end
      ensure
         logged
      end

feature {} -- find
   find_here (a_location: FIXED_STRING; a_file_name: STRING): BOOLEAN
      local
         here: STRING
      do
         here := once ""
         here.make_from_string(a_location)
         dir.connect_to(here)
         if dir.is_connected then
            from
               dir.read_entry
            until
               Result or else dir.end_of_input
            loop
               if dir.last_entry.is_equal(a_file_name) then
                  Result := True
               end
               dir.read_entry
            end
            dir.disconnect
         end
      end

   find_child (a_class_name: FIXED_STRING; a_file_name: STRING; new_mark: like find_mark): LIBERTY_CLUSTER
      local
         child: LIBERTY_CLUSTER
         i: INTEGER
      do
         from
            i := children.lower
         until
            Result /= Void or else i > children.upper
         loop
            child := children.item(i)
            if child.depth >= depth then
               Result := child.find_cluster(a_class_name, a_file_name, new_mark)
            end
            i := i + 1
         end
      end

feature {}
   make_void
      do
         name := "<Void>".intern
         create class_names.with_capacity(0)
         create {FAST_ARRAY[FIXED_STRING]} locations.with_capacity(0)
         depth := -1
      end

   make_root
      local
         c: FAST_ARRAY[LIBERTY_CLUSTER]
         etc: LIBERTY_ETC
      do
         name := "<Root>".intern
         create {FAST_ARRAY[FIXED_STRING]} locations.with_capacity(0)
         create class_names.with_capacity(7)
         root := Current
         parent := Current
         create c.with_capacity(etc.clusters.count)
         children := c
         etc.clusters.do_all(agent add_if_root({LIBERTY_ETC_CLUSTER}, c))
         log_cluster_tree(0)
      ensure
         depth = 0
      end

   add_if_root (a_etc: LIBERTY_ETC_CLUSTER; a_children: FAST_ARRAY[LIBERTY_CLUSTER])
      require
         is_root: root = Current
         in_other_words: depth = 0
      do
         if a_etc.depth = 0 and then a_etc.cluster = Void then
            log.trace.put_string(name)
            log.trace.put_string(once ": adding root cluster from etc ")
            log.trace.put_line(a_etc.name)
            a_children.add_last(create {LIBERTY_CLUSTER}.make_from_etc(a_etc, Current, Current))
         end
      end

   make_from_etc (a_etc: LIBERTY_ETC_CLUSTER; a_parent: like parent; a_root: like root)
      require
         a_etc /= Void
         a_root /= Void
         a_etc.cluster = Void
         a_root.depth = 0
         a_parent /= Void
      local
         c: FAST_ARRAY[LIBERTY_CLUSTER]
      do
         depth := a_parent.depth + 1
         parent := a_parent
         name := a_etc.name
         root := a_root
         locations := a_etc.locations
         create class_names.with_capacity(16)
         create c.with_capacity(a_etc.needs.count)
         children := c
         log.info.put_string(once "Cluster (")
         log.info.put_integer(depth)
         log.info.put_string(once ") ")
         log.info.put_string(name)
         log.info.put_string(once ": ")
         log.info.put_line(locations.out)
         a_etc.set_cluster(Current)
         a_etc.needs.do_all(agent add_needs({LIBERTY_ETC_NEEDS}, c, a_root))
      ensure
         root = a_root
         parent = a_parent
         depth = a_parent.depth + 1
         locations = a_etc.locations
      end

   add_needs (a_etc: LIBERTY_ETC_NEEDS; a_children: FAST_ARRAY[LIBERTY_CLUSTER]; a_root: like root)
      require
         a_root.depth = 0
      do
         if a_etc.cluster.cluster /= Void then
            if not has_parent(a_etc.cluster.cluster) then
               a_children.add_last(a_etc.cluster.cluster)
            end
         else
            log.trace.put_string(name)
            log.trace.put_string(once ": adding child cluster from etc ")
            log.trace.put_line(a_etc.cluster.name)
            a_children.add_last(create {LIBERTY_CLUSTER}.make_from_etc(a_etc.cluster, Current, root))
         end
      end

   make_from_loadpath (a_loadpath: STRING; a_parent: like parent; a_root: like root)
      require
         a_loadpath /= Void
         a_root.depth = 0
         a_parent /= Void
      local
         location_directory: STRING
      do
         log.warning.put_line(once "Effective clusters should not be created directly from classpath.se anymore! (only master clusters should)")

         if not ft.is_file(a_loadpath) then
            std_error.put_line("*** Error: not a loadpath: " + a_loadpath)
            die_with_code(1)
         end

         depth := a_parent.depth + 1
         parent := a_parent
         root := a_root
         name := a_loadpath.intern
         dir.compute_parent_directory_of(a_loadpath)
         if dir.last_entry.is_empty then
            location_directory := dir.current_working_directory.out
         else
            location_directory := dir.last_entry.twin
         end
         create class_names.with_capacity(16)
         log.info.put_string(once "Cluster (")
         log.info.put_integer(depth)
         log.info.put_string(once ") ")
         log.info.put_string(name)
         log.info.put_string(once ": ")
         log.info.put_line(locations.out)
         read_loadpath(a_loadpath, location_directory)
      ensure
         root = a_root
         depth = a_parent.depth + 1
         parent = a_parent
      end

   read_loadpath (a_loadpath, a_location_directory: STRING)
      require
         root /= Void
         ft.is_file(a_loadpath)
      local
         loc: FAST_ARRAY[FIXED_STRING]
         c: FAST_ARRAY[LIBERTY_CLUSTER]
      do
         create loc.with_capacity(4)
         create c.with_capacity(2)
         tfr.connect_to(a_loadpath)
         if tfr.is_connected then
            from
               tfr.read_line
            until
               tfr.end_of_input
            loop
               env.substitute(tfr.last_string)
               process_loadpath(loc, c, a_location_directory, tfr.last_string)
               tfr.read_line
            end
            env.substitute(tfr.last_string)
            process_loadpath(loc, c, a_location_directory, tfr.last_string)
            tfr.disconnect
         end
         locations := loc
         children := c
      end

   process_loadpath (a_locations: FAST_ARRAY[FIXED_STRING]; a_children: FAST_ARRAY[LIBERTY_CLUSTER]; a_location_directory, loadpath_line: STRING)
      require
         a_locations /= Void
         a_children /= Void
         loadpath_line /= Void
         root /= Void
      local
         sublocation: STRING
      do
         if not loadpath_line.is_empty and then not loadpath_line.has_prefix(once "--") then
            sublocation := ""
            dir.ensure_system_notation
            dir.system_notation.from_notation(loadpath_notation, loadpath_line)

            if dir.system_notation.is_absolute_path(loadpath_line) then
               sublocation.copy(loadpath_line)
            else
               dir.compute_subdirectory_with(a_location_directory, loadpath_line)
               if dir.last_entry.is_empty then
                  --| *** TODO error: the loadpath line does not contain a valid path
                  not_yet_implemented
               end
               sublocation.copy(dir.last_entry)
            end
            if ft.is_directory(sublocation) then
               a_locations.add_last(sublocation.intern)
            elseif ft.is_file(sublocation) then
               log.trace.put_string(name)
               log.trace.put_string(once ": adding child cluster from loadpath ")
               log.trace.put_line(sublocation)
               a_children.add_last(create {LIBERTY_CLUSTER}.make_from_loadpath(sublocation, Current, root));
            else
               std_error.put_line(once "*** Warning: ignored location: " + sublocation)
            end
         end
      end

   dir: BASIC_DIRECTORY

   tfr: TEXT_FILE_READ
      once
         create Result.make
      end

   ft: FILE_TOOLS

   children: TRAVERSABLE[LIBERTY_CLUSTER]
   class_names: HASHED_DICTIONARY[FIXED_STRING, FIXED_STRING]
   root: LIBERTY_CLUSTER
   parent: LIBERTY_CLUSTER

   loadpath_entry: POSIX_PATH_NAME
      once
         create Result.make_empty
      end

   loadpath_notation: UNIX_DIRECTORY_NOTATION
      once
         create Result
      end

   env: LIBERTY_ENVIRONMENT
   find_mark: INTEGER
   logged: BOOLEAN

   find_mark_counter: COUNTER
      once
         create Result
      end

invariant
   not name.is_empty
   class_names /= Void
   locations.for_all(agent ft.is_directory)
   root.depth = 0
   depth = 0 implies root = Current
   parent /= Void
   Current = root implies Current = parent
   depth >= 0

end
