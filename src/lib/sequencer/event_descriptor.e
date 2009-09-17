deferred class EVENT_DESCRIPTOR
	--
	-- An event that can happen, managed by the EVENTS_SET.
	--

feature {ANY}
	expected (events: EVENTS_SET): BOOLEAN is
			-- True if the event is expected by the `events' set
		do
			if expected_array /= Void then
				Result := expected_array.fast_has(events)
			end
		ensure
			Result implies is_expected
		end

	is_expected: BOOLEAN is
			-- True if the event is expected by any EVENTS_SET
		do
			Result := expected_array /= Void and then not expected_array.is_empty
		end

feature {EVENTS_SET}
	expect (events: EVENTS_SET) is
		require
			not expected(events)
			events /= Void
		deferred
		ensure
			expected(events)
		end

	occurred (events: EVENTS_SET): BOOLEAN is
		require
			expected(events)
			events /= Void
		deferred
		end

	reset (events: EVENTS_SET) is
		require
			expected(events)
			action: unset_expected_(events)
		do
			-- done in require (see "action")
		ensure
			not expected(events)
		end

feature {} --| Clever use of assertions to be sure not to create arrays in boost mode
	set_expected (events: EVENTS_SET) is
		require
			not expected(events)
			action: set_expected_(events)
		do
			-- done in require (see "action")
		ensure
			expected(events)
		end

	set_expected_ (events: EVENTS_SET): BOOLEAN is
		require
			not expected(events)
		do
			if expected_array = Void then
				create expected_array.make(0)
			end
			expected_array.add_last(events)
			Result := True
		ensure
			expected(events)
			Result
		end

	unset_expected_ (events: EVENTS_SET): BOOLEAN is
		require
			expected(events)
		local
			i: INTEGER
		do
			i := expected_array.fast_first_index_of(events)
			expected_array.remove(i)
			Result := True
		ensure
			not expected(events)
			Result
		end

	expected_array: FAST_ARRAY[EVENTS_SET]

end -- class EVENT_DESCRIPTOR
