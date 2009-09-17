deferred class BACKGROUND_JOB
	-- Describe job to be executed in the background, when there nothing
	-- more important to do. Such job is ready to run at any time.

inherit
	JOB

feature {LOOP_ITEM}
	prepare (events: EVENTS_SET) is
		local
			t: TIME_EVENTS
		do
			events.expect(t.timeout(0))
		end

	is_ready (events: EVENTS_SET): BOOLEAN is
		do
			Result := True
		end

end -- class BACKGROUND_JOB
