deferred class PERIODIC_JOB
	-- Pseudo periodic job. The timing is not exact : the time between
	-- two execution may be longer than the given period depending on
	-- time needed to execute ready tasks. There is no try to recover the
	-- time lost each time.

inherit
	JOB

feature {ANY}
	period: REAL -- unit is seconds

	next_time: MICROSECOND_TIME

feature {LOOP_ITEM}
	prepare (events: EVENTS_SET) is
		local
			t: TIME_EVENTS
		do
			events.expect(t.at_date(next_time))
		end

	is_ready (events: EVENTS_SET): BOOLEAN is
		do
			Result := next_time <= events.current_time
			if Result then
				next_time := events.current_time + period
			end
		end

invariant
	period > 0

end -- class PERIODIC_JOB
