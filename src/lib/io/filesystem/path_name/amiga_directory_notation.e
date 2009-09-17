class AMIGA_DIRECTORY_NOTATION
	-- The Amiga file path notation looks like:
	--   DEV:SmartEiffel/sys/system.se

inherit
	DIRECTORY_NOTATION

feature {ANY}
	is_current_directory (path: STRING): BOOLEAN is
		do
			not_yet_implemented
		end

	is_parent_directory (path: STRING): BOOLEAN is
		do
			not_yet_implemented
		end

	to_parent_directory (some_path: STRING) is
		do
			if some_path.last = ':' then
				some_path.clear_count
			else
				from
					some_path.remove_last
				until
					some_path.is_empty or else some_path.last = '/' or else some_path.last = ':'
				loop
					some_path.remove_last
				end
			end
			if not some_path.is_empty and then (some_path.last /= '/' and then some_path.last /= ':') then
				some_path.extend('/')
			end
		end

	to_subdirectory_with (parent_path, entry_name: STRING) is
		do
			inspect
				parent_path.last
			when '/' then
				if entry_name.first = '/' then
					parent_path.remove_last
				end
			when ':' then
			else
				if entry_name.first /= '/' then
					parent_path.add_last('/')
				end
			end
			parent_path.append(entry_name)
			parent_path.extend_unless('/')
		end

	to_file_path_with (parent_path, file_name: STRING) is
		do
			inspect
				parent_path.last
			when ':' then
			when '/' then
				if file_name.first = '/' then
					parent_path.remove_last
				end
			else
				if file_name.first /= '/' then
					parent_path.extend('/')
				end
			end
			parent_path.append(file_name)
		end

	to_subpath_with (parent_path, subpath: STRING) is
		do
			if parent_path.last /= ':' then
				parent_path.extend_unless('/')
			end
			parent_path.append(subpath)
		end

	to_directory_path (path: STRING) is
		do
			path.extend_unless('/')
		end

feature {ANY}
	can_map_drive (source_notation: DIRECTORY_NOTATION; drive: STRING): BOOLEAN is
		do
			--|*** We (c/sh)ould do better than nothing... <24/03/2005>
		end

	to_root (source_notation: DIRECTORY_NOTATION; drive: STRING) is
		do
			check
				False
			end
		end

	to_default_root (directory: STRING) is
		do
			not_yet_implemented
		end

	to_current_directory (directory: STRING) is
		do
			not_yet_implemented
		end

feature {ANY}
	is_case_sensitive: BOOLEAN is True

	is_valid_path, is_valid_directory_path (path: STRING): BOOLEAN is
		do
			--|*** Not nearly strict enough <FM-24/03/2003>
			Result := not path.is_empty
		end

	is_valid_file_name (name: STRING): BOOLEAN is
		do
			--|*** Not nearly strict enough <FM-24/03/2003>
			Result := not name.is_empty
		end

	is_absolute_path (path: STRING): BOOLEAN is
		do
			not_yet_implemented
		end

feature {DIRECTORY_NOTATION}
	to_notation (path: STRING; destination_notation: DIRECTORY_NOTATION): STRING is
		do
			not_yet_implemented
		end

end -- class AMIGA_DIRECTORY_NOTATION
