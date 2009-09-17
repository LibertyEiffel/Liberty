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
