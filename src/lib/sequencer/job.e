deferred class JOB
	--The job life will looks like :
	--   do
	--      prepare
	--      if is_ready then
	--         continue
	--   repeat while not done
	--
	--If the same job as to live again, restart is called.
	--
	-- Note: never change priority after job inserted in loop_item.
	--       Priority should only be set at creation time.
	--

insert
	ANY
	PLATFORM

feature {JOB, LOOP_ITEM}
	priority: INTEGER
			-- Never change priority after job inserted in loop_item.
			-- Priority should only be set at creation time.

feature {LOOP_ITEM}
	prepare (events: EVENTS_SET) is
			-- Use `events' to descibe condition that make this job ready to `continue'.
			-- `events' describe the conditions to be satisfied before 
			-- runing this job for one more step.
		require
			events /= Void
			not events.queryable
			not done
		deferred
		end

	is_ready (events: EVENTS_SET): BOOLEAN is
			-- Check if this job is ready to continue his work.
			-- `events' describe the events which occured.
		require
			events /= Void
			events.queryable
			not done
		deferred
		end

	continue is
			-- Continue to do the job.
			-- The work to do has to be small work and non blocking, it
			-- will continue on next call.
		require
			not done
		deferred
		end

	done: BOOLEAN is
			-- `done' returns `True' when the job is finished. Then the
			-- job may be `restart'(ed) if it need to run again.
		deferred
		end

	restart is
			-- Configure the job like the initial state.
			-- Example: when some window dialog appears second time, all
			-- jobs from this window are restarted.
		require
			done
		deferred
		ensure
			not done
		end

	infix "<" (other: JOB): BOOLEAN is
		do
			Result := priority < other.priority
		end

invariant
	priority /= Minimum_integer

end -- class JOB
