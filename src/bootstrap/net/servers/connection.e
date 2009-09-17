deferred class CONNECTION
	--
	-- Handle one connection to the SERVER.
	--

inherit
	JOB

feature {SERVER}
	set_io (a_io: SOCKET_INPUT_OUTPUT_STREAM) is
		require
			a_io.is_connected
		do
			ios := a_io
		ensure
			ios = a_io
		end

feature {LOOP_ITEM}
	prepare (events: EVENTS_SET) is
		do
			events.expect(ios.event_can_read)
		end

	is_ready (events: EVENTS_SET): BOOLEAN is
		do
			Result := events.event_occurred(ios.event_can_read)
		end

	done: BOOLEAN is
		do
			Result := not ios.is_connected
		end

	restart is
		do
			-- cannot restart a connection
			--|*** (the postcondition will not be respected, how can I do otherwise? Philippe?)
		end

feature {}
	ios: SOCKET_INPUT_OUTPUT_STREAM

end -- class CONNECTION
