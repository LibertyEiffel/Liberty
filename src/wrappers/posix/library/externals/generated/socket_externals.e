-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SOCKET_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	accept (a_fd: INTEGER; an_addr: POINTER; an_addr_len: POINTER): INTEGER 

		-- function accept (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- accept
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "accept"
               }"
               end

	accept4 (a_fd: INTEGER; an_addr: POINTER; an_addr_len: POINTER; a_flags: INTEGER): INTEGER 

		-- function accept4 (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- accept4
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "accept4"
               }"
               end

	bind (a_fd: INTEGER; an_addr: POINTER; a_len: NATURAL): INTEGER 

		-- function bind (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- bind
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "bind"
               }"
               end

	connect (a_fd: INTEGER; an_addr: POINTER; a_len: NATURAL): INTEGER 

		-- function connect (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- connect
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "connect"
               }"
               end

	getpeername (a_fd: INTEGER; an_addr: POINTER; a_len: POINTER): INTEGER 

		-- function getpeername (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- getpeername
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpeername"
               }"
               end

	getsockname (a_fd: INTEGER; an_addr: POINTER; a_len: POINTER): INTEGER 

		-- function getsockname (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- getsockname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getsockname"
               }"
               end

	getsockopt (a_fd: INTEGER; a_level: INTEGER; an_optname: INTEGER; an_optval: POINTER; an_optlen: POINTER): INTEGER 

		-- function getsockopt (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- getsockopt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getsockopt"
               }"
               end

	isfdtype (a_fd: INTEGER; a_fdtype: INTEGER): INTEGER 

		-- function isfdtype (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- isfdtype
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isfdtype"
               }"
               end

	listen (a_fd: INTEGER; a_n: INTEGER): INTEGER 

		-- function listen (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- listen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "listen"
               }"
               end

	recv (a_fd: INTEGER; a_buf: POINTER; a_n: like size_t; a_flags: INTEGER): like ssize_t 

		-- function recv (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- recv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "recv"
               }"
               end

	recvfrom (a_fd: INTEGER; a_buf: POINTER; a_n: like size_t; a_flags: INTEGER; an_addr: POINTER; an_addr_len: POINTER): like ssize_t 

		-- function recvfrom (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- recvfrom
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "recvfrom"
               }"
               end

	recvmmsg (a_fd: INTEGER; a_vmessages: POINTER; a_vlen: NATURAL; a_flags: INTEGER; a_tmo: POINTER): INTEGER 

		-- function recvmmsg (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- recvmmsg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "recvmmsg"
               }"
               end

	recvmsg (a_fd: INTEGER; a_message: POINTER; a_flags: INTEGER): like ssize_t 

		-- function recvmsg (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- recvmsg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "recvmsg"
               }"
               end

	send (a_fd: INTEGER; a_buf: POINTER; a_n: like size_t; a_flags: INTEGER): like ssize_t 

		-- function send (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- send
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "send"
               }"
               end

	sendmmsg (a_fd: INTEGER; a_vmessages: POINTER; a_vlen: NATURAL; a_flags: INTEGER): INTEGER 

		-- function sendmmsg (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- sendmmsg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sendmmsg"
               }"
               end

	sendmsg (a_fd: INTEGER; a_message: POINTER; a_flags: INTEGER): like ssize_t 

		-- function sendmsg (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- sendmsg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sendmsg"
               }"
               end

	sendto (a_fd: INTEGER; a_buf: POINTER; a_n: like size_t; a_flags: INTEGER; an_addr: POINTER; an_addr_len: NATURAL): like ssize_t 

		-- function sendto (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- sendto
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sendto"
               }"
               end

	setsockopt (a_fd: INTEGER; a_level: INTEGER; an_optname: INTEGER; an_optval: POINTER; an_optlen: NATURAL): INTEGER 

		-- function setsockopt (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- setsockopt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setsockopt"
               }"
               end

	shutdown (a_fd: INTEGER; a_how: INTEGER): INTEGER 

		-- function shutdown (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- shutdown
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "shutdown"
               }"
               end

	sockatmark (a_fd: INTEGER): INTEGER 

		-- function sockatmark (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- sockatmark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sockatmark"
               }"
               end

	socket (a_domain: INTEGER; a_type: INTEGER; a_protocol: INTEGER): INTEGER 

		-- function socket (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- socket
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "socket"
               }"
               end

	socketpair (a_domain: INTEGER; a_type: INTEGER; a_protocol: INTEGER; a_fds: POINTER): INTEGER 

		-- function socketpair (in `/usr/include/x86_64-linux-gnu/sys/socket.h')
               -- socketpair
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "socketpair"
               }"
               end


end -- class SOCKET_EXTERNALS
