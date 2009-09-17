class DIRECTORY
	--
	-- Tools for file-system directory handling.
	-- High-level facade for class BASIC_DIRECTORY.
	--

insert
	DIRECTORY_NOTATION_HANDLER

creation {ANY}
	make, scan, scan_with, scan_current_working_directory

feature {ANY}
	path: STRING
			-- The directory path in use (see `scan').

	last_scan_status: BOOLEAN
			-- True when last `scan' (or last `re_scan') has sucessfully
			-- read some existing directory using `path'.

feature {}
	basic_directory: BASIC_DIRECTORY
			-- Provide low level access to directories.

	name_list: FAST_ARRAY[STRING]
			-- Actual list of entries (files or subdirectories).

	make is
			-- Make a new not assigned one.
		do
			init(16)
		ensure
			is_empty
		end

	init (suggested_path_capacity: INTEGER) is
		do
			if name_list = Void then
				create name_list.with_capacity(32)
				create path.make(suggested_path_capacity)
			else
				name_list.clear_count
				path.clear_count
			end
		ensure
			is_empty
		end

feature {ANY} -- Disk access:
	scan (directory_path: STRING) is
			-- Try to scan some existing `directory_path' which is supposed to be a correctly spelled
			-- directory path. After this call the client is supposed to check `last_scan_status' to
			-- know. So, when `last_scan_status' is True after this call, the entire directory has been
			-- read. Also note that the given `directory_path' is always left unchanged, but in case of
			-- a successful `last_scan_status', the `path' attribute usually contains an absolute
			-- equivalent of the `directory_path'.
			--
			-- See also `scan_with', `scan_subdirectory', `scan_current_working_directory'.
		require
			not directory_path.is_empty
			directory_path /= path
		local
			entry: STRING
		do
			basic_directory.ensure_system_notation
			basic_directory.compute_absolute_file_path_with(directory_path)
			init(basic_directory.last_entry.count)
			path.copy(basic_directory.last_entry)
			basic_directory.connect_to(path)
			if basic_directory.is_connected then
				from
					basic_directory.read_entry
				until
					basic_directory.end_of_input
				loop
					entry := basic_directory.last_entry.twin
					name_list.add_last(entry)
					basic_directory.read_entry
				end
				basic_directory.disconnect
				last_scan_status := True
			else
				last_scan_status := False
			end
		ensure
			not last_scan_status implies is_empty
			path /= directory_path
		end

	scan_with (some_path: STRING) is
			-- Try to scan `Current' using `some_path' where `some_path' can be either a file path or
			-- an existing directory path.
			-- When `some_path' is a directory path, the behavior is equivalent to `scan'.
			-- When `some_path' is the path of an existing file, the directory which contains this
			-- file is scanned.
			--
			-- See also `scan', `scan_subdirectory', `scan_current_working_directory'.
		require
			not some_path.is_empty
		do
			scan(some_path)
			if not last_scan_status then
				basic_directory.connect_with(some_path)
				if basic_directory.is_connected then
					path.copy(basic_directory.last_entry)
					basic_directory.disconnect
					re_scan
				end
			end
		ensure
			not last_scan_status implies is_empty
		end

	scan_subdirectory (subdirectory: STRING) is
			-- Try to scan the given subdirectory of the current one. "." and ".." are not scanned.
			--
			-- See also `scan_with', `scan_parent_directory', `scan_current_working_directory'.
		require
			has(subdirectory)
		do
			last_scan_status := False
			basic_directory.compute_subdirectory_with(path, subdirectory)
			path_buffer.copy(basic_directory.last_entry)
			if path_buffer.count > 0 then
				scan(path_buffer)
			end
		end

	scan_parent_directory is
			-- Try to scan the parent directory, if it exists. If not the directory is unchanged.
		do
			last_scan_status := False
			basic_directory.compute_parent_directory_of(path)
			path_buffer.copy(basic_directory.last_entry)
			if path_buffer.count > 0 then
				scan(path_buffer)
			end
		end

	re_scan is
			-- Update internal information by reloading all the information about the `path' directory
			-- from the disk.
			-- Update `last_scan_status', `count', and all `item's.
			--
			-- See also `scan', `scan_subdirectory'.
		require
			path /= Void
		local
			entry: STRING; i: INTEGER
		do
			basic_directory.connect_to(path)
			if basic_directory.is_connected then
				from
					basic_directory.read_entry
				until
					basic_directory.end_of_input
				loop
					if name_list.valid_index(i) then
						entry := name_list.item(i)
						if not basic_directory.last_entry.is_equal(entry) then
							entry := basic_directory.last_entry.twin
							name_list.put(entry, i)
						end
					else
						entry := basic_directory.last_entry.twin
						name_list.add_last(entry)
					end
					basic_directory.read_entry
					i := i + 1
				end
				basic_directory.disconnect
				name_list.resize(i)
				last_scan_status := True
			else
				name_list.clear_count
				last_scan_status := False
			end
		ensure
			not last_scan_status implies is_empty
		end

	scan_current_working_directory is
		local
			entry: STRING
		do
			basic_directory.connect_to_current_working_directory
			if basic_directory.is_connected then
				init(basic_directory.last_entry.count)
				path.copy(basic_directory.last_entry)
				from
					basic_directory.read_entry
				until
					basic_directory.end_of_input
				loop
					entry := basic_directory.last_entry.twin
					name_list.add_last(entry)
					basic_directory.read_entry
				end
				basic_directory.disconnect
				last_scan_status := True
			else
				make
				last_scan_status := False
			end
		ensure
			not last_scan_status implies is_empty
		end

feature {ANY} -- Access:
	lower: INTEGER is 1
			-- Index of the first item.

	upper: INTEGER is
			-- Index of the last item.
		do
			Result := name_list.upper + 1
		end

	count: INTEGER is
			-- Number of items (files or directories) in Current.
		do
			Result := name_list.count
		ensure
			Result >= 0
		end

	is_empty: BOOLEAN is
		do
			Result := count = 0
		ensure
			definition: Result = (count = 0)
		end

	valid_index (index: INTEGER): BOOLEAN is
		do
			if index >= 1 then
				Result := index <= name_list.upper + 1
			end
		ensure
			Result = (lower <= index and index <= upper)
		end

	item, name (index: INTEGER): STRING is
			-- Return the name of entry (file or subdirectory) at `index'.
		require
			valid_index(index)
		do
			Result := name_list.item(index - 1)
		ensure
			has(Result)
		end

	has (entry_name: STRING): BOOLEAN is
			-- Does Current contain the `entry_name' (file or subdirectory) ?
		require
			not entry_name.is_empty
		local
			is_case_sensitive: BOOLEAN; entry: STRING; i: INTEGER
		do
			from
				is_case_sensitive := basic_directory.is_case_sensitive
				i := name_list.upper
			until
				Result or else i < name_list.lower
			loop
				entry := name_list.item(i)
				if is_case_sensitive then
					Result := entry.is_equal(entry_name)
				else
					Result := entry.same_as(entry_name)
				end
				i := i - 1
			end
		end

feature {ANY} -- File access:
	connect_to_file (file: FILE; filename: STRING) is
			-- Connect the `file' to the operating system file given by its `filename'.
		require
			not file.is_connected
		do
			basic_directory.compute_file_path_with(path, filename)
			path_buffer.copy(basic_directory.last_entry)
			file.connect_to(path_buffer)
		end

feature {}
	path_buffer: STRING is
		once
			create Result.make(16)
		end

invariant
	path /= Void

	name_list /= Void

end -- class DIRECTORY
