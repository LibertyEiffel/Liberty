-- See the Copyright notice at the end of this file.
--
class SOCKET
	--
	-- A low-level socket. Should not be used directly, but only via a SOCKET_INPUT_OUTPUT_STREAM.
	--

insert
	STRING_HANDLER
	SOCKET_HANDLER
	SOCKET_PLUG_IN
	RECYCLABLE
	DISPOSABLE

creation {SOCKET_HANDLER}
	make_local, make_tcp, make_udp

creation {SOCKET_SERVER, SOCKET_HANDLER}
	bind

feature {SOCKET_HANDLER}
	default_buffer_size: INTEGER is 8192

	is_connected: BOOLEAN

	error: STRING

	read (sync: BOOLEAN) is
		require
			is_connected
		local
			count: INTEGER
		do
			last_read.resize(default_buffer_size)
			count := net_read(fd, default_buffer_size, last_read.storage.to_external, sync)
			if count < 0 then
				count := 0
			end
			last_read.resize(count)
			error := last_error
			if error /= Void then
				disconnect
			end
		end

	last_read: STRING

	write (data: STRING) is
		require
			is_connected
			data /= Void
		local
			dummy: INTEGER
		do
			dummy := net_write(fd, data.count, data.storage)
			error := last_error
			if error /= Void then
				disconnect
			end
		end

	disconnect is
		require
			is_connected
		do
			net_shutdown(fd)
			net_disconnect(fd)
			is_connected := False
			fire_disconnected
		ensure
			not is_connected
		end

	clear is
		require
			not is_connected
		do
			if disconnected_listeners /= Void then
				disconnected_listeners.clear_count
			end
		end

	a, b, c, d: INTEGER

	port: INTEGER

	fd: INTEGER

	when_disconnected (a_listener: PROCEDURE[TUPLE[SOCKET]]) is
		require
			a_listener /= Void
		do
			if disconnected_listeners = Void then
				create disconnected_listeners.with_capacity(2)
			end
			disconnected_listeners.add_last(a_listener)
		end

feature {SOCKET_SERVER, SOCKET_HANDLER}
	bind (server: SOCKET_SERVER) is
			-- Binds the socket to the server.
		require
			not is_connected
		do
			if bind_values.is_null then
				bind_values := bind_values.calloc(6)
			end
			net_accept(server.fd, bind_values)
			fd := bind_values.item(5)
			if fd >= 0 then
				check
					last_error = Void
				end
				common_make(bind_values.item(0), bind_values.item(1), bind_values.item(2), bind_values.item(3), bind_values.item(4))
				is_connected := True
			else
				error := last_error
			end
		end

feature {}
	common_make (ip_a, ip_b, ip_c, ip_d, a_port: INTEGER) is
		do
			a := ip_a
			b := ip_b
			c := ip_c
			d := ip_d
			if last_read = Void then
				create last_read.make(default_buffer_size)
			end
			port := a_port
		end

	make_local (ip_a, ip_b, ip_c, ip_d, a_port: INTEGER) is
		do
			common_make(ip_a, ip_b, ip_c, ip_d, a_port)
			connect(net_local(a_port))
		end

	make_tcp (ip_a, ip_b, ip_c, ip_d, a_port: INTEGER) is
		do
			common_make(ip_a, ip_b, ip_c, ip_d, a_port)
			connect(net_tcp(a, b, c, d, a_port))
		end

	make_udp (ip_a, ip_b, ip_c, ip_d, a_port: INTEGER) is
		do
			common_make(ip_a, ip_b, ip_c, ip_d, a_port)
			connect(net_udp(a, b, c, d, a_port))
		end

	connect (a_fd: like fd) is
		do
			if a_fd >= 0 then
				is_connected := True
				fd := a_fd
			else
				error := last_error
			end
		end

feature {} -- socket listeners
	disconnected_listeners: FAST_ARRAY[PROCEDURE[TUPLE[SOCKET]]]

	fire_disconnected is
		local
			i: INTEGER
		do
			if disconnected_listeners /= Void then
				from
					i := disconnected_listeners.lower
				until
					i > disconnected_listeners.upper
				loop
					disconnected_listeners.item(i).call([Current])
					i := i + 1
				end
			end
		end

feature {RECYCLING_POOL}
	recycle is
		do
			clear
		end

feature {} -- really low level
	bind_values: NATIVE_ARRAY[INTEGER]

	dispose is
		require
			should_not_rely_on_gc: not is_connected
		do
			if is_connected then
				disconnect
			end
		end

end -- class SOCKET
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
