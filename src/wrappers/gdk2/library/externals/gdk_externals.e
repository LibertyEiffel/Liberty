-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDK_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gdk_add_option_entries_libgtk_only (a_group: POINTER) is
 		-- gdk_add_option_entries_libgtk_only
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_add_option_entries_libgtk_only"
		}"
		end

	gdk_beep is
 		-- gdk_beep
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_beep()"
		}"
		end

	gdk_error_trap_pop: INTEGER_32 is
 		-- gdk_error_trap_pop
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_error_trap_pop()"
		}"
		end

	gdk_error_trap_push is
 		-- gdk_error_trap_push
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_error_trap_push()"
		}"
		end

	gdk_event_send_client_message (an_event: POINTER; a_winid: NATURAL_32): INTEGER_32 is
 		-- gdk_event_send_client_message
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_send_client_message"
		}"
		end

	gdk_event_send_client_message_for_display (a_display: POINTER; an_event: POINTER; a_winid: NATURAL_32): INTEGER_32 is
 		-- gdk_event_send_client_message_for_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_send_client_message_for_display"
		}"
		end

	gdk_event_send_clientmessage_toall (an_event: POINTER) is
 		-- gdk_event_send_clientmessage_toall
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_event_send_clientmessage_toall"
		}"
		end

	gdk_flush is
 		-- gdk_flush
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_flush()"
		}"
		end

	gdk_get_display: POINTER is
 		-- gdk_get_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_get_display()"
		}"
		end

	gdk_get_display_arg_name: POINTER is
 		-- gdk_get_display_arg_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_get_display_arg_name()"
		}"
		end

	gdk_get_program_class: POINTER is
 		-- gdk_get_program_class
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_get_program_class()"
		}"
		end

	gdk_init (an_argc: POINTER; an_argv: POINTER) is
 		-- gdk_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_init"
		}"
		end

	gdk_init_check (an_argc: POINTER; an_argv: POINTER): INTEGER_32 is
 		-- gdk_init_check
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_init_check"
		}"
		end

	gdk_keyboard_grab (a_window: POINTER; an_owner_events: INTEGER_32; a_time: NATURAL_32): INTEGER is
 		-- gdk_keyboard_grab
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keyboard_grab"
		}"
		end

	gdk_keyboard_grab_info_libgtk_only (a_display: POINTER; a_grab_window: POINTER; an_owner_events: POINTER): INTEGER_32 is
 		-- gdk_keyboard_grab_info_libgtk_only
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keyboard_grab_info_libgtk_only"
		}"
		end

	gdk_keyboard_ungrab (a_time: NATURAL_32) is
 		-- gdk_keyboard_ungrab
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keyboard_ungrab"
		}"
		end

	gdk_notify_startup_complete is
 		-- gdk_notify_startup_complete
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_notify_startup_complete()"
		}"
		end

	gdk_notify_startup_complete_with_id (a_startup_id: POINTER) is
 		-- gdk_notify_startup_complete_with_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_notify_startup_complete_with_id"
		}"
		end

	gdk_parse_args (an_argc: POINTER; an_argv: POINTER) is
 		-- gdk_parse_args
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_parse_args"
		}"
		end

	gdk_pointer_grab (a_window: POINTER; an_owner_events: INTEGER_32; an_event_mask: INTEGER; a_confine_to: POINTER; a_cursor: POINTER; a_time: NATURAL_32): INTEGER is
 		-- gdk_pointer_grab
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_pointer_grab"
		}"
		end

	gdk_pointer_grab_info_libgtk_only (a_display: POINTER; a_grab_window: POINTER; an_owner_events: POINTER): INTEGER_32 is
 		-- gdk_pointer_grab_info_libgtk_only
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_pointer_grab_info_libgtk_only"
		}"
		end

	gdk_pointer_is_grabbed: INTEGER_32 is
 		-- gdk_pointer_is_grabbed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_pointer_is_grabbed()"
		}"
		end

	gdk_pointer_ungrab (a_time: NATURAL_32) is
 		-- gdk_pointer_ungrab
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_pointer_ungrab"
		}"
		end

	gdk_pre_parse_libgtk_only is
 		-- gdk_pre_parse_libgtk_only
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_pre_parse_libgtk_only()"
		}"
		end

	gdk_rectangle_get_type: NATURAL_64 is
 		-- gdk_rectangle_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_rectangle_get_type()"
		}"
		end

	gdk_rectangle_intersect (a_src1: POINTER; a_src2: POINTER; a_dest: POINTER): INTEGER_32 is
 		-- gdk_rectangle_intersect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_rectangle_intersect"
		}"
		end

	gdk_rectangle_union (a_src1: POINTER; a_src2: POINTER; a_dest: POINTER) is
 		-- gdk_rectangle_union
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_rectangle_union"
		}"
		end

	gdk_screen_height: INTEGER_32 is
 		-- gdk_screen_height
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_height()"
		}"
		end

	gdk_screen_height_mm: INTEGER_32 is
 		-- gdk_screen_height_mm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_height_mm()"
		}"
		end

	gdk_screen_width: INTEGER_32 is
 		-- gdk_screen_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_width()"
		}"
		end

	gdk_screen_width_mm: INTEGER_32 is
 		-- gdk_screen_width_mm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_width_mm()"
		}"
		end

	gdk_set_double_click_time (a_msec: NATURAL_32) is
 		-- gdk_set_double_click_time
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_set_double_click_time"
		}"
		end

	gdk_set_program_class (a_program_class: POINTER) is
 		-- gdk_set_program_class
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_set_program_class"
		}"
		end

	gdk_threads_add_idle (a_function: POINTER; a_data: POINTER): NATURAL_32 is
 		-- gdk_threads_add_idle
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_threads_add_idle"
		}"
		end

	gdk_threads_add_idle_full (a_priority: INTEGER_32; a_function: POINTER; a_data: POINTER; a_notify: POINTER): NATURAL_32 is
 		-- gdk_threads_add_idle_full
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_threads_add_idle_full"
		}"
		end

	gdk_threads_add_timeout (an_interval: NATURAL_32; a_function: POINTER; a_data: POINTER): NATURAL_32 is
 		-- gdk_threads_add_timeout
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_threads_add_timeout"
		}"
		end

	gdk_threads_add_timeout_full (a_priority: INTEGER_32; an_interval: NATURAL_32; a_function: POINTER; a_data: POINTER; a_notify: POINTER): NATURAL_32 is
 		-- gdk_threads_add_timeout_full
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_threads_add_timeout_full"
		}"
		end

	gdk_threads_add_timeout_seconds (an_interval: NATURAL_32; a_function: POINTER; a_data: POINTER): NATURAL_32 is
 		-- gdk_threads_add_timeout_seconds
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_threads_add_timeout_seconds"
		}"
		end

	gdk_threads_add_timeout_seconds_full (a_priority: INTEGER_32; an_interval: NATURAL_32; a_function: POINTER; a_data: POINTER; a_notify: POINTER): NATURAL_32 is
 		-- gdk_threads_add_timeout_seconds_full
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_threads_add_timeout_seconds_full"
		}"
		end

	gdk_threads_enter is
 		-- gdk_threads_enter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_threads_enter()"
		}"
		end

	gdk_threads_init is
 		-- gdk_threads_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_threads_init()"
		}"
		end

	gdk_threads_leave is
 		-- gdk_threads_leave
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_threads_leave()"
		}"
		end

	gdk_threads_lock: POINTER is
 		-- gdk_threads_lock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_threads_lock"
		}"
		end

	address_of_gdk_threads_lock: POINTER is
 		-- Address of gdk_threads_lock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gdk_threads_lock"
		}"
		end

	set_gdk_threads_lock (a_value: POINTER) is
		-- Set variable gdk_threads_lock value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gdk_threads_lock"
		}"
		end

	gdk_threads_set_lock_functions (an_enter_fn: POINTER; a_leave_fn: POINTER) is
 		-- gdk_threads_set_lock_functions
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_threads_set_lock_functions"
		}"
		end

	gdk_threads_unlock: POINTER is
 		-- gdk_threads_unlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_threads_unlock"
		}"
		end

	address_of_gdk_threads_unlock: POINTER is
 		-- Address of gdk_threads_unlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gdk_threads_unlock"
		}"
		end

	set_gdk_threads_unlock (a_value: POINTER) is
		-- Set variable gdk_threads_unlock value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gdk_threads_unlock"
		}"
		end


end -- class GDK_EXTERNALS
