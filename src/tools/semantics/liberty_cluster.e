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
	make

create {LIBERTY_CLUSTER}
	make_subcluster

create {LIBERTY_CLASS_DESCRIPTOR}
	make_void

feature {ANY}
	location: STRING

feature {}
	location_directory: STRING

feature {ANY}
	hash_code: INTEGER is
		do
			Result := location.hash_code
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := other.location.is_equal(location)
		end

feature {LIBERTY_UNIVERSE, LIBERTY_TYPE_RESOLVER}
	find (a_class_name: STRING): LIBERTY_CLUSTER is
		local
			filename: STRING
		do
			filename := once ""
			filename.copy(a_class_name)
			filename.to_lower
			filename.append(once ".e")
			Result := find_file(filename, Void, True)
		end

feature {LIBERTY_CLUSTER}
	find_file (a_file_name: STRING; clip_child: LIBERTY_CLUSTER; try_up: BOOLEAN): LIBERTY_CLUSTER is
		do
			Result := find_here(a_file_name)
			if Result = Void then
				Result := find_child(a_file_name, clip_child)
			end
			if Result = Void and then try_up and then parent /= Void then
				Result := parent.find_file(a_file_name, Current, try_up)
			end
		end

feature {} -- find
	find_here (a_file_name: STRING): LIBERTY_CLUSTER is
		do
			dir.connect_to(location)
			if dir.is_connected then
				from
					dir.read_entry
				until
					Result /= Void or else dir.end_of_input
				loop
					if dir.last_entry.is_equal(a_file_name) then
						Result := Current
					end
					dir.read_entry
				end
				dir.disconnect
			end
		end

	find_child (a_file_name: STRING; clip_child: LIBERTY_CLUSTER): LIBERTY_CLUSTER is
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
					Result := child.find_file(a_file_name, Void, False)
				end
				i := i + 1
			end
		end

feature {}
	make_void is
		do
			location := "<Void>"
		end

	make (a_location: like location) is
		require
			a_location /= Void
		do
			logging.trace.put_string("Cluster: ")
			logging.trace.put_line(a_location)
			location := a_location
			if ft.is_directory(a_location) then
				location_directory := a_location
			else
				dir.compute_parent_directory_of(location)
				if dir.last_entry.is_empty then
					location_directory := dir.current_working_directory.out
				else
					location_directory := dir.last_entry.twin
				end
			end
			create_children
		ensure
			location = a_location
		end

	make_subcluster (a_location: like location; a_parent: like parent) is
		require
			a_location /= Void
			a_parent /= Void
		do
			make(a_location)
			parent := a_parent
		ensure
			location = a_location
			parent = a_parent
		end

	create_children is
		local
			subdirs: like subdirectories
		do
			subdirs := subdirectories
			-- only now can we create subclusters
			-- (otherwise there would be a clash while using the shared `dir' and `tfr' instances)
			children := subclusters(subdirs)
		end

	subdirectories: TRAVERSABLE[STRING] is
		do
			if location = location_directory then
				check
					ft.is_directory(location)
				end
				Result := scan_subdirectories
			else
				check
					ft.is_file(location)
					-- location's basename is "loadpath.se"
				end
				Result := read_loadpath
			end
		ensure
			Result /= Void
		end

	read_loadpath: COLLECTION[STRING] is
		require
			ft.is_file(location)
		do
			create {FAST_ARRAY[STRING]} Result.with_capacity(4)
			tfr.connect_to(location)
			if tfr.is_connected then
				from
					tfr.read_line
				until
					tfr.end_of_input
				loop
					process_loadpath(Result, tfr.last_string)
					tfr.read_line
				end
				process_loadpath(Result, tfr.last_string)
				tfr.disconnect
			end
		end

	process_loadpath (subdirs: like read_loadpath; loadpath_line: STRING) is
		require
			ft.is_file(location)
			subdirs /= Void
			loadpath_line /= Void
		local
			sublocation, loadpath_last: STRING
		do
			if not loadpath_line.is_empty and then not loadpath_line.has_prefix(once "--") then
				sublocation := ""
				dir.ensure_system_notation
				dir.system_notation.from_notation(loadpath_notation, loadpath_line)

				dir.compute_subdirectory_with(location_directory, loadpath_line)
				if dir.last_entry.is_empty then
					--| *** TODO error: the loadpath line does not contain a valid path
					not_yet_implemented
				end
				sublocation.copy(dir.last_entry)
				if not ft.is_directory(sublocation) then
					loadpath_entry.make_from_string(loadpath_line)
					loadpath_last := loadpath_entry.last

					dir.compute_parent_directory_of(loadpath_line)
					loadpath_line.copy(dir.last_entry)
					dir.compute_subdirectory_with(location_directory, loadpath_line)
					check
						not dir.last_entry.is_empty
					end
					sublocation.copy(dir.last_entry)
					dir.compute_file_path_with(sublocation, loadpath_last)
					check
						not dir.last_entry.is_empty
					end
					sublocation.copy(dir.last_entry)
				end
				subdirs.add_last(sublocation)
			end
		end

	scan_subdirectories: COLLECTION[STRING] is
		require
			ft.is_directory(location)
			in_other_words: location = location_directory
		local
			sublocation, entry: STRING
		do
			create {FAST_ARRAY[STRING]} Result.make(0)
			dir.connect_to(location)
			if dir.is_connected then
				entry := once ""
				from
					dir.read_entry
				until
					dir.end_of_input
				loop
					inspect
						dir.last_entry
					when ".", ".." then
						-- forget those
					else
						sublocation := location_directory.twin
						entry.copy(dir.last_entry)
						dir.compute_subdirectory_with(sublocation, entry)
						sublocation.copy(dir.last_entry)
						if not sublocation.is_empty and then ft.is_directory(sublocation) then
							Result.add_last(sublocation)
						end
					end
					dir.read_entry
				end
				dir.disconnect
			end
		end

	subclusters (subdirs: like subdirectories): COLLECTION[LIBERTY_CLUSTER] is
		require
			subdirs /= Void
		local
			i: INTEGER
		do
			create {FAST_ARRAY[LIBERTY_CLUSTER]} Result.with_capacity(subdirs.count)
			from
				i := subdirs.lower
			until
				i > subdirs.upper
			loop
				Result.add_last(create {LIBERTY_CLUSTER}.make_subcluster(subdirs.item(i), Current))
				i := i + 1
			end
		end

	dir: BASIC_DIRECTORY

	tfr: TEXT_FILE_READ is
		once
			create Result.make
		end

	ft: FILE_TOOLS

	children: TRAVERSABLE[LIBERTY_CLUSTER]
	parent: LIBERTY_CLUSTER

	loadpath_entry: POSIX_PATH_NAME is
		once
			create Result.make_empty
		end

	loadpath_notation: UNIX_DIRECTORY_NOTATION is
		once
			create Result
		end

	logging: LOGGING

invariant
	ft.is_directory(location) implies location_directory = location

end
