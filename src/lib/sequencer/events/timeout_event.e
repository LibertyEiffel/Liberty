class TIMEOUT_EVENT
	--
	-- Event: a timeout occurred
	--

inherit
	TIME_EVENT

creation {TIME_EVENTS}
	make

feature {TIME_EVENTS}
	set_timeout (timeout_ms: like timeout) is
			-- `timeout_ms' is the max time in milliseconds to wait when the EVENTS_SET.wait begins.
		require
			not is_expected
			timeout >= 0
		do
			timeout := timeout_ms
		ensure
			timeout = timeout_ms
		end

feature {EVENTS_SET}
	expect (events: EVENTS_SET) is
		do
			events.after(timeout)
			set_expected(events)
		end

	occurred (events: EVENTS_SET): BOOLEAN is
		do
			Result := True --|*** OK??
		end

feature {}
	timeout: INTEGER

	make is
		do
		end

end -- class TIMEOUT_EVENT
