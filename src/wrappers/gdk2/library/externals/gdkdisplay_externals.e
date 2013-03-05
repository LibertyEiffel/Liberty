-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKDISPLAY_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gdk_display_add_client_message_filter (a_display: POINTER; a_message_type: POINTER; a_func: POINTER; a_data: POINTER) is
 		-- gdk_display_add_client_message_filter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_add_client_message_filter"
		}"
		end

	gdk_display_beep (a_display: POINTER) is
 		-- gdk_display_beep
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_beep"
		}"
		end

	gdk_display_close (a_display: POINTER) is
 		-- gdk_display_close
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_close"
		}"
		end

	gdk_display_flush (a_display: POINTER) is
 		-- gdk_display_flush
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_flush"
		}"
		end

	gdk_display_get_core_pointer (a_display: POINTER): POINTER is
 		-- gdk_display_get_core_pointer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_get_core_pointer"
		}"
		end

	gdk_display_get_default: POINTER is
 		-- gdk_display_get_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_get_default()"
		}"
		end

	gdk_display_get_default_cursor_size (a_display: POINTER): NATURAL_32 is
 		-- gdk_display_get_default_cursor_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_get_default_cursor_size"
		}"
		end

	gdk_display_get_default_group (a_display: POINTER): POINTER is
 		-- gdk_display_get_default_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_get_default_group"
		}"
		end

	gdk_display_get_default_screen (a_display: POINTER): POINTER is
 		-- gdk_display_get_default_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_get_default_screen"
		}"
		end

	gdk_display_get_event (a_display: POINTER): POINTER is
 		-- gdk_display_get_event
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_get_event"
		}"
		end

	gdk_display_get_maximal_cursor_size (a_display: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- gdk_display_get_maximal_cursor_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_get_maximal_cursor_size"
		}"
		end

	gdk_display_get_n_screens (a_display: POINTER): INTEGER_32 is
 		-- gdk_display_get_n_screens
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_get_n_screens"
		}"
		end

	gdk_display_get_name (a_display: POINTER): POINTER is
 		-- gdk_display_get_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_get_name"
		}"
		end

	gdk_display_get_pointer (a_display: POINTER; a_screen: POINTER; a_x: POINTER; a_y: POINTER; a_mask: POINTER) is
 		-- gdk_display_get_pointer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_get_pointer"
		}"
		end

	gdk_display_get_screen (a_display: POINTER; a_screen_num: INTEGER_32): POINTER is
 		-- gdk_display_get_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_get_screen"
		}"
		end

	gdk_display_get_type: NATURAL_64 is
 		-- gdk_display_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_get_type()"
		}"
		end

	gdk_display_get_window_at_pointer (a_display: POINTER; a_win_x: POINTER; a_win_y: POINTER): POINTER is
 		-- gdk_display_get_window_at_pointer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_get_window_at_pointer"
		}"
		end

	gdk_display_is_closed (a_display: POINTER): INTEGER_32 is
 		-- gdk_display_is_closed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_is_closed"
		}"
		end

	gdk_display_keyboard_ungrab (a_display: POINTER; a_time: NATURAL_32) is
 		-- gdk_display_keyboard_ungrab
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_keyboard_ungrab"
		}"
		end

	gdk_display_list_devices (a_display: POINTER): POINTER is
 		-- gdk_display_list_devices
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_list_devices"
		}"
		end

	gdk_display_open (a_display_name: POINTER): POINTER is
 		-- gdk_display_open
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_open"
		}"
		end

	gdk_display_open_default_libgtk_only: POINTER is
 		-- gdk_display_open_default_libgtk_only
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_open_default_libgtk_only()"
		}"
		end

	gdk_display_peek_event (a_display: POINTER): POINTER is
 		-- gdk_display_peek_event
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_peek_event"
		}"
		end

	gdk_display_pointer_is_grabbed (a_display: POINTER): INTEGER_32 is
 		-- gdk_display_pointer_is_grabbed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_pointer_is_grabbed"
		}"
		end

	gdk_display_pointer_ungrab (a_display: POINTER; a_time: NATURAL_32) is
 		-- gdk_display_pointer_ungrab
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_pointer_ungrab"
		}"
		end

	gdk_display_put_event (a_display: POINTER; an_event: POINTER) is
 		-- gdk_display_put_event
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_put_event"
		}"
		end

	gdk_display_request_selection_notification (a_display: POINTER; a_selection: POINTER): INTEGER_32 is
 		-- gdk_display_request_selection_notification
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_request_selection_notification"
		}"
		end

	gdk_display_set_double_click_distance (a_display: POINTER; a_distance: NATURAL_32) is
 		-- gdk_display_set_double_click_distance
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_set_double_click_distance"
		}"
		end

	gdk_display_set_double_click_time (a_display: POINTER; a_msec: NATURAL_32) is
 		-- gdk_display_set_double_click_time
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_set_double_click_time"
		}"
		end

	gdk_display_store_clipboard (a_display: POINTER; a_clipboard_window: POINTER; a_time: NATURAL_32; a_targets: POINTER; a_n_targets: INTEGER_32) is
 		-- gdk_display_store_clipboard
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_store_clipboard"
		}"
		end

	gdk_display_supports_clipboard_persistence (a_display: POINTER): INTEGER_32 is
 		-- gdk_display_supports_clipboard_persistence
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_supports_clipboard_persistence"
		}"
		end

	gdk_display_supports_composite (a_display: POINTER): INTEGER_32 is
 		-- gdk_display_supports_composite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_supports_composite"
		}"
		end

	gdk_display_supports_cursor_alpha (a_display: POINTER): INTEGER_32 is
 		-- gdk_display_supports_cursor_alpha
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_supports_cursor_alpha"
		}"
		end

	gdk_display_supports_cursor_color (a_display: POINTER): INTEGER_32 is
 		-- gdk_display_supports_cursor_color
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_supports_cursor_color"
		}"
		end

	gdk_display_supports_input_shapes (a_display: POINTER): INTEGER_32 is
 		-- gdk_display_supports_input_shapes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_supports_input_shapes"
		}"
		end

	gdk_display_supports_selection_notification (a_display: POINTER): INTEGER_32 is
 		-- gdk_display_supports_selection_notification
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_supports_selection_notification"
		}"
		end

	gdk_display_supports_shapes (a_display: POINTER): INTEGER_32 is
 		-- gdk_display_supports_shapes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_supports_shapes"
		}"
		end

	gdk_display_sync (a_display: POINTER) is
 		-- gdk_display_sync
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_sync"
		}"
		end

	gdk_display_warp_pointer (a_display: POINTER; a_screen: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- gdk_display_warp_pointer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_warp_pointer"
		}"
		end


end -- class GDKDISPLAY_EXTERNALS
