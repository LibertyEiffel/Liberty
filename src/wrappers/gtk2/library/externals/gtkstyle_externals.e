-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSTYLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_paint_spinner (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_step: NATURAL_32; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_spinner (node at line 115)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_spinner"
		}"
		end

	-- `hidden' function _gtk_widget_get_cursor_gc skipped.
	gtk_style_get (a_style: POINTER; a_widget_type: NATURAL_64; a_first_property_name: POINTER) is
 		-- gtk_style_get (variadic call)  (node at line 1617)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_get"
		}"
		end

	gtk_border_new: POINTER is
 		-- gtk_border_new (node at line 2225)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_new()"
		}"
		end

	gtk_style_get_valist (a_style: POINTER; a_widget_type: NATURAL_64; a_first_property_name: POINTER; a_var_args: POINTER) is
 		-- gtk_style_get_valist (node at line 2714)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_get_valist"
		}"
		end

	gtk_paint_polygon (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_points: POINTER; a_n_points: INTEGER_32; a_fill: INTEGER_32) is
 		-- gtk_paint_polygon (node at line 3100)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_polygon"
		}"
		end

	gtk_style_apply_default_background (a_style: POINTER; a_window: POINTER; a_set_bg: INTEGER_32; a_state_type: INTEGER; an_area: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_style_apply_default_background (node at line 3273)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_apply_default_background"
		}"
		end

	-- `hidden' function _gtk_style_init_for_settings skipped.
	gtk_paint_vline (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_y1: INTEGER_32; a_y2: INTEGER_32; a_x: INTEGER_32) is
 		-- gtk_paint_vline (node at line 4331)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_vline"
		}"
		end

	gtk_paint_diamond (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_diamond (node at line 5831)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_diamond"
		}"
		end

	gtk_paint_arrow (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; an_arrow_type: INTEGER; a_fill: INTEGER_32; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_arrow (node at line 5866)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_arrow"
		}"
		end

	gtk_paint_shadow_gap (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32; a_gap_side: INTEGER; a_gap_x: INTEGER_32; a_gap_width: INTEGER_32) is
 		-- gtk_paint_shadow_gap (node at line 7446)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_shadow_gap"
		}"
		end

	gtk_paint_shadow (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_shadow (node at line 7634)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_shadow"
		}"
		end

	gtk_border_copy (a_border: POINTER): POINTER is
 		-- gtk_border_copy (node at line 12937)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_copy"
		}"
		end

	gtk_style_copy (a_style: POINTER): POINTER is
 		-- gtk_style_copy (node at line 13240)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_copy"
		}"
		end

	gtk_paint_check (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_check (node at line 13427)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_check"
		}"
		end

	gtk_paint_box_gap (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32; a_gap_side: INTEGER; a_gap_x: INTEGER_32; a_gap_width: INTEGER_32) is
 		-- gtk_paint_box_gap (node at line 13459)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_box_gap"
		}"
		end

	gtk_paint_hline (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x1: INTEGER_32; a_x2: INTEGER_32; a_y: INTEGER_32) is
 		-- gtk_paint_hline (node at line 15390)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_hline"
		}"
		end

	gtk_paint_slider (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32; an_orientation: INTEGER) is
 		-- gtk_paint_slider (node at line 15513)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_slider"
		}"
		end

	gtk_style_lookup_icon_set (a_style: POINTER; a_stock_id: POINTER): POINTER is
 		-- gtk_style_lookup_icon_set (node at line 16269)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_lookup_icon_set"
		}"
		end

	gtk_paint_expander (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; an_expander_style: INTEGER) is
 		-- gtk_paint_expander (node at line 17121)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_expander"
		}"
		end

	gtk_style_lookup_color (a_style: POINTER; a_color_name: POINTER; a_color: POINTER): INTEGER_32 is
 		-- gtk_style_lookup_color (node at line 17788)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_lookup_color"
		}"
		end

	gtk_paint_option (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_option (node at line 20089)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_option"
		}"
		end

	gtk_style_set_background (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER) is
 		-- gtk_style_set_background (node at line 20558)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_set_background"
		}"
		end

	gtk_style_render_icon (a_style: POINTER; a_source: POINTER; a_direction: INTEGER; a_state: INTEGER; a_size: INTEGER; a_widget: POINTER; a_detail: POINTER): POINTER is
 		-- gtk_style_render_icon (node at line 21006)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_render_icon"
		}"
		end

	gtk_style_detach (a_style: POINTER) is
 		-- gtk_style_detach (node at line 22381)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_detach"
		}"
		end

	gtk_style_new: POINTER is
 		-- gtk_style_new (node at line 22476)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_new()"
		}"
		end

	gtk_paint_box (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_box (node at line 24962)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_box"
		}"
		end

	gtk_border_free (a_border: POINTER) is
 		-- gtk_border_free (node at line 25039)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_free"
		}"
		end

	gtk_draw_insertion_cursor (a_widget: POINTER; a_drawable: POINTER; an_area: POINTER; a_location: POINTER; an_is_primary: INTEGER_32; a_direction: INTEGER; a_draw_arrow: INTEGER_32) is
 		-- gtk_draw_insertion_cursor (node at line 27921)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_insertion_cursor"
		}"
		end

	-- `hidden' function _gtk_widget_get_cursor_color skipped.
	gtk_style_get_style_property (a_style: POINTER; a_widget_type: NATURAL_64; a_property_name: POINTER; a_value: POINTER) is
 		-- gtk_style_get_style_property (node at line 29709)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_get_style_property"
		}"
		end

	gtk_paint_focus (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_focus (node at line 32112)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_focus"
		}"
		end

	gtk_border_get_type: NATURAL_64 is
 		-- gtk_border_get_type (node at line 32627)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_get_type()"
		}"
		end

	-- `hidden' function _gtk_style_shade skipped.
	gtk_paint_layout (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_use_text: INTEGER_32; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_layout: POINTER) is
 		-- gtk_paint_layout (node at line 33116)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_layout"
		}"
		end

	gtk_paint_resize_grip (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; an_edge: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_resize_grip (node at line 33962)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_resize_grip"
		}"
		end

	gtk_paint_tab (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_tab (node at line 34008)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_tab"
		}"
		end

	gtk_paint_extension (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32; a_gap_side: INTEGER) is
 		-- gtk_paint_extension (node at line 34238)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_extension"
		}"
		end

	-- `hidden' function _gtk_style_peek_property_value skipped.
	gtk_paint_handle (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32; an_orientation: INTEGER) is
 		-- gtk_paint_handle (node at line 35668)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_handle"
		}"
		end

	gtk_style_attach (a_style: POINTER; a_window: POINTER): POINTER is
 		-- gtk_style_attach (node at line 38367)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_attach"
		}"
		end

	gtk_paint_flat_box (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_flat_box (node at line 39474)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_flat_box"
		}"
		end

	gtk_style_get_type: NATURAL_64 is
 		-- gtk_style_get_type (node at line 41217)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_get_type()"
		}"
		end


end -- class GTKSTYLE_EXTERNALS
