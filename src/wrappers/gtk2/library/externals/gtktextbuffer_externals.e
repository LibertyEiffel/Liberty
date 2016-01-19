-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTBUFFER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_text_buffer_add_mark (a_buffer: POINTER; a_mark: POINTER; a_where: POINTER) is
 		-- gtk_text_buffer_add_mark
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_add_mark"
		}"
		end

	gtk_text_buffer_add_selection_clipboard (a_buffer: POINTER; a_clipboard: POINTER) is
 		-- gtk_text_buffer_add_selection_clipboard
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_add_selection_clipboard"
		}"
		end

	gtk_text_buffer_apply_tag (a_buffer: POINTER; a_tag: POINTER; a_start: POINTER; an_end_external: POINTER) is
 		-- gtk_text_buffer_apply_tag
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_apply_tag"
		}"
		end

	gtk_text_buffer_apply_tag_by_name (a_buffer: POINTER; a_name: POINTER; a_start: POINTER; an_end_external: POINTER) is
 		-- gtk_text_buffer_apply_tag_by_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_apply_tag_by_name"
		}"
		end

	gtk_text_buffer_backspace (a_buffer: POINTER; an_iter: POINTER; an_interactive: INTEGER; a_default_editable: INTEGER): INTEGER is
 		-- gtk_text_buffer_backspace
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_backspace"
		}"
		end

	gtk_text_buffer_begin_user_action (a_buffer: POINTER) is
 		-- gtk_text_buffer_begin_user_action
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_begin_user_action"
		}"
		end

	gtk_text_buffer_copy_clipboard (a_buffer: POINTER; a_clipboard: POINTER) is
 		-- gtk_text_buffer_copy_clipboard
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_copy_clipboard"
		}"
		end

	gtk_text_buffer_create_child_anchor (a_buffer: POINTER; an_iter: POINTER): POINTER is
 		-- gtk_text_buffer_create_child_anchor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_create_child_anchor"
		}"
		end

	gtk_text_buffer_create_mark (a_buffer: POINTER; a_mark_name: POINTER; a_where: POINTER; a_left_gravity: INTEGER): POINTER is
 		-- gtk_text_buffer_create_mark
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_create_mark"
		}"
		end

	gtk_text_buffer_create_tag (a_buffer: POINTER; a_tag_name: POINTER; a_first_property_name: POINTER): POINTER is
 		-- gtk_text_buffer_create_tag (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_create_tag"
		}"
		end

	gtk_text_buffer_cut_clipboard (a_buffer: POINTER; a_clipboard: POINTER; a_default_editable: INTEGER) is
 		-- gtk_text_buffer_cut_clipboard
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_cut_clipboard"
		}"
		end

	gtk_text_buffer_delete (a_buffer: POINTER; a_start: POINTER; an_end_external: POINTER) is
 		-- gtk_text_buffer_delete
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_delete"
		}"
		end

	gtk_text_buffer_delete_interactive (a_buffer: POINTER; a_start_iter: POINTER; an_end_iter: POINTER; a_default_editable: INTEGER): INTEGER is
 		-- gtk_text_buffer_delete_interactive
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_delete_interactive"
		}"
		end

	gtk_text_buffer_delete_mark (a_buffer: POINTER; a_mark: POINTER) is
 		-- gtk_text_buffer_delete_mark
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_delete_mark"
		}"
		end

	gtk_text_buffer_delete_mark_by_name (a_buffer: POINTER; a_name: POINTER) is
 		-- gtk_text_buffer_delete_mark_by_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_delete_mark_by_name"
		}"
		end

	gtk_text_buffer_delete_selection (a_buffer: POINTER; an_interactive: INTEGER; a_default_editable: INTEGER): INTEGER is
 		-- gtk_text_buffer_delete_selection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_delete_selection"
		}"
		end

	gtk_text_buffer_end_user_action (a_buffer: POINTER) is
 		-- gtk_text_buffer_end_user_action
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_end_user_action"
		}"
		end

	gtk_text_buffer_get_bounds (a_buffer: POINTER; a_start: POINTER; an_end_external: POINTER) is
 		-- gtk_text_buffer_get_bounds
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_bounds"
		}"
		end

	-- `hidden' function _gtk_text_buffer_get_btree skipped.
	gtk_text_buffer_get_char_count (a_buffer: POINTER): INTEGER is
 		-- gtk_text_buffer_get_char_count
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_char_count"
		}"
		end

	gtk_text_buffer_get_copy_target_list (a_buffer: POINTER): POINTER is
 		-- gtk_text_buffer_get_copy_target_list
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_copy_target_list"
		}"
		end

	gtk_text_buffer_get_end_iter (a_buffer: POINTER; an_iter: POINTER) is
 		-- gtk_text_buffer_get_end_iter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_end_iter"
		}"
		end

	gtk_text_buffer_get_has_selection (a_buffer: POINTER): INTEGER is
 		-- gtk_text_buffer_get_has_selection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_has_selection"
		}"
		end

	gtk_text_buffer_get_insert (a_buffer: POINTER): POINTER is
 		-- gtk_text_buffer_get_insert
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_insert"
		}"
		end

	gtk_text_buffer_get_iter_at_child_anchor (a_buffer: POINTER; an_iter: POINTER; an_anchor: POINTER) is
 		-- gtk_text_buffer_get_iter_at_child_anchor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_iter_at_child_anchor"
		}"
		end

	gtk_text_buffer_get_iter_at_line (a_buffer: POINTER; an_iter: POINTER; a_line_number: INTEGER) is
 		-- gtk_text_buffer_get_iter_at_line
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_iter_at_line"
		}"
		end

	gtk_text_buffer_get_iter_at_line_index (a_buffer: POINTER; an_iter: POINTER; a_line_number: INTEGER; a_byte_index: INTEGER) is
 		-- gtk_text_buffer_get_iter_at_line_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_iter_at_line_index"
		}"
		end

	gtk_text_buffer_get_iter_at_line_offset (a_buffer: POINTER; an_iter: POINTER; a_line_number: INTEGER; a_char_offset: INTEGER) is
 		-- gtk_text_buffer_get_iter_at_line_offset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_iter_at_line_offset"
		}"
		end

	gtk_text_buffer_get_iter_at_mark (a_buffer: POINTER; an_iter: POINTER; a_mark: POINTER) is
 		-- gtk_text_buffer_get_iter_at_mark
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_iter_at_mark"
		}"
		end

	gtk_text_buffer_get_iter_at_offset (a_buffer: POINTER; an_iter: POINTER; a_char_offset: INTEGER) is
 		-- gtk_text_buffer_get_iter_at_offset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_iter_at_offset"
		}"
		end

	gtk_text_buffer_get_line_count (a_buffer: POINTER): INTEGER is
 		-- gtk_text_buffer_get_line_count
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_line_count"
		}"
		end

	-- `hidden' function _gtk_text_buffer_get_line_log_attrs skipped.
	gtk_text_buffer_get_mark (a_buffer: POINTER; a_name: POINTER): POINTER is
 		-- gtk_text_buffer_get_mark
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_mark"
		}"
		end

	gtk_text_buffer_get_modified (a_buffer: POINTER): INTEGER is
 		-- gtk_text_buffer_get_modified
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_modified"
		}"
		end

	gtk_text_buffer_get_paste_target_list (a_buffer: POINTER): POINTER is
 		-- gtk_text_buffer_get_paste_target_list
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_paste_target_list"
		}"
		end

	gtk_text_buffer_get_selection_bound (a_buffer: POINTER): POINTER is
 		-- gtk_text_buffer_get_selection_bound
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_selection_bound"
		}"
		end

	gtk_text_buffer_get_selection_bounds (a_buffer: POINTER; a_start: POINTER; an_end_external: POINTER): INTEGER is
 		-- gtk_text_buffer_get_selection_bounds
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_selection_bounds"
		}"
		end

	gtk_text_buffer_get_slice (a_buffer: POINTER; a_start: POINTER; an_end_external: POINTER; an_include_hidden_chars: INTEGER): POINTER is
 		-- gtk_text_buffer_get_slice
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_slice"
		}"
		end

	gtk_text_buffer_get_start_iter (a_buffer: POINTER; an_iter: POINTER) is
 		-- gtk_text_buffer_get_start_iter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_start_iter"
		}"
		end

	gtk_text_buffer_get_tag_table (a_buffer: POINTER): POINTER is
 		-- gtk_text_buffer_get_tag_table
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_tag_table"
		}"
		end

	gtk_text_buffer_get_text (a_buffer: POINTER; a_start: POINTER; an_end_external: POINTER; an_include_hidden_chars: INTEGER): POINTER is
 		-- gtk_text_buffer_get_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_text"
		}"
		end

	gtk_text_buffer_get_type: like long_unsigned is
 		-- gtk_text_buffer_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_type()"
		}"
		end

	gtk_text_buffer_insert (a_buffer: POINTER; an_iter: POINTER; a_text: POINTER; a_len: INTEGER) is
 		-- gtk_text_buffer_insert
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert"
		}"
		end

	gtk_text_buffer_insert_at_cursor (a_buffer: POINTER; a_text: POINTER; a_len: INTEGER) is
 		-- gtk_text_buffer_insert_at_cursor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_at_cursor"
		}"
		end

	gtk_text_buffer_insert_child_anchor (a_buffer: POINTER; an_iter: POINTER; an_anchor: POINTER) is
 		-- gtk_text_buffer_insert_child_anchor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_child_anchor"
		}"
		end

	gtk_text_buffer_insert_interactive (a_buffer: POINTER; an_iter: POINTER; a_text: POINTER; a_len: INTEGER; a_default_editable: INTEGER): INTEGER is
 		-- gtk_text_buffer_insert_interactive
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_interactive"
		}"
		end

	gtk_text_buffer_insert_interactive_at_cursor (a_buffer: POINTER; a_text: POINTER; a_len: INTEGER; a_default_editable: INTEGER): INTEGER is
 		-- gtk_text_buffer_insert_interactive_at_cursor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_interactive_at_cursor"
		}"
		end

	gtk_text_buffer_insert_pixbuf (a_buffer: POINTER; an_iter: POINTER; a_pixbuf: POINTER) is
 		-- gtk_text_buffer_insert_pixbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_pixbuf"
		}"
		end

	gtk_text_buffer_insert_range (a_buffer: POINTER; an_iter: POINTER; a_start: POINTER; an_end_external: POINTER) is
 		-- gtk_text_buffer_insert_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_range"
		}"
		end

	gtk_text_buffer_insert_range_interactive (a_buffer: POINTER; an_iter: POINTER; a_start: POINTER; an_end_external: POINTER; a_default_editable: INTEGER): INTEGER is
 		-- gtk_text_buffer_insert_range_interactive
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_range_interactive"
		}"
		end

	gtk_text_buffer_insert_with_tags (a_buffer: POINTER; an_iter: POINTER; a_text: POINTER; a_len: INTEGER; a_first_tag: POINTER) is
 		-- gtk_text_buffer_insert_with_tags (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_with_tags"
		}"
		end

	gtk_text_buffer_insert_with_tags_by_name (a_buffer: POINTER; an_iter: POINTER; a_text: POINTER; a_len: INTEGER; a_first_tag_name: POINTER) is
 		-- gtk_text_buffer_insert_with_tags_by_name (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_insert_with_tags_by_name"
		}"
		end

	gtk_text_buffer_move_mark (a_buffer: POINTER; a_mark: POINTER; a_where: POINTER) is
 		-- gtk_text_buffer_move_mark
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_move_mark"
		}"
		end

	gtk_text_buffer_move_mark_by_name (a_buffer: POINTER; a_name: POINTER; a_where: POINTER) is
 		-- gtk_text_buffer_move_mark_by_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_move_mark_by_name"
		}"
		end

	gtk_text_buffer_new (a_table: POINTER): POINTER is
 		-- gtk_text_buffer_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_new"
		}"
		end

	-- `hidden' function _gtk_text_buffer_notify_will_remove_tag skipped.
	gtk_text_buffer_paste_clipboard (a_buffer: POINTER; a_clipboard: POINTER; an_override_location: POINTER; a_default_editable: INTEGER) is
 		-- gtk_text_buffer_paste_clipboard
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_paste_clipboard"
		}"
		end

	gtk_text_buffer_place_cursor (a_buffer: POINTER; a_where: POINTER) is
 		-- gtk_text_buffer_place_cursor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_place_cursor"
		}"
		end

	gtk_text_buffer_remove_all_tags (a_buffer: POINTER; a_start: POINTER; an_end_external: POINTER) is
 		-- gtk_text_buffer_remove_all_tags
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_remove_all_tags"
		}"
		end

	gtk_text_buffer_remove_selection_clipboard (a_buffer: POINTER; a_clipboard: POINTER) is
 		-- gtk_text_buffer_remove_selection_clipboard
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_remove_selection_clipboard"
		}"
		end

	gtk_text_buffer_remove_tag (a_buffer: POINTER; a_tag: POINTER; a_start: POINTER; an_end_external: POINTER) is
 		-- gtk_text_buffer_remove_tag
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_remove_tag"
		}"
		end

	gtk_text_buffer_remove_tag_by_name (a_buffer: POINTER; a_name: POINTER; a_start: POINTER; an_end_external: POINTER) is
 		-- gtk_text_buffer_remove_tag_by_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_remove_tag_by_name"
		}"
		end

	gtk_text_buffer_select_range (a_buffer: POINTER; an_ins: POINTER; a_bound: POINTER) is
 		-- gtk_text_buffer_select_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_select_range"
		}"
		end

	gtk_text_buffer_set_modified (a_buffer: POINTER; a_setting: INTEGER) is
 		-- gtk_text_buffer_set_modified
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_set_modified"
		}"
		end

	gtk_text_buffer_set_text (a_buffer: POINTER; a_text: POINTER; a_len: INTEGER) is
 		-- gtk_text_buffer_set_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_set_text"
		}"
		end

	-- `hidden' function _gtk_text_buffer_spew skipped.

end -- class GTKTEXTBUFFER_EXTERNALS
