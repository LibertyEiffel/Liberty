note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class G_TIMER

inherit C_STRUCT redefine default_create end

insert G_TIMER_EXTERNALS undefine default_create end

-- creation make

feature {} -- 
	struct_size: INTEGER
		external "C inline use <glib.h>"
		alias "sizeof(GTimer)"
		end

feature {ANY} -- Creation
	default_create is --, make is
			-- Creates a new timer, and starts timing
		do
			handle := g_timer_new
		end
	
	dispose
		do
			g_timer_destroy (handle)
			handle := default_pointer
		end
	
feature {ANY}
	start
			-- (Re)starts timing
		do
			g_timer_start(handle)
		end

	stop
			-- Marks an end time
		do
			 g_timer_stop (handle)
		end

	continue
			-- Resumes a timer that has previously been stopped
		require
			-- TODO is_stopped
		do
			g_timer_continue (handle)
		end

	elapsed: REAL
			-- If timer has been started but not stopped, obtains the
			-- time since the timer was started. If timer has been
			-- stopped, obtains the elapsed time between the time it was
			-- started and the time it was stopped. Result unit is
			-- seconds elapsed, including any fractional part
		local
			microseconds: REAL
		do
			Result:= g_timer_elapsed (handle, $microseconds)
		end

end

