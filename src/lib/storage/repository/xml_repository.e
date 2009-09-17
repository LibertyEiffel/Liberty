class XML_REPOSITORY[O_ -> STORABLE]

obsolete
		"Use either XML_STREAM_REPOSITORY or XML_FILE_REPOSITORY (may 2006)"

inherit
	XML_REPOSITORY_IMPL[O_]

creation {ANY}
	connect_to, from_file, make

feature {ANY} -- Updating and committing
	commit_to_file (path: STRING) is
			-- Overwrite or create `path' with the contents of `Current'.
		obsolete
			"Use XML_FILE_REPOSITORY.connect_to and the standard commit"
		do
			tfw.connect_to(path)
			write_to_stream(tfw)
			tfw.disconnect
		end

	update_from_file (path: STRING) is
			-- Get all objects from the file designed by `path'. Previous objects are not discarded except if new
			-- objects use the same key.
		obsolete
			"Use XML_FILE_REPOSITORY.connect_to and the standard update"
		do
			tfr.connect_to(path)
			if tfr.is_connected then
				update_from_stream(tfr)
				tfr.disconnect
			end
		end

	read_from_file (path: STRING) is
			-- Get all objects from the file designed by `path'. Previous objects are discarded first.
		obsolete
			"Use XML_FILE_REPOSITORY.connect_to and the standard update"
		do
			tfr.connect_to(path)
			read_from_stream(tfr)
			tfr.disconnect
		end

	commit is
		do
			write_to_stream(commit_stream)
		end

	is_commitable: BOOLEAN is
		do
			Result := commit_stream /= Void and then commit_stream.is_connected
		end

	update is
		do
			read_from_stream(update_stream)
		end

	is_updateable: BOOLEAN is
		do
			Result := update_stream /= Void and then update_stream.is_connected
		end

	is_connected: BOOLEAN is
		do
			Result := commit_stream /= Void and then commit_stream.is_connected
		end

feature {} -- Creation
	from_file (path: STRING) is
			-- Create a not-connected repository with initial data from the given path. One must use
			-- `update_from_file' and `commit_to_file'.
		obsolete
			"Use XML_FILE_REPOSITORY.connect_to"
		do
			make
			tfr.connect_to(path)
			if tfr.is_connected then
				update_from_stream(tfr)
				tfr.disconnect
			end
		end

	connect_to (in_stream: like update_stream; out_stream: like commit_stream) is
			-- Connect to a repository with streams as physical store.
		do
			make
			update_stream := in_stream
			commit_stream := out_stream
		end

feature {} -- Internals
	tfr: TEXT_FILE_READ is
		once
			create Result.make
		end

	tfw: TEXT_FILE_WRITE is
		once
			create Result.make
		end

	update_stream: INPUT_STREAM
	commit_stream: OUTPUT_STREAM

end -- class XML_REPOSITORY
