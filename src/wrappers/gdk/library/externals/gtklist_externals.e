-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKLIST_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_list_select_all (a_list: POINTER) is
 		-- gtk_list_select_all (node at line 6720)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_select_all"
		}"
		end

	gtk_list_start_selection (a_list: POINTER) is
 		-- gtk_list_start_selection (node at line 6815)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_start_selection"
		}"
		end

	gtk_list_scroll_horizontal (a_list: POINTER; a_scroll_type: INTEGER; a_position: REAL_32) is
 		-- gtk_list_scroll_horizontal (node at line 7442)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_scroll_horizontal"
		}"
		end

	gtk_list_toggle_row (a_list: POINTER; an_item: POINTER) is
 		-- gtk_list_toggle_row (node at line 7548)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_toggle_row"
		}"
		end

	gtk_list_toggle_add_mode (a_list: POINTER) is
 		-- gtk_list_toggle_add_mode (node at line 9460)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_toggle_add_mode"
		}"
		end

	gtk_list_insert_items (a_list: POINTER; an_items: POINTER; a_position: INTEGER_32) is
 		-- gtk_list_insert_items (node at line 9777)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_insert_items"
		}"
		end

	gtk_list_extend_selection (a_list: POINTER; a_scroll_type: INTEGER; a_position: REAL_32; an_auto_start_selection: INTEGER_32) is
 		-- gtk_list_extend_selection (node at line 13063)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_extend_selection"
		}"
		end

	gtk_list_scroll_vertical (a_list: POINTER; a_scroll_type: INTEGER; a_position: REAL_32) is
 		-- gtk_list_scroll_vertical (node at line 15349)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_scroll_vertical"
		}"
		end

	gtk_list_end_selection (a_list: POINTER) is
 		-- gtk_list_end_selection (node at line 15383)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_end_selection"
		}"
		end

	gtk_list_prepend_items (a_list: POINTER; an_items: POINTER) is
 		-- gtk_list_prepend_items (node at line 15625)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_prepend_items"
		}"
		end

	gtk_list_toggle_focus_row (a_list: POINTER) is
 		-- gtk_list_toggle_focus_row (node at line 15847)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_toggle_focus_row"
		}"
		end

	gtk_list_append_items (a_list: POINTER; an_items: POINTER) is
 		-- gtk_list_append_items (node at line 16917)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_append_items"
		}"
		end

	gtk_list_remove_items (a_list: POINTER; an_items: POINTER) is
 		-- gtk_list_remove_items (node at line 18923)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_remove_items"
		}"
		end

	gtk_list_remove_items_no_unref (a_list: POINTER; an_items: POINTER) is
 		-- gtk_list_remove_items_no_unref (node at line 19847)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_remove_items_no_unref"
		}"
		end

	gtk_list_set_selection_mode (a_list: POINTER; a_mode: INTEGER) is
 		-- gtk_list_set_selection_mode (node at line 20939)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_set_selection_mode"
		}"
		end

	gtk_list_select_item (a_list: POINTER; an_item: INTEGER_32) is
 		-- gtk_list_select_item (node at line 21378)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_select_item"
		}"
		end

	gtk_list_unselect_all (a_list: POINTER) is
 		-- gtk_list_unselect_all (node at line 24659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_unselect_all"
		}"
		end

	gtk_list_end_drag_selection (a_list: POINTER) is
 		-- gtk_list_end_drag_selection (node at line 28369)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_end_drag_selection"
		}"
		end

	gtk_list_new: POINTER is
 		-- gtk_list_new (node at line 29329)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_new()"
		}"
		end

	gtk_list_select_child (a_list: POINTER; a_child: POINTER) is
 		-- gtk_list_select_child (node at line 33210)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_select_child"
		}"
		end

	gtk_list_unselect_child (a_list: POINTER; a_child: POINTER) is
 		-- gtk_list_unselect_child (node at line 33343)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_unselect_child"
		}"
		end

	gtk_list_get_type: NATURAL_32 is
 		-- gtk_list_get_type (node at line 33812)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_get_type()"
		}"
		end

	gtk_list_clear_items (a_list: POINTER; a_start: INTEGER_32; an_end_external: INTEGER_32) is
 		-- gtk_list_clear_items (node at line 35360)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_clear_items"
		}"
		end

	gtk_list_child_position (a_list: POINTER; a_child: POINTER): INTEGER_32 is
 		-- gtk_list_child_position (node at line 36242)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_child_position"
		}"
		end

	gtk_list_undo_selection (a_list: POINTER) is
 		-- gtk_list_undo_selection (node at line 36695)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_undo_selection"
		}"
		end

	gtk_list_unselect_item (a_list: POINTER; an_item: INTEGER_32) is
 		-- gtk_list_unselect_item (node at line 36950)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_unselect_item"
		}"
		end


end -- class GTKLIST_EXTERNALS
