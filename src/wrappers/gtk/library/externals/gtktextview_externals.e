-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTVIEW_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_text_view_set_overwrite (a_text_view: POINTER; an_overwrite: INTEGER_32) is
 		-- gtk_text_view_set_overwrite (node at line 239)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_overwrite"
		}"
		end

	gtk_text_view_get_window_type (a_text_view: POINTER; a_window: POINTER): INTEGER is
 		-- gtk_text_view_get_window_type (node at line 1597)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_window_type"
		}"
		end

	gtk_text_view_get_line_at_y (a_text_view: POINTER; a_target_iter: POINTER; a_y: INTEGER_32; a_line_top: POINTER) is
 		-- gtk_text_view_get_line_at_y (node at line 2234)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_line_at_y"
		}"
		end

	gtk_text_view_add_child_at_anchor (a_text_view: POINTER; a_child: POINTER; an_anchor: POINTER) is
 		-- gtk_text_view_add_child_at_anchor (node at line 3241)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_add_child_at_anchor"
		}"
		end

	gtk_text_view_get_editable (a_text_view: POINTER): INTEGER_32 is
 		-- gtk_text_view_get_editable (node at line 3272)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_editable"
		}"
		end

	gtk_text_view_set_indent (a_text_view: POINTER; an_indent: INTEGER_32) is
 		-- gtk_text_view_set_indent (node at line 3978)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_indent"
		}"
		end

	gtk_text_view_buffer_to_window_coords (a_text_view: POINTER; a_win: INTEGER; a_buffer_x: INTEGER_32; a_buffer_y: INTEGER_32; a_window_x: POINTER; a_window_y: POINTER) is
 		-- gtk_text_view_buffer_to_window_coords (node at line 4557)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_buffer_to_window_coords"
		}"
		end

	gtk_text_view_get_tabs (a_text_view: POINTER): POINTER is
 		-- gtk_text_view_get_tabs (node at line 5650)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_tabs"
		}"
		end

	gtk_text_view_scroll_mark_onscreen (a_text_view: POINTER; a_mark: POINTER) is
 		-- gtk_text_view_scroll_mark_onscreen (node at line 6144)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_scroll_mark_onscreen"
		}"
		end

	gtk_text_view_get_pixels_inside_wrap (a_text_view: POINTER): INTEGER_32 is
 		-- gtk_text_view_get_pixels_inside_wrap (node at line 8059)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_pixels_inside_wrap"
		}"
		end

	gtk_text_view_get_default_attributes (a_text_view: POINTER): POINTER is
 		-- gtk_text_view_get_default_attributes (node at line 8363)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_default_attributes"
		}"
		end

	gtk_text_view_get_iter_location (a_text_view: POINTER; an_iter: POINTER; a_location: POINTER) is
 		-- gtk_text_view_get_iter_location (node at line 8982)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_iter_location"
		}"
		end

	gtk_text_view_get_buffer (a_text_view: POINTER): POINTER is
 		-- gtk_text_view_get_buffer (node at line 9025)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_buffer"
		}"
		end

	gtk_text_view_set_pixels_inside_wrap (a_text_view: POINTER; a_pixels_inside_wrap: INTEGER_32) is
 		-- gtk_text_view_set_pixels_inside_wrap (node at line 10576)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_pixels_inside_wrap"
		}"
		end

	gtk_text_view_get_cursor_visible (a_text_view: POINTER): INTEGER_32 is
 		-- gtk_text_view_get_cursor_visible (node at line 11160)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_cursor_visible"
		}"
		end

	gtk_text_view_scroll_to_iter (a_text_view: POINTER; an_iter: POINTER; a_within_margin: REAL_64; an_use_align: INTEGER_32; a_xalign: REAL_64; a_yalign: REAL_64): INTEGER_32 is
 		-- gtk_text_view_scroll_to_iter (node at line 11722)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_scroll_to_iter"
		}"
		end

	gtk_text_view_get_pixels_above_lines (a_text_view: POINTER): INTEGER_32 is
 		-- gtk_text_view_get_pixels_above_lines (node at line 12328)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_pixels_above_lines"
		}"
		end

	gtk_text_view_move_mark_onscreen (a_text_view: POINTER; a_mark: POINTER): INTEGER_32 is
 		-- gtk_text_view_move_mark_onscreen (node at line 12992)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_move_mark_onscreen"
		}"
		end

	gtk_text_view_get_overwrite (a_text_view: POINTER): INTEGER_32 is
 		-- gtk_text_view_get_overwrite (node at line 13216)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_overwrite"
		}"
		end

	gtk_text_view_forward_display_line_end (a_text_view: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_view_forward_display_line_end (node at line 13518)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_forward_display_line_end"
		}"
		end

	gtk_text_view_get_accepts_tab (a_text_view: POINTER): INTEGER_32 is
 		-- gtk_text_view_get_accepts_tab (node at line 13597)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_accepts_tab"
		}"
		end

	gtk_text_view_set_accepts_tab (a_text_view: POINTER; an_accepts_tab: INTEGER_32) is
 		-- gtk_text_view_set_accepts_tab (node at line 13852)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_accepts_tab"
		}"
		end

	gtk_text_view_set_right_margin (a_text_view: POINTER; a_right_margin: INTEGER_32) is
 		-- gtk_text_view_set_right_margin (node at line 14915)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_right_margin"
		}"
		end

	gtk_text_view_backward_display_line_start (a_text_view: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_view_backward_display_line_start (node at line 17802)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_backward_display_line_start"
		}"
		end

	gtk_text_view_get_right_margin (a_text_view: POINTER): INTEGER_32 is
 		-- gtk_text_view_get_right_margin (node at line 18946)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_right_margin"
		}"
		end

	gtk_text_view_set_cursor_visible (a_text_view: POINTER; a_setting: INTEGER_32) is
 		-- gtk_text_view_set_cursor_visible (node at line 19411)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_cursor_visible"
		}"
		end

	gtk_text_view_set_tabs (a_text_view: POINTER; a_tabs: POINTER) is
 		-- gtk_text_view_set_tabs (node at line 20199)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_tabs"
		}"
		end

	gtk_text_view_get_visible_rect (a_text_view: POINTER; a_visible_rect: POINTER) is
 		-- gtk_text_view_get_visible_rect (node at line 20258)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_visible_rect"
		}"
		end

	gtk_text_view_set_left_margin (a_text_view: POINTER; a_left_margin: INTEGER_32) is
 		-- gtk_text_view_set_left_margin (node at line 20490)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_left_margin"
		}"
		end

	gtk_text_view_backward_display_line (a_text_view: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_view_backward_display_line (node at line 20702)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_backward_display_line"
		}"
		end

	gtk_text_view_get_indent (a_text_view: POINTER): INTEGER_32 is
 		-- gtk_text_view_get_indent (node at line 20974)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_indent"
		}"
		end

	gtk_text_view_get_window (a_text_view: POINTER; a_win: INTEGER): POINTER is
 		-- gtk_text_view_get_window (node at line 22152)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_window"
		}"
		end

	gtk_text_view_set_pixels_above_lines (a_text_view: POINTER; a_pixels_above_lines: INTEGER_32) is
 		-- gtk_text_view_set_pixels_above_lines (node at line 22663)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_pixels_above_lines"
		}"
		end

	gtk_text_view_get_justification (a_text_view: POINTER): INTEGER is
 		-- gtk_text_view_get_justification (node at line 22732)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_justification"
		}"
		end

	gtk_text_view_get_pixels_below_lines (a_text_view: POINTER): INTEGER_32 is
 		-- gtk_text_view_get_pixels_below_lines (node at line 23053)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_pixels_below_lines"
		}"
		end

	gtk_text_view_set_pixels_below_lines (a_text_view: POINTER; a_pixels_below_lines: INTEGER_32) is
 		-- gtk_text_view_set_pixels_below_lines (node at line 25117)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_pixels_below_lines"
		}"
		end

	gtk_text_view_window_to_buffer_coords (a_text_view: POINTER; a_win: INTEGER; a_window_x: INTEGER_32; a_window_y: INTEGER_32; a_buffer_x: POINTER; a_buffer_y: POINTER) is
 		-- gtk_text_view_window_to_buffer_coords (node at line 25462)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_window_to_buffer_coords"
		}"
		end

	gtk_text_view_add_child_in_window (a_text_view: POINTER; a_child: POINTER; a_which_window: INTEGER; a_xpos: INTEGER_32; a_ypos: INTEGER_32) is
 		-- gtk_text_view_add_child_in_window (node at line 25685)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_add_child_in_window"
		}"
		end

	gtk_text_view_get_type: NATURAL_32 is
 		-- gtk_text_view_get_type (node at line 27805)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_type()"
		}"
		end

	gtk_text_view_new: POINTER is
 		-- gtk_text_view_new (node at line 28186)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_new()"
		}"
		end

	gtk_text_view_set_justification (a_text_view: POINTER; a_justification: INTEGER) is
 		-- gtk_text_view_set_justification (node at line 28333)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_justification"
		}"
		end

	gtk_text_view_set_buffer (a_text_view: POINTER; a_buffer: POINTER) is
 		-- gtk_text_view_set_buffer (node at line 31093)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_buffer"
		}"
		end

	gtk_text_view_scroll_to_mark (a_text_view: POINTER; a_mark: POINTER; a_within_margin: REAL_64; an_use_align: INTEGER_32; a_xalign: REAL_64; a_yalign: REAL_64) is
 		-- gtk_text_view_scroll_to_mark (node at line 31130)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_scroll_to_mark"
		}"
		end

	gtk_text_view_get_iter_at_location (a_text_view: POINTER; an_iter: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- gtk_text_view_get_iter_at_location (node at line 31723)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_iter_at_location"
		}"
		end

	gtk_text_view_set_editable (a_text_view: POINTER; a_setting: INTEGER_32) is
 		-- gtk_text_view_set_editable (node at line 32188)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_editable"
		}"
		end

	gtk_text_view_get_line_yrange (a_text_view: POINTER; an_iter: POINTER; a_y: POINTER; a_height: POINTER) is
 		-- gtk_text_view_get_line_yrange (node at line 32208)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_line_yrange"
		}"
		end

	gtk_text_view_move_visually (a_text_view: POINTER; an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_view_move_visually (node at line 32326)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_move_visually"
		}"
		end

	gtk_text_view_get_wrap_mode (a_text_view: POINTER): INTEGER is
 		-- gtk_text_view_get_wrap_mode (node at line 32352)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_wrap_mode"
		}"
		end

	gtk_text_view_get_left_margin (a_text_view: POINTER): INTEGER_32 is
 		-- gtk_text_view_get_left_margin (node at line 33039)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_left_margin"
		}"
		end

	gtk_text_view_get_iter_at_position (a_text_view: POINTER; an_iter: POINTER; a_trailing: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- gtk_text_view_get_iter_at_position (node at line 33693)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_iter_at_position"
		}"
		end

	gtk_text_view_place_cursor_onscreen (a_text_view: POINTER): INTEGER_32 is
 		-- gtk_text_view_place_cursor_onscreen (node at line 33765)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_place_cursor_onscreen"
		}"
		end

	gtk_text_view_move_child (a_text_view: POINTER; a_child: POINTER; a_xpos: INTEGER_32; a_ypos: INTEGER_32) is
 		-- gtk_text_view_move_child (node at line 34730)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_move_child"
		}"
		end

	gtk_text_view_get_border_window_size (a_text_view: POINTER; a_type: INTEGER): INTEGER_32 is
 		-- gtk_text_view_get_border_window_size (node at line 35026)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_border_window_size"
		}"
		end

	gtk_text_view_starts_display_line (a_text_view: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_view_starts_display_line (node at line 35073)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_starts_display_line"
		}"
		end

	gtk_text_view_set_wrap_mode (a_text_view: POINTER; a_wrap_mode: INTEGER) is
 		-- gtk_text_view_set_wrap_mode (node at line 35920)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_wrap_mode"
		}"
		end

	gtk_text_view_forward_display_line (a_text_view: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_view_forward_display_line (node at line 35948)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_forward_display_line"
		}"
		end

	gtk_text_view_set_border_window_size (a_text_view: POINTER; a_type: INTEGER; a_size: INTEGER_32) is
 		-- gtk_text_view_set_border_window_size (node at line 37165)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_border_window_size"
		}"
		end

	gtk_text_view_new_with_buffer (a_buffer: POINTER): POINTER is
 		-- gtk_text_view_new_with_buffer (node at line 37525)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_new_with_buffer"
		}"
		end


end -- class GTKTEXTVIEW_EXTERNALS
