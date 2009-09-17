class TCP_ACCESS
	-- Access to a TCP server.

inherit
	ACCESS

insert
	SOCKET_PLUG_IN

creation {ANY}
	make

feature {ANY}
	server: SOCKET_SERVER is
		local
			fd: INTEGER
		do
			fd := net_tcp_socket
			if fd >= 0 then
				set_preopen_options(fd)
				fd := net_bind_server(fd, port, af_inet)
				if fd >= 0 then
					create Result.make(Current, fd)
				end
			end


		end

	set_address_reuse (value: BOOLEAN) is
			-- When `value', servers are created with reusable addresses
			-- See SO_REUSEADDR in IP sockets documentation for details
		do
			address_reuse := value
		ensure
			address_reuse = value
		end

	address_reuse: BOOLEAN
			-- Should created servers should be created with a reusable bind address?

feature {}
	make (a_address: ADDRESS; a_port: INTEGER) is
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
				create Result.make_tcp(ip.a, ip.b, ip.c, ip.d, port)
				if not Result.is_connected then
					error := Result.error
				end
			end
		end

feature {} -- Option handling
	set_preopen_options(fd: INTEGER) is
			-- Set the socket options that should be set after creating the
			-- socket and before binding it
		do
			if address_reuse then
				set_integer_socket_option (fd, so_reuse_addr, 1)
			end
		end

	set_integer_socket_option(fd, opt_name, opt_val: INTEGER) is
		local
			op_result: INTEGER
		do
			op_result := net_set_int_option(fd, sol_socket, opt_name, opt_val)
			if net_last_error.is_not_null then
				create error.from_external(net_last_error)
			end
		ensure
			net_last_error_number = 0
		end

end -- class TCP_ACCESS

