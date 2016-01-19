-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSTYLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_border_copy (a_border: POINTER): POINTER is
 		-- gtk_border_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_copy"
		}"
		end

	gtk_border_free (a_border: POINTER) is
 		-- gtk_border_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_free"
		}"
		end

	gtk_border_get_type: like long_unsigned is
 		-- gtk_border_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_get_type()"
		}"
		end

	gtk_border_new: POINTER is
 		-- gtk_border_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_new()"
		}"
		end

	gtk_draw_insertion_cursor (a_widget: POINTER; a_drawable: POINTER; an_area: POINTER; a_location: POINTER; an_is_primary: INTEGER; a_direction: INTEGER; a_draw_arrow: INTEGER) is
 		-- gtk_draw_insertion_cursor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_insertion_cursor"
		}"
		end

	gtk_paint_arrow (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; an_arrow_type: INTEGER; a_fill: INTEGER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER) is
 		-- gtk_paint_arrow
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_arrow"
		}"
		end

	gtk_paint_box (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER) is
 		-- gtk_paint_box
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_box"
		}"
		end

	gtk_paint_box_gap (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER; a_gap_side: INTEGER; a_gap_x: INTEGER; a_gap_width: INTEGER) is
 		-- gtk_paint_box_gap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_box_gap"
		}"
		end

	gtk_paint_check (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER) is
 		-- gtk_paint_check
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_check"
		}"
		end

	gtk_paint_diamond (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER) is
 		-- gtk_paint_diamond
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_diamond"
		}"
		end

	gtk_paint_expander (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER; a_y: INTEGER; an_expander_style: INTEGER) is
 		-- gtk_paint_expander
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_expander"
		}"
		end

	gtk_paint_extension (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER; a_gap_side: INTEGER) is
 		-- gtk_paint_extension
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_extension"
		}"
		end

	gtk_paint_flat_box (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER) is
 		-- gtk_paint_flat_box
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_flat_box"
		}"
		end

	gtk_paint_focus (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER) is
 		-- gtk_paint_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_focus"
		}"
		end

	gtk_paint_handle (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER; an_orientation: INTEGER) is
 		-- gtk_paint_handle
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_handle"
		}"
		end

	gtk_paint_hline (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x1: INTEGER; a_x2: INTEGER; a_y: INTEGER) is
 		-- gtk_paint_hline
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_hline"
		}"
		end

	gtk_paint_layout (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_use_text: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER; a_y: INTEGER; a_layout: POINTER) is
 		-- gtk_paint_layout
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_layout"
		}"
		end

	gtk_paint_option (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER) is
 		-- gtk_paint_option
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_option"
		}"
		end

	gtk_paint_polygon (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_points: POINTER; a_n_points: INTEGER; a_fill: INTEGER) is
 		-- gtk_paint_polygon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_polygon"
		}"
		end

	gtk_paint_resize_grip (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; an_edge: INTEGER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER) is
 		-- gtk_paint_resize_grip
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_resize_grip"
		}"
		end

	gtk_paint_shadow (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER) is
 		-- gtk_paint_shadow
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_shadow"
		}"
		end

	gtk_paint_shadow_gap (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER; a_gap_side: INTEGER; a_gap_x: INTEGER; a_gap_width: INTEGER) is
 		-- gtk_paint_shadow_gap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_shadow_gap"
		}"
		end

	gtk_paint_slider (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER; an_orientation: INTEGER) is
 		-- gtk_paint_slider
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_slider"
		}"
		end

	gtk_paint_spinner (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_step: NATURAL; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER) is
 		-- gtk_paint_spinner
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_spinner"
		}"
		end

	gtk_paint_tab (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER) is
 		-- gtk_paint_tab
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_tab"
		}"
		end

	gtk_paint_vline (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_y1: INTEGER; a_y2: INTEGER; a_x: INTEGER) is
 		-- gtk_paint_vline
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_vline"
		}"
		end

	gtk_style_apply_default_background (a_style: POINTER; a_window: POINTER; a_set_bg: INTEGER; a_state_type: INTEGER; an_area: POINTER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER) is
 		-- gtk_style_apply_default_background
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_apply_default_background"
		}"
		end

	gtk_style_attach (a_style: POINTER; a_window: POINTER): POINTER is
 		-- gtk_style_attach
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_attach"
		}"
		end

	gtk_style_copy (a_style: POINTER): POINTER is
 		-- gtk_style_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_copy"
		}"
		end

	gtk_style_detach (a_style: POINTER) is
 		-- gtk_style_detach
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_detach"
		}"
		end

	gtk_style_get (a_style: POINTER; a_widget_type: like long_unsigned; a_first_property_name: POINTER) is
 		-- gtk_style_get (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_get"
		}"
		end

	gtk_style_get_style_property (a_style: POINTER; a_widget_type: like long_unsigned; a_property_name: POINTER; a_value: POINTER) is
 		-- gtk_style_get_style_property
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_get_style_property"
		}"
		end

	gtk_style_get_type: like long_unsigned is
 		-- gtk_style_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_get_type()"
		}"
		end

	gtk_style_get_valist (a_style: POINTER; a_widget_type: like long_unsigned; a_first_property_name: POINTER; a_var_args: POINTER) is
 		-- gtk_style_get_valist
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_get_valist"
		}"
		end

	-- `hidden' function _gtk_style_init_for_settings skipped.
	gtk_style_lookup_color (a_style: POINTER; a_color_name: POINTER; a_color: POINTER): INTEGER is
 		-- gtk_style_lookup_color
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_lookup_color"
		}"
		end

	gtk_style_lookup_icon_set (a_style: POINTER; a_stock_id: POINTER): POINTER is
 		-- gtk_style_lookup_icon_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_lookup_icon_set"
		}"
		end

	gtk_style_new: POINTER is
 		-- gtk_style_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_new()"
		}"
		end

	-- `hidden' function _gtk_style_peek_property_value skipped.
	gtk_style_render_icon (a_style: POINTER; a_source: POINTER; a_direction: INTEGER; a_state: INTEGER; a_size: INTEGER; a_widget: POINTER; a_detail: POINTER): POINTER is
 		-- gtk_style_render_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_render_icon"
		}"
		end

	gtk_style_set_background (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER) is
 		-- gtk_style_set_background
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_set_background"
		}"
		end

	-- `hidden' function _gtk_style_shade skipped.
	-- `hidden' function _gtk_widget_get_cursor_color skipped.
	-- `hidden' function _gtk_widget_get_cursor_gc skipped.

end -- class GTKSTYLE_EXTERNALS
