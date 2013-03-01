-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTITER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_text_iter_forward_visible_lines (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_forward_visible_lines (node at line 149)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_lines"
		}"
		end

	gtk_text_iter_backward_visible_lines (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_backward_visible_lines (node at line 451)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_lines"
		}"
		end

	gtk_text_iter_get_child_anchor (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_child_anchor (node at line 1125)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_child_anchor"
		}"
		end

	gtk_text_iter_backward_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_line (node at line 1445)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_line"
		}"
		end

	gtk_text_iter_forward_visible_word_end (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_visible_word_end (node at line 1653)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_word_end"
		}"
		end

	gtk_text_iter_set_offset (an_iter: POINTER; a_char_offset: INTEGER_32) is
 		-- gtk_text_iter_set_offset (node at line 2318)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_offset"
		}"
		end

	gtk_text_iter_can_insert (an_iter: POINTER; a_default_editability: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_can_insert (node at line 2687)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_can_insert"
		}"
		end

	gtk_text_iter_forward_visible_cursor_position (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_visible_cursor_position (node at line 4971)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_cursor_position"
		}"
		end

	gtk_text_iter_equal (a_lhs: POINTER; a_rhs: POINTER): INTEGER_32 is
 		-- gtk_text_iter_equal (node at line 5388)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_equal"
		}"
		end

	gtk_text_iter_copy (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_copy (node at line 5769)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_copy"
		}"
		end

	gtk_text_iter_begins_tag (an_iter: POINTER; a_tag: POINTER): INTEGER_32 is
 		-- gtk_text_iter_begins_tag (node at line 6125)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_begins_tag"
		}"
		end

	gtk_text_iter_get_text (a_start: POINTER; an_end_external: POINTER): POINTER is
 		-- gtk_text_iter_get_text (node at line 6159)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_text"
		}"
		end

	gtk_text_iter_set_line (an_iter: POINTER; a_line_number: INTEGER_32) is
 		-- gtk_text_iter_set_line (node at line 6198)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_line"
		}"
		end

	gtk_text_iter_inside_word (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_inside_word (node at line 6722)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_inside_word"
		}"
		end

	gtk_text_iter_get_marks (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_marks (node at line 6875)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_marks"
		}"
		end

	gtk_text_iter_backward_sentence_start (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_sentence_start (node at line 8020)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_sentence_start"
		}"
		end

	gtk_text_iter_in_range (an_iter: POINTER; a_start: POINTER; an_end_external: POINTER): INTEGER_32 is
 		-- gtk_text_iter_in_range (node at line 8760)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_in_range"
		}"
		end

	gtk_text_iter_has_tag (an_iter: POINTER; a_tag: POINTER): INTEGER_32 is
 		-- gtk_text_iter_has_tag (node at line 9275)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_has_tag"
		}"
		end

	gtk_text_iter_get_visible_line_offset (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_visible_line_offset (node at line 9512)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_visible_line_offset"
		}"
		end

	gtk_text_iter_forward_to_tag_toggle (an_iter: POINTER; a_tag: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_to_tag_toggle (node at line 9682)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_to_tag_toggle"
		}"
		end

	gtk_text_iter_get_buffer (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_buffer (node at line 10791)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_buffer"
		}"
		end

	gtk_text_iter_is_cursor_position (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_is_cursor_position (node at line 11322)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_is_cursor_position"
		}"
		end

	gtk_text_iter_get_line_index (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_line_index (node at line 11441)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_line_index"
		}"
		end

	gtk_text_iter_backward_lines (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_backward_lines (node at line 12890)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_lines"
		}"
		end

	gtk_text_iter_forward_word_end (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_word_end (node at line 13202)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_word_end"
		}"
		end

	gtk_text_iter_get_visible_text (a_start: POINTER; an_end_external: POINTER): POINTER is
 		-- gtk_text_iter_get_visible_text (node at line 13268)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_visible_text"
		}"
		end

	gtk_text_iter_get_char (an_iter: POINTER): NATURAL_32 is
 		-- gtk_text_iter_get_char (node at line 13589)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_char"
		}"
		end

	gtk_text_iter_backward_visible_word_start (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_visible_word_start (node at line 14408)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_word_start"
		}"
		end

	gtk_text_iter_forward_cursor_position (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_cursor_position (node at line 15467)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_cursor_position"
		}"
		end

	gtk_text_iter_order (a_first: POINTER; a_second: POINTER) is
 		-- gtk_text_iter_order (node at line 16118)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_order"
		}"
		end

	gtk_text_iter_forward_sentence_ends (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_forward_sentence_ends (node at line 16176)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_sentence_ends"
		}"
		end

	gtk_text_iter_set_visible_line_offset (an_iter: POINTER; a_char_on_line: INTEGER_32) is
 		-- gtk_text_iter_set_visible_line_offset (node at line 16902)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_visible_line_offset"
		}"
		end

	gtk_text_iter_forward_visible_cursor_positions (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_forward_visible_cursor_positions (node at line 17303)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_cursor_positions"
		}"
		end

	gtk_text_iter_set_line_index (an_iter: POINTER; a_byte_on_line: INTEGER_32) is
 		-- gtk_text_iter_set_line_index (node at line 17472)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_line_index"
		}"
		end

	gtk_text_iter_ends_word (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_ends_word (node at line 18133)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_ends_word"
		}"
		end

	gtk_text_iter_is_end (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_is_end (node at line 18310)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_is_end"
		}"
		end

	gtk_text_iter_get_slice (a_start: POINTER; an_end_external: POINTER): POINTER is
 		-- gtk_text_iter_get_slice (node at line 18524)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_slice"
		}"
		end

	gtk_text_iter_backward_search (an_iter: POINTER; a_str: POINTER; a_flags: INTEGER; a_match_start: POINTER; a_match_end: POINTER; a_limit: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_search (node at line 19096)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_search"
		}"
		end

	gtk_text_iter_forward_cursor_positions (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_forward_cursor_positions (node at line 19380)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_cursor_positions"
		}"
		end

	gtk_text_iter_ends_sentence (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_ends_sentence (node at line 19747)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_ends_sentence"
		}"
		end

	gtk_text_iter_get_visible_line_index (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_visible_line_index (node at line 19802)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_visible_line_index"
		}"
		end

	gtk_text_iter_ends_tag (an_iter: POINTER; a_tag: POINTER): INTEGER_32 is
 		-- gtk_text_iter_ends_tag (node at line 19957)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_ends_tag"
		}"
		end

	gtk_text_iter_get_visible_slice (a_start: POINTER; an_end_external: POINTER): POINTER is
 		-- gtk_text_iter_get_visible_slice (node at line 20382)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_visible_slice"
		}"
		end

	gtk_text_iter_get_offset (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_offset (node at line 20420)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_offset"
		}"
		end

	gtk_text_iter_get_toggled_tags (an_iter: POINTER; a_toggled_on: INTEGER_32): POINTER is
 		-- gtk_text_iter_get_toggled_tags (node at line 20563)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_toggled_tags"
		}"
		end

	gtk_text_iter_backward_chars (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_backward_chars (node at line 21138)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_chars"
		}"
		end

	gtk_text_iter_get_type: NATURAL_64 is
 		-- gtk_text_iter_get_type (node at line 21793)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_type()"
		}"
		end

	gtk_text_iter_set_visible_line_index (an_iter: POINTER; a_byte_on_line: INTEGER_32) is
 		-- gtk_text_iter_set_visible_line_index (node at line 22296)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_visible_line_index"
		}"
		end

	gtk_text_iter_ends_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_ends_line (node at line 22449)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_ends_line"
		}"
		end

	gtk_text_iter_backward_to_tag_toggle (an_iter: POINTER; a_tag: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_to_tag_toggle (node at line 22627)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_to_tag_toggle"
		}"
		end

	gtk_text_iter_set_line_offset (an_iter: POINTER; a_char_on_line: INTEGER_32) is
 		-- gtk_text_iter_set_line_offset (node at line 22858)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_line_offset"
		}"
		end

	gtk_text_iter_editable (an_iter: POINTER; a_default_setting: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_editable (node at line 23579)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_editable"
		}"
		end

	gtk_text_iter_forward_search (an_iter: POINTER; a_str: POINTER; a_flags: INTEGER; a_match_start: POINTER; a_match_end: POINTER; a_limit: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_search (node at line 23617)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_search"
		}"
		end

	gtk_text_iter_forward_to_end (an_iter: POINTER) is
 		-- gtk_text_iter_forward_to_end (node at line 24846)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_to_end"
		}"
		end

	gtk_text_iter_starts_sentence (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_starts_sentence (node at line 25448)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_starts_sentence"
		}"
		end

	gtk_text_iter_backward_cursor_position (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_cursor_position (node at line 25945)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_cursor_position"
		}"
		end

	gtk_text_iter_get_pixbuf (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_pixbuf (node at line 27643)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_pixbuf"
		}"
		end

	gtk_text_iter_backward_cursor_positions (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_backward_cursor_positions (node at line 27704)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_cursor_positions"
		}"
		end

	gtk_text_iter_get_line_offset (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_line_offset (node at line 28845)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_line_offset"
		}"
		end

	gtk_text_iter_get_chars_in_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_chars_in_line (node at line 29169)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_chars_in_line"
		}"
		end

	gtk_text_iter_get_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_line (node at line 29422)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_line"
		}"
		end

	gtk_text_iter_backward_visible_word_starts (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_backward_visible_word_starts (node at line 29455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_word_starts"
		}"
		end

	gtk_text_iter_backward_char (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_char (node at line 29469)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_char"
		}"
		end

	gtk_text_iter_forward_word_ends (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_forward_word_ends (node at line 30161)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_word_ends"
		}"
		end

	gtk_text_iter_get_language (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_language (node at line 30349)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_language"
		}"
		end

	gtk_text_iter_forward_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_line (node at line 30386)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_line"
		}"
		end

	gtk_text_iter_backward_visible_cursor_position (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_visible_cursor_position (node at line 31202)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_cursor_position"
		}"
		end

	gtk_text_iter_free (an_iter: POINTER) is
 		-- gtk_text_iter_free (node at line 31959)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_free"
		}"
		end

	gtk_text_iter_starts_word (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_starts_word (node at line 32175)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_starts_word"
		}"
		end

	gtk_text_iter_inside_sentence (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_inside_sentence (node at line 32357)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_inside_sentence"
		}"
		end

	gtk_text_iter_backward_sentence_starts (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_backward_sentence_starts (node at line 32648)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_sentence_starts"
		}"
		end

	gtk_text_iter_forward_lines (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_forward_lines (node at line 33303)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_lines"
		}"
		end

	gtk_text_iter_backward_word_start (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_word_start (node at line 34316)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_word_start"
		}"
		end

	gtk_text_iter_toggles_tag (an_iter: POINTER; a_tag: POINTER): INTEGER_32 is
 		-- gtk_text_iter_toggles_tag (node at line 34472)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_toggles_tag"
		}"
		end

	gtk_text_iter_get_bytes_in_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_bytes_in_line (node at line 34508)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_bytes_in_line"
		}"
		end

	gtk_text_iter_forward_char (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_char (node at line 34929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_char"
		}"
		end

	gtk_text_iter_get_attributes (an_iter: POINTER; a_values: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_attributes (node at line 35594)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_attributes"
		}"
		end

	gtk_text_iter_get_tags (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_tags (node at line 35878)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_tags"
		}"
		end

	gtk_text_iter_starts_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_starts_line (node at line 36142)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_starts_line"
		}"
		end

	gtk_text_iter_is_start (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_is_start (node at line 36208)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_is_start"
		}"
		end

	gtk_text_iter_forward_to_line_end (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_to_line_end (node at line 38097)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_to_line_end"
		}"
		end

	gtk_text_iter_forward_visible_word_ends (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_forward_visible_word_ends (node at line 38635)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_word_ends"
		}"
		end

	gtk_text_iter_backward_visible_cursor_positions (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_backward_visible_cursor_positions (node at line 38932)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_cursor_positions"
		}"
		end

	gtk_text_iter_compare (a_lhs: POINTER; a_rhs: POINTER): INTEGER_32 is
 		-- gtk_text_iter_compare (node at line 39192)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_compare"
		}"
		end

	gtk_text_iter_backward_visible_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_visible_line (node at line 39219)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_line"
		}"
		end

	gtk_text_iter_backward_word_starts (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_backward_word_starts (node at line 39536)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_word_starts"
		}"
		end

	gtk_text_iter_forward_visible_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_visible_line (node at line 39747)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_line"
		}"
		end

	gtk_text_iter_forward_sentence_end (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_sentence_end (node at line 40524)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_sentence_end"
		}"
		end

	gtk_text_iter_backward_find_char (an_iter: POINTER; a_pred: POINTER; an_user_data: POINTER; a_limit: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_find_char (node at line 40572)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_find_char"
		}"
		end

	gtk_text_iter_forward_chars (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_forward_chars (node at line 40684)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_chars"
		}"
		end

	gtk_text_iter_forward_find_char (an_iter: POINTER; a_pred: POINTER; an_user_data: POINTER; a_limit: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_find_char (node at line 40835)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_find_char"
		}"
		end


end -- class GTKTEXTITER_EXTERNALS
