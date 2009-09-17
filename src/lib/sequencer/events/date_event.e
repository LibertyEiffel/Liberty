class DATE_EVENT
	--
	-- Event: a timeout occurred
	--

inherit
	TIME_EVENT

creation {TIME_EVENTS}
	make

feature {EVENTS_SET}
	expect (events: EVENTS_SET) is
		do
			events.at(expiration)
			set_expected(events)
		end

	occurred (events: EVENTS_SET): BOOLEAN is
		do
			Result := events.current_time > expiration
		end

feature {TIME_EVENTS}
	expiration: MICROSECOND_TIME

	in_time (timeout_ms: INTEGER) is
			-- `timeout_ms' is the maximum time in milliseconds to wait from now.
		require
			not is_expected
			timeout_ms >= 0
		do
			expiration.update
			expiration.add_second(timeout_ms #// 1000)
			expiration.add_millisecond(timeout_ms #\\ 1000)
		end

	at_date (date: MICROSECOND_TIME) is
			-- `date' is the last moment `wait' can wait.
		require
			not is_expected
		do
			expiration := date
		end

feature {}
	make is
		do
		end

end -- class DATE_EVENT
