-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GTIMER_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_usleep (a_microseconds: NATURAL_32) is
 		-- g_usleep
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_usleep"
		}"
		end

	g_timer_elapsed (a_timer: POINTER; a_microseconds: POINTER): REAL_64 is
 		-- g_timer_elapsed
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_timer_elapsed"
		}"
		end

	g_time_val_to_iso8601 (a_time_: POINTER): POINTER is
 		-- g_time_val_to_iso8601
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_time_val_to_iso8601"
		}"
		end

	g_timer_stop (a_timer: POINTER) is
 		-- g_timer_stop
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_timer_stop"
		}"
		end

	g_timer_continue (a_timer: POINTER) is
 		-- g_timer_continue
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_timer_continue"
		}"
		end

	g_time_val_add (a_time_: POINTER; a_microseconds: INTEGER_32) is
 		-- g_time_val_add
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_time_val_add"
		}"
		end

	g_timer_reset (a_timer: POINTER) is
 		-- g_timer_reset
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_timer_reset"
		}"
		end

	g_timer_new: POINTER is
 		-- g_timer_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_timer_new"
		}"
		end

	g_time_val_from_iso8601 (an_iso_date: POINTER; a_time_: POINTER): INTEGER_32 is
 		-- g_time_val_from_iso8601
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_time_val_from_iso8601"
		}"
		end

	g_timer_start (a_timer: POINTER) is
 		-- g_timer_start
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_timer_start"
		}"
		end

	g_timer_destroy (a_timer: POINTER) is
 		-- g_timer_destroy
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_timer_destroy"
		}"
		end

end
