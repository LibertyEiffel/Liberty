class SOCKET_PLUG_IN

feature {}
	last_error: STRING is
		local
			e: POINTER
		do
			e := net_last_error
			if e /= default_pointer then
				Result := once ""
				Result.from_external(e)
			end
		end

	last_error_number: INTEGER is
		require
			last_error /= Void
		do
			Result := net_last_error_number
		end

feature {} -- Plugin
	net_tcp (ip_a, ip_b, ip_c, ip_d: INTEGER; a_port: INTEGER): INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_tcp"
         }"
		end

	net_udp (ip_a, ip_b, ip_c, ip_d: INTEGER; a_port: INTEGER): INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_udp"
         }"
		end

	net_local (a_port: INTEGER): INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_local"
         }"
		end

	net_select (a_fd: INTEGER; a_timeout: REAL): INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_select_one"
         }"
		end

	net_read (a_fd, a_count: INTEGER; a_buffer: POINTER; sync: BOOLEAN): INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_read"
         }"
		end

	net_write (a_fd, a_count: INTEGER; a_buffer: NATIVE_ARRAY[CHARACTER]): INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_write"
         }"
		end

	net_accept (a_fd: INTEGER; a_val: NATIVE_ARRAY[INTEGER]) is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_accept"
         }"
		end

	net_disconnect (a_fd: INTEGER) is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_disconnect"
         }"
		end

	net_shutdown (a_fd: INTEGER) is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_shutdown"
         }"
		end

	net_last_error: POINTER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_last_error"
         }"
		end

	net_last_error_number: INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_last_error_number"
         }"
		end

	net_hostname (a_hostname: POINTER): INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_hostname"
         }"
		end

	net_tcp_server (port: INTEGER): INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_tcp_server"
         }"
		end

	net_udp_server (port: INTEGER): INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_udp_server"
         }"
		end

	net_local_server (port: INTEGER): INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_local_server"
         }"
		end

	net_bind_server(socket, port, sockfamily: INTEGER): INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_bind_server"
         }"
		end

	net_set_int_option(fd, level, optname, opt_val: INTEGER): INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_set_int_option"
         }"
		end

	net_tcp_socket: INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_tcp_socket()"
         }"
		end

feature {} -- Name resolution -- see LOCALHOST
	net_gethostname: POINTER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_gethostname()"
         }"
		end

	net_sethostname (hn: POINTER; size: INTEGER) is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_sethostname"
         }"
		end

	net_getdomainname: POINTER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_getdomainname()"
         }"
		end

	net_setdomainname (dn: POINTER; size: INTEGER) is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "net_setdomainname"
         }"
		end

feature {} -- Macros for setting options
	sol_socket: INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "SOL_SOCKET"
         }"
		end

	so_reuse_addr: INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "SO_REUSEADDR"
         }"
		end

	af_inet: INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "net"
         feature_name: "AF_INET"
         }"
		end
end -- class SOCKET_PLUG_IN
