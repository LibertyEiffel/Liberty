class SOCKET_SERVER
	--
	-- A socket server waits for connections to happen on some given address/port. It then defers treatment to
	-- handlers (see the `when_connect' feature).
	--
	-- Please use ACCESS.server to create a SOCKET_SERVER.
	--

insert
	SOCKET_HANDLER
	SOCKET_PLUG_IN

creation {ACCESS}
	make

feature {ANY}
	can_connect: BOOLEAN
			-- True if some client can connect to the server.

	shutdown is
			-- Wait for the connections to finish, then stop the server.
			-- No more connections will be accepted.
		require
			can_connect
		do
			can_connect := False
			net_shutdown(fd)
			net_disconnect(fd)
		ensure
			not can_connect
		end

	halt is
			-- Force all the connected sockets to disconnect, then shutdown
		require
			can_connect
		do
			kill_connections
			shutdown
		ensure
			not can_connect
		end

	new_stream (read_sync: BOOLEAN): SOCKET_INPUT_OUTPUT_STREAM is
		do
			create {SERVER_SOCKET_INPUT_OUTPUT_STREAM} Result.connect_to(Current, read_sync)
		end

feature {EVENTS_SET, SOCKET}
	fd: INTEGER
			-- The file descriptor of the socket; it is used to wait for some connection.

feature {}
	access: ACCESS

feature {SOCKET_INPUT_OUTPUT_STREAM}
	bind: SOCKET is
			-- Create a socket for the stream to connect upon (used by the stream at creation)
		do
			Result := bind_socket
		ensure
			has_socket(Result)
		end

	unbind (socket: SOCKET) is
			-- Close the socket and unbind it
		require
			socket.is_connected
			has_socket(socket)
		do
			socket.disconnect
			-- will call socket_disconnected
		ensure
			not has_socket(socket)
			not socket.is_connected
		end

	has_socket (socket: SOCKET): BOOLEAN is
		do
			Result := connected_sockets.fast_has(socket)
		end

	socket_disconnected (socket: SOCKET) is
		require
			not socket.is_connected
			has_socket(socket)
		do
			unbind_socket(socket)
		ensure
			not has_socket(socket)
		end

feature {}
	connected_sockets: FAST_ARRAY[SOCKET]
			-- The currently connected sockets

	sockets_pool: RECYCLING_POOL[SOCKET] is
			-- Common array containing all the currently disconnected sockets.
		once
			create Result.make
		end

	bind_socket: SOCKET is
		do
			if sockets_pool.is_empty then
				create Result.bind(Current)
			else
				Result := sockets_pool.item
				check
					not Result.is_connected
				end
				Result.bind(Current)
			end
			if Result.is_connected then
				connected_sockets.add_last(Result)
			end
		ensure
			Result.is_connected implies connected_sockets.fast_has(Result) and then connected_sockets.count = old connected_sockets.count + 1
		end

	unbind_socket (socket: SOCKET) is
		require
			connected_sockets.fast_has(socket)
		local
			i: INTEGER
		do
			i := connected_sockets.first_index_of(socket)
			connected_sockets.remove(i)
			sockets_pool.recycle(socket)
		ensure
			not connected_sockets.fast_has(socket)
		end

	kill_connections is
		local
			s: SOCKET
		do
			from
			until
				connected_sockets.is_empty
			loop
				s := connected_sockets.first
				if s.is_connected then
					s.disconnect
				end
			end
		end

feature {}
	make (a_access: ACCESS; a_socket_fd: INTEGER) is
			-- Connect to an access, which must also provide the file descriptor
		require
			a_access /= Void
			valid_file_descriptor: a_socket_fd >= 0
		do
			access := a_access
			fd := a_socket_fd
			can_connect := True
			create connected_sockets.with_capacity(4)
		end

feature {ANY}
	event_connection: EVENT_DESCRIPTOR is
		do
			Result := connection_occurred
			if Result = Void then
				create connection_occurred.make(Current)
				Result := connection_occurred
			end
		end

feature {}
	connection_occurred: NETWORK_CONNECTION_OCCURRED

end -- class SOCKET_SERVER
