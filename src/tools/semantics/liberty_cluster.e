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

insert
	HASHABLE

create {LIBERTY_UNIVERSE}
	make_root

create {LIBERTY_CLUSTER}
	make_from_loadpath, make_from_etc

create {LIBERTY_CLASS_DESCRIPTOR}
	make_void

feature {ANY}
	name: FIXED_STRING
	locations: TRAVERSABLE[FIXED_STRING]

feature {ANY}
	hash_code: INTEGER

	is_equal (other: like Current): BOOLEAN is
		do
			Result := other.locations.is_equal(locations)
		end

	location_of (a_class_name: FIXED_STRING): FIXED_STRING is
		do
			Result := class_names.fast_reference_at(a_class_name)
			if Result = Void then
				Result := find(a_class_name).location_of(a_class_name)
			end
		end

feature {LIBERTY_UNIVERSE, LIBERTY_TYPE_RESOLVER}
	find (a_class_name: FIXED_STRING): LIBERTY_CLUSTER is
		local
			filename: STRING
		do
			filename := once ""
			filename.make_from_string(a_class_name)
			filename.to_lower
			filename.append(once ".e")
			Result := find_cluster(a_class_name, filename, Void)
			if Result = Void and then root /= Current then
				Result := root.find_cluster(a_class_name, filename, Current)
			end
		ensure
			Result.location_of(a_class_name) /= Void
		end

feature {LIBERTY_CLUSTER}
	find_cluster (a_class_name: FIXED_STRING; a_file_name: STRING; clip_child: LIBERTY_CLUSTER): LIBERTY_CLUSTER is
		local
			i: INTEGER
		do
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
				Result := find_child(a_class_name, a_file_name, clip_child)
			end
		end

feature {} -- find
	find_here (a_location: FIXED_STRING; a_file_name: STRING): BOOLEAN is
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

	find_child (a_class_name: FIXED_STRING; a_file_name: STRING; clip_child: LIBERTY_CLUSTER): LIBERTY_CLUSTER is
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
				if child /= clip_child then
					Result := child.find_cluster(a_class_name, a_file_name, clip_child)
				end
				i := i + 1
			end
		end

feature {}
	make_void is
		do
			name := "<Void>".intern
			create class_names.with_capacity(0)
			create {FAST_ARRAY[FIXED_STRING]} locations.with_capacity(0)
		end

	make_root is
		local
			c: FAST_ARRAY[LIBERTY_CLUSTER]
			etc: LIBERTY_ETC
		do
			name := "<Root>".intern
			create {FAST_ARRAY[FIXED_STRING]} locations.with_capacity(0)
			create class_names.with_capacity(7)
			root := Current
			create c.with_capacity(etc.clusters.count)
			children := c
			etc.clusters.do_all(agent add_if_root({LIBERTY_ETC_CLUSTER}, c))
		end

	add_if_root (a_etc: LIBERTY_ETC_CLUSTER; a_children: FAST_ARRAY[LIBERTY_CLUSTER]) is
		require
			root = Current
		do
			if a_etc.depth = 0 then
				check
					a_etc.cluster = Void
				end
				a_children.add_last(create {LIBERTY_CLUSTER}.make_from_etc(a_etc, Current))
			end
		end

	make_from_etc (a_etc: LIBERTY_ETC_CLUSTER; a_root: like root) is
		require
			a_etc /= Void
			a_root /= Void
			a_etc.cluster = Void
		local
			c: FAST_ARRAY[LIBERTY_CLUSTER]
		do
			a_etc.set_cluster(Current)
			name := a_etc.name
			locations := a_etc.locations
			create class_names.with_capacity(16)
			root := a_root
			create c.with_capacity(a_etc.needs.count)
			children := c
			a_etc.needs.do_all(agent add_needs({LIBERTY_ETC_NEEDS}, c))
		end

	add_needs (a_etc: LIBERTY_ETC_NEEDS; a_children: FAST_ARRAY[LIBERTY_CLUSTER]) is
		do
			if a_etc.cluster.cluster /= Void then
				a_children.add_last(a_etc.cluster.cluster)
			else
				a_children.add_last(create {LIBERTY_CLUSTER}.make_from_etc(a_etc.cluster, Current))
			end
		end

	make_from_loadpath (a_loadpath: STRING; a_root: like root) is
		require
			a_loadpath /= Void
			a_root /= Void
		local
			location_directory: STRING
		do
			if ft.is_directory(a_loadpath) then
				std_error.put_line("*** Error: not a loadpath: " + a_loadpath)
				die_with_code(1)
			end

			root := a_root
			name := a_loadpath.intern
			dir.compute_parent_directory_of(a_loadpath)
			if dir.last_entry.is_empty then
				location_directory := dir.current_working_directory.out
			else
				location_directory := dir.last_entry.twin
			end
			read_loadpath(a_loadpath, location_directory)
			create class_names.with_capacity(16)
		ensure
			root = a_root
		end

	read_loadpath (a_loadpath, a_location_directory: STRING) is
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

	process_loadpath (a_locations: FAST_ARRAY[FIXED_STRING]; a_children: FAST_ARRAY[LIBERTY_CLUSTER]; a_location_directory, loadpath_line: STRING) is
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
					a_children.add_last(create {LIBERTY_CLUSTER}.make_from_loadpath(sublocation, root));
				else
					std_error.put_line(once "*** Warning: ignored location: " + sublocation)
				end
			end
		end

	dir: BASIC_DIRECTORY

	tfr: TEXT_FILE_READ is
		once
			create Result.make
		end

	ft: FILE_TOOLS

	children: TRAVERSABLE[LIBERTY_CLUSTER]
	class_names: HASHED_DICTIONARY[FIXED_STRING, FIXED_STRING]
	root: LIBERTY_CLUSTER

	loadpath_entry: POSIX_PATH_NAME is
		once
			create Result.make_empty
		end

	loadpath_notation: UNIX_DIRECTORY_NOTATION is
		once
			create Result
		end

	logging: LOGGING
	env: LIBERTY_ENVIRONMENT

invariant
	not name.is_empty
	class_names /= Void
	locations.for_all(agent ft.is_directory)

end
