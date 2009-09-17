class WINDOWS_DIRECTORY_NOTATION
	-- The Windows like file path notation looks like:
	--   C:\SmartEiffel\sys\system.se

inherit
	PATH_NAME_NOTATION

feature {ANY}
	is_current_directory (path: STRING): BOOLEAN is
		do
			if path.compare(once ".") = 0 or else path.compare(once ".\") = 0 then
				Result := True
			elseif path.is_empty then
			elseif path.first /= '\' then
				Result := path.occurrences('.') + path.occurrences('\') = path.count and not path.has_substring("..")
			end
		end

	is_parent_directory (path: STRING): BOOLEAN is
		local
			pos: INTEGER
		do
			if path.compare(once "..") = 0 or else path.compare(once "..\") = 0 then
				Result := True
			elseif path.is_empty then
			elseif path.first /= '\' then
				Result := path.occurrences('.') + path.occurrences('\') = path.count and path.has_substring("..")
				if Result then
					pos := path.first_substring_index("..")
					Result := Result and path.substring_index("..", pos + 2) = 0
				end
			end
		end

	to_directory_path (path: STRING) is
		do
			from
			until path.is_empty or else path.last /= '\'
			loop
				path.remove_last
			end
		end

feature {ANY}
	is_case_sensitive: BOOLEAN is False

feature {}
	tmp1: MICROSOFT_PATH_NAME is
		once
			create Result.make_empty
		end

	tmp2: MICROSOFT_PATH_NAME is
		once
			create Result.make_empty
		end

end -- class WINDOWS_DIRECTORY_NOTATION
