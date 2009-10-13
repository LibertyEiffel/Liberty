-- See the Copyright notice at the end of this file.
--
deferred class TCP_PROTOCOL
	--
	-- A protocol that handles a TCP stream.
	--

inherit
	PROTOCOL

insert
	NETWORK_RESOURCE_VALIDITY

feature {ANY}
	error: STRING

	valid_uri (a_uri: STRING): BOOLEAN is
		do
			Result := is_absolute_uri(a_uri)
		end

feature {URL}
	connect_to (url: URL; read, write: BOOLEAN) is
		local
			nrl: NETWORK_RESOURCE_LOCATOR
			ios: SOCKET_INPUT_OUTPUT_STREAM
			a: TCP_ACCESS; h: HOST
		do
			--|*** STILL SOME MEMORY LEAKS
			nrl ::= url.uri
			create h.make(nrl.host)
			if nrl.port = 0 then
				create a.make(h, standard_port)
			else
				create a.make(h, nrl.port)
			end
			a.set_read_sync(True) --*** hard-coded??
			ios := a.stream
			if a.error /= Void then
				error := h.error
			else
				tcp_connect_to(ios, url, read, write)
			end
		end

	standard_port: INTEGER is
		deferred
		end

	locator (a_uri: STRING): NETWORK_RESOURCE_LOCATOR is
		do
			if locators.is_empty then
				create Result.set_uri(a_uri)
			else
				Result := locators.item
				Result.set_uri(a_uri)
			end
		end

	recycle_locator (a_locator: RESOURCE_LOCATOR) is
		local
			nrl: NETWORK_RESOURCE_LOCATOR
		do
			nrl ::= a_locator
			locators.recycle(nrl)
		end

feature {}
	tcp_connect_to (ios: SOCKET_INPUT_OUTPUT_STREAM; url: URL; read, write: BOOLEAN) is
		require
			ios.is_connected
			url.uri /= Void
			not is_connected
		deferred
		end

	locators: RECYCLING_POOL[NETWORK_RESOURCE_LOCATOR] is
		once
			create Result.make
		end

end -- class TCP_PROTOCOL
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
