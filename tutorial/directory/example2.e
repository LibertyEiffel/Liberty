class EXAMPLE2
	--
	-- This example shows how to manipulate files and directories without
	-- ever relying to any explicit pathname manipulation (that is, we may
	-- need to bufferize some pathname, but never to scan it, cut it, build
	-- it and so on)
	--

creation {ANY}
	make

feature {ANY}
	make is
		local
			wd: DIRECTORY
		do
			create wd.scan_current_working_directory
			recursive_list(wd)
		end

feature {}
	recursive_list (wd: DIRECTORY) is
			-- Lists the contents of the directory, and tries to list the
			-- subdirectories
		local
			i: INTEGER; a: FAST_ARRAY[STRING]; filename: STRING; path: STRING
		do
			io.put_string(wd.path)
			io.put_new_line
			create a.with_capacity(wd.count)
			-- keep the names
			from
				i := wd.lower
			until
				i > wd.upper
			loop
				filename := wd.item(i)
				if filename /= Void and then filename.count > 0 then
					a.add_last(filename)
				end
				i := i + 1
			end
			from
				i := a.lower
			until
				i > a.upper
			loop
				-- save the current directory path
				path := wd.path.twin
				wd.scan_subdirectory(a.item(i))
				if wd.last_scan_status then
					recursive_list(wd)
					wd.scan_parent_directory
				else
					-- restore the current directory
					wd.scan(path)
				end
				i := i + 1
			end
			-- restore the current directory
			wd.scan(path)
		end

end -- class EXAMPLE2
