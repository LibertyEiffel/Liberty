-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKEVENTS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gdk_add_client_message_filter (a_message_type: POINTER; a_func: POINTER; a_data: POINTER) is
 		-- gdk_add_client_message_filter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_add_client_message_filter"
		}"
		end

	gdk_event_copy (an_event: POINTER): POINTER is
 		-- gdk_event_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_copy"
		}"
		end

	gdk_event_free (an_event: POINTER) is
 		-- gdk_event_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_free"
		}"
		end

	gdk_event_get: POINTER is
 		-- gdk_event_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_get()"
		}"
		end

	gdk_event_get_axis (an_event: POINTER; an_axis_use: INTEGER; a_value: POINTER): INTEGER_32 is
 		-- gdk_event_get_axis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_get_axis"
		}"
		end

	gdk_event_get_coords (an_event: POINTER; a_x_win: POINTER; a_y_win: POINTER): INTEGER_32 is
 		-- gdk_event_get_coords
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_get_coords"
		}"
		end

	gdk_event_get_root_coords (an_event: POINTER; a_x_root: POINTER; a_y_root: POINTER): INTEGER_32 is
 		-- gdk_event_get_root_coords
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_get_root_coords"
		}"
		end

	gdk_event_get_screen (an_event: POINTER): POINTER is
 		-- gdk_event_get_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_get_screen"
		}"
		end

	gdk_event_get_state (an_event: POINTER; a_state: POINTER): INTEGER_32 is
 		-- gdk_event_get_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_get_state"
		}"
		end

	gdk_event_get_time (an_event: POINTER): NATURAL_32 is
 		-- gdk_event_get_time
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_get_time"
		}"
		end

	gdk_event_get_type: NATURAL_64 is
 		-- gdk_event_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_get_type()"
		}"
		end

	gdk_event_handler_set (a_func: POINTER; a_data: POINTER; a_notify: POINTER) is
 		-- gdk_event_handler_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_handler_set"
		}"
		end

	gdk_event_new (a_type: INTEGER): POINTER is
 		-- gdk_event_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_new"
		}"
		end

	gdk_event_peek: POINTER is
 		-- gdk_event_peek
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_peek()"
		}"
		end

	gdk_event_put (an_event: POINTER) is
 		-- gdk_event_put
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_put"
		}"
		end

	gdk_event_request_motions (an_event: POINTER) is
 		-- gdk_event_request_motions
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_request_motions"
		}"
		end

	gdk_event_set_screen (an_event: POINTER; a_screen: POINTER) is
 		-- gdk_event_set_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_set_screen"
		}"
		end

	gdk_events_pending: INTEGER_32 is
 		-- gdk_events_pending
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_events_pending()"
		}"
		end

	gdk_get_show_events: INTEGER_32 is
 		-- gdk_get_show_events
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_get_show_events()"
		}"
		end

	gdk_set_show_events (a_show_events: INTEGER_32) is
 		-- gdk_set_show_events
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_set_show_events"
		}"
		end

	gdk_setting_get (a_name: POINTER; a_value: POINTER): INTEGER_32 is
 		-- gdk_setting_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_setting_get"
		}"
		end


end -- class GDKEVENTS_EXTERNALS
