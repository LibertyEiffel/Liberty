class STREAM_PROTOCOL
	--
	-- A protocol used for internal purposes: implementation of STREAM.url
	--

inherit
	PROTOCOL

create {URL}
	make

feature {ANY}
	name: STRING is
		do
			Result := out -- make it as ugly as possible. Not a possible URL protocol name.
		end

	is_connected: BOOLEAN is
		do
			Result := stream.is_connected
		end

	error: STRING is
		do
			-- not used; always Void (no error)
		end

feature {URL_VALIDITY}
	valid_uri (a_uri: STRING): BOOLEAN is
		do
			check False end
		end

feature {URL}
	connect_to (url: URL; read, write: BOOLEAN) is
		require else
			True
		do
			if read and then instream ?:= stream then
				instream ::= stream
			end
			if write and then outstream ?:= stream then
				outstream ::= stream
			end
		end

	disconnect is
		do
			stream.disconnect
		end

	input: INPUT_STREAM is
		do
			Result := instream
		end

	output: OUTPUT_STREAM is
		do
			Result := outstream
		end

	locator (a_uri: STRING): RESOURCE_LOCATOR is
		do
			check False end
		end

	recycle_locator (a_locator: RESOURCE_LOCATOR) is
		do
			check False end
		end

feature {}
	make (a_stream: like stream) is
		require
			a_stream /= Void
		do
			stream := a_stream
		end

	stream: STREAM
	instream: INPUT_STREAM
	outstream: OUTPUT_STREAM

invariant
	stream /= Void
	instream /= Void implies instream = stream
	outstream /= Void implies outstream = stream

end -- STREAM_PROTOCOL
