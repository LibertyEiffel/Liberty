-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTIMER_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_time_val_add (a_time: POINTER; a_microseconds: like long) 
               -- g_time_val_add
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_time_val_add"
               }"
               end

	g_time_val_from_iso8601 (an_iso_date: POINTER; a_time: POINTER): INTEGER 
               -- g_time_val_from_iso8601
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_time_val_from_iso8601"
               }"
               end

	g_time_val_to_iso8601 (a_time: POINTER): POINTER 
               -- g_time_val_to_iso8601
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_time_val_to_iso8601"
               }"
               end

	g_timer_continue (a_timer: POINTER) 
               -- g_timer_continue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_timer_continue"
               }"
               end

	g_timer_destroy (a_timer: POINTER) 
               -- g_timer_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_timer_destroy"
               }"
               end

	g_timer_elapsed (a_timer: POINTER; a_microseconds: POINTER): REAL 
               -- g_timer_elapsed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_timer_elapsed"
               }"
               end

	g_timer_new: POINTER 
               -- g_timer_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_timer_new"
               }"
               end

	g_timer_reset (a_timer: POINTER) 
               -- g_timer_reset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_timer_reset"
               }"
               end

	g_timer_start (a_timer: POINTER) 
               -- g_timer_start
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_timer_start"
               }"
               end

	g_timer_stop (a_timer: POINTER) 
               -- g_timer_stop
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_timer_stop"
               }"
               end

	g_usleep (a_microseconds: like long_unsigned) 
               -- g_usleep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_usleep"
               }"
               end


end -- class GTIMER_EXTERNALS
