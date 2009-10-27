-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_CLUSTER

insert
	HASHABLE

create {LIBERTY_UNIVERSE}
	make

create {LIBERTY_CLUSTER}
	make_subcluster

feature {ANY}
	location: STRING

feature {ANY}
	hash_code: INTEGER is
		do
			Result := location.hash_code
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := other.location.is_equal(location)
		end

feature {LIBERTY_UNIVERSE}
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
	make (a_location: like location) is
		do
			location := a_location
			create_children
		ensure
			location = a_location
		end

	make_subcluster (a_location: like location; a_parent: like parent) is
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
		require
			dir.is_connected
		do
			if ft.is_file(location) then
				check
					-- location's basename is "loadpath.se"
				end
				Result := read_loadpath(location)
			else
				Result := scan_subdirectories
			end
		ensure
			Result /= Void
		end

	read_loadpath (loadpath: STRING): COLLECTION[STRING] is
		do
			tfr.connect_to(loadpath)
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
			subdirs /= Void
			loadpath_line /= Void
		local
			sublocation, loadpath_last: STRING
		do
			if not loadpath_line.is_empty and then not loadpath_line.has_prefix(once "--") then
				sublocation := location.twin
				loadpath_entry.make_from_string(loadpath_line)
				loadpath_last := loadpath_entry.last
				dir.ensure_system_notation
				dir.system_notation.from_notation(loadpath_notation, loadpath_line)
				dir.compute_subdirectory_with(sublocation, loadpath_line)
				if not ft.is_directory(sublocation) then
					dir.compute_parent_directory_of(loadpath_line)
					sublocation.copy(location)
					dir.compute_subdirectory_with(sublocation, loadpath_line)
					dir.compute_file_path_with(sublocation, loadpath_last)
					subdirs.add_last(sublocation)
				end
			end
		end

	scan_subdirectories: COLLECTION[STRING] is
		local
			sublocation: STRING
		do
			create {FAST_ARRAY[STRING]}Result.make(0)
			dir.connect_to(location)
			if dir.is_connected then
				from
					dir.read_entry
				until
					dir.end_of_input
				loop
					sublocation := location.twin
					dir.compute_subdirectory_with(sublocation, dir.last_entry)
					if not sublocation.is_empty and then ft.is_directory(sublocation) then
						Result.add_last(sublocation)
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
			create {FAST_ARRAY[LIBERTY_CLUSTER]}Result.with_capacity(subdirs.count)
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

end
