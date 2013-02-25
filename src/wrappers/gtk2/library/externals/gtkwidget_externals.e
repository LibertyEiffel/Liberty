-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKWIDGET_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_widget_get_ancestor (a_widget: POINTER; a_widget_type: NATURAL_64): POINTER is
 		-- gtk_widget_get_ancestor (node at line 36)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_ancestor"
		}"
		end

	gtk_widget_ensure_style (a_widget: POINTER) is
 		-- gtk_widget_ensure_style (node at line 1489)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_ensure_style"
		}"
		end

	gtk_widget_get_tooltip_text (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_tooltip_text (node at line 1640)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_tooltip_text"
		}"
		end

	gtk_widget_get_pointer (a_widget: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- gtk_widget_get_pointer (node at line 2086)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_pointer"
		}"
		end

	gtk_widget_set_accel_path (a_widget: POINTER; an_accel_path: POINTER; an_accel_group: POINTER) is
 		-- gtk_widget_set_accel_path (node at line 2091)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_accel_path"
		}"
		end

	gtk_widget_set_receives_default (a_widget: POINTER; a_receives_default: INTEGER_32) is
 		-- gtk_widget_set_receives_default (node at line 2406)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_receives_default"
		}"
		end

	gtk_widget_set_tooltip_window (a_widget: POINTER; a_custom_window: POINTER) is
 		-- gtk_widget_set_tooltip_window (node at line 2451)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_tooltip_window"
		}"
		end

	gtk_widget_get_tooltip_window (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_tooltip_window (node at line 2555)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_tooltip_window"
		}"
		end

	-- `hidden' function _gtk_widget_propagate_hierarchy_changed skipped.
	gtk_widget_class_install_style_property_parser (a_klass: POINTER; a_pspec: POINTER; a_parser: POINTER) is
 		-- gtk_widget_class_install_style_property_parser (node at line 3302)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_class_install_style_property_parser"
		}"
		end

	gtk_widget_input_shape_combine_mask (a_widget: POINTER; a_shape_mask: POINTER; an_offset_x: INTEGER_32; an_offset_y: INTEGER_32) is
 		-- gtk_widget_input_shape_combine_mask (node at line 3419)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_input_shape_combine_mask"
		}"
		end

	gtk_widget_modify_text (a_widget: POINTER; a_state: INTEGER; a_color: POINTER) is
 		-- gtk_widget_modify_text (node at line 3515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_text"
		}"
		end

	gtk_widget_get_tooltip_markup (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_tooltip_markup (node at line 3749)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_tooltip_markup"
		}"
		end

	gtk_widget_add_events (a_widget: POINTER; an_events: INTEGER_32) is
 		-- gtk_widget_add_events (node at line 3839)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_add_events"
		}"
		end

	gtk_widget_get_visible (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_visible (node at line 4022)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_visible"
		}"
		end

	gtk_widget_get_default_direction: INTEGER is
 		-- gtk_widget_get_default_direction (node at line 4037)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_default_direction()"
		}"
		end

	gtk_widget_realize (a_widget: POINTER) is
 		-- gtk_widget_realize (node at line 4412)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_realize"
		}"
		end

	gtk_widget_reset_rc_styles (a_widget: POINTER) is
 		-- gtk_widget_reset_rc_styles (node at line 4705)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_reset_rc_styles"
		}"
		end

	gtk_widget_set_parent (a_widget: POINTER; a_parent: POINTER) is
 		-- gtk_widget_set_parent (node at line 4713)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_parent"
		}"
		end

	gtk_widget_get_snapshot (a_widget: POINTER; a_clip_rect: POINTER): POINTER is
 		-- gtk_widget_get_snapshot (node at line 4759)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_snapshot"
		}"
		end

	gtk_widget_reparent (a_widget: POINTER; a_new_parent: POINTER) is
 		-- gtk_widget_reparent (node at line 5222)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_reparent"
		}"
		end

	gtk_widget_show (a_widget: POINTER) is
 		-- gtk_widget_show (node at line 5362)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_show"
		}"
		end

	gtk_widget_remove_accelerator (a_widget: POINTER; an_accel_group: POINTER; an_accel_key: NATURAL_32; an_accel_mods: INTEGER): INTEGER_32 is
 		-- gtk_widget_remove_accelerator (node at line 5399)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_remove_accelerator"
		}"
		end

	gtk_widget_set_sensitive (a_widget: POINTER; a_sensitive: INTEGER_32) is
 		-- gtk_widget_set_sensitive (node at line 5420)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_sensitive"
		}"
		end

	gtk_widget_get_name (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_name (node at line 5434)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_name"
		}"
		end

	gtk_widget_set_composite_name (a_widget: POINTER; a_name: POINTER) is
 		-- gtk_widget_set_composite_name (node at line 5602)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_composite_name"
		}"
		end

	-- `hidden' function _gtk_widget_grab_notify skipped.
	gtk_widget_style_get_valist (a_widget: POINTER; a_first_property_name: POINTER; a_var_args: POINTER) is
 		-- gtk_widget_style_get_valist (node at line 6690)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_style_get_valist"
		}"
		end

	gtk_widget_get_clipboard (a_widget: POINTER; a_selection: POINTER): POINTER is
 		-- gtk_widget_get_clipboard (node at line 7396)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_clipboard"
		}"
		end

	gtk_widget_set_state (a_widget: POINTER; a_state: INTEGER) is
 		-- gtk_widget_set_state (node at line 7567)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_state"
		}"
		end

	gtk_widget_set_events (a_widget: POINTER; an_events: INTEGER_32) is
 		-- gtk_widget_set_events (node at line 7600)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_events"
		}"
		end

	gtk_widget_grab_default (a_widget: POINTER) is
 		-- gtk_widget_grab_default (node at line 7623)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_grab_default"
		}"
		end

	gtk_widget_is_ancestor (a_widget: POINTER; an_ancestor: POINTER): INTEGER_32 is
 		-- gtk_widget_is_ancestor (node at line 7820)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_ancestor"
		}"
		end

	gtk_widget_region_intersect (a_widget: POINTER; a_region: POINTER): POINTER is
 		-- gtk_widget_region_intersect (node at line 7829)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_region_intersect"
		}"
		end

	gtk_widget_keynav_failed (a_widget: POINTER; a_direction: INTEGER): INTEGER_32 is
 		-- gtk_widget_keynav_failed (node at line 7935)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_keynav_failed"
		}"
		end

	gtk_widget_set_realized (a_widget: POINTER; a_realized: INTEGER_32) is
 		-- gtk_widget_set_realized (node at line 7955)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_realized"
		}"
		end

	gtk_widget_queue_draw (a_widget: POINTER) is
 		-- gtk_widget_queue_draw (node at line 8124)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_queue_draw"
		}"
		end

	gtk_widget_new (a_type: NATURAL_64; a_first_property_name: POINTER): POINTER is
 		-- gtk_widget_new (variadic call)  (node at line 8164)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_new"
		}"
		end

	gtk_widget_set_allocation (a_widget: POINTER; an_allocation: POINTER) is
 		-- gtk_widget_set_allocation (node at line 8244)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_allocation"
		}"
		end

	gtk_widget_push_colormap (a_cmap: POINTER) is
 		-- gtk_widget_push_colormap (node at line 8399)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_push_colormap"
		}"
		end

	gtk_widget_activate (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_activate (node at line 8545)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_activate"
		}"
		end

	gtk_widget_modify_base (a_widget: POINTER; a_state: INTEGER; a_color: POINTER) is
 		-- gtk_widget_modify_base (node at line 8624)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_base"
		}"
		end

	gtk_widget_get_realized (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_realized (node at line 9006)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_realized"
		}"
		end

	gtk_widget_set_default_direction (a_dir: INTEGER) is
 		-- gtk_widget_set_default_direction (node at line 9206)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_default_direction"
		}"
		end

	gtk_widget_intersect (a_widget: POINTER; an_area: POINTER; an_intersection: POINTER): INTEGER_32 is
 		-- gtk_widget_intersect (node at line 10134)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_intersect"
		}"
		end

	gtk_widget_trigger_tooltip_query (a_widget: POINTER) is
 		-- gtk_widget_trigger_tooltip_query (node at line 10602)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_trigger_tooltip_query"
		}"
		end

	gtk_widget_class_list_style_properties (a_klass: POINTER; a_n_properties: POINTER): POINTER is
 		-- gtk_widget_class_list_style_properties (node at line 11199)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_class_list_style_properties"
		}"
		end

	gtk_widget_set_mapped (a_widget: POINTER; a_mapped: INTEGER_32) is
 		-- gtk_widget_set_mapped (node at line 11682)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_mapped"
		}"
		end

	gtk_widget_get_mapped (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_mapped (node at line 11827)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_mapped"
		}"
		end

	gtk_widget_get_sensitive (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_sensitive (node at line 11835)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_sensitive"
		}"
		end

	gtk_widget_set_child_visible (a_widget: POINTER; an_is_visible: INTEGER_32) is
 		-- gtk_widget_set_child_visible (node at line 11870)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_child_visible"
		}"
		end

	-- `hidden' function _gtk_widget_get_pointer_window skipped.
	gtk_widget_add_mnemonic_label (a_widget: POINTER; a_label: POINTER) is
 		-- gtk_widget_add_mnemonic_label (node at line 12737)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_add_mnemonic_label"
		}"
		end

	gtk_widget_get_has_tooltip (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_has_tooltip (node at line 12874)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_has_tooltip"
		}"
		end

	gtk_widget_get_screen (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_screen (node at line 13313)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_screen"
		}"
		end

	gtk_widget_set_tooltip_markup (a_widget: POINTER; a_markup: POINTER) is
 		-- gtk_widget_set_tooltip_markup (node at line 13547)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_tooltip_markup"
		}"
		end

	gtk_widget_add_accelerator (a_widget: POINTER; an_accel_signal: POINTER; an_accel_group: POINTER; an_accel_key: NATURAL_32; an_accel_mods: INTEGER; an_accel_flags: INTEGER) is
 		-- gtk_widget_add_accelerator (node at line 13635)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_add_accelerator"
		}"
		end

	gtk_widget_get_type: NATURAL_64 is
 		-- gtk_widget_get_type (node at line 13655)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_type()"
		}"
		end

	gtk_widget_style_get (a_widget: POINTER; a_first_property_name: POINTER) is
 		-- gtk_widget_style_get (variadic call)  (node at line 13856)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_style_get"
		}"
		end

	gtk_widget_get_default_colormap: POINTER is
 		-- gtk_widget_get_default_colormap (node at line 13935)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_default_colormap()"
		}"
		end

	gtk_widget_has_screen (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_has_screen (node at line 13970)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_has_screen"
		}"
		end

	gtk_widget_class_find_style_property (a_klass: POINTER; a_property_name: POINTER): POINTER is
 		-- gtk_widget_class_find_style_property (node at line 14069)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_class_find_style_property"
		}"
		end

	gtk_widget_get_toplevel (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_toplevel (node at line 14134)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_toplevel"
		}"
		end

	gtk_widget_set_has_window (a_widget: POINTER; a_has_window: INTEGER_32) is
 		-- gtk_widget_set_has_window (node at line 14267)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_has_window"
		}"
		end

	gtk_widget_remove_mnemonic_label (a_widget: POINTER; a_label: POINTER) is
 		-- gtk_widget_remove_mnemonic_label (node at line 14482)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_remove_mnemonic_label"
		}"
		end

	gtk_widget_queue_draw_area (a_widget: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_widget_queue_draw_area (node at line 14554)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_queue_draw_area"
		}"
		end

	gtk_widget_set_no_show_all (a_widget: POINTER; a_no_show_all: INTEGER_32) is
 		-- gtk_widget_set_no_show_all (node at line 14573)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_no_show_all"
		}"
		end

	gtk_widget_unparent (a_widget: POINTER) is
 		-- gtk_widget_unparent (node at line 14703)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_unparent"
		}"
		end

	gtk_widget_hide_on_delete (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_hide_on_delete (node at line 14706)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_hide_on_delete"
		}"
		end

	gtk_widget_has_grab (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_has_grab (node at line 14875)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_has_grab"
		}"
		end

	gtk_widget_unmap (a_widget: POINTER) is
 		-- gtk_widget_unmap (node at line 15178)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_unmap"
		}"
		end

	gtk_widget_is_sensitive (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_is_sensitive (node at line 15808)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_sensitive"
		}"
		end

	gtk_widget_list_accel_closures (a_widget: POINTER): POINTER is
 		-- gtk_widget_list_accel_closures (node at line 16087)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_list_accel_closures"
		}"
		end

	gtk_widget_send_expose (a_widget: POINTER; an_event: POINTER): INTEGER_32 is
 		-- gtk_widget_send_expose (node at line 16235)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_send_expose"
		}"
		end

	gtk_widget_queue_resize_no_redraw (a_widget: POINTER) is
 		-- gtk_widget_queue_resize_no_redraw (node at line 16254)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_queue_resize_no_redraw"
		}"
		end

	gtk_widget_get_display (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_display (node at line 16578)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_display"
		}"
		end

	-- `hidden' function _gtk_widget_set_has_default skipped.
	gtk_widget_set_can_focus (a_widget: POINTER; a_can_focus: INTEGER_32) is
 		-- gtk_widget_set_can_focus (node at line 17212)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_can_focus"
		}"
		end

	gtk_widget_get_accessible (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_accessible (node at line 17282)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_accessible"
		}"
		end

	gtk_widget_style_get_property (a_widget: POINTER; a_property_name: POINTER; a_value: POINTER) is
 		-- gtk_widget_style_get_property (node at line 17402)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_style_get_property"
		}"
		end

	gtk_widget_get_settings (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_settings (node at line 17592)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_settings"
		}"
		end

	gtk_widget_modify_bg (a_widget: POINTER; a_state: INTEGER; a_color: POINTER) is
 		-- gtk_widget_modify_bg (node at line 17723)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_bg"
		}"
		end

	gtk_widget_modify_fg (a_widget: POINTER; a_state: INTEGER; a_color: POINTER) is
 		-- gtk_widget_modify_fg (node at line 17871)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_fg"
		}"
		end

	-- `hidden' function _gtk_widget_propagate_composited_changed skipped.
	gtk_widget_render_icon (a_widget: POINTER; a_stock_id: POINTER; a_size: INTEGER; a_detail: POINTER): POINTER is
 		-- gtk_widget_render_icon (node at line 17999)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_render_icon"
		}"
		end

	gtk_widget_get_app_paintable (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_app_paintable (node at line 18407)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_app_paintable"
		}"
		end

	gtk_widget_set_style (a_widget: POINTER; a_style: POINTER) is
 		-- gtk_widget_set_style (node at line 18661)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_style"
		}"
		end

	gtk_widget_size_allocate (a_widget: POINTER; an_allocation: POINTER) is
 		-- gtk_widget_size_allocate (node at line 19245)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_size_allocate"
		}"
		end

	gtk_widget_set_visible (a_widget: POINTER; a_visible: INTEGER_32) is
 		-- gtk_widget_set_visible (node at line 19552)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_visible"
		}"
		end

	gtk_widget_set_window (a_widget: POINTER; a_window: POINTER) is
 		-- gtk_widget_set_window (node at line 19815)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_window"
		}"
		end

	gtk_widget_set_colormap (a_widget: POINTER; a_colormap: POINTER) is
 		-- gtk_widget_set_colormap (node at line 19877)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_colormap"
		}"
		end

	gtk_widget_error_bell (a_widget: POINTER) is
 		-- gtk_widget_error_bell (node at line 20166)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_error_bell"
		}"
		end

	gtk_widget_get_root_window (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_root_window (node at line 20496)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_root_window"
		}"
		end

	gtk_widget_get_child_visible (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_child_visible (node at line 20545)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_child_visible"
		}"
		end

	gtk_widget_send_focus_change (a_widget: POINTER; an_event: POINTER): INTEGER_32 is
 		-- gtk_widget_send_focus_change (node at line 20804)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_send_focus_change"
		}"
		end

	gtk_widget_freeze_child_notify (a_widget: POINTER) is
 		-- gtk_widget_freeze_child_notify (node at line 20850)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_freeze_child_notify"
		}"
		end

	gtk_widget_get_colormap (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_colormap (node at line 21053)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_colormap"
		}"
		end

	gtk_widget_is_toplevel (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_is_toplevel (node at line 21210)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_toplevel"
		}"
		end

	gtk_widget_set_double_buffered (a_widget: POINTER; a_double_buffered: INTEGER_32) is
 		-- gtk_widget_set_double_buffered (node at line 21254)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_double_buffered"
		}"
		end

	-- `hidden' function _gtk_widget_set_pointer_window skipped.
	gtk_widget_modify_font (a_widget: POINTER; a_font_desc: POINTER) is
 		-- gtk_widget_modify_font (node at line 21872)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_font"
		}"
		end

	gtk_widget_get_can_default (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_can_default (node at line 22140)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_can_default"
		}"
		end

	gtk_widget_thaw_child_notify (a_widget: POINTER) is
 		-- gtk_widget_thaw_child_notify (node at line 22652)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_thaw_child_notify"
		}"
		end

	gtk_widget_get_parent (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_parent (node at line 22661)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_parent"
		}"
		end

	gtk_widget_grab_focus (a_widget: POINTER) is
 		-- gtk_widget_grab_focus (node at line 22812)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_grab_focus"
		}"
		end

	gtk_widget_get_direction (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_direction (node at line 23644)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_direction"
		}"
		end

	-- `hidden' function _gtk_widget_get_accel_path skipped.
	gtk_widget_get_style (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_style (node at line 24583)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_style"
		}"
		end

	gtk_widget_set_app_paintable (a_widget: POINTER; an_app_paintable: INTEGER_32) is
 		-- gtk_widget_set_app_paintable (node at line 24698)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_app_paintable"
		}"
		end

	gtk_widget_set_name (a_widget: POINTER; a_name: POINTER) is
 		-- gtk_widget_set_name (node at line 24711)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_name"
		}"
		end

	gtk_widget_class_install_style_property (a_klass: POINTER; a_pspec: POINTER) is
 		-- gtk_widget_class_install_style_property (node at line 24753)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_class_install_style_property"
		}"
		end

	gtk_widget_translate_coordinates (a_src_widget: POINTER; a_dest_widget: POINTER; a_src_x: INTEGER_32; a_src_y: INTEGER_32; a_dest_x: POINTER; a_dest_y: POINTER): INTEGER_32 is
 		-- gtk_widget_translate_coordinates (node at line 24772)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_translate_coordinates"
		}"
		end

	gtk_widget_get_events (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_events (node at line 24986)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_events"
		}"
		end

	gtk_widget_is_focus (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_is_focus (node at line 25361)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_focus"
		}"
		end

	gtk_widget_has_rc_style (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_has_rc_style (node at line 25517)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_has_rc_style"
		}"
		end

	gtk_widget_has_focus (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_has_focus (node at line 26009)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_has_focus"
		}"
		end

	gtk_widget_create_pango_layout (a_widget: POINTER; a_text: POINTER): POINTER is
 		-- gtk_widget_create_pango_layout (node at line 26307)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_create_pango_layout"
		}"
		end

	gtk_widget_get_receives_default (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_receives_default (node at line 26507)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_receives_default"
		}"
		end

	gtk_widget_shape_combine_mask (a_widget: POINTER; a_shape_mask: POINTER; an_offset_x: INTEGER_32; an_offset_y: INTEGER_32) is
 		-- gtk_widget_shape_combine_mask (node at line 26967)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_shape_combine_mask"
		}"
		end

	gtk_widget_get_window (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_window (node at line 27357)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_window"
		}"
		end

	gtk_widget_modify_style (a_widget: POINTER; a_style: POINTER) is
 		-- gtk_widget_modify_style (node at line 27670)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_style"
		}"
		end

	gtk_widget_set_direction (a_widget: POINTER; a_dir: INTEGER) is
 		-- gtk_widget_set_direction (node at line 27818)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_direction"
		}"
		end

	gtk_widget_get_state (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_state (node at line 28032)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_state"
		}"
		end

	gtk_widget_size_request (a_widget: POINTER; a_requisition: POINTER) is
 		-- gtk_widget_size_request (node at line 28471)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_size_request"
		}"
		end

	gtk_widget_get_pango_context (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_pango_context (node at line 28571)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_pango_context"
		}"
		end

	gtk_widget_get_no_show_all (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_no_show_all (node at line 28801)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_no_show_all"
		}"
		end

	gtk_widget_push_composite_child is
 		-- gtk_widget_push_composite_child (node at line 28848)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_push_composite_child()"
		}"
		end

	gtk_widget_get_allocation (a_widget: POINTER; an_allocation: POINTER) is
 		-- gtk_widget_get_allocation (node at line 28972)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_allocation"
		}"
		end

	gtk_widget_set_extension_events (a_widget: POINTER; a_mode: INTEGER) is
 		-- gtk_widget_set_extension_events (node at line 29271)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_extension_events"
		}"
		end

	gtk_widget_get_visual (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_visual (node at line 29514)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_visual"
		}"
		end

	gtk_widget_hide (a_widget: POINTER) is
 		-- gtk_widget_hide (node at line 29686)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_hide"
		}"
		end

	gtk_widget_unrealize (a_widget: POINTER) is
 		-- gtk_widget_unrealize (node at line 29753)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_unrealize"
		}"
		end

	gtk_widget_destroy (a_widget: POINTER) is
 		-- gtk_widget_destroy (node at line 30010)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_destroy"
		}"
		end

	gtk_widget_child_notify (a_widget: POINTER; a_child_property: POINTER) is
 		-- gtk_widget_child_notify (node at line 30063)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_child_notify"
		}"
		end

	gtk_widget_event (a_widget: POINTER; an_event: POINTER): INTEGER_32 is
 		-- gtk_widget_event (node at line 30272)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_event"
		}"
		end

	gtk_widget_can_activate_accel (a_widget: POINTER; a_signal_id: NATURAL_32): INTEGER_32 is
 		-- gtk_widget_can_activate_accel (node at line 30577)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_can_activate_accel"
		}"
		end

	gtk_widget_show_all (a_widget: POINTER) is
 		-- gtk_widget_show_all (node at line 30766)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_show_all"
		}"
		end

	gtk_widget_child_focus (a_widget: POINTER; a_direction: INTEGER): INTEGER_32 is
 		-- gtk_widget_child_focus (node at line 30847)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_child_focus"
		}"
		end

	gtk_widget_get_child_requisition (a_widget: POINTER; a_requisition: POINTER) is
 		-- gtk_widget_get_child_requisition (node at line 31322)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_child_requisition"
		}"
		end

	gtk_widget_get_parent_window (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_parent_window (node at line 31879)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_parent_window"
		}"
		end

	gtk_widget_set_default_colormap (a_colormap: POINTER) is
 		-- gtk_widget_set_default_colormap (node at line 31946)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_default_colormap"
		}"
		end

	-- `hidden' function _gtk_widget_synthesize_crossing skipped.
	gtk_widget_get_extension_events (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_extension_events (node at line 32432)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_extension_events"
		}"
		end

	gtk_widget_get_requisition (a_widget: POINTER; a_requisition: POINTER) is
 		-- gtk_widget_get_requisition (node at line 32502)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_requisition"
		}"
		end

	-- `hidden' function _gtk_widget_buildable_finish_accelerator skipped.
	-- `hidden' function _gtk_widget_set_has_grab skipped.
	-- `hidden' function _gtk_widget_propagate_screen_changed skipped.
	gtk_widget_get_can_focus (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_can_focus (node at line 33893)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_can_focus"
		}"
		end

	gtk_widget_list_mnemonic_labels (a_widget: POINTER): POINTER is
 		-- gtk_widget_list_mnemonic_labels (node at line 34068)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_list_mnemonic_labels"
		}"
		end

	gtk_widget_is_drawable (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_is_drawable (node at line 34134)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_drawable"
		}"
		end

	gtk_widget_destroyed (a_widget: POINTER; a_widget_pointer: POINTER) is
 		-- gtk_widget_destroyed (node at line 34348)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_destroyed"
		}"
		end

	gtk_widget_get_default_visual: POINTER is
 		-- gtk_widget_get_default_visual (node at line 35572)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_default_visual()"
		}"
		end

	gtk_widget_get_modifier_style (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_modifier_style (node at line 35692)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_modifier_style"
		}"
		end

	gtk_requisition_free (a_requisition: POINTER) is
 		-- gtk_requisition_free (node at line 35751)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_requisition_free"
		}"
		end

	-- `hidden' function _gtk_widget_get_aux_info skipped.
	gtk_widget_set_redraw_on_allocate (a_widget: POINTER; a_redraw_on_allocate: INTEGER_32) is
 		-- gtk_widget_set_redraw_on_allocate (node at line 36085)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_redraw_on_allocate"
		}"
		end

	gtk_widget_style_attach (a_style: POINTER) is
 		-- gtk_widget_style_attach (node at line 36155)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_style_attach"
		}"
		end

	gtk_widget_queue_resize (a_widget: POINTER) is
 		-- gtk_widget_queue_resize (node at line 36556)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_queue_resize"
		}"
		end

	gtk_widget_modify_cursor (a_widget: POINTER; a_primary: POINTER; a_secondary: POINTER) is
 		-- gtk_widget_modify_cursor (node at line 36588)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_cursor"
		}"
		end

	-- `hidden' function _gtk_widget_peek_colormap skipped.
	ubuntu_gtk_widget_set_has_grab (a_widget: POINTER; a_has_grab: INTEGER_32) is
 		-- ubuntu_gtk_widget_set_has_grab (node at line 36754)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_gtk_widget_set_has_grab"
		}"
		end

	gtk_widget_set_size_request (a_widget: POINTER; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_widget_set_size_request (node at line 36912)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_size_request"
		}"
		end

	gtk_widget_path (a_widget: POINTER; a_path_length: POINTER; a_path: POINTER; a_path_reversed: POINTER) is
 		-- gtk_widget_path (node at line 36962)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_path"
		}"
		end

	gtk_requisition_copy (a_requisition: POINTER): POINTER is
 		-- gtk_requisition_copy (node at line 37078)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_requisition_copy"
		}"
		end

	gtk_widget_get_default_style: POINTER is
 		-- gtk_widget_get_default_style (node at line 37234)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_default_style()"
		}"
		end

	gtk_widget_get_double_buffered (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_double_buffered (node at line 37390)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_double_buffered"
		}"
		end

	gtk_widget_set_parent_window (a_widget: POINTER; a_parent_window: POINTER) is
 		-- gtk_widget_set_parent_window (node at line 37765)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_parent_window"
		}"
		end

	gtk_widget_pop_colormap is
 		-- gtk_widget_pop_colormap (node at line 37904)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_pop_colormap()"
		}"
		end

	gtk_widget_get_composite_name (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_composite_name (node at line 37940)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_composite_name"
		}"
		end

	gtk_widget_map (a_widget: POINTER) is
 		-- gtk_widget_map (node at line 38168)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_map"
		}"
		end

	gtk_widget_mnemonic_activate (a_widget: POINTER; a_group_cycling: INTEGER_32): INTEGER_32 is
 		-- gtk_widget_mnemonic_activate (node at line 38304)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_mnemonic_activate"
		}"
		end

	gtk_widget_create_pango_context (a_widget: POINTER): POINTER is
 		-- gtk_widget_create_pango_context (node at line 38314)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_create_pango_context"
		}"
		end

	gtk_widget_set_tooltip_text (a_widget: POINTER; a_text: POINTER) is
 		-- gtk_widget_set_tooltip_text (node at line 38468)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_tooltip_text"
		}"
		end

	-- `hidden' function _gtk_widget_set_is_toplevel skipped.
	gtk_widget_get_has_window (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_has_window (node at line 38816)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_has_window"
		}"
		end

	gtk_widget_is_composited (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_is_composited (node at line 38941)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_composited"
		}"
		end

	gtk_widget_show_now (a_widget: POINTER) is
 		-- gtk_widget_show_now (node at line 38953)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_show_now"
		}"
		end

	gtk_widget_set_scroll_adjustments (a_widget: POINTER; a_hadjustment: POINTER; a_vadjustment: POINTER): INTEGER_32 is
 		-- gtk_widget_set_scroll_adjustments (node at line 39086)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_scroll_adjustments"
		}"
		end

	gtk_widget_set_can_default (a_widget: POINTER; a_can_default: INTEGER_32) is
 		-- gtk_widget_set_can_default (node at line 39138)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_can_default"
		}"
		end

	gtk_widget_has_default (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_has_default (node at line 39157)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_has_default"
		}"
		end

	gtk_widget_class_path (a_widget: POINTER; a_path_length: POINTER; a_path: POINTER; a_path_reversed: POINTER) is
 		-- gtk_widget_class_path (node at line 39239)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_class_path"
		}"
		end

	gtk_widget_set_has_tooltip (a_widget: POINTER; a_has_tooltip: INTEGER_32) is
 		-- gtk_widget_set_has_tooltip (node at line 39255)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_has_tooltip"
		}"
		end

	gtk_requisition_get_type: NATURAL_64 is
 		-- gtk_requisition_get_type (node at line 39368)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_requisition_get_type()"
		}"
		end

	gtk_widget_pop_composite_child is
 		-- gtk_widget_pop_composite_child (node at line 40153)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_pop_composite_child()"
		}"
		end

	gtk_widget_get_size_request (a_widget: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- gtk_widget_get_size_request (node at line 41161)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_size_request"
		}"
		end

	-- `hidden' function _gtk_widget_is_pointer_widget skipped.

end -- class GTKWIDGET_EXTERNALS
