-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTIMER_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_usleep (a_microseconds: NATURAL_32) is
 		-- g_usleep (node at line 925)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_usleep"
		}"
		end

	g_timer_elapsed (a_timer: POINTER; a_microseconds: POINTER): REAL_64 is
 		-- g_timer_elapsed (node at line 1156)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_timer_elapsed"
		}"
		end

	g_time_val_to_iso8601 (a_time: POINTER): POINTER is
 		-- g_time_val_to_iso8601 (node at line 1292)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_time_val_to_iso8601"
		}"
		end

	g_timer_stop (a_timer: POINTER) is
 		-- g_timer_stop (node at line 1384)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_timer_stop"
		}"
		end

	g_timer_continue (a_timer: POINTER) is
 		-- g_timer_continue (node at line 1732)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_timer_continue"
		}"
		end

	g_time_val_add (a_time: POINTER; a_microseconds: INTEGER_32) is
 		-- g_time_val_add (node at line 2683)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_time_val_add"
		}"
		end

	g_timer_reset (a_timer: POINTER) is
 		-- g_timer_reset (node at line 3060)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_timer_reset"
		}"
		end

	g_timer_new: POINTER is
 		-- g_timer_new (node at line 4842)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_timer_new()"
		}"
		end

	g_time_val_from_iso8601 (an_iso_date: POINTER; a_time: POINTER): INTEGER_32 is
 		-- g_time_val_from_iso8601 (node at line 6290)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_time_val_from_iso8601"
		}"
		end

	g_timer_start (a_timer: POINTER) is
 		-- g_timer_start (node at line 6494)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_timer_start"
		}"
		end

	g_timer_destroy (a_timer: POINTER) is
 		-- g_timer_destroy (node at line 6597)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_timer_destroy"
		}"
		end


end -- class GTIMER_EXTERNALS
