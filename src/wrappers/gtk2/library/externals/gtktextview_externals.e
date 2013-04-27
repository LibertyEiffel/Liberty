-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTVIEW_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_text_view_add_child_at_anchor (a_text_view: POINTER; a_child: POINTER; an_anchor: POINTER) is
 		-- gtk_text_view_add_child_at_anchor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_add_child_at_anchor"
		}"
		end

	gtk_text_view_add_child_in_window (a_text_view: POINTER; a_child: POINTER; a_which_window: INTEGER; a_xpos: INTEGER; a_ypos: INTEGER) is
 		-- gtk_text_view_add_child_in_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_add_child_in_window"
		}"
		end

	gtk_text_view_backward_display_line (a_text_view: POINTER; an_iter: POINTER): INTEGER is
 		-- gtk_text_view_backward_display_line
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_backward_display_line"
		}"
		end

	gtk_text_view_backward_display_line_start (a_text_view: POINTER; an_iter: POINTER): INTEGER is
 		-- gtk_text_view_backward_display_line_start
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_backward_display_line_start"
		}"
		end

	gtk_text_view_buffer_to_window_coords (a_text_view: POINTER; a_win: INTEGER; a_buffer_x: INTEGER; a_buffer_y: INTEGER; a_window_x: POINTER; a_window_y: POINTER) is
 		-- gtk_text_view_buffer_to_window_coords
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_buffer_to_window_coords"
		}"
		end

	gtk_text_view_forward_display_line (a_text_view: POINTER; an_iter: POINTER): INTEGER is
 		-- gtk_text_view_forward_display_line
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_forward_display_line"
		}"
		end

	gtk_text_view_forward_display_line_end (a_text_view: POINTER; an_iter: POINTER): INTEGER is
 		-- gtk_text_view_forward_display_line_end
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_forward_display_line_end"
		}"
		end

	gtk_text_view_get_accepts_tab (a_text_view: POINTER): INTEGER is
 		-- gtk_text_view_get_accepts_tab
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_accepts_tab"
		}"
		end

	gtk_text_view_get_border_window_size (a_text_view: POINTER; a_type: INTEGER): INTEGER is
 		-- gtk_text_view_get_border_window_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_border_window_size"
		}"
		end

	gtk_text_view_get_buffer (a_text_view: POINTER): POINTER is
 		-- gtk_text_view_get_buffer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_buffer"
		}"
		end

	gtk_text_view_get_cursor_visible (a_text_view: POINTER): INTEGER is
 		-- gtk_text_view_get_cursor_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_cursor_visible"
		}"
		end

	gtk_text_view_get_default_attributes (a_text_view: POINTER): POINTER is
 		-- gtk_text_view_get_default_attributes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_default_attributes"
		}"
		end

	gtk_text_view_get_editable (a_text_view: POINTER): INTEGER is
 		-- gtk_text_view_get_editable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_editable"
		}"
		end

	gtk_text_view_get_hadjustment (a_text_view: POINTER): POINTER is
 		-- gtk_text_view_get_hadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_hadjustment"
		}"
		end

	gtk_text_view_get_indent (a_text_view: POINTER): INTEGER is
 		-- gtk_text_view_get_indent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_indent"
		}"
		end

	gtk_text_view_get_iter_at_location (a_text_view: POINTER; an_iter: POINTER; a_x: INTEGER; a_y: INTEGER) is
 		-- gtk_text_view_get_iter_at_location
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_iter_at_location"
		}"
		end

	gtk_text_view_get_iter_at_position (a_text_view: POINTER; an_iter: POINTER; a_trailing: POINTER; a_x: INTEGER; a_y: INTEGER) is
 		-- gtk_text_view_get_iter_at_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_iter_at_position"
		}"
		end

	gtk_text_view_get_iter_location (a_text_view: POINTER; an_iter: POINTER; a_location: POINTER) is
 		-- gtk_text_view_get_iter_location
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_iter_location"
		}"
		end

	gtk_text_view_get_justification (a_text_view: POINTER): INTEGER is
 		-- gtk_text_view_get_justification
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_justification"
		}"
		end

	gtk_text_view_get_left_margin (a_text_view: POINTER): INTEGER is
 		-- gtk_text_view_get_left_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_left_margin"
		}"
		end

	gtk_text_view_get_line_at_y (a_text_view: POINTER; a_target_iter: POINTER; a_y: INTEGER; a_line_top: POINTER) is
 		-- gtk_text_view_get_line_at_y
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_line_at_y"
		}"
		end

	gtk_text_view_get_line_yrange (a_text_view: POINTER; an_iter: POINTER; a_y: POINTER; a_height: POINTER) is
 		-- gtk_text_view_get_line_yrange
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_line_yrange"
		}"
		end

	gtk_text_view_get_overwrite (a_text_view: POINTER): INTEGER is
 		-- gtk_text_view_get_overwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_overwrite"
		}"
		end

	gtk_text_view_get_pixels_above_lines (a_text_view: POINTER): INTEGER is
 		-- gtk_text_view_get_pixels_above_lines
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_pixels_above_lines"
		}"
		end

	gtk_text_view_get_pixels_below_lines (a_text_view: POINTER): INTEGER is
 		-- gtk_text_view_get_pixels_below_lines
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_pixels_below_lines"
		}"
		end

	gtk_text_view_get_pixels_inside_wrap (a_text_view: POINTER): INTEGER is
 		-- gtk_text_view_get_pixels_inside_wrap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_pixels_inside_wrap"
		}"
		end

	gtk_text_view_get_right_margin (a_text_view: POINTER): INTEGER is
 		-- gtk_text_view_get_right_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_right_margin"
		}"
		end

	gtk_text_view_get_tabs (a_text_view: POINTER): POINTER is
 		-- gtk_text_view_get_tabs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_tabs"
		}"
		end

	gtk_text_view_get_type: like long_unsigned is
 		-- gtk_text_view_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_type()"
		}"
		end

	gtk_text_view_get_vadjustment (a_text_view: POINTER): POINTER is
 		-- gtk_text_view_get_vadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_vadjustment"
		}"
		end

	gtk_text_view_get_visible_rect (a_text_view: POINTER; a_visible_rect: POINTER) is
 		-- gtk_text_view_get_visible_rect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_visible_rect"
		}"
		end

	gtk_text_view_get_window (a_text_view: POINTER; a_win: INTEGER): POINTER is
 		-- gtk_text_view_get_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_window"
		}"
		end

	gtk_text_view_get_window_type (a_text_view: POINTER; a_window: POINTER): INTEGER is
 		-- gtk_text_view_get_window_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_window_type"
		}"
		end

	gtk_text_view_get_wrap_mode (a_text_view: POINTER): INTEGER is
 		-- gtk_text_view_get_wrap_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_get_wrap_mode"
		}"
		end

	gtk_text_view_im_context_filter_keypress (a_text_view: POINTER; an_event: POINTER): INTEGER is
 		-- gtk_text_view_im_context_filter_keypress
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_im_context_filter_keypress"
		}"
		end

	gtk_text_view_move_child (a_text_view: POINTER; a_child: POINTER; a_xpos: INTEGER; a_ypos: INTEGER) is
 		-- gtk_text_view_move_child
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_move_child"
		}"
		end

	gtk_text_view_move_mark_onscreen (a_text_view: POINTER; a_mark: POINTER): INTEGER is
 		-- gtk_text_view_move_mark_onscreen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_move_mark_onscreen"
		}"
		end

	gtk_text_view_move_visually (a_text_view: POINTER; an_iter: POINTER; a_count: INTEGER): INTEGER is
 		-- gtk_text_view_move_visually
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_move_visually"
		}"
		end

	gtk_text_view_new: POINTER is
 		-- gtk_text_view_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_new()"
		}"
		end

	gtk_text_view_new_with_buffer (a_buffer: POINTER): POINTER is
 		-- gtk_text_view_new_with_buffer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_new_with_buffer"
		}"
		end

	gtk_text_view_place_cursor_onscreen (a_text_view: POINTER): INTEGER is
 		-- gtk_text_view_place_cursor_onscreen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_place_cursor_onscreen"
		}"
		end

	gtk_text_view_reset_im_context (a_text_view: POINTER) is
 		-- gtk_text_view_reset_im_context
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_reset_im_context"
		}"
		end

	gtk_text_view_scroll_mark_onscreen (a_text_view: POINTER; a_mark: POINTER) is
 		-- gtk_text_view_scroll_mark_onscreen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_scroll_mark_onscreen"
		}"
		end

	gtk_text_view_scroll_to_iter (a_text_view: POINTER; an_iter: POINTER; a_within_margin: REAL; an_use_align: INTEGER; a_xalign: REAL; a_yalign: REAL): INTEGER is
 		-- gtk_text_view_scroll_to_iter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_scroll_to_iter"
		}"
		end

	gtk_text_view_scroll_to_mark (a_text_view: POINTER; a_mark: POINTER; a_within_margin: REAL; an_use_align: INTEGER; a_xalign: REAL; a_yalign: REAL) is
 		-- gtk_text_view_scroll_to_mark
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_scroll_to_mark"
		}"
		end

	gtk_text_view_set_accepts_tab (a_text_view: POINTER; an_accepts_tab: INTEGER) is
 		-- gtk_text_view_set_accepts_tab
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_accepts_tab"
		}"
		end

	gtk_text_view_set_border_window_size (a_text_view: POINTER; a_type: INTEGER; a_size: INTEGER) is
 		-- gtk_text_view_set_border_window_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_border_window_size"
		}"
		end

	gtk_text_view_set_buffer (a_text_view: POINTER; a_buffer: POINTER) is
 		-- gtk_text_view_set_buffer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_buffer"
		}"
		end

	gtk_text_view_set_cursor_visible (a_text_view: POINTER; a_setting: INTEGER) is
 		-- gtk_text_view_set_cursor_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_cursor_visible"
		}"
		end

	gtk_text_view_set_editable (a_text_view: POINTER; a_setting: INTEGER) is
 		-- gtk_text_view_set_editable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_editable"
		}"
		end

	gtk_text_view_set_indent (a_text_view: POINTER; an_indent: INTEGER) is
 		-- gtk_text_view_set_indent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_indent"
		}"
		end

	gtk_text_view_set_justification (a_text_view: POINTER; a_justification: INTEGER) is
 		-- gtk_text_view_set_justification
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_justification"
		}"
		end

	gtk_text_view_set_left_margin (a_text_view: POINTER; a_left_margin: INTEGER) is
 		-- gtk_text_view_set_left_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_left_margin"
		}"
		end

	gtk_text_view_set_overwrite (a_text_view: POINTER; an_overwrite: INTEGER) is
 		-- gtk_text_view_set_overwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_overwrite"
		}"
		end

	gtk_text_view_set_pixels_above_lines (a_text_view: POINTER; a_pixels_above_lines: INTEGER) is
 		-- gtk_text_view_set_pixels_above_lines
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_pixels_above_lines"
		}"
		end

	gtk_text_view_set_pixels_below_lines (a_text_view: POINTER; a_pixels_below_lines: INTEGER) is
 		-- gtk_text_view_set_pixels_below_lines
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_pixels_below_lines"
		}"
		end

	gtk_text_view_set_pixels_inside_wrap (a_text_view: POINTER; a_pixels_inside_wrap: INTEGER) is
 		-- gtk_text_view_set_pixels_inside_wrap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_pixels_inside_wrap"
		}"
		end

	gtk_text_view_set_right_margin (a_text_view: POINTER; a_right_margin: INTEGER) is
 		-- gtk_text_view_set_right_margin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_right_margin"
		}"
		end

	gtk_text_view_set_tabs (a_text_view: POINTER; a_tabs: POINTER) is
 		-- gtk_text_view_set_tabs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_tabs"
		}"
		end

	gtk_text_view_set_wrap_mode (a_text_view: POINTER; a_wrap_mode: INTEGER) is
 		-- gtk_text_view_set_wrap_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_set_wrap_mode"
		}"
		end

	gtk_text_view_starts_display_line (a_text_view: POINTER; an_iter: POINTER): INTEGER is
 		-- gtk_text_view_starts_display_line
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_starts_display_line"
		}"
		end

	gtk_text_view_window_to_buffer_coords (a_text_view: POINTER; a_win: INTEGER; a_window_x: INTEGER; a_window_y: INTEGER; a_buffer_x: POINTER; a_buffer_y: POINTER) is
 		-- gtk_text_view_window_to_buffer_coords
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_view_window_to_buffer_coords"
		}"
		end


end -- class GTKTEXTVIEW_EXTERNALS
