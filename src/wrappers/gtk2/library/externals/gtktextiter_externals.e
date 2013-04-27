-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTITER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_text_iter_backward_char (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_backward_char
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_char"
		}"
		end

	gtk_text_iter_backward_chars (an_iter: POINTER; a_count: INTEGER): INTEGER is
 		-- gtk_text_iter_backward_chars
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_chars"
		}"
		end

	gtk_text_iter_backward_cursor_position (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_backward_cursor_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_cursor_position"
		}"
		end

	gtk_text_iter_backward_cursor_positions (an_iter: POINTER; a_count: INTEGER): INTEGER is
 		-- gtk_text_iter_backward_cursor_positions
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_cursor_positions"
		}"
		end

	gtk_text_iter_backward_find_char (an_iter: POINTER; a_pred: POINTER; an_user_data: POINTER; a_limit: POINTER): INTEGER is
 		-- gtk_text_iter_backward_find_char
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_find_char"
		}"
		end

	gtk_text_iter_backward_line (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_backward_line
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_line"
		}"
		end

	gtk_text_iter_backward_lines (an_iter: POINTER; a_count: INTEGER): INTEGER is
 		-- gtk_text_iter_backward_lines
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_lines"
		}"
		end

	gtk_text_iter_backward_search (an_iter: POINTER; a_str: POINTER; a_flags: INTEGER; a_match_start: POINTER; a_match_end: POINTER; a_limit: POINTER): INTEGER is
 		-- gtk_text_iter_backward_search
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_search"
		}"
		end

	gtk_text_iter_backward_sentence_start (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_backward_sentence_start
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_sentence_start"
		}"
		end

	gtk_text_iter_backward_sentence_starts (an_iter: POINTER; a_count: INTEGER): INTEGER is
 		-- gtk_text_iter_backward_sentence_starts
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_sentence_starts"
		}"
		end

	gtk_text_iter_backward_to_tag_toggle (an_iter: POINTER; a_tag: POINTER): INTEGER is
 		-- gtk_text_iter_backward_to_tag_toggle
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_to_tag_toggle"
		}"
		end

	gtk_text_iter_backward_visible_cursor_position (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_backward_visible_cursor_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_cursor_position"
		}"
		end

	gtk_text_iter_backward_visible_cursor_positions (an_iter: POINTER; a_count: INTEGER): INTEGER is
 		-- gtk_text_iter_backward_visible_cursor_positions
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_cursor_positions"
		}"
		end

	gtk_text_iter_backward_visible_line (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_backward_visible_line
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_line"
		}"
		end

	gtk_text_iter_backward_visible_lines (an_iter: POINTER; a_count: INTEGER): INTEGER is
 		-- gtk_text_iter_backward_visible_lines
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_lines"
		}"
		end

	gtk_text_iter_backward_visible_word_start (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_backward_visible_word_start
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_word_start"
		}"
		end

	gtk_text_iter_backward_visible_word_starts (an_iter: POINTER; a_count: INTEGER): INTEGER is
 		-- gtk_text_iter_backward_visible_word_starts
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_word_starts"
		}"
		end

	gtk_text_iter_backward_word_start (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_backward_word_start
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_word_start"
		}"
		end

	gtk_text_iter_backward_word_starts (an_iter: POINTER; a_count: INTEGER): INTEGER is
 		-- gtk_text_iter_backward_word_starts
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_word_starts"
		}"
		end

	gtk_text_iter_begins_tag (an_iter: POINTER; a_tag: POINTER): INTEGER is
 		-- gtk_text_iter_begins_tag
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_begins_tag"
		}"
		end

	gtk_text_iter_can_insert (an_iter: POINTER; a_default_editability: INTEGER): INTEGER is
 		-- gtk_text_iter_can_insert
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_can_insert"
		}"
		end

	gtk_text_iter_compare (a_lhs: POINTER; a_rhs: POINTER): INTEGER is
 		-- gtk_text_iter_compare
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_compare"
		}"
		end

	gtk_text_iter_copy (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_copy"
		}"
		end

	gtk_text_iter_editable (an_iter: POINTER; a_default_setting: INTEGER): INTEGER is
 		-- gtk_text_iter_editable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_editable"
		}"
		end

	gtk_text_iter_ends_line (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_ends_line
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_ends_line"
		}"
		end

	gtk_text_iter_ends_sentence (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_ends_sentence
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_ends_sentence"
		}"
		end

	gtk_text_iter_ends_tag (an_iter: POINTER; a_tag: POINTER): INTEGER is
 		-- gtk_text_iter_ends_tag
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_ends_tag"
		}"
		end

	gtk_text_iter_ends_word (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_ends_word
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_ends_word"
		}"
		end

	gtk_text_iter_equal (a_lhs: POINTER; a_rhs: POINTER): INTEGER is
 		-- gtk_text_iter_equal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_equal"
		}"
		end

	gtk_text_iter_forward_char (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_forward_char
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_char"
		}"
		end

	gtk_text_iter_forward_chars (an_iter: POINTER; a_count: INTEGER): INTEGER is
 		-- gtk_text_iter_forward_chars
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_chars"
		}"
		end

	gtk_text_iter_forward_cursor_position (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_forward_cursor_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_cursor_position"
		}"
		end

	gtk_text_iter_forward_cursor_positions (an_iter: POINTER; a_count: INTEGER): INTEGER is
 		-- gtk_text_iter_forward_cursor_positions
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_cursor_positions"
		}"
		end

	gtk_text_iter_forward_find_char (an_iter: POINTER; a_pred: POINTER; an_user_data: POINTER; a_limit: POINTER): INTEGER is
 		-- gtk_text_iter_forward_find_char
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_find_char"
		}"
		end

	gtk_text_iter_forward_line (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_forward_line
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_line"
		}"
		end

	gtk_text_iter_forward_lines (an_iter: POINTER; a_count: INTEGER): INTEGER is
 		-- gtk_text_iter_forward_lines
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_lines"
		}"
		end

	gtk_text_iter_forward_search (an_iter: POINTER; a_str: POINTER; a_flags: INTEGER; a_match_start: POINTER; a_match_end: POINTER; a_limit: POINTER): INTEGER is
 		-- gtk_text_iter_forward_search
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_search"
		}"
		end

	gtk_text_iter_forward_sentence_end (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_forward_sentence_end
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_sentence_end"
		}"
		end

	gtk_text_iter_forward_sentence_ends (an_iter: POINTER; a_count: INTEGER): INTEGER is
 		-- gtk_text_iter_forward_sentence_ends
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_sentence_ends"
		}"
		end

	gtk_text_iter_forward_to_end (an_iter: POINTER) is
 		-- gtk_text_iter_forward_to_end
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_to_end"
		}"
		end

	gtk_text_iter_forward_to_line_end (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_forward_to_line_end
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_to_line_end"
		}"
		end

	gtk_text_iter_forward_to_tag_toggle (an_iter: POINTER; a_tag: POINTER): INTEGER is
 		-- gtk_text_iter_forward_to_tag_toggle
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_to_tag_toggle"
		}"
		end

	gtk_text_iter_forward_visible_cursor_position (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_forward_visible_cursor_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_cursor_position"
		}"
		end

	gtk_text_iter_forward_visible_cursor_positions (an_iter: POINTER; a_count: INTEGER): INTEGER is
 		-- gtk_text_iter_forward_visible_cursor_positions
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_cursor_positions"
		}"
		end

	gtk_text_iter_forward_visible_line (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_forward_visible_line
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_line"
		}"
		end

	gtk_text_iter_forward_visible_lines (an_iter: POINTER; a_count: INTEGER): INTEGER is
 		-- gtk_text_iter_forward_visible_lines
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_lines"
		}"
		end

	gtk_text_iter_forward_visible_word_end (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_forward_visible_word_end
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_word_end"
		}"
		end

	gtk_text_iter_forward_visible_word_ends (an_iter: POINTER; a_count: INTEGER): INTEGER is
 		-- gtk_text_iter_forward_visible_word_ends
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_word_ends"
		}"
		end

	gtk_text_iter_forward_word_end (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_forward_word_end
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_word_end"
		}"
		end

	gtk_text_iter_forward_word_ends (an_iter: POINTER; a_count: INTEGER): INTEGER is
 		-- gtk_text_iter_forward_word_ends
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_word_ends"
		}"
		end

	gtk_text_iter_free (an_iter: POINTER) is
 		-- gtk_text_iter_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_free"
		}"
		end

	gtk_text_iter_get_attributes (an_iter: POINTER; a_values: POINTER): INTEGER is
 		-- gtk_text_iter_get_attributes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_attributes"
		}"
		end

	gtk_text_iter_get_buffer (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_buffer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_buffer"
		}"
		end

	gtk_text_iter_get_bytes_in_line (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_get_bytes_in_line
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_bytes_in_line"
		}"
		end

	gtk_text_iter_get_char (an_iter: POINTER): NATURAL is
 		-- gtk_text_iter_get_char
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_char"
		}"
		end

	gtk_text_iter_get_chars_in_line (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_get_chars_in_line
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_chars_in_line"
		}"
		end

	gtk_text_iter_get_child_anchor (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_child_anchor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_child_anchor"
		}"
		end

	gtk_text_iter_get_language (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_language
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_language"
		}"
		end

	gtk_text_iter_get_line (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_get_line
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_line"
		}"
		end

	gtk_text_iter_get_line_index (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_get_line_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_line_index"
		}"
		end

	gtk_text_iter_get_line_offset (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_get_line_offset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_line_offset"
		}"
		end

	gtk_text_iter_get_marks (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_marks
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_marks"
		}"
		end

	gtk_text_iter_get_offset (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_get_offset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_offset"
		}"
		end

	gtk_text_iter_get_pixbuf (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_pixbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_pixbuf"
		}"
		end

	gtk_text_iter_get_slice (a_start: POINTER; an_end_external: POINTER): POINTER is
 		-- gtk_text_iter_get_slice
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_slice"
		}"
		end

	gtk_text_iter_get_tags (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_tags
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_tags"
		}"
		end

	gtk_text_iter_get_text (a_start: POINTER; an_end_external: POINTER): POINTER is
 		-- gtk_text_iter_get_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_text"
		}"
		end

	gtk_text_iter_get_toggled_tags (an_iter: POINTER; a_toggled_on: INTEGER): POINTER is
 		-- gtk_text_iter_get_toggled_tags
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_toggled_tags"
		}"
		end

	gtk_text_iter_get_type: like long_unsigned is
 		-- gtk_text_iter_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_type()"
		}"
		end

	gtk_text_iter_get_visible_line_index (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_get_visible_line_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_visible_line_index"
		}"
		end

	gtk_text_iter_get_visible_line_offset (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_get_visible_line_offset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_visible_line_offset"
		}"
		end

	gtk_text_iter_get_visible_slice (a_start: POINTER; an_end_external: POINTER): POINTER is
 		-- gtk_text_iter_get_visible_slice
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_visible_slice"
		}"
		end

	gtk_text_iter_get_visible_text (a_start: POINTER; an_end_external: POINTER): POINTER is
 		-- gtk_text_iter_get_visible_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_visible_text"
		}"
		end

	gtk_text_iter_has_tag (an_iter: POINTER; a_tag: POINTER): INTEGER is
 		-- gtk_text_iter_has_tag
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_has_tag"
		}"
		end

	gtk_text_iter_in_range (an_iter: POINTER; a_start: POINTER; an_end_external: POINTER): INTEGER is
 		-- gtk_text_iter_in_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_in_range"
		}"
		end

	gtk_text_iter_inside_sentence (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_inside_sentence
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_inside_sentence"
		}"
		end

	gtk_text_iter_inside_word (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_inside_word
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_inside_word"
		}"
		end

	gtk_text_iter_is_cursor_position (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_is_cursor_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_is_cursor_position"
		}"
		end

	gtk_text_iter_is_end (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_is_end
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_is_end"
		}"
		end

	gtk_text_iter_is_start (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_is_start
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_is_start"
		}"
		end

	gtk_text_iter_order (a_first: POINTER; a_second: POINTER) is
 		-- gtk_text_iter_order
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_order"
		}"
		end

	gtk_text_iter_set_line (an_iter: POINTER; a_line_number: INTEGER) is
 		-- gtk_text_iter_set_line
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_line"
		}"
		end

	gtk_text_iter_set_line_index (an_iter: POINTER; a_byte_on_line: INTEGER) is
 		-- gtk_text_iter_set_line_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_line_index"
		}"
		end

	gtk_text_iter_set_line_offset (an_iter: POINTER; a_char_on_line: INTEGER) is
 		-- gtk_text_iter_set_line_offset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_line_offset"
		}"
		end

	gtk_text_iter_set_offset (an_iter: POINTER; a_char_offset: INTEGER) is
 		-- gtk_text_iter_set_offset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_offset"
		}"
		end

	gtk_text_iter_set_visible_line_index (an_iter: POINTER; a_byte_on_line: INTEGER) is
 		-- gtk_text_iter_set_visible_line_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_visible_line_index"
		}"
		end

	gtk_text_iter_set_visible_line_offset (an_iter: POINTER; a_char_on_line: INTEGER) is
 		-- gtk_text_iter_set_visible_line_offset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_visible_line_offset"
		}"
		end

	gtk_text_iter_starts_line (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_starts_line
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_starts_line"
		}"
		end

	gtk_text_iter_starts_sentence (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_starts_sentence
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_starts_sentence"
		}"
		end

	gtk_text_iter_starts_word (an_iter: POINTER): INTEGER is
 		-- gtk_text_iter_starts_word
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_starts_word"
		}"
		end

	gtk_text_iter_toggles_tag (an_iter: POINTER; a_tag: POINTER): INTEGER is
 		-- gtk_text_iter_toggles_tag
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_toggles_tag"
		}"
		end


end -- class GTKTEXTITER_EXTERNALS
