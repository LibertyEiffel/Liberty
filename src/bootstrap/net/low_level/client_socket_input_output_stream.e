class CLIENT_SOCKET_INPUT_OUTPUT_STREAM

inherit
	SOCKET_INPUT_OUTPUT_STREAM

creation {ACCESS}
	connect_to

feature {ANY}
	disconnect is
		do
			detach
			socket.disconnect
		end

feature {}
	connect_to (a_socket: SOCKET; a_read_sync: BOOLEAN) is
		require
			a_socket /= Void
		do
			socket := a_socket
			make(a_read_sync)
		end

	socket: SOCKET

end -- class CLIENT_SOCKET_INPUT_OUTPUT_STREAM
