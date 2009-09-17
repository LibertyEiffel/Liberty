class SIMPLE_PERIODIC_JOB
	-- Pseudo periodic job. The timing is not exact : the time between
	-- two execution may be longer than the given period depending on
	-- time needed to execute ready tasks. There is no try to recover the
	-- time lost each time.

inherit
	PERIODIC_JOB

creation {ANY}
	set_work

feature {ANY}
	set_work (t: like task; tr: like task_restart; prio: INTEGER; seconds: like period) is
			-- t has to return True while continue
		require
			t /= Void
			prio /= Minimum_integer
			seconds > 0
		do
			task := t
			task_restart := tr
			priority := prio
			period := seconds
			next_time.update
			next_time := next_time + period
		ensure
			priority = prio
			period = seconds
		end

feature {LOOP_ITEM}
	done: BOOLEAN

	continue is
		local
			cont: BOOLEAN
		do
			-- BUG : done := not task.item([]);
			cont := task.item([])
			done := not cont
		end

	restart is
		do
			if task_restart /= Void then
				task_restart.call([])
			end
			done := False
		end

feature {}
	task: PREDICATE[TUPLE]

	task_restart: PROCEDURE[TUPLE]

end -- class SIMPLE_PERIODIC_JOB
