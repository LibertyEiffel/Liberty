class XML_STREAM_REPOSITORY [O_ -> STORABLE]
	--
	-- To be used via streams that commit and update the XML repository
	--
inherit
	XML_REPOSITORY_IMPL[O_]

create {ANY}
	connect_to

feature {ANY} -- Updating and committing
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

feature {ANY} -- Creation
	connect_to (in_stream: like update_stream; out_stream: like commit_stream) is
			-- Connect to a repository with streams as physical store.
		do
			make
			update_stream := in_stream
			commit_stream := out_stream
		end

feature {}
	update_stream: INPUT_STREAM
	commit_stream: OUTPUT_STREAM

end -- class XML_STREAM_REPOSITORY
