-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKNOTEBOOK_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_notebook_set_show_border (a_notebook: POINTER; a_show_border: INTEGER_32) is
 		-- gtk_notebook_set_show_border (node at line 3444)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_show_border"
		}"
		end

	gtk_notebook_get_menu_label_text (a_notebook: POINTER; a_child: POINTER): POINTER is
 		-- gtk_notebook_get_menu_label_text (node at line 4168)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_menu_label_text"
		}"
		end

	gtk_notebook_get_action_widget (a_notebook: POINTER; a_pack_type: INTEGER): POINTER is
 		-- gtk_notebook_get_action_widget (node at line 5480)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_action_widget"
		}"
		end

	gtk_notebook_set_menu_label (a_notebook: POINTER; a_child: POINTER; a_menu_label: POINTER) is
 		-- gtk_notebook_set_menu_label (node at line 5780)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_menu_label"
		}"
		end

	gtk_notebook_get_group (a_notebook: POINTER): POINTER is
 		-- gtk_notebook_get_group (node at line 6263)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_group"
		}"
		end

	gtk_notebook_prepend_page_menu (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER; a_menu_label: POINTER): INTEGER_32 is
 		-- gtk_notebook_prepend_page_menu (node at line 6490)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_prepend_page_menu"
		}"
		end

	gtk_notebook_get_type: NATURAL_32 is
 		-- gtk_notebook_get_type (node at line 6588)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_type()"
		}"
		end

	gtk_notebook_set_tab_border (a_notebook: POINTER; a_border_width: NATURAL_32) is
 		-- gtk_notebook_set_tab_border (node at line 7411)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_border"
		}"
		end

	gtk_notebook_get_scrollable (a_notebook: POINTER): INTEGER_32 is
 		-- gtk_notebook_get_scrollable (node at line 8631)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_scrollable"
		}"
		end

	gtk_notebook_set_tab_reorderable (a_notebook: POINTER; a_child: POINTER; a_reorderable: INTEGER_32) is
 		-- gtk_notebook_set_tab_reorderable (node at line 9001)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_reorderable"
		}"
		end

	gtk_notebook_get_tab_pos (a_notebook: POINTER): INTEGER is
 		-- gtk_notebook_get_tab_pos (node at line 9799)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_pos"
		}"
		end

	gtk_notebook_set_action_widget (a_notebook: POINTER; a_widget: POINTER; a_pack_type: INTEGER) is
 		-- gtk_notebook_set_action_widget (node at line 11587)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_action_widget"
		}"
		end

	gtk_notebook_set_tab_hborder (a_notebook: POINTER; a_tab_hborder: NATURAL_32) is
 		-- gtk_notebook_set_tab_hborder (node at line 11614)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_hborder"
		}"
		end

	gtk_notebook_insert_page (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER; a_position: INTEGER_32): INTEGER_32 is
 		-- gtk_notebook_insert_page (node at line 13277)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_insert_page"
		}"
		end

	gtk_notebook_query_tab_label_packing (a_notebook: POINTER; a_child: POINTER; an_expand: POINTER; a_fill: POINTER; a_pack_type: POINTER) is
 		-- gtk_notebook_query_tab_label_packing (node at line 14000)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_query_tab_label_packing"
		}"
		end

	gtk_notebook_reorder_child (a_notebook: POINTER; a_child: POINTER; a_position: INTEGER_32) is
 		-- gtk_notebook_reorder_child (node at line 14687)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_reorder_child"
		}"
		end

	gtk_notebook_set_group (a_notebook: POINTER; a_group: POINTER) is
 		-- gtk_notebook_set_group (node at line 15503)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_group"
		}"
		end

	gtk_notebook_set_tab_pos (a_notebook: POINTER; a_pos: INTEGER) is
 		-- gtk_notebook_set_tab_pos (node at line 16063)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_pos"
		}"
		end

	gtk_notebook_get_tab_label_text (a_notebook: POINTER; a_child: POINTER): POINTER is
 		-- gtk_notebook_get_tab_label_text (node at line 16119)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_label_text"
		}"
		end

	gtk_notebook_get_tab_label (a_notebook: POINTER; a_child: POINTER): POINTER is
 		-- gtk_notebook_get_tab_label (node at line 16668)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_label"
		}"
		end

	gtk_notebook_get_show_border (a_notebook: POINTER): INTEGER_32 is
 		-- gtk_notebook_get_show_border (node at line 17016)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_show_border"
		}"
		end

	gtk_notebook_get_show_tabs (a_notebook: POINTER): INTEGER_32 is
 		-- gtk_notebook_get_show_tabs (node at line 17687)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_show_tabs"
		}"
		end

	gtk_notebook_insert_page_menu (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER; a_menu_label: POINTER; a_position: INTEGER_32): INTEGER_32 is
 		-- gtk_notebook_insert_page_menu (node at line 18212)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_insert_page_menu"
		}"
		end

	gtk_notebook_page_num (a_notebook: POINTER; a_child: POINTER): INTEGER_32 is
 		-- gtk_notebook_page_num (node at line 18317)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_page_num"
		}"
		end

	gtk_notebook_get_current_page (a_notebook: POINTER): INTEGER_32 is
 		-- gtk_notebook_get_current_page (node at line 19252)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_current_page"
		}"
		end

	gtk_notebook_prev_page (a_notebook: POINTER) is
 		-- gtk_notebook_prev_page (node at line 19483)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_prev_page"
		}"
		end

	gtk_notebook_set_tab_vborder (a_notebook: POINTER; a_tab_vborder: NATURAL_32) is
 		-- gtk_notebook_set_tab_vborder (node at line 19701)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_vborder"
		}"
		end

	gtk_notebook_set_tab_label (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER) is
 		-- gtk_notebook_set_tab_label (node at line 20549)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_label"
		}"
		end

	gtk_notebook_get_tab_reorderable (a_notebook: POINTER; a_child: POINTER): INTEGER_32 is
 		-- gtk_notebook_get_tab_reorderable (node at line 20848)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_reorderable"
		}"
		end

	gtk_notebook_popup_disable (a_notebook: POINTER) is
 		-- gtk_notebook_popup_disable (node at line 21057)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_popup_disable"
		}"
		end

	gtk_notebook_set_window_creation_hook (a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_notebook_set_window_creation_hook (node at line 21398)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_window_creation_hook"
		}"
		end

	gtk_notebook_set_show_tabs (a_notebook: POINTER; a_show_tabs: INTEGER_32) is
 		-- gtk_notebook_set_show_tabs (node at line 21627)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_show_tabs"
		}"
		end

	gtk_notebook_get_tab_detachable (a_notebook: POINTER; a_child: POINTER): INTEGER_32 is
 		-- gtk_notebook_get_tab_detachable (node at line 22035)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_detachable"
		}"
		end

	gtk_notebook_remove_page (a_notebook: POINTER; a_page_num: INTEGER_32) is
 		-- gtk_notebook_remove_page (node at line 22090)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_remove_page"
		}"
		end

	gtk_notebook_set_group_id (a_notebook: POINTER; a_group_id: INTEGER_32) is
 		-- gtk_notebook_set_group_id (node at line 22570)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_group_id"
		}"
		end

	gtk_notebook_new: POINTER is
 		-- gtk_notebook_new (node at line 23335)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_new()"
		}"
		end

	gtk_notebook_get_group_id (a_notebook: POINTER): INTEGER_32 is
 		-- gtk_notebook_get_group_id (node at line 23530)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_group_id"
		}"
		end

	gtk_notebook_set_tab_label_text (a_notebook: POINTER; a_child: POINTER; a_tab_text: POINTER) is
 		-- gtk_notebook_set_tab_label_text (node at line 23917)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_label_text"
		}"
		end

	gtk_notebook_append_page (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER): INTEGER_32 is
 		-- gtk_notebook_append_page (node at line 24266)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_append_page"
		}"
		end

	gtk_notebook_get_nth_page (a_notebook: POINTER; a_page_num: INTEGER_32): POINTER is
 		-- gtk_notebook_get_nth_page (node at line 24974)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_nth_page"
		}"
		end

	gtk_notebook_set_current_page (a_notebook: POINTER; a_page_num: INTEGER_32) is
 		-- gtk_notebook_set_current_page (node at line 26975)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_current_page"
		}"
		end

	gtk_notebook_set_scrollable (a_notebook: POINTER; a_scrollable: INTEGER_32) is
 		-- gtk_notebook_set_scrollable (node at line 27576)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_scrollable"
		}"
		end

	gtk_notebook_get_n_pages (a_notebook: POINTER): INTEGER_32 is
 		-- gtk_notebook_get_n_pages (node at line 28890)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_n_pages"
		}"
		end

	gtk_notebook_set_tab_detachable (a_notebook: POINTER; a_child: POINTER; a_detachable: INTEGER_32) is
 		-- gtk_notebook_set_tab_detachable (node at line 30101)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_detachable"
		}"
		end

	gtk_notebook_set_menu_label_text (a_notebook: POINTER; a_child: POINTER; a_menu_text: POINTER) is
 		-- gtk_notebook_set_menu_label_text (node at line 30378)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_menu_label_text"
		}"
		end

	gtk_notebook_append_page_menu (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER; a_menu_label: POINTER): INTEGER_32 is
 		-- gtk_notebook_append_page_menu (node at line 31412)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_append_page_menu"
		}"
		end

	gtk_notebook_set_homogeneous_tabs (a_notebook: POINTER; a_homogeneous: INTEGER_32) is
 		-- gtk_notebook_set_homogeneous_tabs (node at line 35406)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_homogeneous_tabs"
		}"
		end

	gtk_notebook_next_page (a_notebook: POINTER) is
 		-- gtk_notebook_next_page (node at line 35746)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_next_page"
		}"
		end

	gtk_notebook_popup_enable (a_notebook: POINTER) is
 		-- gtk_notebook_popup_enable (node at line 36206)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_popup_enable"
		}"
		end

	gtk_notebook_set_tab_label_packing (a_notebook: POINTER; a_child: POINTER; an_expand: INTEGER_32; a_fill: INTEGER_32; a_pack_type: INTEGER) is
 		-- gtk_notebook_set_tab_label_packing (node at line 37083)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_label_packing"
		}"
		end

	gtk_notebook_prepend_page (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER): INTEGER_32 is
 		-- gtk_notebook_prepend_page (node at line 37139)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_prepend_page"
		}"
		end

	gtk_notebook_get_menu_label (a_notebook: POINTER; a_child: POINTER): POINTER is
 		-- gtk_notebook_get_menu_label (node at line 37465)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_menu_label"
		}"
		end


end -- class GTKNOTEBOOK_EXTERNALS
