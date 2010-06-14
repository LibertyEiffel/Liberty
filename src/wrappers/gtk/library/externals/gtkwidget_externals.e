-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKWIDGET_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_widget_get_ancestor (a_widget: POINTER; a_widget_type: NATURAL_32): POINTER is
 		-- gtk_widget_get_ancestor (node at line 42)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_ancestor"
		}"
		end

	gtk_widget_reset_shapes (a_widget: POINTER) is
 		-- gtk_widget_reset_shapes (node at line 1238)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_reset_shapes"
		}"
		end

	gtk_widget_ensure_style (a_widget: POINTER) is
 		-- gtk_widget_ensure_style (node at line 1532)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_ensure_style"
		}"
		end

	gtk_widget_get_tooltip_text (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_tooltip_text (node at line 1708)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_tooltip_text"
		}"
		end

	gtk_widget_show_all (a_widget: POINTER) is
 		-- gtk_widget_show_all (node at line 1778)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_show_all"
		}"
		end

	gtk_widget_get_pointer (a_widget: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- gtk_widget_get_pointer (node at line 2192)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_pointer"
		}"
		end

	gtk_widget_set_accel_path (a_widget: POINTER; an_accel_path: POINTER; an_accel_group: POINTER) is
 		-- gtk_widget_set_accel_path (node at line 2202)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_accel_path"
		}"
		end

	gtk_widget_set_receives_default (a_widget: POINTER; a_receives_default: INTEGER_32) is
 		-- gtk_widget_set_receives_default (node at line 2519)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_receives_default"
		}"
		end

	gtk_widget_set_tooltip_window (a_widget: POINTER; a_custom_window: POINTER) is
 		-- gtk_widget_set_tooltip_window (node at line 2563)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_tooltip_window"
		}"
		end

	gtk_widget_get_tooltip_window (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_tooltip_window (node at line 2637)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_tooltip_window"
		}"
		end

	-- `hidden' function _gtk_widget_propagate_hierarchy_changed skipped.
	gtk_widget_class_install_style_property_parser (a_klass: POINTER; a_pspec: POINTER; a_parser: POINTER) is
 		-- gtk_widget_class_install_style_property_parser (node at line 3223)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_class_install_style_property_parser"
		}"
		end

	gtk_widget_input_shape_combine_mask (a_widget: POINTER; a_shape_mask: POINTER; an_offset_x: INTEGER_32; an_offset_y: INTEGER_32) is
 		-- gtk_widget_input_shape_combine_mask (node at line 3322)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_input_shape_combine_mask"
		}"
		end

	gtk_widget_modify_text (a_widget: POINTER; a_state: INTEGER; a_color: POINTER) is
 		-- gtk_widget_modify_text (node at line 3428)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_text"
		}"
		end

	gtk_widget_get_tooltip_markup (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_tooltip_markup (node at line 3646)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_tooltip_markup"
		}"
		end

	gtk_widget_add_events (a_widget: POINTER; an_events: INTEGER_32) is
 		-- gtk_widget_add_events (node at line 3722)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_add_events"
		}"
		end

	gtk_widget_get_default_direction: INTEGER is
 		-- gtk_widget_get_default_direction (node at line 3863)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_default_direction()"
		}"
		end

	gtk_widget_set_usize (a_widget: POINTER; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_widget_set_usize (node at line 4123)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_usize"
		}"
		end

	gtk_widget_realize (a_widget: POINTER) is
 		-- gtk_widget_realize (node at line 4223)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_realize"
		}"
		end

	gtk_widget_reset_rc_styles (a_widget: POINTER) is
 		-- gtk_widget_reset_rc_styles (node at line 4483)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_reset_rc_styles"
		}"
		end

	gtk_widget_set_parent (a_widget: POINTER; a_parent: POINTER) is
 		-- gtk_widget_set_parent (node at line 4491)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_parent"
		}"
		end

	gtk_widget_get_snapshot (a_widget: POINTER; a_clip_rect: POINTER): POINTER is
 		-- gtk_widget_get_snapshot (node at line 4565)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_snapshot"
		}"
		end

	gtk_widget_map (a_widget: POINTER) is
 		-- gtk_widget_map (node at line 4569)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_map"
		}"
		end

	gtk_widget_get_default_visual: POINTER is
 		-- gtk_widget_get_default_visual (node at line 4652)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_default_visual()"
		}"
		end

	gtk_widget_reparent (a_widget: POINTER; a_new_parent: POINTER) is
 		-- gtk_widget_reparent (node at line 4994)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_reparent"
		}"
		end

	gtk_widget_show (a_widget: POINTER) is
 		-- gtk_widget_show (node at line 5108)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_show"
		}"
		end

	gtk_widget_remove_accelerator (a_widget: POINTER; an_accel_group: POINTER; an_accel_key: NATURAL_32; an_accel_mods: INTEGER): INTEGER_32 is
 		-- gtk_widget_remove_accelerator (node at line 5135)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_remove_accelerator"
		}"
		end

	gtk_widget_set_sensitive (a_widget: POINTER; a_sensitive: INTEGER_32) is
 		-- gtk_widget_set_sensitive (node at line 5151)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_sensitive"
		}"
		end

	gtk_widget_get_name (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_name (node at line 5169)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_name"
		}"
		end

	gtk_widget_set_composite_name (a_widget: POINTER; a_name: POINTER) is
 		-- gtk_widget_set_composite_name (node at line 5338)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_composite_name"
		}"
		end

	gtk_widget_get_double_buffered (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_double_buffered (node at line 5807)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_double_buffered"
		}"
		end

	gtk_widget_style_get_valist (a_widget: POINTER; a_first_property_name: POINTER; a_var_args: POINTER) is
 		-- gtk_widget_style_get_valist (node at line 6101)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_style_get_valist"
		}"
		end

	gtk_widget_get_clipboard (a_widget: POINTER; a_selection: POINTER): POINTER is
 		-- gtk_widget_get_clipboard (node at line 6759)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_clipboard"
		}"
		end

	gtk_widget_set_state (a_widget: POINTER; a_state: INTEGER) is
 		-- gtk_widget_set_state (node at line 6925)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_state"
		}"
		end

	gtk_widget_queue_clear (a_widget: POINTER) is
 		-- gtk_widget_queue_clear (node at line 6937)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_queue_clear"
		}"
		end

	gtk_widget_set_events (a_widget: POINTER; an_events: INTEGER_32) is
 		-- gtk_widget_set_events (node at line 6940)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_events"
		}"
		end

	gtk_widget_grab_default (a_widget: POINTER) is
 		-- gtk_widget_grab_default (node at line 6963)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_grab_default"
		}"
		end

	gtk_widget_is_ancestor (a_widget: POINTER; an_ancestor: POINTER): INTEGER_32 is
 		-- gtk_widget_is_ancestor (node at line 7132)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_ancestor"
		}"
		end

	gtk_widget_region_intersect (a_widget: POINTER; a_region: POINTER): POINTER is
 		-- gtk_widget_region_intersect (node at line 7143)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_region_intersect"
		}"
		end

	gtk_widget_keynav_failed (a_widget: POINTER; a_direction: INTEGER): INTEGER_32 is
 		-- gtk_widget_keynav_failed (node at line 7238)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_keynav_failed"
		}"
		end

	gtk_widget_set_realized (a_widget: POINTER; a_realized: INTEGER_32) is
 		-- gtk_widget_set_realized (node at line 7270)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_realized"
		}"
		end

	gtk_widget_queue_draw (a_widget: POINTER) is
 		-- gtk_widget_queue_draw (node at line 7436)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_queue_draw"
		}"
		end

	gtk_widget_new (a_type: NATURAL_32; a_first_property_name: POINTER): POINTER is
 		-- gtk_widget_new (variadic call)  (node at line 7465)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_new"
		}"
		end

	gtk_widget_set_allocation (a_widget: POINTER; an_allocation: POINTER) is
 		-- gtk_widget_set_allocation (node at line 7540)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_allocation"
		}"
		end

	gtk_widget_push_colormap (a_cmap: POINTER) is
 		-- gtk_widget_push_colormap (node at line 7688)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_push_colormap"
		}"
		end

	gtk_widget_activate (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_activate (node at line 7855)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_activate"
		}"
		end

	gtk_widget_modify_base (a_widget: POINTER; a_state: INTEGER; a_color: POINTER) is
 		-- gtk_widget_modify_base (node at line 7929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_base"
		}"
		end

	gtk_widget_get_realized (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_realized (node at line 8330)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_realized"
		}"
		end

	gtk_widget_set_default_direction (a_dir: INTEGER) is
 		-- gtk_widget_set_default_direction (node at line 8524)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_default_direction"
		}"
		end

	gtk_widget_intersect (a_widget: POINTER; an_area: POINTER; an_intersection: POINTER): INTEGER_32 is
 		-- gtk_widget_intersect (node at line 9380)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_intersect"
		}"
		end

	gtk_widget_hide_all (a_widget: POINTER) is
 		-- gtk_widget_hide_all (node at line 9576)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_hide_all"
		}"
		end

	gtk_widget_trigger_tooltip_query (a_widget: POINTER) is
 		-- gtk_widget_trigger_tooltip_query (node at line 9817)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_trigger_tooltip_query"
		}"
		end

	gtk_widget_class_list_style_properties (a_klass: POINTER; a_n_properties: POINTER): POINTER is
 		-- gtk_widget_class_list_style_properties (node at line 10375)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_class_list_style_properties"
		}"
		end

	gtk_widget_set_mapped (a_widget: POINTER; a_mapped: INTEGER_32) is
 		-- gtk_widget_set_mapped (node at line 10733)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_mapped"
		}"
		end

	gtk_widget_get_mapped (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_mapped (node at line 10896)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_mapped"
		}"
		end

	gtk_widget_get_sensitive (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_sensitive (node at line 10904)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_sensitive"
		}"
		end

	gtk_widget_queue_clear_area (a_widget: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_widget_queue_clear_area (node at line 11093)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_queue_clear_area"
		}"
		end

	gtk_widget_create_pango_context (a_widget: POINTER): POINTER is
 		-- gtk_widget_create_pango_context (node at line 11255)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_create_pango_context"
		}"
		end

	gtk_widget_get_visible (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_visible (node at line 11634)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_visible"
		}"
		end

	gtk_widget_add_mnemonic_label (a_widget: POINTER; a_label: POINTER) is
 		-- gtk_widget_add_mnemonic_label (node at line 11700)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_add_mnemonic_label"
		}"
		end

	gtk_widget_get_has_tooltip (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_has_tooltip (node at line 11832)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_has_tooltip"
		}"
		end

	gtk_widget_get_screen (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_screen (node at line 12232)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_screen"
		}"
		end

	gtk_widget_set_tooltip_markup (a_widget: POINTER; a_markup: POINTER) is
 		-- gtk_widget_set_tooltip_markup (node at line 12455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_tooltip_markup"
		}"
		end

	gtk_widget_add_accelerator (a_widget: POINTER; an_accel_signal: POINTER; an_accel_group: POINTER; an_accel_key: NATURAL_32; an_accel_mods: INTEGER; an_accel_flags: INTEGER) is
 		-- gtk_widget_add_accelerator (node at line 12528)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_add_accelerator"
		}"
		end

	gtk_widget_get_type: NATURAL_32 is
 		-- gtk_widget_get_type (node at line 12548)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_type()"
		}"
		end

	gtk_widget_style_get (a_widget: POINTER; a_first_property_name: POINTER) is
 		-- gtk_widget_style_get (variadic call)  (node at line 12747)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_style_get"
		}"
		end

	gtk_widget_get_default_colormap: POINTER is
 		-- gtk_widget_get_default_colormap (node at line 12832)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_default_colormap()"
		}"
		end

	gtk_widget_has_screen (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_has_screen (node at line 12861)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_has_screen"
		}"
		end

	gtk_widget_class_find_style_property (a_klass: POINTER; a_property_name: POINTER): POINTER is
 		-- gtk_widget_class_find_style_property (node at line 12943)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_class_find_style_property"
		}"
		end

	gtk_widget_get_toplevel (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_toplevel (node at line 13001)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_toplevel"
		}"
		end

	-- `hidden' function _gtk_widget_grab_notify skipped.
	gtk_widget_queue_draw_area (a_widget: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_widget_queue_draw_area (node at line 13447)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_queue_draw_area"
		}"
		end

	gtk_widget_set_no_show_all (a_widget: POINTER; a_no_show_all: INTEGER_32) is
 		-- gtk_widget_set_no_show_all (node at line 13466)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_no_show_all"
		}"
		end

	gtk_widget_unparent (a_widget: POINTER) is
 		-- gtk_widget_unparent (node at line 13622)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_unparent"
		}"
		end

	gtk_widget_hide_on_delete (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_hide_on_delete (node at line 13625)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_hide_on_delete"
		}"
		end

	gtk_widget_unmap (a_widget: POINTER) is
 		-- gtk_widget_unmap (node at line 14046)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_unmap"
		}"
		end

	gtk_widget_is_sensitive (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_is_sensitive (node at line 14620)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_sensitive"
		}"
		end

	gtk_widget_list_accel_closures (a_widget: POINTER): POINTER is
 		-- gtk_widget_list_accel_closures (node at line 14828)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_list_accel_closures"
		}"
		end

	gtk_widget_send_expose (a_widget: POINTER; an_event: POINTER): INTEGER_32 is
 		-- gtk_widget_send_expose (node at line 14977)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_send_expose"
		}"
		end

	-- `hidden' function _gtk_widget_propagate_composited_changed skipped.
	gtk_widget_queue_resize_no_redraw (a_widget: POINTER) is
 		-- gtk_widget_queue_resize_no_redraw (node at line 14997)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_queue_resize_no_redraw"
		}"
		end

	gtk_widget_get_display (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_display (node at line 15261)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_display"
		}"
		end

	gtk_widget_get_accessible (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_accessible (node at line 15935)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_accessible"
		}"
		end

	gtk_widget_style_get_property (a_widget: POINTER; a_property_name: POINTER; a_value: POINTER) is
 		-- gtk_widget_style_get_property (node at line 16029)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_style_get_property"
		}"
		end

	gtk_widget_get_settings (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_settings (node at line 16188)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_settings"
		}"
		end

	gtk_widget_modify_bg (a_widget: POINTER; a_state: INTEGER; a_color: POINTER) is
 		-- gtk_widget_modify_bg (node at line 16285)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_bg"
		}"
		end

	gtk_widget_modify_fg (a_widget: POINTER; a_state: INTEGER; a_color: POINTER) is
 		-- gtk_widget_modify_fg (node at line 16422)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_fg"
		}"
		end

	gtk_widget_get_app_paintable (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_app_paintable (node at line 16886)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_app_paintable"
		}"
		end

	gtk_widget_remove_mnemonic_label (a_widget: POINTER; a_label: POINTER) is
 		-- gtk_widget_remove_mnemonic_label (node at line 17427)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_remove_mnemonic_label"
		}"
		end

	-- `hidden' function _gtk_widget_get_pointer_window skipped.
	gtk_widget_size_allocate (a_widget: POINTER; an_allocation: POINTER) is
 		-- gtk_widget_size_allocate (node at line 17557)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_size_allocate"
		}"
		end

	gtk_widget_set_visible (a_widget: POINTER; a_visible: INTEGER_32) is
 		-- gtk_widget_set_visible (node at line 17859)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_visible"
		}"
		end

	gtk_widget_ref (a_widget: POINTER): POINTER is
 		-- gtk_widget_ref (node at line 18118)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_ref"
		}"
		end

	gtk_widget_set_window (a_widget: POINTER; a_window: POINTER) is
 		-- gtk_widget_set_window (node at line 18143)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_window"
		}"
		end

	gtk_widget_set_colormap (a_widget: POINTER; a_colormap: POINTER) is
 		-- gtk_widget_set_colormap (node at line 18198)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_colormap"
		}"
		end

	gtk_widget_error_bell (a_widget: POINTER) is
 		-- gtk_widget_error_bell (node at line 18500)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_error_bell"
		}"
		end

	gtk_widget_get_root_window (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_root_window (node at line 18773)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_root_window"
		}"
		end

	gtk_widget_get_child_visible (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_child_visible (node at line 18822)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_child_visible"
		}"
		end

	gtk_widget_freeze_child_notify (a_widget: POINTER) is
 		-- gtk_widget_freeze_child_notify (node at line 19070)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_freeze_child_notify"
		}"
		end

	gtk_widget_is_toplevel (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_is_toplevel (node at line 19341)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_toplevel"
		}"
		end

	gtk_widget_set_double_buffered (a_widget: POINTER; a_double_buffered: INTEGER_32) is
 		-- gtk_widget_set_double_buffered (node at line 19374)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_double_buffered"
		}"
		end

	-- `hidden' function _gtk_widget_set_pointer_window skipped.
	gtk_widget_modify_font (a_widget: POINTER; a_font_desc: POINTER) is
 		-- gtk_widget_modify_font (node at line 19947)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_font"
		}"
		end

	gtk_widget_get_can_default (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_can_default (node at line 20083)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_can_default"
		}"
		end

	gtk_widget_get_parent (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_parent (node at line 20556)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_parent"
		}"
		end

	gtk_widget_set (a_widget: POINTER; a_first_property_name: POINTER) is
 		-- gtk_widget_set (variadic call)  (node at line 20622)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set"
		}"
		end

	gtk_widget_grab_focus (a_widget: POINTER) is
 		-- gtk_widget_grab_focus (node at line 20711)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_grab_focus"
		}"
		end

	-- `hidden' function _gtk_widget_get_accel_path skipped.
	gtk_widget_get_direction (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_direction (node at line 21431)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_direction"
		}"
		end

	gtk_widget_get_style (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_style (node at line 22317)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_style"
		}"
		end

	gtk_widget_set_app_paintable (a_widget: POINTER; an_app_paintable: INTEGER_32) is
 		-- gtk_widget_set_app_paintable (node at line 22418)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_app_paintable"
		}"
		end

	gtk_widget_set_name (a_widget: POINTER; a_name: POINTER) is
 		-- gtk_widget_set_name (node at line 22431)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_name"
		}"
		end

	gtk_widget_class_install_style_property (a_klass: POINTER; a_pspec: POINTER) is
 		-- gtk_widget_class_install_style_property (node at line 22481)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_class_install_style_property"
		}"
		end

	gtk_widget_render_icon (a_widget: POINTER; a_stock_id: POINTER; a_size: INTEGER; a_detail: POINTER): POINTER is
 		-- gtk_widget_render_icon (node at line 22497)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_render_icon"
		}"
		end

	gtk_widget_translate_coordinates (a_src_widget: POINTER; a_dest_widget: POINTER; a_src_x: INTEGER_32; a_src_y: INTEGER_32; a_dest_x: POINTER; a_dest_y: POINTER): INTEGER_32 is
 		-- gtk_widget_translate_coordinates (node at line 22515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_translate_coordinates"
		}"
		end

	gtk_widget_get_events (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_events (node at line 22688)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_events"
		}"
		end

	gtk_widget_is_focus (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_is_focus (node at line 23076)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_focus"
		}"
		end

	gtk_widget_has_rc_style (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_has_rc_style (node at line 23177)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_has_rc_style"
		}"
		end

	gtk_widget_has_focus (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_has_focus (node at line 23625)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_has_focus"
		}"
		end

	gtk_widget_create_pango_layout (a_widget: POINTER; a_text: POINTER): POINTER is
 		-- gtk_widget_create_pango_layout (node at line 23842)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_create_pango_layout"
		}"
		end

	gtk_widget_get_receives_default (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_receives_default (node at line 24011)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_receives_default"
		}"
		end

	gtk_widget_shape_combine_mask (a_widget: POINTER; a_shape_mask: POINTER; an_offset_x: INTEGER_32; an_offset_y: INTEGER_32) is
 		-- gtk_widget_shape_combine_mask (node at line 24430)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_shape_combine_mask"
		}"
		end

	gtk_widget_set_extension_events (a_widget: POINTER; a_mode: INTEGER) is
 		-- gtk_widget_set_extension_events (node at line 24510)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_extension_events"
		}"
		end

	gtk_widget_get_window (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_window (node at line 24779)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_window"
		}"
		end

	gtk_widget_modify_style (a_widget: POINTER; a_style: POINTER) is
 		-- gtk_widget_modify_style (node at line 24950)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_style"
		}"
		end

	gtk_widget_set_direction (a_widget: POINTER; a_dir: INTEGER) is
 		-- gtk_widget_set_direction (node at line 25073)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_direction"
		}"
		end

	gtk_widget_size_request (a_widget: POINTER; a_requisition: POINTER) is
 		-- gtk_widget_size_request (node at line 25648)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_size_request"
		}"
		end

	gtk_widget_get_pango_context (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_pango_context (node at line 25832)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_pango_context"
		}"
		end

	gtk_widget_get_no_show_all (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_no_show_all (node at line 26077)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_no_show_all"
		}"
		end

	gtk_widget_push_composite_child is
 		-- gtk_widget_push_composite_child (node at line 26164)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_push_composite_child()"
		}"
		end

	gtk_widget_get_allocation (a_widget: POINTER; an_allocation: POINTER) is
 		-- gtk_widget_get_allocation (node at line 26225)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_allocation"
		}"
		end

	gtk_widget_get_visual (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_visual (node at line 26725)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_visual"
		}"
		end

	gtk_widget_unref (a_widget: POINTER) is
 		-- gtk_widget_unref (node at line 26728)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_unref"
		}"
		end

	gtk_widget_hide (a_widget: POINTER) is
 		-- gtk_widget_hide (node at line 26896)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_hide"
		}"
		end

	gtk_widget_unrealize (a_widget: POINTER) is
 		-- gtk_widget_unrealize (node at line 26952)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_unrealize"
		}"
		end

	gtk_widget_child_notify (a_widget: POINTER; a_child_property: POINTER) is
 		-- gtk_widget_child_notify (node at line 27237)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_child_notify"
		}"
		end

	gtk_widget_can_activate_accel (a_widget: POINTER; a_signal_id: NATURAL_32): INTEGER_32 is
 		-- gtk_widget_can_activate_accel (node at line 27668)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_can_activate_accel"
		}"
		end

	gtk_widget_set_can_focus (a_widget: POINTER; a_can_focus: INTEGER_32) is
 		-- gtk_widget_set_can_focus (node at line 27676)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_can_focus"
		}"
		end

	gtk_widget_child_focus (a_widget: POINTER; a_direction: INTEGER): INTEGER_32 is
 		-- gtk_widget_child_focus (node at line 27914)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_child_focus"
		}"
		end

	gtk_widget_get_child_requisition (a_widget: POINTER; a_requisition: POINTER) is
 		-- gtk_widget_get_child_requisition (node at line 28276)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_child_requisition"
		}"
		end

	gtk_widget_get_parent_window (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_parent_window (node at line 28903)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_parent_window"
		}"
		end

	gtk_widget_set_default_colormap (a_colormap: POINTER) is
 		-- gtk_widget_set_default_colormap (node at line 28949)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_default_colormap"
		}"
		end

	-- `hidden' function _gtk_widget_synthesize_crossing skipped.
	gtk_widget_get_extension_events (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_extension_events (node at line 29388)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_extension_events"
		}"
		end

	gtk_widget_get_requisition (a_widget: POINTER; a_requisition: POINTER) is
 		-- gtk_widget_get_requisition (node at line 29480)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_requisition"
		}"
		end

	-- `hidden' function _gtk_widget_buildable_finish_accelerator skipped.
	-- `hidden' function _gtk_widget_propagate_screen_changed skipped.
	gtk_widget_get_can_focus (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_can_focus (node at line 30668)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_can_focus"
		}"
		end

	gtk_widget_list_mnemonic_labels (a_widget: POINTER): POINTER is
 		-- gtk_widget_list_mnemonic_labels (node at line 30861)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_list_mnemonic_labels"
		}"
		end

	gtk_widget_set_style (a_widget: POINTER; a_style: POINTER) is
 		-- gtk_widget_set_style (node at line 30920)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_style"
		}"
		end

	gtk_widget_is_drawable (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_is_drawable (node at line 30940)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_drawable"
		}"
		end

	gtk_widget_destroyed (a_widget: POINTER; a_widget_pointer: POINTER) is
 		-- gtk_widget_destroyed (node at line 31101)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_destroyed"
		}"
		end

	gtk_widget_set_has_window (a_widget: POINTER; a_has_window: INTEGER_32) is
 		-- gtk_widget_set_has_window (node at line 31400)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_has_window"
		}"
		end

	gtk_widget_event (a_widget: POINTER; an_event: POINTER): INTEGER_32 is
 		-- gtk_widget_event (node at line 31443)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_event"
		}"
		end

	gtk_widget_get_modifier_style (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_modifier_style (node at line 32320)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_modifier_style"
		}"
		end

	gtk_requisition_free (a_requisition: POINTER) is
 		-- gtk_requisition_free (node at line 32365)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_requisition_free"
		}"
		end

	-- `hidden' function _gtk_widget_get_aux_info skipped.
	gtk_widget_set_redraw_on_allocate (a_widget: POINTER; a_redraw_on_allocate: INTEGER_32) is
 		-- gtk_widget_set_redraw_on_allocate (node at line 32707)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_redraw_on_allocate"
		}"
		end

	gtk_widget_set_uposition (a_widget: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- gtk_widget_set_uposition (node at line 32766)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_uposition"
		}"
		end

	gtk_widget_style_attach (a_style: POINTER) is
 		-- gtk_widget_style_attach (node at line 32776)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_style_attach"
		}"
		end

	gtk_widget_queue_resize (a_widget: POINTER) is
 		-- gtk_widget_queue_resize (node at line 33155)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_queue_resize"
		}"
		end

	gtk_widget_modify_cursor (a_widget: POINTER; a_primary: POINTER; a_secondary: POINTER) is
 		-- gtk_widget_modify_cursor (node at line 33173)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_cursor"
		}"
		end

	gtk_widget_has_grab (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_has_grab (node at line 33180)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_has_grab"
		}"
		end

	-- `hidden' function _gtk_widget_peek_colormap skipped.
	gtk_widget_destroy (a_widget: POINTER) is
 		-- gtk_widget_destroy (node at line 33295)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_destroy"
		}"
		end

	gtk_widget_set_size_request (a_widget: POINTER; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_widget_set_size_request (node at line 33429)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_size_request"
		}"
		end

	gtk_widget_get_size_request (a_widget: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- gtk_widget_get_size_request (node at line 33444)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_size_request"
		}"
		end

	gtk_widget_path (a_widget: POINTER; a_path_length: POINTER; a_path: POINTER; a_path_reversed: POINTER) is
 		-- gtk_widget_path (node at line 33485)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_path"
		}"
		end

	gtk_requisition_copy (a_requisition: POINTER): POINTER is
 		-- gtk_requisition_copy (node at line 33602)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_requisition_copy"
		}"
		end

	gtk_widget_get_default_style: POINTER is
 		-- gtk_widget_get_default_style (node at line 33720)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_default_style()"
		}"
		end

	gtk_widget_thaw_child_notify (a_widget: POINTER) is
 		-- gtk_widget_thaw_child_notify (node at line 34007)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_thaw_child_notify"
		}"
		end

	gtk_widget_set_parent_window (a_widget: POINTER; a_parent_window: POINTER) is
 		-- gtk_widget_set_parent_window (node at line 34210)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_parent_window"
		}"
		end

	gtk_widget_set_child_visible (a_widget: POINTER; an_is_visible: INTEGER_32) is
 		-- gtk_widget_set_child_visible (node at line 34348)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_child_visible"
		}"
		end

	gtk_widget_pop_colormap is
 		-- gtk_widget_pop_colormap (node at line 34389)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_pop_colormap()"
		}"
		end

	gtk_widget_get_composite_name (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_composite_name (node at line 34439)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_composite_name"
		}"
		end

	gtk_widget_mnemonic_activate (a_widget: POINTER; a_group_cycling: INTEGER_32): INTEGER_32 is
 		-- gtk_widget_mnemonic_activate (node at line 34762)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_mnemonic_activate"
		}"
		end

	gtk_widget_set_tooltip_text (a_widget: POINTER; a_text: POINTER) is
 		-- gtk_widget_set_tooltip_text (node at line 34882)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_tooltip_text"
		}"
		end

	gtk_widget_get_has_window (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_get_has_window (node at line 35210)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_has_window"
		}"
		end

	gtk_widget_get_state (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_state (node at line 35341)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_state"
		}"
		end

	gtk_widget_is_composited (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_is_composited (node at line 35345)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_composited"
		}"
		end

	gtk_widget_show_now (a_widget: POINTER) is
 		-- gtk_widget_show_now (node at line 35355)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_show_now"
		}"
		end

	gtk_widget_get_colormap (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_colormap (node at line 35400)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_colormap"
		}"
		end

	gtk_widget_set_scroll_adjustments (a_widget: POINTER; a_hadjustment: POINTER; a_vadjustment: POINTER): INTEGER_32 is
 		-- gtk_widget_set_scroll_adjustments (node at line 35516)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_scroll_adjustments"
		}"
		end

	gtk_widget_set_can_default (a_widget: POINTER; a_can_default: INTEGER_32) is
 		-- gtk_widget_set_can_default (node at line 35567)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_can_default"
		}"
		end

	gtk_widget_has_default (a_widget: POINTER): INTEGER_32 is
 		-- gtk_widget_has_default (node at line 35585)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_has_default"
		}"
		end

	gtk_widget_class_path (a_widget: POINTER; a_path_length: POINTER; a_path: POINTER; a_path_reversed: POINTER) is
 		-- gtk_widget_class_path (node at line 35662)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_class_path"
		}"
		end

	gtk_requisition_get_type: NATURAL_32 is
 		-- gtk_requisition_get_type (node at line 35777)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_requisition_get_type()"
		}"
		end

	gtk_widget_draw (a_widget: POINTER; an_area: POINTER) is
 		-- gtk_widget_draw (node at line 36013)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_draw"
		}"
		end

	gtk_widget_pop_composite_child is
 		-- gtk_widget_pop_composite_child (node at line 36504)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_pop_composite_child()"
		}"
		end

	gtk_widget_set_has_tooltip (a_widget: POINTER; a_has_tooltip: INTEGER_32) is
 		-- gtk_widget_set_has_tooltip (node at line 36979)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_has_tooltip"
		}"
		end

	-- `hidden' function _gtk_widget_is_pointer_widget skipped.

end -- class GTKWIDGET_EXTERNALS
