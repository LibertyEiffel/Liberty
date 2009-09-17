class SERVER_SOCKET_INPUT_OUTPUT_STREAM

inherit
	SOCKET_INPUT_OUTPUT_STREAM
		redefine socket_disconnected
		end

creation {SOCKET_SERVER}
	connect_to

feature {ANY}
	disconnect is
		do
			detach
			server.unbind(socket)
		end

feature {}
	connect_to (a_server: SOCKET_SERVER; a_read_sync: BOOLEAN) is
		require
			a_server /= Void
		do
			server := a_server
			socket := a_server.bind
			make(a_read_sync)
		end

	socket: SOCKET

	server: SOCKET_SERVER

	socket_disconnected (a_socket: SOCKET) is
		do
			if server.has_socket(a_socket) then
				server.socket_disconnected(a_socket)
			end
			Precursor(a_socket)
		end

invariant
	server /= Void

end -- class SERVER_SOCKET_INPUT_OUTPUT_STREAM
