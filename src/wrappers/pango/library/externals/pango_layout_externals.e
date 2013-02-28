-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_LAYOUT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_layout_set_attributes (a_layout: POINTER; an_attrs: POINTER) is
 		-- pango_layout_set_attributes (node at line 124)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_set_attributes"
		}"
		end

	pango_layout_xy_to_index (a_layout: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; an_index: POINTER; a_trailing: POINTER): INTEGER_32 is
 		-- pango_layout_xy_to_index (node at line 377)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_xy_to_index"
		}"
		end

	pango_layout_set_wrap (a_layout: POINTER; a_wrap: INTEGER) is
 		-- pango_layout_set_wrap (node at line 600)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_set_wrap"
		}"
		end

	pango_layout_get_line_count (a_layout: POINTER): INTEGER_32 is
 		-- pango_layout_get_line_count (node at line 778)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_line_count"
		}"
		end

	pango_layout_set_width (a_layout: POINTER; a_width: INTEGER_32) is
 		-- pango_layout_set_width (node at line 786)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_set_width"
		}"
		end

	pango_layout_move_cursor_visually (a_layout: POINTER; a_strong: INTEGER_32; an_old_index: INTEGER_32; an_old_trailing: INTEGER_32; a_direction: INTEGER_32; a_new_index: POINTER; a_new_trailing: POINTER) is
 		-- pango_layout_move_cursor_visually (node at line 869)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_move_cursor_visually"
		}"
		end

	pango_layout_get_ellipsize (a_layout: POINTER): INTEGER is
 		-- pango_layout_get_ellipsize (node at line 983)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_ellipsize"
		}"
		end

	pango_layout_line_get_extents (a_line: POINTER; an_ink_rect: POINTER; a_logical_rect: POINTER) is
 		-- pango_layout_line_get_extents (node at line 1076)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_get_extents"
		}"
		end

	pango_layout_get_context (a_layout: POINTER): POINTER is
 		-- pango_layout_get_context (node at line 1117)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_context"
		}"
		end

	pango_layout_set_auto_dir (a_layout: POINTER; an_auto_dir: INTEGER_32) is
 		-- pango_layout_set_auto_dir (node at line 1625)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_set_auto_dir"
		}"
		end

	pango_layout_get_pixel_extents (a_layout: POINTER; an_ink_rect: POINTER; a_logical_rect: POINTER) is
 		-- pango_layout_get_pixel_extents (node at line 1866)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_pixel_extents"
		}"
		end

	pango_layout_set_text (a_layout: POINTER; a_text: POINTER; a_length: INTEGER_32) is
 		-- pango_layout_set_text (node at line 2175)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_set_text"
		}"
		end

	pango_layout_get_unknown_glyphs_count (a_layout: POINTER): INTEGER_32 is
 		-- pango_layout_get_unknown_glyphs_count (node at line 2217)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_unknown_glyphs_count"
		}"
		end

	pango_layout_is_wrapped (a_layout: POINTER): INTEGER_32 is
 		-- pango_layout_is_wrapped (node at line 2374)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_is_wrapped"
		}"
		end

	pango_layout_line_unref (a_line: POINTER) is
 		-- pango_layout_line_unref (node at line 2843)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_unref"
		}"
		end

	pango_layout_is_ellipsized (a_layout: POINTER): INTEGER_32 is
 		-- pango_layout_is_ellipsized (node at line 2894)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_is_ellipsized"
		}"
		end

	pango_layout_set_single_paragraph_mode (a_layout: POINTER; a_setting: INTEGER_32) is
 		-- pango_layout_set_single_paragraph_mode (node at line 3204)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_set_single_paragraph_mode"
		}"
		end

	pango_layout_new (a_context: POINTER): POINTER is
 		-- pango_layout_new (node at line 3436)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_new"
		}"
		end

	pango_layout_get_alignment (a_layout: POINTER): INTEGER is
 		-- pango_layout_get_alignment (node at line 3458)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_alignment"
		}"
		end

	pango_layout_get_lines_readonly (a_layout: POINTER): POINTER is
 		-- pango_layout_get_lines_readonly (node at line 3487)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_lines_readonly"
		}"
		end

	pango_layout_get_extents (a_layout: POINTER; an_ink_rect: POINTER; a_logical_rect: POINTER) is
 		-- pango_layout_get_extents (node at line 3716)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_extents"
		}"
		end

	pango_layout_get_width (a_layout: POINTER): INTEGER_32 is
 		-- pango_layout_get_width (node at line 3872)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_width"
		}"
		end

	pango_layout_set_spacing (a_layout: POINTER; a_spacing: INTEGER_32) is
 		-- pango_layout_set_spacing (node at line 3935)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_set_spacing"
		}"
		end

	pango_layout_iter_get_line_readonly (an_iter: POINTER): POINTER is
 		-- pango_layout_iter_get_line_readonly (node at line 3995)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_get_line_readonly"
		}"
		end

	pango_layout_iter_get_index (an_iter: POINTER): INTEGER_32 is
 		-- pango_layout_iter_get_index (node at line 4085)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_get_index"
		}"
		end

	pango_layout_get_cursor_pos (a_layout: POINTER; an_index: INTEGER_32; a_strong_pos: POINTER; a_weak_pos: POINTER) is
 		-- pango_layout_get_cursor_pos (node at line 4364)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_cursor_pos"
		}"
		end

	pango_layout_get_size (a_layout: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- pango_layout_get_size (node at line 4446)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_size"
		}"
		end

	pango_layout_get_indent (a_layout: POINTER): INTEGER_32 is
 		-- pango_layout_get_indent (node at line 4461)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_indent"
		}"
		end

	pango_layout_iter_next_run (an_iter: POINTER): INTEGER_32 is
 		-- pango_layout_iter_next_run (node at line 4601)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_next_run"
		}"
		end

	pango_layout_set_indent (a_layout: POINTER; an_indent: INTEGER_32) is
 		-- pango_layout_set_indent (node at line 4645)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_set_indent"
		}"
		end

	pango_layout_get_pixel_size (a_layout: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- pango_layout_get_pixel_size (node at line 4786)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_pixel_size"
		}"
		end

	pango_layout_set_justify (a_layout: POINTER; a_justify: INTEGER_32) is
 		-- pango_layout_set_justify (node at line 4801)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_set_justify"
		}"
		end

	pango_layout_get_type: NATURAL_64 is
 		-- pango_layout_get_type (node at line 4805)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_type()"
		}"
		end

	pango_layout_iter_get_layout_extents (an_iter: POINTER; an_ink_rect: POINTER; a_logical_rect: POINTER) is
 		-- pango_layout_iter_get_layout_extents (node at line 4852)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_get_layout_extents"
		}"
		end

	pango_layout_iter_next_char (an_iter: POINTER): INTEGER_32 is
 		-- pango_layout_iter_next_char (node at line 5000)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_next_char"
		}"
		end

	pango_layout_iter_get_char_extents (an_iter: POINTER; a_logical_rect: POINTER) is
 		-- pango_layout_iter_get_char_extents (node at line 5038)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_get_char_extents"
		}"
		end

	pango_layout_set_tabs (a_layout: POINTER; a_tabs: POINTER) is
 		-- pango_layout_set_tabs (node at line 5381)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_set_tabs"
		}"
		end

	pango_layout_get_justify (a_layout: POINTER): INTEGER_32 is
 		-- pango_layout_get_justify (node at line 5478)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_justify"
		}"
		end

	pango_layout_iter_next_cluster (an_iter: POINTER): INTEGER_32 is
 		-- pango_layout_iter_next_cluster (node at line 5636)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_next_cluster"
		}"
		end

	pango_layout_line_get_x_ranges (a_line: POINTER; a_start_index: INTEGER_32; an_end_index: INTEGER_32; a_ranges: POINTER; a_n_ranges: POINTER) is
 		-- pango_layout_line_get_x_ranges (node at line 5655)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_get_x_ranges"
		}"
		end

	pango_layout_set_ellipsize (a_layout: POINTER; an_ellipsize: INTEGER) is
 		-- pango_layout_set_ellipsize (node at line 5773)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_set_ellipsize"
		}"
		end

	pango_layout_get_tabs (a_layout: POINTER): POINTER is
 		-- pango_layout_get_tabs (node at line 5979)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_tabs"
		}"
		end

	pango_layout_line_get_type: NATURAL_64 is
 		-- pango_layout_line_get_type (node at line 6293)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_get_type()"
		}"
		end

	pango_layout_get_single_paragraph_mode (a_layout: POINTER): INTEGER_32 is
 		-- pango_layout_get_single_paragraph_mode (node at line 6376)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_single_paragraph_mode"
		}"
		end

	pango_layout_get_line_readonly (a_layout: POINTER; a_line: INTEGER_32): POINTER is
 		-- pango_layout_get_line_readonly (node at line 6489)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_line_readonly"
		}"
		end

	pango_layout_iter_get_layout (an_iter: POINTER): POINTER is
 		-- pango_layout_iter_get_layout (node at line 6550)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_get_layout"
		}"
		end

	pango_layout_iter_get_baseline (an_iter: POINTER): INTEGER_32 is
 		-- pango_layout_iter_get_baseline (node at line 6607)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_get_baseline"
		}"
		end

	pango_layout_iter_get_line_yrange (an_iter: POINTER; a_y0: POINTER; a_y1: POINTER) is
 		-- pango_layout_iter_get_line_yrange (node at line 6712)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_get_line_yrange"
		}"
		end

	pango_layout_set_markup (a_layout: POINTER; a_markup: POINTER; a_length: INTEGER_32) is
 		-- pango_layout_set_markup (node at line 6793)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_set_markup"
		}"
		end

	pango_layout_get_lines (a_layout: POINTER): POINTER is
 		-- pango_layout_get_lines (node at line 6966)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_lines"
		}"
		end

	pango_layout_line_index_to_x (a_line: POINTER; an_index: INTEGER_32; a_trailing: INTEGER_32; a_x_pos: POINTER) is
 		-- pango_layout_line_index_to_x (node at line 6980)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_index_to_x"
		}"
		end

	pango_layout_get_baseline (a_layout: POINTER): INTEGER_32 is
 		-- pango_layout_get_baseline (node at line 7224)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_baseline"
		}"
		end

	pango_layout_index_to_line_x (a_layout: POINTER; an_index: INTEGER_32; a_trailing: INTEGER_32; a_line: POINTER; a_x_pos: POINTER) is
 		-- pango_layout_index_to_line_x (node at line 7306)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_index_to_line_x"
		}"
		end

	pango_layout_iter_get_run_readonly (an_iter: POINTER): POINTER is
 		-- pango_layout_iter_get_run_readonly (node at line 7405)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_get_run_readonly"
		}"
		end

	pango_layout_get_attributes (a_layout: POINTER): POINTER is
 		-- pango_layout_get_attributes (node at line 7415)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_attributes"
		}"
		end

	pango_layout_iter_get_run_extents (an_iter: POINTER; an_ink_rect: POINTER; a_logical_rect: POINTER) is
 		-- pango_layout_iter_get_run_extents (node at line 7432)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_get_run_extents"
		}"
		end

	pango_layout_get_wrap (a_layout: POINTER): INTEGER is
 		-- pango_layout_get_wrap (node at line 7523)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_wrap"
		}"
		end

	pango_layout_iter_get_line (an_iter: POINTER): POINTER is
 		-- pango_layout_iter_get_line (node at line 7579)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_get_line"
		}"
		end

	pango_layout_get_spacing (a_layout: POINTER): INTEGER_32 is
 		-- pango_layout_get_spacing (node at line 7661)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_spacing"
		}"
		end

	pango_layout_get_font_description (a_layout: POINTER): POINTER is
 		-- pango_layout_get_font_description (node at line 7796)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_font_description"
		}"
		end

	pango_layout_get_text (a_layout: POINTER): POINTER is
 		-- pango_layout_get_text (node at line 7960)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_text"
		}"
		end

	pango_layout_line_ref (a_line: POINTER): POINTER is
 		-- pango_layout_line_ref (node at line 8052)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_ref"
		}"
		end

	pango_layout_set_alignment (a_layout: POINTER; an_alignment: INTEGER) is
 		-- pango_layout_set_alignment (node at line 8143)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_set_alignment"
		}"
		end

	pango_layout_copy (a_src: POINTER): POINTER is
 		-- pango_layout_copy (node at line 8258)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_copy"
		}"
		end

	pango_layout_context_changed (a_layout: POINTER) is
 		-- pango_layout_context_changed (node at line 8454)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_context_changed"
		}"
		end

	pango_layout_get_log_attrs (a_layout: POINTER; an_attrs: POINTER; a_n_attrs: POINTER) is
 		-- pango_layout_get_log_attrs (node at line 8483)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_log_attrs"
		}"
		end

	pango_layout_set_markup_with_accel (a_layout: POINTER; a_markup: POINTER; a_length: INTEGER_32; an_accel_marker: NATURAL_32; an_accel_char: POINTER) is
 		-- pango_layout_set_markup_with_accel (node at line 8750)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_set_markup_with_accel"
		}"
		end

	pango_layout_line_x_to_index (a_line: POINTER; a_x_pos: INTEGER_32; an_index: POINTER; a_trailing: POINTER): INTEGER_32 is
 		-- pango_layout_line_x_to_index (node at line 8874)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_x_to_index"
		}"
		end

	pango_layout_iter_get_run (an_iter: POINTER): POINTER is
 		-- pango_layout_iter_get_run (node at line 9175)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_get_run"
		}"
		end

	pango_layout_set_font_description (a_layout: POINTER; a_desc: POINTER) is
 		-- pango_layout_set_font_description (node at line 9352)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_set_font_description"
		}"
		end

	pango_layout_index_to_pos (a_layout: POINTER; an_index: INTEGER_32; a_pos: POINTER) is
 		-- pango_layout_index_to_pos (node at line 9638)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_index_to_pos"
		}"
		end

	pango_layout_iter_get_line_extents (an_iter: POINTER; an_ink_rect: POINTER; a_logical_rect: POINTER) is
 		-- pango_layout_iter_get_line_extents (node at line 9700)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_get_line_extents"
		}"
		end

	pango_layout_iter_at_last_line (an_iter: POINTER): INTEGER_32 is
 		-- pango_layout_iter_at_last_line (node at line 9705)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_at_last_line"
		}"
		end

	pango_layout_get_iter (a_layout: POINTER): POINTER is
 		-- pango_layout_get_iter (node at line 9755)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_iter"
		}"
		end

	pango_layout_get_line (a_layout: POINTER; a_line: INTEGER_32): POINTER is
 		-- pango_layout_get_line (node at line 10079)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_line"
		}"
		end

	pango_layout_line_get_pixel_extents (a_layout_line: POINTER; an_ink_rect: POINTER; a_logical_rect: POINTER) is
 		-- pango_layout_line_get_pixel_extents (node at line 10173)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_line_get_pixel_extents"
		}"
		end

	pango_layout_iter_get_type: NATURAL_64 is
 		-- pango_layout_iter_get_type (node at line 10249)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_get_type()"
		}"
		end

	pango_layout_iter_get_cluster_extents (an_iter: POINTER; an_ink_rect: POINTER; a_logical_rect: POINTER) is
 		-- pango_layout_iter_get_cluster_extents (node at line 10358)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_get_cluster_extents"
		}"
		end

	pango_layout_get_height (a_layout: POINTER): INTEGER_32 is
 		-- pango_layout_get_height (node at line 10413)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_height"
		}"
		end

	pango_layout_get_auto_dir (a_layout: POINTER): INTEGER_32 is
 		-- pango_layout_get_auto_dir (node at line 10551)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_get_auto_dir"
		}"
		end

	pango_layout_iter_free (an_iter: POINTER) is
 		-- pango_layout_iter_free (node at line 10562)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_free"
		}"
		end

	pango_layout_iter_next_line (an_iter: POINTER): INTEGER_32 is
 		-- pango_layout_iter_next_line (node at line 10749)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_next_line"
		}"
		end

	pango_layout_iter_copy (an_iter: POINTER): POINTER is
 		-- pango_layout_iter_copy (node at line 10838)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_iter_copy"
		}"
		end

	pango_layout_set_height (a_layout: POINTER; a_height: INTEGER_32) is
 		-- pango_layout_set_height (node at line 10885)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_layout_set_height"
		}"
		end


end -- class PANGO_LAYOUT_EXTERNALS
