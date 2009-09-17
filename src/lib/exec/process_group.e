deferred class PROCESS_GROUP

feature {ANY}
	wait: PROCESS is
			-- Wait for a process to finish and return it. If a process has already finished but hasn't been
			-- waited for, return it immediately. If all processes have already been waited for, return `Void'.
		deferred
		end

	finished: PROCESS is
			-- If a process has already finished but hasn't been waited for, return it immediately. If all
			-- finished processes have already been waited for, return `Void'.
		deferred
		end

	count: INTEGER is
		deferred
		ensure
			Result.in_range(0, capacity)
		end

	capacity: INTEGER is
		deferred
		ensure
			Result >= 0
		end

end -- class PROCESS_GROUP
