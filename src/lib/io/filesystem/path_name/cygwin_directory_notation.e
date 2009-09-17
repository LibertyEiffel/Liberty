class CYGWIN_DIRECTORY_NOTATION
	-- The Cygwin like file path notation looks like:
	--   //C/SmartEiffel/sys/system.se
	--|*** I've never sen this notation. My cygwin uses plain old unix
	--|*** notation, windows drives are mapped to /cygdrive/c/ etc...
	--|*** <FM-23/03/2003>
	--|*** AFAIR that's the old b20 series <CAD 2005.11.18>

inherit
	DIRECTORY_NOTATION

feature {ANY}
	is_current_directory (path: STRING): BOOLEAN is
		do
			if path.compare(once ".") = 0 or else path.compare(once "./") = 0 then
				Result := True
			else
				Result := path.occurrences('.') + path.occurrences('/') = path.count and not path.has_substring("..")
			end
		end

	is_parent_directory (path: STRING): BOOLEAN is
		local
			pos: INTEGER
		do
			if path.compare(once "..") = 0 or else path.compare(once "../") = 0 then
				Result := True
			else
				Result := path.occurrences('.') + path.occurrences('/') = path.count and path.has_substring("..")
				if Result then
					pos := path.first_substring_index("..")
					Result := Result and path.substring_index("..", pos + 2) = 0
				end
			end
		end

	to_parent_directory (some_path: STRING) is
		do
			--|*** "." and ".." are not handled correctly <FM-24/03/2005>
			from
				some_path.remove_last
			until
				some_path.is_empty or else some_path.last = '/' or else some_path.last = ':'
			loop
				some_path.remove_last
			end
			if some_path.is_empty then
			elseif some_path.first = '/' then
				if some_path.count = 2 then
					if some_path.item(2) = '/' then
						some_path.remove_last
					end
				end
			end
			if not some_path.is_empty then
				some_path.extend_unless('/')
			end
		end

	to_subdirectory_with (parent_path, entry_name: STRING) is
		do
			if (once ".").is_equal(entry_name) then
				-- Because you would get the same directory as `parent_path' and
				-- not a new subdirectory as explained before.
				parent_path.clear_count
			elseif (once "..").is_equal(entry_name) then
				-- Because you would not get a subdirectory of `parent_path'.
				parent_path.clear_count
			else
				parent_path.extend_unless('/')
				if entry_name.first = '/' then
					parent_path.remove_last
				end
				parent_path.append(entry_name)
				parent_path.extend_unless('/')
			end
		end

	to_file_path_with (parent_path, file_name: STRING) is
		do
			parent_path.extend_unless('/')
			if file_name.first = '/' then
				parent_path.remove_last
			end
			parent_path.append(file_name)
		end

	to_subpath_with (parent_path, subpath: STRING) is
		do
			parent_path.extend_unless('/')
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
			directory.clear_count
			directory.extend('/')
		end

	to_current_directory (directory: STRING) is
		do
			directory.clear_count
			directory.extend('.')
		end

feature {ANY}
	is_case_sensitive: BOOLEAN is True
			--|*** Is it ? <FM-23/03/2003>

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
			Result := path.first = '/'
		end

feature {DIRECTORY_NOTATION}
	to_notation (path: STRING; destination_notation: DIRECTORY_NOTATION): STRING is
		do
			not_yet_implemented
		end

end -- class CYGWIN_DIRECTORY_NOTATION
