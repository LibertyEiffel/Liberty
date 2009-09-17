class LOCAL_ACCESS
	-- Access to a server on the local machine.

inherit
	ACCESS
		redefine address
		end

insert
	SOCKET_PLUG_IN

creation {ANY}
	make

feature {ANY}
	address: LOCALHOST

	server: SOCKET_SERVER is
		local
			fd: INTEGER
		do
			fd := net_local_server(port)
			if fd >= 0 then
				create Result.make(Current, fd)
			end
		end

feature {}
	make (a_address: LOCALHOST; a_port: INTEGER) is
			-- Access to a server on the given host address listening at the given port
		require
			a_address /= Void
			a_port.in_range(1, 65535)
		do
			address := a_address
			port := a_port
		end

	socket: SOCKET is
		local
			ip: IP_ADDRESS
		do
			ip := address.ip
			if address.error /= Void then
				error := address.error
			else
				create Result.make_local(ip.a, ip.b, ip.c, ip.d, port)
				if not Result.is_connected then
					error := Result.error
				end
			end
		end

end -- class LOCAL_ACCESS
