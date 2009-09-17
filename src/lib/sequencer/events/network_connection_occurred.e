class NETWORK_CONNECTION_OCCURRED
	--
	-- Event: a new network connection was established to the given `server'
	--

inherit
	EVENT_DESCRIPTOR

creation {SOCKET_SERVER}
	make

feature {EVENTS_SET}
	expect (events: EVENTS_SET) is
		do
			events.when_connection(server)
			set_expected(events)
		end

	occurred (events: EVENTS_SET): BOOLEAN is
		do
			Result := events.is_connection(server)
		end

feature {}
	server: SOCKET_SERVER

	make (a_server: like server) is
		require
			not is_expected
			a_server /= Void
		do
			server := a_server
		ensure
			server = a_server
		end

end -- class NETWORK_CONNECTION_OCCURRED
