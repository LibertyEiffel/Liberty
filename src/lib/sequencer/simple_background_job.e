class SIMPLE_BACKGROUND_JOB
	-- Describe job to be executed in the background, when there nothing
	-- more important to do. Such job is ready to run at any time.

inherit
	BACKGROUND_JOB

creation {ANY}
	set_work

feature {ANY}
	set_work (t: like task; tr: like task_restart; prio: INTEGER) is
			-- t has to return True while continue
		require
			t /= Void
			prio /= Minimum_integer
		do
			task := t
			task_restart := tr
			priority := prio
		ensure
			priority = prio
		end

feature {LOOP_ITEM}
	done: BOOLEAN

	continue is
		local
			cont: BOOLEAN
		do
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

end -- class SIMPLE_BACKGROUND_JOB
