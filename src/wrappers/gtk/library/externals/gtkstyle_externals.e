-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSTYLE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_paint_spinner (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_step: NATURAL_32; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_spinner (node at line 122)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_spinner"
		}"
		end

	gtk_draw_hline (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_x1: INTEGER_32; a_x2: INTEGER_32; a_y: INTEGER_32) is
 		-- gtk_draw_hline (node at line 341)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_hline"
		}"
		end

	-- `hidden' function _gtk_widget_get_cursor_gc skipped.
	gtk_style_get (a_style: POINTER; a_widget_type: NATURAL_32; a_first_property_name: POINTER) is
 		-- gtk_style_get (variadic call)  (node at line 1693)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_get"
		}"
		end

	gtk_border_new: POINTER is
 		-- gtk_border_new (node at line 2335)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_new()"
		}"
		end

	gtk_style_get_valist (a_style: POINTER; a_widget_type: NATURAL_32; a_first_property_name: POINTER; a_var_args: POINTER) is
 		-- gtk_style_get_valist (node at line 2764)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_get_valist"
		}"
		end

	gtk_paint_polygon (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_points: POINTER; a_n_points: INTEGER_32; a_fill: INTEGER_32) is
 		-- gtk_paint_polygon (node at line 3026)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_polygon"
		}"
		end

	gtk_style_apply_default_background (a_style: POINTER; a_window: POINTER; a_set_bg: INTEGER_32; a_state_type: INTEGER; an_area: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_style_apply_default_background (node at line 3197)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_apply_default_background"
		}"
		end

	-- `hidden' function _gtk_style_init_for_settings skipped.
	gtk_paint_vline (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_y1: INTEGER_32; a_y2: INTEGER_32; a_x: INTEGER_32) is
 		-- gtk_paint_vline (node at line 4146)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_vline"
		}"
		end

	gtk_paint_diamond (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_diamond (node at line 5563)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_diamond"
		}"
		end

	gtk_paint_arrow (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; an_arrow_type: INTEGER; a_fill: INTEGER_32; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_arrow (node at line 5595)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_arrow"
		}"
		end

	gtk_paint_shadow_gap (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32; a_gap_side: INTEGER; a_gap_x: INTEGER_32; a_gap_width: INTEGER_32) is
 		-- gtk_paint_shadow_gap (node at line 6822)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_shadow_gap"
		}"
		end

	gtk_paint_shadow (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_shadow (node at line 6976)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_shadow"
		}"
		end

	gtk_draw_box (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_draw_box (node at line 7217)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_box"
		}"
		end

	gtk_draw_layout (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_use_text: INTEGER_32; a_x: INTEGER_32; a_y: INTEGER_32; a_layout: POINTER) is
 		-- gtk_draw_layout (node at line 7229)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_layout"
		}"
		end

	gtk_border_copy (a_border: POINTER): POINTER is
 		-- gtk_border_copy (node at line 7339)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_copy"
		}"
		end

	gtk_style_set_font (a_style: POINTER; a_font: POINTER) is
 		-- gtk_style_set_font (node at line 7514)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_set_font"
		}"
		end

	gtk_style_unref (a_style: POINTER) is
 		-- gtk_style_unref (node at line 10892)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_unref"
		}"
		end

	gtk_draw_shadow (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_draw_shadow (node at line 11853)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_shadow"
		}"
		end

	gtk_style_copy (a_style: POINTER): POINTER is
 		-- gtk_style_copy (node at line 12152)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_copy"
		}"
		end

	gtk_paint_check (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_check (node at line 12339)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_check"
		}"
		end

	gtk_paint_box_gap (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32; a_gap_side: INTEGER; a_gap_x: INTEGER_32; a_gap_width: INTEGER_32) is
 		-- gtk_paint_box_gap (node at line 12363)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_box_gap"
		}"
		end

	gtk_paint_string (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_string: POINTER) is
 		-- gtk_paint_string (node at line 12617)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_string"
		}"
		end

	gtk_paint_hline (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x1: INTEGER_32; a_x2: INTEGER_32; a_y: INTEGER_32) is
 		-- gtk_paint_hline (node at line 14256)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_hline"
		}"
		end

	gtk_draw_diamond (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_draw_diamond (node at line 15674)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_diamond"
		}"
		end

	gtk_paint_expander (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; an_expander_style: INTEGER) is
 		-- gtk_paint_expander (node at line 15785)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_expander"
		}"
		end

	gtk_draw_tab (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_draw_tab (node at line 15885)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_tab"
		}"
		end

	gtk_style_lookup_color (a_style: POINTER; a_color_name: POINTER; a_color: POINTER): INTEGER_32 is
 		-- gtk_style_lookup_color (node at line 16347)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_lookup_color"
		}"
		end

	gtk_draw_focus (a_style: POINTER; a_window: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_draw_focus (node at line 16502)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_focus"
		}"
		end

	gtk_draw_box_gap (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32; a_gap_side: INTEGER; a_gap_x: INTEGER_32; a_gap_width: INTEGER_32) is
 		-- gtk_draw_box_gap (node at line 16954)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_box_gap"
		}"
		end

	gtk_draw_string (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; a_string: POINTER) is
 		-- gtk_draw_string (node at line 17130)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_string"
		}"
		end

	gtk_draw_polygon (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; a_points: POINTER; a_npoints: INTEGER_32; a_fill: INTEGER_32) is
 		-- gtk_draw_polygon (node at line 17951)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_polygon"
		}"
		end

	gtk_paint_box (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_box (node at line 18265)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_box"
		}"
		end

	gtk_paint_option (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_option (node at line 18416)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_option"
		}"
		end

	gtk_draw_flat_box (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_draw_flat_box (node at line 18710)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_flat_box"
		}"
		end

	gtk_style_set_background (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER) is
 		-- gtk_style_set_background (node at line 18831)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_set_background"
		}"
		end

	gtk_style_render_icon (a_style: POINTER; a_source: POINTER; a_direction: INTEGER; a_state: INTEGER; a_size: INTEGER; a_widget: POINTER; a_detail: POINTER): POINTER is
 		-- gtk_style_render_icon (node at line 19180)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_render_icon"
		}"
		end

	gtk_paint_extension (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32; a_gap_side: INTEGER) is
 		-- gtk_paint_extension (node at line 20118)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_extension"
		}"
		end

	gtk_style_detach (a_style: POINTER) is
 		-- gtk_style_detach (node at line 20293)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_detach"
		}"
		end

	gtk_style_new: POINTER is
 		-- gtk_style_new (node at line 20387)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_new()"
		}"
		end

	gtk_draw_check (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_draw_check (node at line 21166)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_check"
		}"
		end

	gtk_style_get_font (a_style: POINTER): POINTER is
 		-- gtk_style_get_font (node at line 21233)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_get_font"
		}"
		end

	gtk_draw_handle (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32; an_orientation: INTEGER) is
 		-- gtk_draw_handle (node at line 21908)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_handle"
		}"
		end

	gtk_border_free (a_border: POINTER) is
 		-- gtk_border_free (node at line 22744)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_free"
		}"
		end

	gtk_draw_option (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_draw_option (node at line 22751)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_option"
		}"
		end

	gtk_draw_insertion_cursor (a_widget: POINTER; a_drawable: POINTER; an_area: POINTER; a_location: POINTER; an_is_primary: INTEGER_32; a_direction: INTEGER; a_draw_arrow: INTEGER_32) is
 		-- gtk_draw_insertion_cursor (node at line 23729)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_insertion_cursor"
		}"
		end

	gtk_style_lookup_icon_set (a_style: POINTER; a_stock_id: POINTER): POINTER is
 		-- gtk_style_lookup_icon_set (node at line 25446)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_lookup_icon_set"
		}"
		end

	-- `hidden' function _gtk_widget_get_cursor_color skipped.
	gtk_style_get_style_property (a_style: POINTER; a_widget_type: NATURAL_32; a_property_name: POINTER; a_value: POINTER) is
 		-- gtk_style_get_style_property (node at line 26919)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_get_style_property"
		}"
		end

	gtk_draw_resize_grip (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_edge: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_draw_resize_grip (node at line 27091)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_resize_grip"
		}"
		end

	gtk_draw_extension (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32; a_gap_side: INTEGER) is
 		-- gtk_draw_extension (node at line 28305)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_extension"
		}"
		end

	gtk_paint_focus (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_focus (node at line 29092)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_focus"
		}"
		end

	gtk_draw_vline (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_y1: INTEGER_32; a_y2: INTEGER_32; a_x: INTEGER_32) is
 		-- gtk_draw_vline (node at line 29158)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_vline"
		}"
		end

	gtk_border_get_type: NATURAL_32 is
 		-- gtk_border_get_type (node at line 29581)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_border_get_type()"
		}"
		end

	-- `hidden' function _gtk_style_shade skipped.
	gtk_paint_layout (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_use_text: INTEGER_32; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_layout: POINTER) is
 		-- gtk_paint_layout (node at line 30028)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_layout"
		}"
		end

	gtk_draw_arrow (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_arrow_type: INTEGER; a_fill: INTEGER_32; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_draw_arrow (node at line 30453)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_arrow"
		}"
		end

	gtk_style_ref (a_style: POINTER): POINTER is
 		-- gtk_style_ref (node at line 30489)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_ref"
		}"
		end

	gtk_paint_slider (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32; an_orientation: INTEGER) is
 		-- gtk_paint_slider (node at line 30688)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_slider"
		}"
		end

	gtk_paint_resize_grip (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; an_edge: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_resize_grip (node at line 30736)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_resize_grip"
		}"
		end

	gtk_paint_tab (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_tab (node at line 30788)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_tab"
		}"
		end

	-- `hidden' function _gtk_style_peek_property_value skipped.
	gtk_draw_shadow_gap (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32; a_gap_side: INTEGER; a_gap_x: INTEGER_32; a_gap_width: INTEGER_32) is
 		-- gtk_draw_shadow_gap (node at line 31759)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_shadow_gap"
		}"
		end

	gtk_paint_handle (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32; an_orientation: INTEGER) is
 		-- gtk_paint_handle (node at line 32293)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_handle"
		}"
		end

	gtk_draw_expander (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; an_expander_style: INTEGER) is
 		-- gtk_draw_expander (node at line 34581)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_expander"
		}"
		end

	gtk_style_attach (a_style: POINTER; a_window: POINTER): POINTER is
 		-- gtk_style_attach (node at line 34790)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_attach"
		}"
		end

	gtk_draw_slider (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32; an_orientation: INTEGER) is
 		-- gtk_draw_slider (node at line 34808)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_draw_slider"
		}"
		end

	gtk_paint_flat_box (a_style: POINTER; a_window: POINTER; a_state_type: INTEGER; a_shadow_type: INTEGER; an_area: POINTER; a_widget: POINTER; a_detail: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_paint_flat_box (node at line 35890)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_paint_flat_box"
		}"
		end

	gtk_style_get_type: NATURAL_32 is
 		-- gtk_style_get_type (node at line 37528)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_style_get_type()"
		}"
		end


end -- class GTKSTYLE_EXTERNALS
