-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTITER_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_text_iter_forward_visible_lines (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_forward_visible_lines (node at line 155)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_lines"
		}"
		end

	gtk_text_iter_backward_visible_lines (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_backward_visible_lines (node at line 463)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_lines"
		}"
		end

	gtk_text_iter_backward_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_line (node at line 1479)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_line"
		}"
		end

	gtk_text_iter_forward_visible_word_end (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_visible_word_end (node at line 1723)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_word_end"
		}"
		end

	gtk_text_iter_can_insert (an_iter: POINTER; a_default_editability: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_can_insert (node at line 2750)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_can_insert"
		}"
		end

	gtk_text_iter_forward_visible_cursor_position (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_visible_cursor_position (node at line 4739)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_cursor_position"
		}"
		end

	gtk_text_iter_equal (a_lhs: POINTER; a_rhs: POINTER): INTEGER_32 is
 		-- gtk_text_iter_equal (node at line 5128)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_equal"
		}"
		end

	gtk_text_iter_copy (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_copy (node at line 5512)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_copy"
		}"
		end

	gtk_text_iter_begins_tag (an_iter: POINTER; a_tag: POINTER): INTEGER_32 is
 		-- gtk_text_iter_begins_tag (node at line 5827)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_begins_tag"
		}"
		end

	gtk_text_iter_get_text (a_start: POINTER; an_end_external: POINTER): POINTER is
 		-- gtk_text_iter_get_text (node at line 5855)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_text"
		}"
		end

	gtk_text_iter_inside_word (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_inside_word (node at line 6130)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_inside_word"
		}"
		end

	gtk_text_iter_get_marks (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_marks (node at line 6297)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_marks"
		}"
		end

	gtk_text_iter_backward_sentence_start (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_sentence_start (node at line 7320)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_sentence_start"
		}"
		end

	gtk_text_iter_has_tag (an_iter: POINTER; a_tag: POINTER): INTEGER_32 is
 		-- gtk_text_iter_has_tag (node at line 8578)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_has_tag"
		}"
		end

	gtk_text_iter_get_visible_line_offset (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_visible_line_offset (node at line 8760)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_visible_line_offset"
		}"
		end

	gtk_text_iter_forward_to_tag_toggle (an_iter: POINTER; a_tag: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_to_tag_toggle (node at line 8935)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_to_tag_toggle"
		}"
		end

	gtk_text_iter_set_visible_line_index (an_iter: POINTER; a_byte_on_line: INTEGER_32) is
 		-- gtk_text_iter_set_visible_line_index (node at line 9803)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_visible_line_index"
		}"
		end

	gtk_text_iter_get_buffer (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_buffer (node at line 10025)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_buffer"
		}"
		end

	gtk_text_iter_is_cursor_position (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_is_cursor_position (node at line 10435)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_is_cursor_position"
		}"
		end

	gtk_text_iter_get_line_index (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_line_index (node at line 10518)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_line_index"
		}"
		end

	gtk_text_iter_backward_lines (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_backward_lines (node at line 11840)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_lines"
		}"
		end

	gtk_text_iter_forward_word_end (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_word_end (node at line 12127)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_word_end"
		}"
		end

	gtk_text_iter_get_char (an_iter: POINTER): NATURAL_32 is
 		-- gtk_text_iter_get_char (node at line 12491)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_char"
		}"
		end

	gtk_text_iter_backward_visible_word_start (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_visible_word_start (node at line 13283)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_word_start"
		}"
		end

	gtk_text_iter_order (a_first: POINTER; a_second: POINTER) is
 		-- gtk_text_iter_order (node at line 14863)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_order"
		}"
		end

	gtk_text_iter_forward_sentence_ends (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_forward_sentence_ends (node at line 14925)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_sentence_ends"
		}"
		end

	gtk_text_iter_set_visible_line_offset (an_iter: POINTER; a_char_on_line: INTEGER_32) is
 		-- gtk_text_iter_set_visible_line_offset (node at line 15580)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_visible_line_offset"
		}"
		end

	gtk_text_iter_forward_visible_cursor_positions (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_forward_visible_cursor_positions (node at line 15947)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_cursor_positions"
		}"
		end

	gtk_text_iter_set_line_index (an_iter: POINTER; a_byte_on_line: INTEGER_32) is
 		-- gtk_text_iter_set_line_index (node at line 16080)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_line_index"
		}"
		end

	gtk_text_iter_ends_word (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_ends_word (node at line 16665)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_ends_word"
		}"
		end

	gtk_text_iter_is_end (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_is_end (node at line 16801)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_is_end"
		}"
		end

	gtk_text_iter_get_slice (a_start: POINTER; an_end_external: POINTER): POINTER is
 		-- gtk_text_iter_get_slice (node at line 16987)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_slice"
		}"
		end

	gtk_text_iter_backward_search (an_iter: POINTER; a_str: POINTER; a_flags: INTEGER; a_match_start: POINTER; a_match_end: POINTER; a_limit: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_search (node at line 17440)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_search"
		}"
		end

	gtk_text_iter_forward_cursor_positions (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_forward_cursor_positions (node at line 17670)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_cursor_positions"
		}"
		end

	gtk_text_iter_ends_sentence (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_ends_sentence (node at line 18056)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_ends_sentence"
		}"
		end

	gtk_text_iter_get_visible_line_index (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_visible_line_index (node at line 18125)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_visible_line_index"
		}"
		end

	gtk_text_iter_ends_tag (an_iter: POINTER; a_tag: POINTER): INTEGER_32 is
 		-- gtk_text_iter_ends_tag (node at line 18278)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_ends_tag"
		}"
		end

	gtk_text_iter_get_visible_slice (a_start: POINTER; an_end_external: POINTER): POINTER is
 		-- gtk_text_iter_get_visible_slice (node at line 18675)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_visible_slice"
		}"
		end

	gtk_text_iter_get_offset (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_offset (node at line 18706)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_offset"
		}"
		end

	gtk_text_iter_get_toggled_tags (an_iter: POINTER; a_toggled_on: INTEGER_32): POINTER is
 		-- gtk_text_iter_get_toggled_tags (node at line 18836)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_toggled_tags"
		}"
		end

	gtk_text_iter_backward_chars (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_backward_chars (node at line 19280)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_chars"
		}"
		end

	gtk_text_iter_get_type: NATURAL_32 is
 		-- gtk_text_iter_get_type (node at line 19859)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_type()"
		}"
		end

	gtk_text_iter_set_line (an_iter: POINTER; a_line_number: INTEGER_32) is
 		-- gtk_text_iter_set_line (node at line 20269)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_line"
		}"
		end

	gtk_text_iter_ends_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_ends_line (node at line 20347)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_ends_line"
		}"
		end

	gtk_text_iter_backward_to_tag_toggle (an_iter: POINTER; a_tag: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_to_tag_toggle (node at line 20526)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_to_tag_toggle"
		}"
		end

	gtk_text_iter_set_line_offset (an_iter: POINTER; a_char_on_line: INTEGER_32) is
 		-- gtk_text_iter_set_line_offset (node at line 20758)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_line_offset"
		}"
		end

	gtk_text_iter_editable (an_iter: POINTER; a_default_setting: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_editable (node at line 21389)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_editable"
		}"
		end

	gtk_text_iter_forward_search (an_iter: POINTER; a_str: POINTER; a_flags: INTEGER; a_match_start: POINTER; a_match_end: POINTER; a_limit: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_search (node at line 21407)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_search"
		}"
		end

	gtk_text_iter_forward_visible_word_ends (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_forward_visible_word_ends (node at line 21714)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_word_ends"
		}"
		end

	gtk_text_iter_forward_to_end (an_iter: POINTER) is
 		-- gtk_text_iter_forward_to_end (node at line 22567)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_to_end"
		}"
		end

	gtk_text_iter_starts_sentence (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_starts_sentence (node at line 23129)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_starts_sentence"
		}"
		end

	gtk_text_iter_backward_cursor_position (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_cursor_position (node at line 23580)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_cursor_position"
		}"
		end

	gtk_text_iter_get_visible_text (a_start: POINTER; an_end_external: POINTER): POINTER is
 		-- gtk_text_iter_get_visible_text (node at line 24724)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_visible_text"
		}"
		end

	gtk_text_iter_get_pixbuf (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_pixbuf (node at line 24923)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_pixbuf"
		}"
		end

	gtk_text_iter_backward_cursor_positions (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_backward_cursor_positions (node at line 24982)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_cursor_positions"
		}"
		end

	gtk_text_iter_get_chars_in_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_chars_in_line (node at line 26422)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_chars_in_line"
		}"
		end

	gtk_text_iter_get_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_line (node at line 26619)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_line"
		}"
		end

	gtk_text_iter_backward_visible_word_starts (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_backward_visible_word_starts (node at line 26660)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_word_starts"
		}"
		end

	gtk_text_iter_backward_char (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_char (node at line 26680)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_char"
		}"
		end

	gtk_text_iter_forward_word_ends (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_forward_word_ends (node at line 27308)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_word_ends"
		}"
		end

	gtk_text_iter_forward_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_line (node at line 27519)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_line"
		}"
		end

	gtk_text_iter_backward_visible_cursor_position (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_visible_cursor_position (node at line 28183)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_cursor_position"
		}"
		end

	gtk_text_iter_get_child_anchor (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_child_anchor (node at line 28475)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_child_anchor"
		}"
		end

	gtk_text_iter_free (an_iter: POINTER) is
 		-- gtk_text_iter_free (node at line 28962)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_free"
		}"
		end

	gtk_text_iter_starts_word (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_starts_word (node at line 29148)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_starts_word"
		}"
		end

	gtk_text_iter_inside_sentence (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_inside_sentence (node at line 29296)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_inside_sentence"
		}"
		end

	gtk_text_iter_backward_sentence_starts (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_backward_sentence_starts (node at line 29600)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_sentence_starts"
		}"
		end

	gtk_text_iter_forward_lines (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_forward_lines (node at line 30164)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_lines"
		}"
		end

	gtk_text_iter_forward_cursor_position (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_cursor_position (node at line 30685)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_cursor_position"
		}"
		end

	gtk_text_iter_backward_word_start (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_word_start (node at line 31069)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_word_start"
		}"
		end

	gtk_text_iter_toggles_tag (an_iter: POINTER; a_tag: POINTER): INTEGER_32 is
 		-- gtk_text_iter_toggles_tag (node at line 31183)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_toggles_tag"
		}"
		end

	gtk_text_iter_get_bytes_in_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_bytes_in_line (node at line 31212)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_bytes_in_line"
		}"
		end

	gtk_text_iter_forward_char (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_char (node at line 31575)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_char"
		}"
		end

	gtk_text_iter_get_attributes (an_iter: POINTER; a_values: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_attributes (node at line 32230)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_attributes"
		}"
		end

	gtk_text_iter_get_tags (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_tags (node at line 32515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_tags"
		}"
		end

	gtk_text_iter_starts_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_starts_line (node at line 32758)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_starts_line"
		}"
		end

	gtk_text_iter_is_start (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_is_start (node at line 32828)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_is_start"
		}"
		end

	gtk_text_iter_get_language (an_iter: POINTER): POINTER is
 		-- gtk_text_iter_get_language (node at line 33073)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_language"
		}"
		end

	gtk_text_iter_in_range (an_iter: POINTER; a_start: POINTER; an_end_external: POINTER): INTEGER_32 is
 		-- gtk_text_iter_in_range (node at line 33087)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_in_range"
		}"
		end

	gtk_text_iter_get_line_offset (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_get_line_offset (node at line 33234)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_get_line_offset"
		}"
		end

	gtk_text_iter_forward_to_line_end (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_to_line_end (node at line 34570)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_to_line_end"
		}"
		end

	gtk_text_iter_backward_visible_cursor_positions (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_backward_visible_cursor_positions (node at line 35330)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_cursor_positions"
		}"
		end

	gtk_text_iter_compare (a_lhs: POINTER; a_rhs: POINTER): INTEGER_32 is
 		-- gtk_text_iter_compare (node at line 35623)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_compare"
		}"
		end

	gtk_text_iter_backward_visible_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_visible_line (node at line 35648)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_visible_line"
		}"
		end

	gtk_text_iter_backward_word_starts (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_backward_word_starts (node at line 35937)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_word_starts"
		}"
		end

	gtk_text_iter_forward_visible_line (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_visible_line (node at line 36163)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_visible_line"
		}"
		end

	gtk_text_iter_set_offset (an_iter: POINTER; a_char_offset: INTEGER_32) is
 		-- gtk_text_iter_set_offset (node at line 36553)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_set_offset"
		}"
		end

	gtk_text_iter_forward_sentence_end (an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_sentence_end (node at line 36838)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_sentence_end"
		}"
		end

	gtk_text_iter_backward_find_char (an_iter: POINTER; a_pred: POINTER; an_user_data: POINTER; a_limit: POINTER): INTEGER_32 is
 		-- gtk_text_iter_backward_find_char (node at line 36887)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_backward_find_char"
		}"
		end

	gtk_text_iter_forward_chars (an_iter: POINTER; a_count: INTEGER_32): INTEGER_32 is
 		-- gtk_text_iter_forward_chars (node at line 36983)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_chars"
		}"
		end

	gtk_text_iter_forward_find_char (an_iter: POINTER; a_pred: POINTER; an_user_data: POINTER; a_limit: POINTER): INTEGER_32 is
 		-- gtk_text_iter_forward_find_char (node at line 37154)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_iter_forward_find_char"
		}"
		end


end -- class GTKTEXTITER_EXTERNALS
