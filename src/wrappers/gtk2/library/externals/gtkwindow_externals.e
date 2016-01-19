-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKWINDOW_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_window_activate_default (a_window: POINTER): INTEGER is
 		-- gtk_window_activate_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_activate_default"
		}"
		end

	gtk_window_activate_focus (a_window: POINTER): INTEGER is
 		-- gtk_window_activate_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_activate_focus"
		}"
		end

	gtk_window_activate_key (a_window: POINTER; an_event: POINTER): INTEGER is
 		-- gtk_window_activate_key
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_activate_key"
		}"
		end

	gtk_window_add_accel_group (a_window: POINTER; an_accel_group: POINTER) is
 		-- gtk_window_add_accel_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_add_accel_group"
		}"
		end

	gtk_window_add_embedded_xid (a_window: POINTER; a_xid: NATURAL) is
 		-- gtk_window_add_embedded_xid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_add_embedded_xid"
		}"
		end

	gtk_window_add_mnemonic (a_window: POINTER; a_keyval: NATURAL; a_target: POINTER) is
 		-- gtk_window_add_mnemonic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_add_mnemonic"
		}"
		end

	gtk_window_begin_move_drag (a_window: POINTER; a_button: INTEGER; a_root_x: INTEGER; a_root_y: INTEGER; a_timestamp: NATURAL) is
 		-- gtk_window_begin_move_drag
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_begin_move_drag"
		}"
		end

	gtk_window_begin_resize_drag (a_window: POINTER; an_edge: INTEGER; a_button: INTEGER; a_root_x: INTEGER; a_root_y: INTEGER; a_timestamp: NATURAL) is
 		-- gtk_window_begin_resize_drag
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_begin_resize_drag"
		}"
		end

	-- `hidden' function _gtk_window_constrain_size skipped.
	gtk_window_deiconify (a_window: POINTER) is
 		-- gtk_window_deiconify
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_deiconify"
		}"
		end

	gtk_window_fullscreen (a_window: POINTER) is
 		-- gtk_window_fullscreen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_fullscreen"
		}"
		end

	gtk_window_get_accept_focus (a_window: POINTER): INTEGER is
 		-- gtk_window_get_accept_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_accept_focus"
		}"
		end

	gtk_window_get_decorated (a_window: POINTER): INTEGER is
 		-- gtk_window_get_decorated
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_decorated"
		}"
		end

	gtk_window_get_default_icon_list: POINTER is
 		-- gtk_window_get_default_icon_list
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_default_icon_list()"
		}"
		end

	gtk_window_get_default_icon_name: POINTER is
 		-- gtk_window_get_default_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_default_icon_name()"
		}"
		end

	gtk_window_get_default_size (a_window: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- gtk_window_get_default_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_default_size"
		}"
		end

	gtk_window_get_default_widget (a_window: POINTER): POINTER is
 		-- gtk_window_get_default_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_default_widget"
		}"
		end

	gtk_window_get_deletable (a_window: POINTER): INTEGER is
 		-- gtk_window_get_deletable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_deletable"
		}"
		end

	gtk_window_get_destroy_with_parent (a_window: POINTER): INTEGER is
 		-- gtk_window_get_destroy_with_parent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_destroy_with_parent"
		}"
		end

	gtk_window_get_focus (a_window: POINTER): POINTER is
 		-- gtk_window_get_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_focus"
		}"
		end

	gtk_window_get_focus_on_map (a_window: POINTER): INTEGER is
 		-- gtk_window_get_focus_on_map
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_focus_on_map"
		}"
		end

	gtk_window_get_gravity (a_window: POINTER): INTEGER is
 		-- gtk_window_get_gravity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_gravity"
		}"
		end

	gtk_window_get_group (a_window: POINTER): POINTER is
 		-- gtk_window_get_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_group"
		}"
		end

	gtk_window_get_icon (a_window: POINTER): POINTER is
 		-- gtk_window_get_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_icon"
		}"
		end

	gtk_window_get_icon_list (a_window: POINTER): POINTER is
 		-- gtk_window_get_icon_list
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_icon_list"
		}"
		end

	gtk_window_get_icon_name (a_window: POINTER): POINTER is
 		-- gtk_window_get_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_icon_name"
		}"
		end

	gtk_window_get_mnemonic_modifier (a_window: POINTER): INTEGER is
 		-- gtk_window_get_mnemonic_modifier
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_mnemonic_modifier"
		}"
		end

	gtk_window_get_mnemonics_visible (a_window: POINTER): INTEGER is
 		-- gtk_window_get_mnemonics_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_mnemonics_visible"
		}"
		end

	gtk_window_get_modal (a_window: POINTER): INTEGER is
 		-- gtk_window_get_modal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_modal"
		}"
		end

	gtk_window_get_opacity (a_window: POINTER): REAL is
 		-- gtk_window_get_opacity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_opacity"
		}"
		end

	gtk_window_get_position (a_window: POINTER; a_root_x: POINTER; a_root_y: POINTER) is
 		-- gtk_window_get_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_position"
		}"
		end

	gtk_window_get_resizable (a_window: POINTER): INTEGER is
 		-- gtk_window_get_resizable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_resizable"
		}"
		end

	gtk_window_get_role (a_window: POINTER): POINTER is
 		-- gtk_window_get_role
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_role"
		}"
		end

	gtk_window_get_screen (a_window: POINTER): POINTER is
 		-- gtk_window_get_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_screen"
		}"
		end

	gtk_window_get_size (a_window: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- gtk_window_get_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_size"
		}"
		end

	gtk_window_get_skip_pager_hint (a_window: POINTER): INTEGER is
 		-- gtk_window_get_skip_pager_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_skip_pager_hint"
		}"
		end

	gtk_window_get_skip_taskbar_hint (a_window: POINTER): INTEGER is
 		-- gtk_window_get_skip_taskbar_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_skip_taskbar_hint"
		}"
		end

	gtk_window_get_title (a_window: POINTER): POINTER is
 		-- gtk_window_get_title
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_title"
		}"
		end

	gtk_window_get_transient_for (a_window: POINTER): POINTER is
 		-- gtk_window_get_transient_for
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_transient_for"
		}"
		end

	gtk_window_get_type: like long_unsigned is
 		-- gtk_window_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_type()"
		}"
		end

	gtk_window_get_type_hint (a_window: POINTER): INTEGER is
 		-- gtk_window_get_type_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_type_hint"
		}"
		end

	gtk_window_get_urgency_hint (a_window: POINTER): INTEGER is
 		-- gtk_window_get_urgency_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_urgency_hint"
		}"
		end

	gtk_window_get_window_type (a_window: POINTER): INTEGER is
 		-- gtk_window_get_window_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_window_type"
		}"
		end

	gtk_window_group_add_window (a_window_group: POINTER; a_window: POINTER) is
 		-- gtk_window_group_add_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_group_add_window"
		}"
		end

	gtk_window_group_get_current_grab (a_window_group: POINTER): POINTER is
 		-- gtk_window_group_get_current_grab
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_group_get_current_grab"
		}"
		end

	gtk_window_group_get_type: like long_unsigned is
 		-- gtk_window_group_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_group_get_type()"
		}"
		end

	gtk_window_group_list_windows (a_window_group: POINTER): POINTER is
 		-- gtk_window_group_list_windows
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_group_list_windows"
		}"
		end

	gtk_window_group_new: POINTER is
 		-- gtk_window_group_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_group_new()"
		}"
		end

	gtk_window_group_remove_window (a_window_group: POINTER; a_window: POINTER) is
 		-- gtk_window_group_remove_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_group_remove_window"
		}"
		end

	gtk_window_has_group (a_window: POINTER): INTEGER is
 		-- gtk_window_has_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_has_group"
		}"
		end

	gtk_window_has_toplevel_focus (a_window: POINTER): INTEGER is
 		-- gtk_window_has_toplevel_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_has_toplevel_focus"
		}"
		end

	gtk_window_iconify (a_window: POINTER) is
 		-- gtk_window_iconify
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_iconify"
		}"
		end

	-- `hidden' function _gtk_window_internal_set_focus skipped.
	gtk_window_is_active (a_window: POINTER): INTEGER is
 		-- gtk_window_is_active
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_is_active"
		}"
		end

	-- `hidden' function _gtk_window_keys_foreach skipped.
	gtk_window_list_toplevels: POINTER is
 		-- gtk_window_list_toplevels
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_list_toplevels()"
		}"
		end

	gtk_window_maximize (a_window: POINTER) is
 		-- gtk_window_maximize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_maximize"
		}"
		end

	gtk_window_mnemonic_activate (a_window: POINTER; a_keyval: NATURAL; a_modifier: INTEGER): INTEGER is
 		-- gtk_window_mnemonic_activate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_mnemonic_activate"
		}"
		end

	gtk_window_move (a_window: POINTER; a_x: INTEGER; a_y: INTEGER) is
 		-- gtk_window_move
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_move"
		}"
		end

	gtk_window_new (a_type: INTEGER): POINTER is
 		-- gtk_window_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_new"
		}"
		end

	gtk_window_parse_geometry (a_window: POINTER; a_geometry: POINTER): INTEGER is
 		-- gtk_window_parse_geometry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_parse_geometry"
		}"
		end

	gtk_window_present (a_window: POINTER) is
 		-- gtk_window_present
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_present"
		}"
		end

	gtk_window_present_with_time (a_window: POINTER; a_timestamp: NATURAL) is
 		-- gtk_window_present_with_time
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_present_with_time"
		}"
		end

	gtk_window_propagate_key_event (a_window: POINTER; an_event: POINTER): INTEGER is
 		-- gtk_window_propagate_key_event
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_propagate_key_event"
		}"
		end

	-- `hidden' function _gtk_window_query_nonaccels skipped.
	gtk_window_remove_accel_group (a_window: POINTER; an_accel_group: POINTER) is
 		-- gtk_window_remove_accel_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_remove_accel_group"
		}"
		end

	gtk_window_remove_embedded_xid (a_window: POINTER; a_xid: NATURAL) is
 		-- gtk_window_remove_embedded_xid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_remove_embedded_xid"
		}"
		end

	gtk_window_remove_mnemonic (a_window: POINTER; a_keyval: NATURAL; a_target: POINTER) is
 		-- gtk_window_remove_mnemonic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_remove_mnemonic"
		}"
		end

	-- `hidden' function _gtk_window_reposition skipped.
	gtk_window_reshow_with_initial_size (a_window: POINTER) is
 		-- gtk_window_reshow_with_initial_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_reshow_with_initial_size"
		}"
		end

	gtk_window_resize (a_window: POINTER; a_width: INTEGER; a_height: INTEGER) is
 		-- gtk_window_resize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_resize"
		}"
		end

	gtk_window_set_accept_focus (a_window: POINTER; a_setting: INTEGER) is
 		-- gtk_window_set_accept_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_accept_focus"
		}"
		end

	gtk_window_set_auto_startup_notification (a_setting: INTEGER) is
 		-- gtk_window_set_auto_startup_notification
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_auto_startup_notification"
		}"
		end

	gtk_window_set_decorated (a_window: POINTER; a_setting: INTEGER) is
 		-- gtk_window_set_decorated
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_decorated"
		}"
		end

	gtk_window_set_default (a_window: POINTER; a_default_widget: POINTER) is
 		-- gtk_window_set_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_default"
		}"
		end

	gtk_window_set_default_icon (an_icon: POINTER) is
 		-- gtk_window_set_default_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_default_icon"
		}"
		end

	gtk_window_set_default_icon_from_file (a_filename: POINTER; an_err: POINTER): INTEGER is
 		-- gtk_window_set_default_icon_from_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_default_icon_from_file"
		}"
		end

	gtk_window_set_default_icon_list (a_list: POINTER) is
 		-- gtk_window_set_default_icon_list
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_default_icon_list"
		}"
		end

	gtk_window_set_default_icon_name (a_name: POINTER) is
 		-- gtk_window_set_default_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_default_icon_name"
		}"
		end

	gtk_window_set_default_size (a_window: POINTER; a_width: INTEGER; a_height: INTEGER) is
 		-- gtk_window_set_default_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_default_size"
		}"
		end

	gtk_window_set_deletable (a_window: POINTER; a_setting: INTEGER) is
 		-- gtk_window_set_deletable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_deletable"
		}"
		end

	gtk_window_set_destroy_with_parent (a_window: POINTER; a_setting: INTEGER) is
 		-- gtk_window_set_destroy_with_parent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_destroy_with_parent"
		}"
		end

	gtk_window_set_focus (a_window: POINTER; a_focus: POINTER) is
 		-- gtk_window_set_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_focus"
		}"
		end

	gtk_window_set_focus_on_map (a_window: POINTER; a_setting: INTEGER) is
 		-- gtk_window_set_focus_on_map
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_focus_on_map"
		}"
		end

	gtk_window_set_geometry_hints (a_window: POINTER; a_geometry_widget: POINTER; a_geometry: POINTER; a_geom_mask: INTEGER) is
 		-- gtk_window_set_geometry_hints
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_geometry_hints"
		}"
		end

	gtk_window_set_gravity (a_window: POINTER; a_gravity: INTEGER) is
 		-- gtk_window_set_gravity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_gravity"
		}"
		end

	-- `hidden' function _gtk_window_set_has_toplevel_focus skipped.
	gtk_window_set_icon (a_window: POINTER; an_icon: POINTER) is
 		-- gtk_window_set_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_icon"
		}"
		end

	gtk_window_set_icon_from_file (a_window: POINTER; a_filename: POINTER; an_err: POINTER): INTEGER is
 		-- gtk_window_set_icon_from_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_icon_from_file"
		}"
		end

	gtk_window_set_icon_list (a_window: POINTER; a_list: POINTER) is
 		-- gtk_window_set_icon_list
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_icon_list"
		}"
		end

	gtk_window_set_icon_name (a_window: POINTER; a_name: POINTER) is
 		-- gtk_window_set_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_icon_name"
		}"
		end

	-- `hidden' function _gtk_window_set_is_active skipped.
	-- `hidden' function _gtk_window_set_is_toplevel skipped.
	gtk_window_set_keep_above (a_window: POINTER; a_setting: INTEGER) is
 		-- gtk_window_set_keep_above
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_keep_above"
		}"
		end

	gtk_window_set_keep_below (a_window: POINTER; a_setting: INTEGER) is
 		-- gtk_window_set_keep_below
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_keep_below"
		}"
		end

	gtk_window_set_mnemonic_modifier (a_window: POINTER; a_modifier: INTEGER) is
 		-- gtk_window_set_mnemonic_modifier
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_mnemonic_modifier"
		}"
		end

	gtk_window_set_mnemonics_visible (a_window: POINTER; a_setting: INTEGER) is
 		-- gtk_window_set_mnemonics_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_mnemonics_visible"
		}"
		end

	gtk_window_set_modal (a_window: POINTER; a_modal: INTEGER) is
 		-- gtk_window_set_modal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_modal"
		}"
		end

	gtk_window_set_opacity (a_window: POINTER; an_opacity: REAL) is
 		-- gtk_window_set_opacity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_opacity"
		}"
		end

	gtk_window_set_position (a_window: POINTER; a_position: INTEGER) is
 		-- gtk_window_set_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_position"
		}"
		end

	gtk_window_set_resizable (a_window: POINTER; a_resizable: INTEGER) is
 		-- gtk_window_set_resizable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_resizable"
		}"
		end

	gtk_window_set_role (a_window: POINTER; a_role: POINTER) is
 		-- gtk_window_set_role
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_role"
		}"
		end

	gtk_window_set_screen (a_window: POINTER; a_screen: POINTER) is
 		-- gtk_window_set_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_screen"
		}"
		end

	gtk_window_set_skip_pager_hint (a_window: POINTER; a_setting: INTEGER) is
 		-- gtk_window_set_skip_pager_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_skip_pager_hint"
		}"
		end

	gtk_window_set_skip_taskbar_hint (a_window: POINTER; a_setting: INTEGER) is
 		-- gtk_window_set_skip_taskbar_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_skip_taskbar_hint"
		}"
		end

	gtk_window_set_startup_id (a_window: POINTER; a_startup_id: POINTER) is
 		-- gtk_window_set_startup_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_startup_id"
		}"
		end

	gtk_window_set_title (a_window: POINTER; a_title: POINTER) is
 		-- gtk_window_set_title
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_title"
		}"
		end

	gtk_window_set_transient_for (a_window: POINTER; a_parent: POINTER) is
 		-- gtk_window_set_transient_for
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_transient_for"
		}"
		end

	gtk_window_set_type_hint (a_window: POINTER; a_hint: INTEGER) is
 		-- gtk_window_set_type_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_type_hint"
		}"
		end

	gtk_window_set_urgency_hint (a_window: POINTER; a_setting: INTEGER) is
 		-- gtk_window_set_urgency_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_urgency_hint"
		}"
		end

	gtk_window_set_wmclass (a_window: POINTER; a_wmclass_name: POINTER; a_wmclass_class: POINTER) is
 		-- gtk_window_set_wmclass
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_wmclass"
		}"
		end

	gtk_window_stick (a_window: POINTER) is
 		-- gtk_window_stick
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_stick"
		}"
		end

	gtk_window_unfullscreen (a_window: POINTER) is
 		-- gtk_window_unfullscreen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_unfullscreen"
		}"
		end

	gtk_window_unmaximize (a_window: POINTER) is
 		-- gtk_window_unmaximize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_unmaximize"
		}"
		end

	-- `hidden' function _gtk_window_unset_focus_and_default skipped.
	gtk_window_unstick (a_window: POINTER) is
 		-- gtk_window_unstick
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_unstick"
		}"
		end


end -- class GTKWINDOW_EXTERNALS
