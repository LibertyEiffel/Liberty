-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKWINDOW_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function _gtk_window_set_is_toplevel skipped.
	-- `hidden' function _gtk_window_set_has_toplevel_focus skipped.
	gtk_window_set_resizable (a_window: POINTER; a_resizable: INTEGER_32) is
 		-- gtk_window_set_resizable (node at line 858)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_resizable"
		}"
		end

	gtk_window_get_focus (a_window: POINTER): POINTER is
 		-- gtk_window_get_focus (node at line 2613)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_focus"
		}"
		end

	gtk_window_has_toplevel_focus (a_window: POINTER): INTEGER_32 is
 		-- gtk_window_has_toplevel_focus (node at line 2774)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_has_toplevel_focus"
		}"
		end

	-- `hidden' function _gtk_window_constrain_size skipped.
	gtk_window_get_skip_taskbar_hint (a_window: POINTER): INTEGER_32 is
 		-- gtk_window_get_skip_taskbar_hint (node at line 2915)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_skip_taskbar_hint"
		}"
		end

	gtk_window_set_role (a_window: POINTER; a_role: POINTER) is
 		-- gtk_window_set_role (node at line 4331)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_role"
		}"
		end

	gtk_window_set_frame_dimensions (a_window: POINTER; a_left: INTEGER_32; a_top: INTEGER_32; a_right: INTEGER_32; a_bottom: INTEGER_32) is
 		-- gtk_window_set_frame_dimensions (node at line 4370)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_frame_dimensions"
		}"
		end

	gtk_window_get_default_icon_name: POINTER is
 		-- gtk_window_get_default_icon_name (node at line 4668)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_default_icon_name()"
		}"
		end

	gtk_window_group_get_type: NATURAL_32 is
 		-- gtk_window_group_get_type (node at line 4822)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_group_get_type()"
		}"
		end

	gtk_window_reshow_with_initial_size (a_window: POINTER) is
 		-- gtk_window_reshow_with_initial_size (node at line 4839)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_reshow_with_initial_size"
		}"
		end

	gtk_window_move (a_window: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- gtk_window_move (node at line 4904)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_move"
		}"
		end

	gtk_window_set_mnemonics_visible (a_window: POINTER; a_setting: INTEGER_32) is
 		-- gtk_window_set_mnemonics_visible (node at line 4966)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_mnemonics_visible"
		}"
		end

	gtk_window_add_accel_group (a_window: POINTER; an_accel_group: POINTER) is
 		-- gtk_window_add_accel_group (node at line 4998)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_add_accel_group"
		}"
		end

	gtk_window_unfullscreen (a_window: POINTER) is
 		-- gtk_window_unfullscreen (node at line 5209)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_unfullscreen"
		}"
		end

	gtk_window_activate_focus (a_window: POINTER): INTEGER_32 is
 		-- gtk_window_activate_focus (node at line 5705)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_activate_focus"
		}"
		end

	gtk_window_set_icon_name (a_window: POINTER; a_name: POINTER) is
 		-- gtk_window_set_icon_name (node at line 6429)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_icon_name"
		}"
		end

	gtk_window_present (a_window: POINTER) is
 		-- gtk_window_present (node at line 6782)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_present"
		}"
		end

	gtk_window_set_auto_startup_notification (a_setting: INTEGER_32) is
 		-- gtk_window_set_auto_startup_notification (node at line 7032)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_auto_startup_notification"
		}"
		end

	gtk_window_set_skip_taskbar_hint (a_window: POINTER; a_setting: INTEGER_32) is
 		-- gtk_window_set_skip_taskbar_hint (node at line 7713)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_skip_taskbar_hint"
		}"
		end

	gtk_window_get_gravity (a_window: POINTER): INTEGER is
 		-- gtk_window_get_gravity (node at line 7998)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_gravity"
		}"
		end

	gtk_window_set_default_size (a_window: POINTER; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_window_set_default_size (node at line 8048)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_default_size"
		}"
		end

	gtk_window_get_deletable (a_window: POINTER): INTEGER_32 is
 		-- gtk_window_get_deletable (node at line 8704)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_deletable"
		}"
		end

	gtk_window_mnemonic_activate (a_window: POINTER; a_keyval: NATURAL_32; a_modifier: INTEGER): INTEGER_32 is
 		-- gtk_window_mnemonic_activate (node at line 9033)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_mnemonic_activate"
		}"
		end

	gtk_window_set_default_icon_name (a_name: POINTER) is
 		-- gtk_window_set_default_icon_name (node at line 9648)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_default_icon_name"
		}"
		end

	gtk_window_set_default_icon (an_icon: POINTER) is
 		-- gtk_window_set_default_icon (node at line 10465)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_default_icon"
		}"
		end

	gtk_window_get_type_hint (a_window: POINTER): INTEGER is
 		-- gtk_window_get_type_hint (node at line 10635)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_type_hint"
		}"
		end

	gtk_window_set_focus (a_window: POINTER; a_focus: POINTER) is
 		-- gtk_window_set_focus (node at line 11958)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_focus"
		}"
		end

	gtk_window_get_icon_name (a_window: POINTER): POINTER is
 		-- gtk_window_get_icon_name (node at line 12354)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_icon_name"
		}"
		end

	gtk_window_get_screen (a_window: POINTER): POINTER is
 		-- gtk_window_get_screen (node at line 12596)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_screen"
		}"
		end

	gtk_window_get_has_frame (a_window: POINTER): INTEGER_32 is
 		-- gtk_window_get_has_frame (node at line 12688)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_has_frame"
		}"
		end

	gtk_window_set_keep_above (a_window: POINTER; a_setting: INTEGER_32) is
 		-- gtk_window_set_keep_above (node at line 12726)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_keep_above"
		}"
		end

	gtk_window_get_group (a_window: POINTER): POINTER is
 		-- gtk_window_get_group (node at line 12736)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_group"
		}"
		end

	gtk_window_set_skip_pager_hint (a_window: POINTER; a_setting: INTEGER_32) is
 		-- gtk_window_set_skip_pager_hint (node at line 12838)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_skip_pager_hint"
		}"
		end

	gtk_window_set_deletable (a_window: POINTER; a_setting: INTEGER_32) is
 		-- gtk_window_set_deletable (node at line 13114)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_deletable"
		}"
		end

	gtk_window_group_add_window (a_window_group: POINTER; a_window: POINTER) is
 		-- gtk_window_group_add_window (node at line 13923)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_group_add_window"
		}"
		end

	gtk_window_set_keep_below (a_window: POINTER; a_setting: INTEGER_32) is
 		-- gtk_window_set_keep_below (node at line 14152)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_keep_below"
		}"
		end

	gtk_window_begin_move_drag (a_window: POINTER; a_button: INTEGER_32; a_root_x: INTEGER_32; a_root_y: INTEGER_32; a_timestamp: NATURAL_32) is
 		-- gtk_window_begin_move_drag (node at line 14518)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_begin_move_drag"
		}"
		end

	gtk_window_set_gravity (a_window: POINTER; a_gravity: INTEGER) is
 		-- gtk_window_set_gravity (node at line 14525)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_gravity"
		}"
		end

	gtk_window_set_accept_focus (a_window: POINTER; a_setting: INTEGER_32) is
 		-- gtk_window_set_accept_focus (node at line 14623)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_accept_focus"
		}"
		end

	gtk_window_remove_embedded_xid (a_window: POINTER; a_xid: NATURAL_32) is
 		-- gtk_window_remove_embedded_xid (node at line 14754)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_remove_embedded_xid"
		}"
		end

	gtk_window_set_type_hint (a_window: POINTER; a_hint: INTEGER) is
 		-- gtk_window_set_type_hint (node at line 14764)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_type_hint"
		}"
		end

	gtk_window_get_destroy_with_parent (a_window: POINTER): INTEGER_32 is
 		-- gtk_window_get_destroy_with_parent (node at line 15440)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_destroy_with_parent"
		}"
		end

	gtk_window_deiconify (a_window: POINTER) is
 		-- gtk_window_deiconify (node at line 15826)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_deiconify"
		}"
		end

	-- `hidden' function _gtk_window_keys_foreach skipped.
	gtk_window_set_default_icon_from_file (a_filename: POINTER; an_err: POINTER): INTEGER_32 is
 		-- gtk_window_set_default_icon_from_file (node at line 16038)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_default_icon_from_file"
		}"
		end

	gtk_window_resize (a_window: POINTER; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_window_resize (node at line 16075)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_resize"
		}"
		end

	gtk_window_set_destroy_with_parent (a_window: POINTER; a_setting: INTEGER_32) is
 		-- gtk_window_set_destroy_with_parent (node at line 16461)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_destroy_with_parent"
		}"
		end

	gtk_window_group_remove_window (a_window_group: POINTER; a_window: POINTER) is
 		-- gtk_window_group_remove_window (node at line 16569)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_group_remove_window"
		}"
		end

	gtk_window_set_has_frame (a_window: POINTER; a_setting: INTEGER_32) is
 		-- gtk_window_set_has_frame (node at line 16728)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_has_frame"
		}"
		end

	gtk_window_iconify (a_window: POINTER) is
 		-- gtk_window_iconify (node at line 16820)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_iconify"
		}"
		end

	gtk_window_get_title (a_window: POINTER): POINTER is
 		-- gtk_window_get_title (node at line 16889)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_title"
		}"
		end

	gtk_window_unmaximize (a_window: POINTER) is
 		-- gtk_window_unmaximize (node at line 16908)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_unmaximize"
		}"
		end

	gtk_window_get_icon_list (a_window: POINTER): POINTER is
 		-- gtk_window_get_icon_list (node at line 17019)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_icon_list"
		}"
		end

	gtk_window_begin_resize_drag (a_window: POINTER; an_edge: INTEGER; a_button: INTEGER_32; a_root_x: INTEGER_32; a_root_y: INTEGER_32; a_timestamp: NATURAL_32) is
 		-- gtk_window_begin_resize_drag (node at line 17026)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_begin_resize_drag"
		}"
		end

	gtk_window_unstick (a_window: POINTER) is
 		-- gtk_window_unstick (node at line 17169)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_unstick"
		}"
		end

	gtk_window_get_opacity (a_window: POINTER): REAL_64 is
 		-- gtk_window_get_opacity (node at line 17187)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_opacity"
		}"
		end

	-- `hidden' function _gtk_window_reposition skipped.
	-- `hidden' function _gtk_window_query_nonaccels skipped.
	gtk_window_parse_geometry (a_window: POINTER; a_geometry: POINTER): INTEGER_32 is
 		-- gtk_window_parse_geometry (node at line 17738)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_parse_geometry"
		}"
		end

	gtk_window_maximize (a_window: POINTER) is
 		-- gtk_window_maximize (node at line 18186)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_maximize"
		}"
		end

	gtk_window_list_toplevels: POINTER is
 		-- gtk_window_list_toplevels (node at line 18560)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_list_toplevels()"
		}"
		end

	gtk_window_set_wmclass (a_window: POINTER; a_wmclass_name: POINTER; a_wmclass_class: POINTER) is
 		-- gtk_window_set_wmclass (node at line 18626)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_wmclass"
		}"
		end

	gtk_window_add_embedded_xid (a_window: POINTER; a_xid: NATURAL_32) is
 		-- gtk_window_add_embedded_xid (node at line 18699)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_add_embedded_xid"
		}"
		end

	gtk_window_get_accept_focus (a_window: POINTER): INTEGER_32 is
 		-- gtk_window_get_accept_focus (node at line 18975)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_accept_focus"
		}"
		end

	gtk_window_get_modal (a_window: POINTER): INTEGER_32 is
 		-- gtk_window_get_modal (node at line 18982)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_modal"
		}"
		end

	gtk_window_group_list_windows (a_window_group: POINTER): POINTER is
 		-- gtk_window_group_list_windows (node at line 19111)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_group_list_windows"
		}"
		end

	gtk_window_get_default_icon_list: POINTER is
 		-- gtk_window_get_default_icon_list (node at line 19243)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_default_icon_list()"
		}"
		end

	gtk_window_get_type: NATURAL_32 is
 		-- gtk_window_get_type (node at line 20339)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_type()"
		}"
		end

	gtk_window_set_default (a_window: POINTER; a_default_widget: POINTER) is
 		-- gtk_window_set_default (node at line 20679)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_default"
		}"
		end

	gtk_window_get_icon (a_window: POINTER): POINTER is
 		-- gtk_window_get_icon (node at line 20779)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_icon"
		}"
		end

	gtk_window_set_icon_list (a_window: POINTER; a_list: POINTER) is
 		-- gtk_window_set_icon_list (node at line 20923)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_icon_list"
		}"
		end

	gtk_window_set_startup_id (a_window: POINTER; a_startup_id: POINTER) is
 		-- gtk_window_set_startup_id (node at line 21127)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_startup_id"
		}"
		end

	gtk_window_get_skip_pager_hint (a_window: POINTER): INTEGER_32 is
 		-- gtk_window_get_skip_pager_hint (node at line 21393)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_skip_pager_hint"
		}"
		end

	gtk_window_get_transient_for (a_window: POINTER): POINTER is
 		-- gtk_window_get_transient_for (node at line 21659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_transient_for"
		}"
		end

	gtk_window_set_policy (a_window: POINTER; an_allow_shrink: INTEGER_32; an_allow_grow: INTEGER_32; an_auto_shrink: INTEGER_32) is
 		-- gtk_window_set_policy (node at line 22796)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_policy"
		}"
		end

	gtk_window_propagate_key_event (a_window: POINTER; an_event: POINTER): INTEGER_32 is
 		-- gtk_window_propagate_key_event (node at line 23032)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_propagate_key_event"
		}"
		end

	gtk_window_set_urgency_hint (a_window: POINTER; a_setting: INTEGER_32) is
 		-- gtk_window_set_urgency_hint (node at line 23049)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_urgency_hint"
		}"
		end

	gtk_window_set_opacity (a_window: POINTER; an_opacity: REAL_64) is
 		-- gtk_window_set_opacity (node at line 23072)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_opacity"
		}"
		end

	gtk_window_set_default_icon_list (a_list: POINTER) is
 		-- gtk_window_set_default_icon_list (node at line 23493)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_default_icon_list"
		}"
		end

	gtk_window_set_geometry_hints (a_window: POINTER; a_geometry_widget: POINTER; a_geometry: POINTER; a_geom_mask: INTEGER) is
 		-- gtk_window_set_geometry_hints (node at line 24407)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_geometry_hints"
		}"
		end

	-- `hidden' function _gtk_window_unset_focus_and_default skipped.
	gtk_window_get_role (a_window: POINTER): POINTER is
 		-- gtk_window_get_role (node at line 24971)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_role"
		}"
		end

	gtk_window_stick (a_window: POINTER) is
 		-- gtk_window_stick (node at line 25062)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_stick"
		}"
		end

	gtk_window_set_title (a_window: POINTER; a_title: POINTER) is
 		-- gtk_window_set_title (node at line 25146)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_title"
		}"
		end

	gtk_window_set_mnemonic_modifier (a_window: POINTER; a_modifier: INTEGER) is
 		-- gtk_window_set_mnemonic_modifier (node at line 25525)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_mnemonic_modifier"
		}"
		end

	gtk_window_get_frame_dimensions (a_window: POINTER; a_left: POINTER; a_top: POINTER; a_right: POINTER; a_bottom: POINTER) is
 		-- gtk_window_get_frame_dimensions (node at line 25603)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_frame_dimensions"
		}"
		end

	gtk_window_set_focus_on_map (a_window: POINTER; a_setting: INTEGER_32) is
 		-- gtk_window_set_focus_on_map (node at line 26023)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_focus_on_map"
		}"
		end

	gtk_window_get_default_size (a_window: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- gtk_window_get_default_size (node at line 26483)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_default_size"
		}"
		end

	gtk_window_set_transient_for (a_window: POINTER; a_parent: POINTER) is
 		-- gtk_window_set_transient_for (node at line 27203)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_transient_for"
		}"
		end

	gtk_window_add_mnemonic (a_window: POINTER; a_keyval: NATURAL_32; a_target: POINTER) is
 		-- gtk_window_add_mnemonic (node at line 27358)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_add_mnemonic"
		}"
		end

	gtk_window_get_urgency_hint (a_window: POINTER): INTEGER_32 is
 		-- gtk_window_get_urgency_hint (node at line 27492)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_urgency_hint"
		}"
		end

	gtk_window_set_modal (a_window: POINTER; a_modal: INTEGER_32) is
 		-- gtk_window_set_modal (node at line 27515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_modal"
		}"
		end

	-- `hidden' function _gtk_window_internal_set_focus skipped.
	-- `hidden' function _gtk_window_group_get_current_grab skipped.
	gtk_window_group_new: POINTER is
 		-- gtk_window_group_new (node at line 29355)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_group_new()"
		}"
		end

	gtk_window_present_with_time (a_window: POINTER; a_timestamp: NATURAL_32) is
 		-- gtk_window_present_with_time (node at line 29515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_present_with_time"
		}"
		end

	gtk_window_fullscreen (a_window: POINTER) is
 		-- gtk_window_fullscreen (node at line 29952)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_fullscreen"
		}"
		end

	-- `hidden' function _gtk_window_set_is_active skipped.
	gtk_window_get_default_widget (a_window: POINTER): POINTER is
 		-- gtk_window_get_default_widget (node at line 30360)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_default_widget"
		}"
		end

	gtk_window_get_focus_on_map (a_window: POINTER): INTEGER_32 is
 		-- gtk_window_get_focus_on_map (node at line 30468)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_focus_on_map"
		}"
		end

	gtk_window_new (a_type: INTEGER): POINTER is
 		-- gtk_window_new (node at line 30502)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_new"
		}"
		end

	gtk_window_set_position (a_window: POINTER; a_position: INTEGER) is
 		-- gtk_window_set_position (node at line 30702)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_position"
		}"
		end

	gtk_window_get_mnemonic_modifier (a_window: POINTER): INTEGER is
 		-- gtk_window_get_mnemonic_modifier (node at line 31115)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_mnemonic_modifier"
		}"
		end

	gtk_window_get_window_type (a_window: POINTER): INTEGER is
 		-- gtk_window_get_window_type (node at line 31553)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_window_type"
		}"
		end

	gtk_window_get_size (a_window: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- gtk_window_get_size (node at line 32282)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_size"
		}"
		end

	gtk_window_remove_accel_group (a_window: POINTER; an_accel_group: POINTER) is
 		-- gtk_window_remove_accel_group (node at line 32599)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_remove_accel_group"
		}"
		end

	gtk_window_get_decorated (a_window: POINTER): INTEGER_32 is
 		-- gtk_window_get_decorated (node at line 33107)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_decorated"
		}"
		end

	gtk_window_activate_default (a_window: POINTER): INTEGER_32 is
 		-- gtk_window_activate_default (node at line 33218)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_activate_default"
		}"
		end

	gtk_window_set_screen (a_window: POINTER; a_screen: POINTER) is
 		-- gtk_window_set_screen (node at line 33876)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_screen"
		}"
		end

	gtk_window_get_position (a_window: POINTER; a_root_x: POINTER; a_root_y: POINTER) is
 		-- gtk_window_get_position (node at line 34235)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_position"
		}"
		end

	gtk_window_get_resizable (a_window: POINTER): INTEGER_32 is
 		-- gtk_window_get_resizable (node at line 34652)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_resizable"
		}"
		end

	gtk_window_is_active (a_window: POINTER): INTEGER_32 is
 		-- gtk_window_is_active (node at line 35172)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_is_active"
		}"
		end

	gtk_window_activate_key (a_window: POINTER; an_event: POINTER): INTEGER_32 is
 		-- gtk_window_activate_key (node at line 35985)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_activate_key"
		}"
		end

	gtk_window_remove_mnemonic (a_window: POINTER; a_keyval: NATURAL_32; a_target: POINTER) is
 		-- gtk_window_remove_mnemonic (node at line 36666)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_remove_mnemonic"
		}"
		end

	gtk_window_set_decorated (a_window: POINTER; a_setting: INTEGER_32) is
 		-- gtk_window_set_decorated (node at line 36691)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_decorated"
		}"
		end

	gtk_window_set_icon (a_window: POINTER; an_icon: POINTER) is
 		-- gtk_window_set_icon (node at line 36911)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_icon"
		}"
		end

	gtk_window_get_mnemonics_visible (a_window: POINTER): INTEGER_32 is
 		-- gtk_window_get_mnemonics_visible (node at line 37587)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_get_mnemonics_visible"
		}"
		end

	gtk_window_set_icon_from_file (a_window: POINTER; a_filename: POINTER; an_err: POINTER): INTEGER_32 is
 		-- gtk_window_set_icon_from_file (node at line 37607)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_set_icon_from_file"
		}"
		end


end -- class GTKWINDOW_EXTERNALS
