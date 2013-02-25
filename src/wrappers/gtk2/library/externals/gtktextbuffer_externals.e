-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTBUFFER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_text_buffer_get_char_count (a_buffer: POINTER): INTEGER_32 is
 		-- gtk_text_buffer_get_char_count (node at line 158)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_char_count"
		}"
		end

	gtk_text_buffer_get_text (a_buffer: POINTER; a_start: POINTER; an_end_external: POINTER; an_include_hidden_chars: INTEGER_32): POINTER is
 		-- gtk_text_buffer_get_text (node at line 1116)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_text"
		}"
		end

	gtk_text_buffer_delete_mark (a_buffer: POINTER; a_mark: POINTER) is
 		-- gtk_text_buffer_delete_mark (node at line 1252)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_delete_mark"
		}"
		end

	gtk_text_buffer_get_insert (a_buffer: POINTER): POINTER is
 		-- gtk_text_buffer_get_insert (node at line 1386)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_insert"
		}"
		end

	gtk_text_buffer_get_selection_bounds (a_buffer: POINTER; a_start: POINTER; an_end_external: POINTER): INTEGER_32 is
 		-- gtk_text_buffer_get_selection_bounds (node at line 1643)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_selection_bounds"
		}"
		end

	gtk_text_buffer_insert_child_anchor (a_buffer: POINTER; an_iter: POINTER; an_anchor: POINTER) is
 		-- gtk_text_buffer_insert_child_anchor (node at line 2781)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_child_anchor"
		}"
		end

	gtk_text_buffer_get_iter_at_child_anchor (a_buffer: POINTER; an_iter: POINTER; an_anchor: POINTER) is
 		-- gtk_text_buffer_get_iter_at_child_anchor (node at line 2879)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_iter_at_child_anchor"
		}"
		end

	gtk_text_buffer_insert (a_buffer: POINTER; an_iter: POINTER; a_text: POINTER; a_len: INTEGER_32) is
 		-- gtk_text_buffer_insert (node at line 3569)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert"
		}"
		end

	gtk_text_buffer_get_iter_at_line_offset (a_buffer: POINTER; an_iter: POINTER; a_line_number: INTEGER_32; a_char_offset: INTEGER_32) is
 		-- gtk_text_buffer_get_iter_at_line_offset (node at line 3683)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_iter_at_line_offset"
		}"
		end

	-- `hidden' function _gtk_text_buffer_get_btree skipped.
	gtk_text_buffer_begin_user_action (a_buffer: POINTER) is
 		-- gtk_text_buffer_begin_user_action (node at line 5912)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_begin_user_action"
		}"
		end

	gtk_text_buffer_get_mark (a_buffer: POINTER; a_name: POINTER): POINTER is
 		-- gtk_text_buffer_get_mark (node at line 8282)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_mark"
		}"
		end

	gtk_text_buffer_get_copy_target_list (a_buffer: POINTER): POINTER is
 		-- gtk_text_buffer_get_copy_target_list (node at line 8542)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_copy_target_list"
		}"
		end

	-- `hidden' function _gtk_text_buffer_get_line_log_attrs skipped.
	gtk_text_buffer_insert_at_cursor (a_buffer: POINTER; a_text: POINTER; a_len: INTEGER_32) is
 		-- gtk_text_buffer_insert_at_cursor (node at line 9232)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_at_cursor"
		}"
		end

	gtk_text_buffer_get_start_iter (a_buffer: POINTER; an_iter: POINTER) is
 		-- gtk_text_buffer_get_start_iter (node at line 9754)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_start_iter"
		}"
		end

	gtk_text_buffer_delete (a_buffer: POINTER; a_start: POINTER; an_end_external: POINTER) is
 		-- gtk_text_buffer_delete (node at line 11294)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_delete"
		}"
		end

	gtk_text_buffer_create_tag (a_buffer: POINTER; a_tag_name: POINTER; a_first_property_name: POINTER): POINTER is
 		-- gtk_text_buffer_create_tag (variadic call)  (node at line 11546)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_create_tag"
		}"
		end

	gtk_text_buffer_end_user_action (a_buffer: POINTER) is
 		-- gtk_text_buffer_end_user_action (node at line 12748)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_end_user_action"
		}"
		end

	gtk_text_buffer_apply_tag (a_buffer: POINTER; a_tag: POINTER; a_start: POINTER; an_end_external: POINTER) is
 		-- gtk_text_buffer_apply_tag (node at line 12805)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_apply_tag"
		}"
		end

	gtk_text_buffer_get_selection_bound (a_buffer: POINTER): POINTER is
 		-- gtk_text_buffer_get_selection_bound (node at line 13442)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_selection_bound"
		}"
		end

	gtk_text_buffer_move_mark_by_name (a_buffer: POINTER; a_name: POINTER; a_where: POINTER) is
 		-- gtk_text_buffer_move_mark_by_name (node at line 14177)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_move_mark_by_name"
		}"
		end

	gtk_text_buffer_move_mark (a_buffer: POINTER; a_mark: POINTER; a_where: POINTER) is
 		-- gtk_text_buffer_move_mark (node at line 14276)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_move_mark"
		}"
		end

	gtk_text_buffer_get_slice (a_buffer: POINTER; a_start: POINTER; an_end_external: POINTER; an_include_hidden_chars: INTEGER_32): POINTER is
 		-- gtk_text_buffer_get_slice (node at line 15343)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_slice"
		}"
		end

	gtk_text_buffer_new (a_table: POINTER): POINTER is
 		-- gtk_text_buffer_new (node at line 15764)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_new"
		}"
		end

	gtk_text_buffer_get_has_selection (a_buffer: POINTER): INTEGER_32 is
 		-- gtk_text_buffer_get_has_selection (node at line 16008)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_has_selection"
		}"
		end

	gtk_text_buffer_add_selection_clipboard (a_buffer: POINTER; a_clipboard: POINTER) is
 		-- gtk_text_buffer_add_selection_clipboard (node at line 16410)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_add_selection_clipboard"
		}"
		end

	gtk_text_buffer_delete_interactive (a_buffer: POINTER; a_start_iter: POINTER; an_end_iter: POINTER; a_default_editable: INTEGER_32): INTEGER_32 is
 		-- gtk_text_buffer_delete_interactive (node at line 16847)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_delete_interactive"
		}"
		end

	gtk_text_buffer_get_type: NATURAL_64 is
 		-- gtk_text_buffer_get_type (node at line 17049)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_type()"
		}"
		end

	gtk_text_buffer_insert_interactive_at_cursor (a_buffer: POINTER; a_text: POINTER; a_len: INTEGER_32; a_default_editable: INTEGER_32): INTEGER_32 is
 		-- gtk_text_buffer_insert_interactive_at_cursor (node at line 17530)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_interactive_at_cursor"
		}"
		end

	gtk_text_buffer_insert_with_tags_by_name (a_buffer: POINTER; an_iter: POINTER; a_text: POINTER; a_len: INTEGER_32; a_first_tag_name: POINTER) is
 		-- gtk_text_buffer_insert_with_tags_by_name (variadic call)  (node at line 17545)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_with_tags_by_name"
		}"
		end

	gtk_text_buffer_cut_clipboard (a_buffer: POINTER; a_clipboard: POINTER; a_default_editable: INTEGER_32) is
 		-- gtk_text_buffer_cut_clipboard (node at line 19086)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_cut_clipboard"
		}"
		end

	gtk_text_buffer_select_range (a_buffer: POINTER; an_ins: POINTER; a_bound: POINTER) is
 		-- gtk_text_buffer_select_range (node at line 19490)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_select_range"
		}"
		end

	gtk_text_buffer_remove_all_tags (a_buffer: POINTER; a_start: POINTER; an_end_external: POINTER) is
 		-- gtk_text_buffer_remove_all_tags (node at line 20137)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_remove_all_tags"
		}"
		end

	gtk_text_buffer_get_paste_target_list (a_buffer: POINTER): POINTER is
 		-- gtk_text_buffer_get_paste_target_list (node at line 20504)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_paste_target_list"
		}"
		end

	gtk_text_buffer_set_text (a_buffer: POINTER; a_text: POINTER; a_len: INTEGER_32) is
 		-- gtk_text_buffer_set_text (node at line 20771)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_set_text"
		}"
		end

	gtk_text_buffer_copy_clipboard (a_buffer: POINTER; a_clipboard: POINTER) is
 		-- gtk_text_buffer_copy_clipboard (node at line 22246)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_copy_clipboard"
		}"
		end

	gtk_text_buffer_remove_selection_clipboard (a_buffer: POINTER; a_clipboard: POINTER) is
 		-- gtk_text_buffer_remove_selection_clipboard (node at line 23351)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_remove_selection_clipboard"
		}"
		end

	gtk_text_buffer_insert_interactive (a_buffer: POINTER; an_iter: POINTER; a_text: POINTER; a_len: INTEGER_32; a_default_editable: INTEGER_32): INTEGER_32 is
 		-- gtk_text_buffer_insert_interactive (node at line 23414)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_interactive"
		}"
		end

	gtk_text_buffer_get_iter_at_line_index (a_buffer: POINTER; an_iter: POINTER; a_line_number: INTEGER_32; a_byte_index: INTEGER_32) is
 		-- gtk_text_buffer_get_iter_at_line_index (node at line 23439)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_iter_at_line_index"
		}"
		end

	gtk_text_buffer_create_mark (a_buffer: POINTER; a_mark_name: POINTER; a_where: POINTER; a_left_gravity: INTEGER_32): POINTER is
 		-- gtk_text_buffer_create_mark (node at line 23611)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_create_mark"
		}"
		end

	gtk_text_buffer_delete_selection (a_buffer: POINTER; an_interactive: INTEGER_32; a_default_editable: INTEGER_32): INTEGER_32 is
 		-- gtk_text_buffer_delete_selection (node at line 24089)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_delete_selection"
		}"
		end

	gtk_text_buffer_delete_mark_by_name (a_buffer: POINTER; a_name: POINTER) is
 		-- gtk_text_buffer_delete_mark_by_name (node at line 24399)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_delete_mark_by_name"
		}"
		end

	gtk_text_buffer_get_end_iter (a_buffer: POINTER; an_iter: POINTER) is
 		-- gtk_text_buffer_get_end_iter (node at line 25476)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_end_iter"
		}"
		end

	gtk_text_buffer_backspace (a_buffer: POINTER; an_iter: POINTER; an_interactive: INTEGER_32; a_default_editable: INTEGER_32): INTEGER_32 is
 		-- gtk_text_buffer_backspace (node at line 26478)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_backspace"
		}"
		end

	gtk_text_buffer_paste_clipboard (a_buffer: POINTER; a_clipboard: POINTER; an_override_location: POINTER; a_default_editable: INTEGER_32) is
 		-- gtk_text_buffer_paste_clipboard (node at line 27143)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_paste_clipboard"
		}"
		end

	gtk_text_buffer_insert_range_interactive (a_buffer: POINTER; an_iter: POINTER; a_start: POINTER; an_end_external: POINTER; a_default_editable: INTEGER_32): INTEGER_32 is
 		-- gtk_text_buffer_insert_range_interactive (node at line 28613)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_range_interactive"
		}"
		end

	gtk_text_buffer_remove_tag_by_name (a_buffer: POINTER; a_name: POINTER; a_start: POINTER; an_end_external: POINTER) is
 		-- gtk_text_buffer_remove_tag_by_name (node at line 28754)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_remove_tag_by_name"
		}"
		end

	gtk_text_buffer_apply_tag_by_name (a_buffer: POINTER; a_name: POINTER; a_start: POINTER; an_end_external: POINTER) is
 		-- gtk_text_buffer_apply_tag_by_name (node at line 28807)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_apply_tag_by_name"
		}"
		end

	gtk_text_buffer_get_tag_table (a_buffer: POINTER): POINTER is
 		-- gtk_text_buffer_get_tag_table (node at line 29983)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_tag_table"
		}"
		end

	gtk_text_buffer_add_mark (a_buffer: POINTER; a_mark: POINTER; a_where: POINTER) is
 		-- gtk_text_buffer_add_mark (node at line 32129)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_add_mark"
		}"
		end

	gtk_text_buffer_insert_pixbuf (a_buffer: POINTER; an_iter: POINTER; a_pixbuf: POINTER) is
 		-- gtk_text_buffer_insert_pixbuf (node at line 32493)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_pixbuf"
		}"
		end

	-- `hidden' function _gtk_text_buffer_spew skipped.
	gtk_text_buffer_insert_range (a_buffer: POINTER; an_iter: POINTER; a_start: POINTER; an_end_external: POINTER) is
 		-- gtk_text_buffer_insert_range (node at line 35212)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_range"
		}"
		end

	gtk_text_buffer_insert_with_tags (a_buffer: POINTER; an_iter: POINTER; a_text: POINTER; a_len: INTEGER_32; a_first_tag: POINTER) is
 		-- gtk_text_buffer_insert_with_tags (variadic call)  (node at line 35498)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_with_tags"
		}"
		end

	-- `hidden' function _gtk_text_buffer_notify_will_remove_tag skipped.
	gtk_text_buffer_set_modified (a_buffer: POINTER; a_setting: INTEGER_32) is
 		-- gtk_text_buffer_set_modified (node at line 36619)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_set_modified"
		}"
		end

	gtk_text_buffer_remove_tag (a_buffer: POINTER; a_tag: POINTER; a_start: POINTER; an_end_external: POINTER) is
 		-- gtk_text_buffer_remove_tag (node at line 36828)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_remove_tag"
		}"
		end

	gtk_text_buffer_get_iter_at_line (a_buffer: POINTER; an_iter: POINTER; a_line_number: INTEGER_32) is
 		-- gtk_text_buffer_get_iter_at_line (node at line 37307)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_iter_at_line"
		}"
		end

	gtk_text_buffer_get_modified (a_buffer: POINTER): INTEGER_32 is
 		-- gtk_text_buffer_get_modified (node at line 37733)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_modified"
		}"
		end

	gtk_text_buffer_get_iter_at_offset (a_buffer: POINTER; an_iter: POINTER; a_char_offset: INTEGER_32) is
 		-- gtk_text_buffer_get_iter_at_offset (node at line 37774)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_iter_at_offset"
		}"
		end

	gtk_text_buffer_get_iter_at_mark (a_buffer: POINTER; an_iter: POINTER; a_mark: POINTER) is
 		-- gtk_text_buffer_get_iter_at_mark (node at line 38900)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_iter_at_mark"
		}"
		end

	gtk_text_buffer_get_bounds (a_buffer: POINTER; a_start: POINTER; an_end_external: POINTER) is
 		-- gtk_text_buffer_get_bounds (node at line 39753)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_bounds"
		}"
		end

	gtk_text_buffer_get_line_count (a_buffer: POINTER): INTEGER_32 is
 		-- gtk_text_buffer_get_line_count (node at line 39919)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_line_count"
		}"
		end

	gtk_text_buffer_place_cursor (a_buffer: POINTER; a_where: POINTER) is
 		-- gtk_text_buffer_place_cursor (node at line 40264)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_place_cursor"
		}"
		end

	gtk_text_buffer_create_child_anchor (a_buffer: POINTER; an_iter: POINTER): POINTER is
 		-- gtk_text_buffer_create_child_anchor (node at line 41268)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_create_child_anchor"
		}"
		end


end -- class GTKTEXTBUFFER_EXTERNALS
