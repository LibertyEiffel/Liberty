-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKWIDGET_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_requisition_copy (a_requisition: POINTER): POINTER is
 		-- gtk_requisition_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_requisition_copy"
		}"
		end

	gtk_requisition_free (a_requisition: POINTER) is
 		-- gtk_requisition_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_requisition_free"
		}"
		end

	gtk_requisition_get_type: like long_unsigned is
 		-- gtk_requisition_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_requisition_get_type()"
		}"
		end

	gtk_widget_activate (a_widget: POINTER): INTEGER is
 		-- gtk_widget_activate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_activate"
		}"
		end

	gtk_widget_add_accelerator (a_widget: POINTER; an_accel_signal: POINTER; an_accel_group: POINTER; an_accel_key: NATURAL; an_accel_mods: INTEGER; an_accel_flags: INTEGER) is
 		-- gtk_widget_add_accelerator
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_add_accelerator"
		}"
		end

	gtk_widget_add_events (a_widget: POINTER; an_events: INTEGER) is
 		-- gtk_widget_add_events
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_add_events"
		}"
		end

	gtk_widget_add_mnemonic_label (a_widget: POINTER; a_label: POINTER) is
 		-- gtk_widget_add_mnemonic_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_add_mnemonic_label"
		}"
		end

	-- `hidden' function _gtk_widget_buildable_finish_accelerator skipped.
	gtk_widget_can_activate_accel (a_widget: POINTER; a_signal_id: NATURAL): INTEGER is
 		-- gtk_widget_can_activate_accel
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_can_activate_accel"
		}"
		end

	gtk_widget_child_focus (a_widget: POINTER; a_direction: INTEGER): INTEGER is
 		-- gtk_widget_child_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_child_focus"
		}"
		end

	gtk_widget_child_notify (a_widget: POINTER; a_child_property: POINTER) is
 		-- gtk_widget_child_notify
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_child_notify"
		}"
		end

	gtk_widget_class_find_style_property (a_klass: POINTER; a_property_name: POINTER): POINTER is
 		-- gtk_widget_class_find_style_property
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_class_find_style_property"
		}"
		end

	gtk_widget_class_install_style_property (a_klass: POINTER; a_pspec: POINTER) is
 		-- gtk_widget_class_install_style_property
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_class_install_style_property"
		}"
		end

	gtk_widget_class_install_style_property_parser (a_klass: POINTER; a_pspec: POINTER; a_parser: POINTER) is
 		-- gtk_widget_class_install_style_property_parser
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_class_install_style_property_parser"
		}"
		end

	gtk_widget_class_list_style_properties (a_klass: POINTER; a_n_properties: POINTER): POINTER is
 		-- gtk_widget_class_list_style_properties
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_class_list_style_properties"
		}"
		end

	gtk_widget_class_path (a_widget: POINTER; a_path_length: POINTER; a_path: POINTER; a_path_reversed: POINTER) is
 		-- gtk_widget_class_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_class_path"
		}"
		end

	gtk_widget_create_pango_context (a_widget: POINTER): POINTER is
 		-- gtk_widget_create_pango_context
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_create_pango_context"
		}"
		end

	gtk_widget_create_pango_layout (a_widget: POINTER; a_text: POINTER): POINTER is
 		-- gtk_widget_create_pango_layout
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_create_pango_layout"
		}"
		end

	gtk_widget_destroy (a_widget: POINTER) is
 		-- gtk_widget_destroy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_destroy"
		}"
		end

	gtk_widget_destroyed (a_widget: POINTER; a_widget_pointer: POINTER) is
 		-- gtk_widget_destroyed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_destroyed"
		}"
		end

	gtk_widget_ensure_style (a_widget: POINTER) is
 		-- gtk_widget_ensure_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_ensure_style"
		}"
		end

	gtk_widget_error_bell (a_widget: POINTER) is
 		-- gtk_widget_error_bell
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_error_bell"
		}"
		end

	gtk_widget_event (a_widget: POINTER; an_event: POINTER): INTEGER is
 		-- gtk_widget_event
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_event"
		}"
		end

	gtk_widget_freeze_child_notify (a_widget: POINTER) is
 		-- gtk_widget_freeze_child_notify
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_freeze_child_notify"
		}"
		end

	-- `hidden' function _gtk_widget_get_accel_path skipped.
	gtk_widget_get_accessible (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_accessible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_accessible"
		}"
		end

	gtk_widget_get_allocation (a_widget: POINTER; an_allocation: POINTER) is
 		-- gtk_widget_get_allocation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_allocation"
		}"
		end

	gtk_widget_get_ancestor (a_widget: POINTER; a_widget_type: like long_unsigned): POINTER is
 		-- gtk_widget_get_ancestor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_ancestor"
		}"
		end

	gtk_widget_get_app_paintable (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_app_paintable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_app_paintable"
		}"
		end

	-- `hidden' function _gtk_widget_get_aux_info skipped.
	gtk_widget_get_can_default (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_can_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_can_default"
		}"
		end

	gtk_widget_get_can_focus (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_can_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_can_focus"
		}"
		end

	gtk_widget_get_child_requisition (a_widget: POINTER; a_requisition: POINTER) is
 		-- gtk_widget_get_child_requisition
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_child_requisition"
		}"
		end

	gtk_widget_get_child_visible (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_child_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_child_visible"
		}"
		end

	gtk_widget_get_clipboard (a_widget: POINTER; a_selection: POINTER): POINTER is
 		-- gtk_widget_get_clipboard
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_clipboard"
		}"
		end

	gtk_widget_get_colormap (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_colormap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_colormap"
		}"
		end

	gtk_widget_get_composite_name (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_composite_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_composite_name"
		}"
		end

	gtk_widget_get_default_colormap: POINTER is
 		-- gtk_widget_get_default_colormap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_default_colormap()"
		}"
		end

	gtk_widget_get_default_direction: INTEGER is
 		-- gtk_widget_get_default_direction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_default_direction()"
		}"
		end

	gtk_widget_get_default_style: POINTER is
 		-- gtk_widget_get_default_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_default_style()"
		}"
		end

	gtk_widget_get_default_visual: POINTER is
 		-- gtk_widget_get_default_visual
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_default_visual()"
		}"
		end

	gtk_widget_get_direction (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_direction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_direction"
		}"
		end

	gtk_widget_get_display (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_display"
		}"
		end

	gtk_widget_get_double_buffered (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_double_buffered
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_double_buffered"
		}"
		end

	gtk_widget_get_events (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_events
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_events"
		}"
		end

	gtk_widget_get_extension_events (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_extension_events
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_extension_events"
		}"
		end

	gtk_widget_get_has_tooltip (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_has_tooltip
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_has_tooltip"
		}"
		end

	gtk_widget_get_has_window (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_has_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_has_window"
		}"
		end

	gtk_widget_get_mapped (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_mapped
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_mapped"
		}"
		end

	gtk_widget_get_modifier_style (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_modifier_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_modifier_style"
		}"
		end

	gtk_widget_get_name (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_name"
		}"
		end

	gtk_widget_get_no_show_all (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_no_show_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_no_show_all"
		}"
		end

	gtk_widget_get_pango_context (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_pango_context
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_pango_context"
		}"
		end

	gtk_widget_get_parent (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_parent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_parent"
		}"
		end

	gtk_widget_get_parent_window (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_parent_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_parent_window"
		}"
		end

	gtk_widget_get_pointer (a_widget: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- gtk_widget_get_pointer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_pointer"
		}"
		end

	-- `hidden' function _gtk_widget_get_pointer_window skipped.
	gtk_widget_get_realized (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_realized
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_realized"
		}"
		end

	gtk_widget_get_receives_default (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_receives_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_receives_default"
		}"
		end

	gtk_widget_get_requisition (a_widget: POINTER; a_requisition: POINTER) is
 		-- gtk_widget_get_requisition
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_requisition"
		}"
		end

	gtk_widget_get_root_window (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_root_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_root_window"
		}"
		end

	gtk_widget_get_screen (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_screen"
		}"
		end

	gtk_widget_get_sensitive (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_sensitive
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_sensitive"
		}"
		end

	gtk_widget_get_settings (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_settings
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_settings"
		}"
		end

	gtk_widget_get_size_request (a_widget: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- gtk_widget_get_size_request
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_size_request"
		}"
		end

	gtk_widget_get_snapshot (a_widget: POINTER; a_clip_rect: POINTER): POINTER is
 		-- gtk_widget_get_snapshot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_snapshot"
		}"
		end

	gtk_widget_get_state (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_state"
		}"
		end

	gtk_widget_get_style (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_style"
		}"
		end

	gtk_widget_get_tooltip_markup (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_tooltip_markup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_tooltip_markup"
		}"
		end

	gtk_widget_get_tooltip_text (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_tooltip_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_tooltip_text"
		}"
		end

	gtk_widget_get_tooltip_window (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_tooltip_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_tooltip_window"
		}"
		end

	gtk_widget_get_toplevel (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_toplevel
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_toplevel"
		}"
		end

	gtk_widget_get_type: like long_unsigned is
 		-- gtk_widget_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_type()"
		}"
		end

	gtk_widget_get_visible (a_widget: POINTER): INTEGER is
 		-- gtk_widget_get_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_visible"
		}"
		end

	gtk_widget_get_visual (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_visual
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_visual"
		}"
		end

	gtk_widget_get_window (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_window"
		}"
		end

	gtk_widget_grab_default (a_widget: POINTER) is
 		-- gtk_widget_grab_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_grab_default"
		}"
		end

	gtk_widget_grab_focus (a_widget: POINTER) is
 		-- gtk_widget_grab_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_grab_focus"
		}"
		end

	-- `hidden' function _gtk_widget_grab_notify skipped.
	gtk_widget_has_default (a_widget: POINTER): INTEGER is
 		-- gtk_widget_has_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_has_default"
		}"
		end

	gtk_widget_has_focus (a_widget: POINTER): INTEGER is
 		-- gtk_widget_has_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_has_focus"
		}"
		end

	gtk_widget_has_grab (a_widget: POINTER): INTEGER is
 		-- gtk_widget_has_grab
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_has_grab"
		}"
		end

	gtk_widget_has_rc_style (a_widget: POINTER): INTEGER is
 		-- gtk_widget_has_rc_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_has_rc_style"
		}"
		end

	gtk_widget_has_screen (a_widget: POINTER): INTEGER is
 		-- gtk_widget_has_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_has_screen"
		}"
		end

	gtk_widget_hide (a_widget: POINTER) is
 		-- gtk_widget_hide
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_hide"
		}"
		end

	gtk_widget_hide_on_delete (a_widget: POINTER): INTEGER is
 		-- gtk_widget_hide_on_delete
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_hide_on_delete"
		}"
		end

	gtk_widget_input_shape_combine_mask (a_widget: POINTER; a_shape_mask: POINTER; an_offset_x: INTEGER; an_offset_y: INTEGER) is
 		-- gtk_widget_input_shape_combine_mask
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_input_shape_combine_mask"
		}"
		end

	gtk_widget_intersect (a_widget: POINTER; an_area: POINTER; an_intersection: POINTER): INTEGER is
 		-- gtk_widget_intersect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_intersect"
		}"
		end

	gtk_widget_is_ancestor (a_widget: POINTER; an_ancestor: POINTER): INTEGER is
 		-- gtk_widget_is_ancestor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_ancestor"
		}"
		end

	gtk_widget_is_composited (a_widget: POINTER): INTEGER is
 		-- gtk_widget_is_composited
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_composited"
		}"
		end

	gtk_widget_is_drawable (a_widget: POINTER): INTEGER is
 		-- gtk_widget_is_drawable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_drawable"
		}"
		end

	gtk_widget_is_focus (a_widget: POINTER): INTEGER is
 		-- gtk_widget_is_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_focus"
		}"
		end

	-- `hidden' function _gtk_widget_is_pointer_widget skipped.
	gtk_widget_is_sensitive (a_widget: POINTER): INTEGER is
 		-- gtk_widget_is_sensitive
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_sensitive"
		}"
		end

	gtk_widget_is_toplevel (a_widget: POINTER): INTEGER is
 		-- gtk_widget_is_toplevel
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_is_toplevel"
		}"
		end

	gtk_widget_keynav_failed (a_widget: POINTER; a_direction: INTEGER): INTEGER is
 		-- gtk_widget_keynav_failed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_keynav_failed"
		}"
		end

	gtk_widget_list_accel_closures (a_widget: POINTER): POINTER is
 		-- gtk_widget_list_accel_closures
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_list_accel_closures"
		}"
		end

	gtk_widget_list_mnemonic_labels (a_widget: POINTER): POINTER is
 		-- gtk_widget_list_mnemonic_labels
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_list_mnemonic_labels"
		}"
		end

	gtk_widget_map (a_widget: POINTER) is
 		-- gtk_widget_map
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_map"
		}"
		end

	gtk_widget_mnemonic_activate (a_widget: POINTER; a_group_cycling: INTEGER): INTEGER is
 		-- gtk_widget_mnemonic_activate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_mnemonic_activate"
		}"
		end

	gtk_widget_modify_base (a_widget: POINTER; a_state: INTEGER; a_color: POINTER) is
 		-- gtk_widget_modify_base
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_base"
		}"
		end

	gtk_widget_modify_bg (a_widget: POINTER; a_state: INTEGER; a_color: POINTER) is
 		-- gtk_widget_modify_bg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_bg"
		}"
		end

	gtk_widget_modify_cursor (a_widget: POINTER; a_primary: POINTER; a_secondary: POINTER) is
 		-- gtk_widget_modify_cursor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_cursor"
		}"
		end

	gtk_widget_modify_fg (a_widget: POINTER; a_state: INTEGER; a_color: POINTER) is
 		-- gtk_widget_modify_fg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_fg"
		}"
		end

	gtk_widget_modify_font (a_widget: POINTER; a_font_desc: POINTER) is
 		-- gtk_widget_modify_font
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_font"
		}"
		end

	gtk_widget_modify_style (a_widget: POINTER; a_style: POINTER) is
 		-- gtk_widget_modify_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_style"
		}"
		end

	gtk_widget_modify_text (a_widget: POINTER; a_state: INTEGER; a_color: POINTER) is
 		-- gtk_widget_modify_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_modify_text"
		}"
		end

	gtk_widget_new (a_type: like long_unsigned; a_first_property_name: POINTER): POINTER is
 		-- gtk_widget_new (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_new"
		}"
		end

	gtk_widget_path (a_widget: POINTER; a_path_length: POINTER; a_path: POINTER; a_path_reversed: POINTER) is
 		-- gtk_widget_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_path"
		}"
		end

	-- `hidden' function _gtk_widget_peek_colormap skipped.
	gtk_widget_pop_colormap is
 		-- gtk_widget_pop_colormap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_pop_colormap()"
		}"
		end

	gtk_widget_pop_composite_child is
 		-- gtk_widget_pop_composite_child
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_pop_composite_child()"
		}"
		end

	-- `hidden' function _gtk_widget_propagate_composited_changed skipped.
	-- `hidden' function _gtk_widget_propagate_hierarchy_changed skipped.
	-- `hidden' function _gtk_widget_propagate_screen_changed skipped.
	gtk_widget_push_colormap (a_cmap: POINTER) is
 		-- gtk_widget_push_colormap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_push_colormap"
		}"
		end

	gtk_widget_push_composite_child is
 		-- gtk_widget_push_composite_child
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_push_composite_child()"
		}"
		end

	gtk_widget_queue_draw (a_widget: POINTER) is
 		-- gtk_widget_queue_draw
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_queue_draw"
		}"
		end

	gtk_widget_queue_draw_area (a_widget: POINTER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER) is
 		-- gtk_widget_queue_draw_area
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_queue_draw_area"
		}"
		end

	gtk_widget_queue_resize (a_widget: POINTER) is
 		-- gtk_widget_queue_resize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_queue_resize"
		}"
		end

	gtk_widget_queue_resize_no_redraw (a_widget: POINTER) is
 		-- gtk_widget_queue_resize_no_redraw
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_queue_resize_no_redraw"
		}"
		end

	gtk_widget_realize (a_widget: POINTER) is
 		-- gtk_widget_realize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_realize"
		}"
		end

	gtk_widget_region_intersect (a_widget: POINTER; a_region: POINTER): POINTER is
 		-- gtk_widget_region_intersect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_region_intersect"
		}"
		end

	gtk_widget_remove_accelerator (a_widget: POINTER; an_accel_group: POINTER; an_accel_key: NATURAL; an_accel_mods: INTEGER): INTEGER is
 		-- gtk_widget_remove_accelerator
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_remove_accelerator"
		}"
		end

	gtk_widget_remove_mnemonic_label (a_widget: POINTER; a_label: POINTER) is
 		-- gtk_widget_remove_mnemonic_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_remove_mnemonic_label"
		}"
		end

	gtk_widget_render_icon (a_widget: POINTER; a_stock_id: POINTER; a_size: INTEGER; a_detail: POINTER): POINTER is
 		-- gtk_widget_render_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_render_icon"
		}"
		end

	gtk_widget_reparent (a_widget: POINTER; a_new_parent: POINTER) is
 		-- gtk_widget_reparent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_reparent"
		}"
		end

	gtk_widget_reset_rc_styles (a_widget: POINTER) is
 		-- gtk_widget_reset_rc_styles
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_reset_rc_styles"
		}"
		end

	gtk_widget_send_expose (a_widget: POINTER; an_event: POINTER): INTEGER is
 		-- gtk_widget_send_expose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_send_expose"
		}"
		end

	gtk_widget_send_focus_change (a_widget: POINTER; an_event: POINTER): INTEGER is
 		-- gtk_widget_send_focus_change
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_send_focus_change"
		}"
		end

	gtk_widget_set_accel_path (a_widget: POINTER; an_accel_path: POINTER; an_accel_group: POINTER) is
 		-- gtk_widget_set_accel_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_accel_path"
		}"
		end

	gtk_widget_set_allocation (a_widget: POINTER; an_allocation: POINTER) is
 		-- gtk_widget_set_allocation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_allocation"
		}"
		end

	gtk_widget_set_app_paintable (a_widget: POINTER; an_app_paintable: INTEGER) is
 		-- gtk_widget_set_app_paintable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_app_paintable"
		}"
		end

	gtk_widget_set_can_default (a_widget: POINTER; a_can_default: INTEGER) is
 		-- gtk_widget_set_can_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_can_default"
		}"
		end

	gtk_widget_set_can_focus (a_widget: POINTER; a_can_focus: INTEGER) is
 		-- gtk_widget_set_can_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_can_focus"
		}"
		end

	gtk_widget_set_child_visible (a_widget: POINTER; an_is_visible: INTEGER) is
 		-- gtk_widget_set_child_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_child_visible"
		}"
		end

	gtk_widget_set_colormap (a_widget: POINTER; a_colormap: POINTER) is
 		-- gtk_widget_set_colormap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_colormap"
		}"
		end

	gtk_widget_set_composite_name (a_widget: POINTER; a_name: POINTER) is
 		-- gtk_widget_set_composite_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_composite_name"
		}"
		end

	gtk_widget_set_default_colormap (a_colormap: POINTER) is
 		-- gtk_widget_set_default_colormap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_default_colormap"
		}"
		end

	gtk_widget_set_default_direction (a_dir: INTEGER) is
 		-- gtk_widget_set_default_direction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_default_direction"
		}"
		end

	gtk_widget_set_direction (a_widget: POINTER; a_dir: INTEGER) is
 		-- gtk_widget_set_direction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_direction"
		}"
		end

	gtk_widget_set_double_buffered (a_widget: POINTER; a_double_buffered: INTEGER) is
 		-- gtk_widget_set_double_buffered
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_double_buffered"
		}"
		end

	gtk_widget_set_events (a_widget: POINTER; an_events: INTEGER) is
 		-- gtk_widget_set_events
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_events"
		}"
		end

	gtk_widget_set_extension_events (a_widget: POINTER; a_mode: INTEGER) is
 		-- gtk_widget_set_extension_events
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_extension_events"
		}"
		end

	-- `hidden' function _gtk_widget_set_has_default skipped.
	-- `hidden' function _gtk_widget_set_has_grab skipped.
	gtk_widget_set_has_tooltip (a_widget: POINTER; a_has_tooltip: INTEGER) is
 		-- gtk_widget_set_has_tooltip
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_has_tooltip"
		}"
		end

	gtk_widget_set_has_window (a_widget: POINTER; a_has_window: INTEGER) is
 		-- gtk_widget_set_has_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_has_window"
		}"
		end

	-- `hidden' function _gtk_widget_set_is_toplevel skipped.
	gtk_widget_set_mapped (a_widget: POINTER; a_mapped: INTEGER) is
 		-- gtk_widget_set_mapped
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_mapped"
		}"
		end

	gtk_widget_set_name (a_widget: POINTER; a_name: POINTER) is
 		-- gtk_widget_set_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_name"
		}"
		end

	gtk_widget_set_no_show_all (a_widget: POINTER; a_no_show_all: INTEGER) is
 		-- gtk_widget_set_no_show_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_no_show_all"
		}"
		end

	gtk_widget_set_parent (a_widget: POINTER; a_parent: POINTER) is
 		-- gtk_widget_set_parent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_parent"
		}"
		end

	gtk_widget_set_parent_window (a_widget: POINTER; a_parent_window: POINTER) is
 		-- gtk_widget_set_parent_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_parent_window"
		}"
		end

	-- `hidden' function _gtk_widget_set_pointer_window skipped.
	gtk_widget_set_realized (a_widget: POINTER; a_realized: INTEGER) is
 		-- gtk_widget_set_realized
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_realized"
		}"
		end

	gtk_widget_set_receives_default (a_widget: POINTER; a_receives_default: INTEGER) is
 		-- gtk_widget_set_receives_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_receives_default"
		}"
		end

	gtk_widget_set_redraw_on_allocate (a_widget: POINTER; a_redraw_on_allocate: INTEGER) is
 		-- gtk_widget_set_redraw_on_allocate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_redraw_on_allocate"
		}"
		end

	gtk_widget_set_scroll_adjustments (a_widget: POINTER; a_hadjustment: POINTER; a_vadjustment: POINTER): INTEGER is
 		-- gtk_widget_set_scroll_adjustments
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_scroll_adjustments"
		}"
		end

	gtk_widget_set_sensitive (a_widget: POINTER; a_sensitive: INTEGER) is
 		-- gtk_widget_set_sensitive
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_sensitive"
		}"
		end

	gtk_widget_set_size_request (a_widget: POINTER; a_width: INTEGER; a_height: INTEGER) is
 		-- gtk_widget_set_size_request
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_size_request"
		}"
		end

	gtk_widget_set_state (a_widget: POINTER; a_state: INTEGER) is
 		-- gtk_widget_set_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_state"
		}"
		end

	gtk_widget_set_style (a_widget: POINTER; a_style: POINTER) is
 		-- gtk_widget_set_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_style"
		}"
		end

	gtk_widget_set_tooltip_markup (a_widget: POINTER; a_markup: POINTER) is
 		-- gtk_widget_set_tooltip_markup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_tooltip_markup"
		}"
		end

	gtk_widget_set_tooltip_text (a_widget: POINTER; a_text: POINTER) is
 		-- gtk_widget_set_tooltip_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_tooltip_text"
		}"
		end

	gtk_widget_set_tooltip_window (a_widget: POINTER; a_custom_window: POINTER) is
 		-- gtk_widget_set_tooltip_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_tooltip_window"
		}"
		end

	gtk_widget_set_visible (a_widget: POINTER; a_visible: INTEGER) is
 		-- gtk_widget_set_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_visible"
		}"
		end

	gtk_widget_set_window (a_widget: POINTER; a_window: POINTER) is
 		-- gtk_widget_set_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_set_window"
		}"
		end

	gtk_widget_shape_combine_mask (a_widget: POINTER; a_shape_mask: POINTER; an_offset_x: INTEGER; an_offset_y: INTEGER) is
 		-- gtk_widget_shape_combine_mask
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_shape_combine_mask"
		}"
		end

	gtk_widget_show (a_widget: POINTER) is
 		-- gtk_widget_show
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_show"
		}"
		end

	gtk_widget_show_all (a_widget: POINTER) is
 		-- gtk_widget_show_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_show_all"
		}"
		end

	gtk_widget_show_now (a_widget: POINTER) is
 		-- gtk_widget_show_now
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_show_now"
		}"
		end

	gtk_widget_size_allocate (a_widget: POINTER; an_allocation: POINTER) is
 		-- gtk_widget_size_allocate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_size_allocate"
		}"
		end

	gtk_widget_size_request (a_widget: POINTER; a_requisition: POINTER) is
 		-- gtk_widget_size_request
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_size_request"
		}"
		end

	gtk_widget_style_attach (a_style: POINTER) is
 		-- gtk_widget_style_attach
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_style_attach"
		}"
		end

	gtk_widget_style_get (a_widget: POINTER; a_first_property_name: POINTER) is
 		-- gtk_widget_style_get (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_style_get"
		}"
		end

	gtk_widget_style_get_property (a_widget: POINTER; a_property_name: POINTER; a_value: POINTER) is
 		-- gtk_widget_style_get_property
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_style_get_property"
		}"
		end

	gtk_widget_style_get_valist (a_widget: POINTER; a_first_property_name: POINTER; a_var_args: POINTER) is
 		-- gtk_widget_style_get_valist
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_style_get_valist"
		}"
		end

	-- `hidden' function _gtk_widget_synthesize_crossing skipped.
	gtk_widget_thaw_child_notify (a_widget: POINTER) is
 		-- gtk_widget_thaw_child_notify
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_thaw_child_notify"
		}"
		end

	gtk_widget_translate_coordinates (a_src_widget: POINTER; a_dest_widget: POINTER; a_src_x: INTEGER; a_src_y: INTEGER; a_dest_x: POINTER; a_dest_y: POINTER): INTEGER is
 		-- gtk_widget_translate_coordinates
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_translate_coordinates"
		}"
		end

	gtk_widget_trigger_tooltip_query (a_widget: POINTER) is
 		-- gtk_widget_trigger_tooltip_query
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_trigger_tooltip_query"
		}"
		end

	gtk_widget_unmap (a_widget: POINTER) is
 		-- gtk_widget_unmap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_unmap"
		}"
		end

	gtk_widget_unparent (a_widget: POINTER) is
 		-- gtk_widget_unparent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_unparent"
		}"
		end

	gtk_widget_unrealize (a_widget: POINTER) is
 		-- gtk_widget_unrealize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_unrealize"
		}"
		end

	ubuntu_gtk_widget_set_has_grab (a_widget: POINTER; a_has_grab: INTEGER) is
 		-- ubuntu_gtk_widget_set_has_grab
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_gtk_widget_set_has_grab"
		}"
		end


end -- class GTKWIDGET_EXTERNALS
