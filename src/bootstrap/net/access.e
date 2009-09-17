deferred class ACCESS
	-- Access to a server running on some host (at some address).

insert
	SOCKET_HANDLER

feature {ANY}
	port: INTEGER
			-- The port on which the server runs

	address: ADDRESS
			-- The host of the server

	error: STRING
			-- If an error occurred

	read_sync: BOOLEAN
			-- True if read access should be synchronous (blocking when there is no data)

	server: SOCKET_SERVER is
			-- Start a server on the given port on localhost, listening to connections bound to the given
			-- address.
		deferred
		end

	stream: SOCKET_INPUT_OUTPUT_STREAM is
			-- Open a connection to the remote address and port.
		do
			Result := a_stream
		ensure
			error = Void implies Result.is_connected
		end

	set_read_sync (a_read_sync: like read_sync) is
		do
			read_sync := a_read_sync
		ensure
			read_sync = a_read_sync
		end

feature {}
	a_stream: CLIENT_SOCKET_INPUT_OUTPUT_STREAM is
		local
			s: like socket
		do
			s := socket
			if error = Void then
				create Result.connect_to(s, read_sync)
			end
		end

	socket: SOCKET is
			-- Create a low-level socket connected to the remote address and host.
		deferred
		ensure
			error = Void implies Result.is_connected
		end

end -- class ACCESS
