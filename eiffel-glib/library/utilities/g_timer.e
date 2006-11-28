indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class G_TIMER

inherit
	C_STRUCT
	
insert
	G_TIMER_EXTERNALS

creation
	make

feature {}
	timer: POINTER
	
feature {} -- Creation
	make is
			-- Creates a new timer, and starts timing
		do
			timer := g_timer_new
		end
	
feature
	start is
			-- (Re)starts timing
		do
			g_timer_start(timer)
		end

	stop is 
			-- Marks an end time
		do
			 g_timer_stop (timer)
		end

	continue is
			-- Resumes a timer that has previously been stopped
		require
			-- TODO is_stopped
		do
			g_timer_continue (timer)
		end

	elapsed: REAL is
			-- If timer has been started but not stopped, obtains the
			-- time since the timer was started. If timer has been
			-- stopped, obtains the elapsed time between the time it was
			-- started and the time it was stopped. Result unit is
			-- seconds elapsed, including any fractional part
		local
			microseconds: REAL
		do
			Result:= g_timer_elapsed (timer, $microseconds)
		end

end

