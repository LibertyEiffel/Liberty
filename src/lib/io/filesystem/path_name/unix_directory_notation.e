class UNIX_DIRECTORY_NOTATION
	-- The Unix like file path notation looks like:
	--   /SmartEiffel/sys/system.se

inherit
	PATH_NAME_NOTATION

feature {ANY}
	is_current_directory (path: STRING): BOOLEAN is
		do
			if path.compare(once ".") = 0 or else path.compare(once "./") = 0 then
				Result := True
			elseif path.is_empty then
			elseif path.first /= '/' then
				Result := path.occurrences('.') + path.occurrences('/') = path.count and not path.has_substring(once "..")
			end
		end

	is_parent_directory (path: STRING): BOOLEAN is
		local
			pos: INTEGER
		do
			if path.compare(once "..") = 0 or else path.compare(once "../") = 0 then
				Result := True
			elseif path.is_empty then
			elseif path.first /= '/' then
				Result := path.occurrences('.') + path.occurrences('/') = path.count and path.has_substring(once "..")
				if Result then
					pos := path.first_substring_index(once "..")
					Result := Result and path.substring_index(once "..", pos + 2) = 0
				end
			end
		end

	to_directory_path (path: STRING) is
		do
			path.extend_unless('/')
		end

feature {ANY}
	is_case_sensitive: BOOLEAN is True

feature {}
	tmp1: POSIX_PATH_NAME is
		once
			create Result.make_empty
		end

	tmp2: POSIX_PATH_NAME is
		once
			create Result.make_empty
		end

end -- class UNIX_DIRECTORY_NOTATION
