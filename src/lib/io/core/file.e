deferred class FILE
	--
	-- Common parent class to all the file-related streams. Provides a common
	-- connection interface to the "real" files of the operating system.
	--

insert
	ANY

feature {ANY}
	path: STRING
			-- Not Void when connected to the corresponding file on the disk.

	is_connected: BOOLEAN is
			-- Is this file connected to some file of the operating system?
		do
			Result := path /= Void
		ensure
			definition: Result = (path /= Void)
		end

	connect_to (new_path: STRING) is
			-- Try to connect to an existing file of the operating system.
		require
			not is_connected
			not_malformed_path: not new_path.is_empty
		deferred
		ensure
			is_connected implies path.same_as(new_path)
		end

	disconnect is
			-- Disconnect from any file.
		require
			is_connected
		deferred
		ensure
			not is_connected
		end

end -- class FILE
