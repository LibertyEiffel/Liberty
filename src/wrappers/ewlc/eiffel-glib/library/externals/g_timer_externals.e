note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class G_TIMER_EXTERNALS
	
inherit ANY undefine is_equal, copy end

feature {} -- External calls
	g_timer_new: POINTER
			-- Creates a new timer, and starts timing
			-- (i.e. g_timer_start() is implicitly called for you).
			-- Returns : a new GTimer.
		external "C use <glib.h>"
		end

	g_timer_start (timer: POINTER)
			-- Marks a start time, so that future calls to
			-- g_timer_elapsed() will report the time since
			-- g_timer_start() was called.  g_timer_new() automatically
			-- marks the start time, so no need to call g_timer_start()
			-- immediately after creating the timer.  timer : a GTimer.
		external "C use <glib.h>"
		end

	g_timer_stop (timer: POINTER)
			-- Marks an end time, so calls to g_timer_elapsed() will return
			-- the difference between this end time and the start time.
			-- timer : a GTimer.
		external "C use <glib.h>"
		end

	g_timer_continue (timer: POINTER)
			-- Resumes a timer that has previously been stopped with
			-- g_timer_stop(). g_timer_stop() must be called before using
			-- this function.  timer : a GTimer.
		external "C use <glib.h>"
		end

	g_timer_elapsed (timer,gulong_microseconds: POINTER): REAL
		-- If timer has been started but not stopped, obtains the time
		-- since the timer was started. If timer has been stopped,
		-- obtains the elapsed time between the time it was started and
		-- the time it was stopped. The return value is the number of
		-- seconds elapsed, including any fractional part. The
		-- microseconds out parameter is essentially useless.  timer : a
		-- GTimer.  microseconds : fractional part of seconds elapsed,
		-- in microseconds (that is, the total number of microseconds
		-- elapsed, modulo 1000000) Returns : seconds elapsed as a
		-- floating point value, including any fractional part.  --
		external "C use <glib.h>"
		end

	g_timer_destroy (timer: POINTER)
			-- Destroys a timer, freeing associated resources.  timer : a
			-- GTimer to destroy.
		external "C use <glib.h>"
		end
end
