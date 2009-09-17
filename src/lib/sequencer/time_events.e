expanded class TIME_EVENTS

feature {ANY}
	timeout (timeout_ms: INTEGER): TIMEOUT_EVENT is
			-- `timeout_ms' is the max time in milliseconds to wait starting from when EVENTS_SET.wait
			-- is called.
		do
			Result ::= item(timeout_events)
			if Result = Void then
				create Result.make
				if empty_slot = -1 then
					timeout_events.add_last(create {WEAK_REFERENCE[TIMEOUT_EVENT]}.set_item(Result))
				else
					timeout_events.item(empty_slot).set_item(Result)
				end
			end
			Result.set_timeout(timeout_ms)
		end

	in_time (timeout_ms: INTEGER): DATE_EVENT is
			-- `timeout_ms' is the maximum time in milliseconds to wait starting from now.
		do
			Result ::= item(date_events)
			if Result = Void then
				create Result.make
				if empty_slot = -1 then
					date_events.add_last(create {WEAK_REFERENCE[DATE_EVENT]}.set_item(Result))
				else
					date_events.item(empty_slot).set_item(Result)
				end
			end
			Result.in_time(timeout_ms)
		end

	at_date (date: MICROSECOND_TIME): DATE_EVENT is
			-- `date' is the latest moment `wait' can wait.
		do
			Result ::= item(date_events)
			if Result = Void then
				create Result.make
				if empty_slot = -1 then
					date_events.add_last(create {WEAK_REFERENCE[DATE_EVENT]}.set_item(Result))
				else
					date_events.item(empty_slot).set_item(Result)
				end
			end
			Result.at_date(date)
		end

feature {}
	item (events: FAST_ARRAY[WEAK_REFERENCE[TIME_EVENT]]): TIME_EVENT is
		local
			i: INTEGER
		do
			from
				empty_slot := -1
				i := events.lower
			until
				Result /= Void or else i > events.upper
			loop
				Result := events.item(i).item
				if Result = Void then
					empty_slot := i
				elseif Result.is_expected then
					Result := Void
				end
				i := i + 1
			end
		ensure
			Result /= Void implies not Result.is_expected
			Result = Void implies empty_slot = -1 or else events.item(empty_slot) = Void
		end

feature {}
	timeout_events: FAST_ARRAY[WEAK_REFERENCE[TIMEOUT_EVENT]] is
		once
			create Result.make(0)
		end

	date_events: FAST_ARRAY[WEAK_REFERENCE[DATE_EVENT]] is
		once
			create Result.make(0)
		end

	empty_slot: INTEGER

end -- class TIME_EVENTS
