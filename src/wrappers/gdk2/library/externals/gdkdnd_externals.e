-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKDND_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gdk_drag_abort (a_context: POINTER; a_time: NATURAL_32) is
 		-- gdk_drag_abort
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drag_abort"
		}"
		end

	gdk_drag_begin (a_window: POINTER; a_targets: POINTER): POINTER is
 		-- gdk_drag_begin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drag_begin"
		}"
		end

	gdk_drag_context_get_actions (a_context: POINTER): INTEGER is
 		-- gdk_drag_context_get_actions
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drag_context_get_actions"
		}"
		end

	gdk_drag_context_get_dest_window (a_context: POINTER): POINTER is
 		-- gdk_drag_context_get_dest_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drag_context_get_dest_window"
		}"
		end

	gdk_drag_context_get_protocol (a_context: POINTER): INTEGER is
 		-- gdk_drag_context_get_protocol
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drag_context_get_protocol"
		}"
		end

	gdk_drag_context_get_selected_action (a_context: POINTER): INTEGER is
 		-- gdk_drag_context_get_selected_action
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drag_context_get_selected_action"
		}"
		end

	gdk_drag_context_get_source_window (a_context: POINTER): POINTER is
 		-- gdk_drag_context_get_source_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drag_context_get_source_window"
		}"
		end

	gdk_drag_context_get_suggested_action (a_context: POINTER): INTEGER is
 		-- gdk_drag_context_get_suggested_action
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drag_context_get_suggested_action"
		}"
		end

	gdk_drag_context_get_type: NATURAL_64 is
 		-- gdk_drag_context_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drag_context_get_type()"
		}"
		end

	gdk_drag_context_list_targets (a_context: POINTER): POINTER is
 		-- gdk_drag_context_list_targets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drag_context_list_targets"
		}"
		end

	gdk_drag_drop (a_context: POINTER; a_time: NATURAL_32) is
 		-- gdk_drag_drop
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drag_drop"
		}"
		end

	gdk_drag_drop_succeeded (a_context: POINTER): INTEGER_32 is
 		-- gdk_drag_drop_succeeded
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drag_drop_succeeded"
		}"
		end

	gdk_drag_find_window_for_screen (a_context: POINTER; a_drag_window: POINTER; a_screen: POINTER; a_x_root: INTEGER_32; a_y_root: INTEGER_32; a_dest_window: POINTER; a_protocol: POINTER) is
 		-- gdk_drag_find_window_for_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drag_find_window_for_screen"
		}"
		end

	gdk_drag_get_protocol_for_display (a_display: POINTER; a_xid: NATURAL_32; a_protocol: POINTER): NATURAL_32 is
 		-- gdk_drag_get_protocol_for_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drag_get_protocol_for_display"
		}"
		end

	gdk_drag_get_selection (a_context: POINTER): POINTER is
 		-- gdk_drag_get_selection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drag_get_selection"
		}"
		end

	gdk_drag_motion (a_context: POINTER; a_dest_window: POINTER; a_protocol: INTEGER; a_x_root: INTEGER_32; a_y_root: INTEGER_32; a_suggested_action: INTEGER; a_possible_actions: INTEGER; a_time: NATURAL_32): INTEGER_32 is
 		-- gdk_drag_motion
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drag_motion"
		}"
		end

	gdk_drag_status (a_context: POINTER; an_action: INTEGER; a_time: NATURAL_32) is
 		-- gdk_drag_status
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drag_status"
		}"
		end

	gdk_drop_finish (a_context: POINTER; a_success: INTEGER_32; a_time: NATURAL_32) is
 		-- gdk_drop_finish
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drop_finish"
		}"
		end

	gdk_drop_reply (a_context: POINTER; an_ok: INTEGER_32; a_time: NATURAL_32) is
 		-- gdk_drop_reply
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drop_reply"
		}"
		end


end -- class GDKDND_EXTERNALS
