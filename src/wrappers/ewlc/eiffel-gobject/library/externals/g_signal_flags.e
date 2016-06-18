note
	description: "wrapper of enum GSignalFlags; the signal flags are used to specify a signal's behaviour, the overall signal description outlines how especially the RUN flags control the stages of a signal emission."

deferred class G_SIGNAL_FLAGS 

inherit ANY undefine is_equal, copy end

feature {} --  enum
	g_signal_run_first: INTEGER
			-- Invoke the object method handler in the first emission
			-- stage.
		external "C macro use <glib-object.h>"
		alias "G_SIGNAL_RUN_FIRST"
		end
	
	g_signal_run_last: INTEGER
			-- Invoke the object method handler in the third emission stage.
		external "C macro use <glib-object.h>"
		alias "G_SIGNAL_RUN_LAST"
		end

	g_signal_run_cleanup: INTEGER
			-- Invoke the object method handler in the last emission stage.
		external "C macro use <glib-object.h>"
		alias "G_SIGNAL_RUN_CLEANUP"
		end

	g_signal_no_recurse: INTEGER
			-- Signals being emitted for an object while currently being in emission for this very object will not be emitted recursively, but instead cause the first emission to be restarted.
		external "C macro use <glib-object.h>"
		alias "G_SIGNAL_NO_RECURSE"
		end

	g_signal_detailed: INTEGER
			-- This signal supports "::detail" appendices to the signal name upon handler connections and emissions.
		external "C macro use <glib-object.h>"
		alias "G_SIGNAL_DETAILED"
		end

	g_signal_action: INTEGER
			-- Action signals are signals that may freely be emitted on alive objects from user code via g_signal_emit() and friends, without the need of being embedded into extra code that performs pre or post emission adjustments on the object. They can also be thought of as object methods which can be called generically by third-party code.
		external "C macro use <glib-object.h>"
		alias "G_SIGNAL_ACTION"
		end

	g_signal_no_hooks: INTEGER
			-- No emissions hooks are supported for this signal.
		external "C macro use <glib-object.h>"
		alias "G_SIGNAL_NO_HOOKS"
		end


	are_valid_signal_flags (some_flags: INTEGER): BOOLEAN
		-- are `some_flags' valid G_SIGNAL_FLAGS?
		do
			Result:=(some_flags & (g_signal_run_first	|
										  g_signal_run_last  |
										  g_signal_run_cleanup |
										  g_signal_no_recurse  |
										  g_signal_detailed    |
										  g_signal_action	|
										  g_signal_no_hooks)).to_boolean
		end
end
