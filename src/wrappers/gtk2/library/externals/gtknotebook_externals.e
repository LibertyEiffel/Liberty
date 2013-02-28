-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKNOTEBOOK_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_notebook_set_show_border (a_notebook: POINTER; a_show_border: INTEGER_32) is
 		-- gtk_notebook_set_show_border (node at line 3531)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_show_border"
		}"
		end

	gtk_notebook_get_menu_label_text (a_notebook: POINTER; a_child: POINTER): POINTER is
 		-- gtk_notebook_get_menu_label_text (node at line 4348)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_menu_label_text"
		}"
		end

	gtk_notebook_get_action_widget (a_notebook: POINTER; a_pack_type: INTEGER): POINTER is
 		-- gtk_notebook_get_action_widget (node at line 5729)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_action_widget"
		}"
		end

	gtk_notebook_set_menu_label (a_notebook: POINTER; a_child: POINTER; a_menu_label: POINTER) is
 		-- gtk_notebook_set_menu_label (node at line 6076)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_menu_label"
		}"
		end

	gtk_notebook_prepend_page_menu (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER; a_menu_label: POINTER): INTEGER_32 is
 		-- gtk_notebook_prepend_page_menu (node at line 7082)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_prepend_page_menu"
		}"
		end

	gtk_notebook_set_tab_reorderable (a_notebook: POINTER; a_child: POINTER; a_reorderable: INTEGER_32) is
 		-- gtk_notebook_set_tab_reorderable (node at line 9762)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_reorderable"
		}"
		end

	gtk_notebook_get_tab_pos (a_notebook: POINTER): INTEGER is
 		-- gtk_notebook_get_tab_pos (node at line 10586)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_pos"
		}"
		end

	gtk_notebook_set_action_widget (a_notebook: POINTER; a_widget: POINTER; a_pack_type: INTEGER) is
 		-- gtk_notebook_set_action_widget (node at line 12635)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_action_widget"
		}"
		end

	gtk_notebook_insert_page (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER; a_position: INTEGER_32): INTEGER_32 is
 		-- gtk_notebook_insert_page (node at line 14398)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_insert_page"
		}"
		end

	gtk_notebook_reorder_child (a_notebook: POINTER; a_child: POINTER; a_position: INTEGER_32) is
 		-- gtk_notebook_reorder_child (node at line 15884)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_reorder_child"
		}"
		end

	gtk_notebook_set_tab_pos (a_notebook: POINTER; a_pos: INTEGER) is
 		-- gtk_notebook_set_tab_pos (node at line 17455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_pos"
		}"
		end

	gtk_notebook_get_tab_label (a_notebook: POINTER; a_child: POINTER): POINTER is
 		-- gtk_notebook_get_tab_label (node at line 18136)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_label"
		}"
		end

	gtk_notebook_get_n_pages (a_notebook: POINTER): INTEGER_32 is
 		-- gtk_notebook_get_n_pages (node at line 18868)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_n_pages"
		}"
		end

	gtk_notebook_get_show_tabs (a_notebook: POINTER): INTEGER_32 is
 		-- gtk_notebook_get_show_tabs (node at line 19396)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_show_tabs"
		}"
		end

	gtk_notebook_insert_page_menu (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER; a_menu_label: POINTER; a_position: INTEGER_32): INTEGER_32 is
 		-- gtk_notebook_insert_page_menu (node at line 19902)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_insert_page_menu"
		}"
		end

	gtk_notebook_page_num (a_notebook: POINTER; a_child: POINTER): INTEGER_32 is
 		-- gtk_notebook_page_num (node at line 19996)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_page_num"
		}"
		end

	gtk_notebook_get_current_page (a_notebook: POINTER): INTEGER_32 is
 		-- gtk_notebook_get_current_page (node at line 21107)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_current_page"
		}"
		end

	gtk_notebook_prev_page (a_notebook: POINTER) is
 		-- gtk_notebook_prev_page (node at line 21386)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_prev_page"
		}"
		end

	gtk_notebook_set_tab_label (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER) is
 		-- gtk_notebook_set_tab_label (node at line 22645)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_label"
		}"
		end

	gtk_notebook_get_tab_reorderable (a_notebook: POINTER; a_child: POINTER): INTEGER_32 is
 		-- gtk_notebook_get_tab_reorderable (node at line 22965)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_reorderable"
		}"
		end

	gtk_notebook_append_page_menu (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER; a_menu_label: POINTER): INTEGER_32 is
 		-- gtk_notebook_append_page_menu (node at line 23294)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_append_page_menu"
		}"
		end

	gtk_notebook_set_show_tabs (a_notebook: POINTER; a_show_tabs: INTEGER_32) is
 		-- gtk_notebook_set_show_tabs (node at line 23857)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_show_tabs"
		}"
		end

	gtk_notebook_get_tab_detachable (a_notebook: POINTER; a_child: POINTER): INTEGER_32 is
 		-- gtk_notebook_get_tab_detachable (node at line 24276)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_detachable"
		}"
		end

	gtk_notebook_remove_page (a_notebook: POINTER; a_page_num: INTEGER_32) is
 		-- gtk_notebook_remove_page (node at line 24333)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_remove_page"
		}"
		end

	gtk_notebook_set_tab_label_text (a_notebook: POINTER; a_child: POINTER; a_tab_text: POINTER) is
 		-- gtk_notebook_set_tab_label_text (node at line 26392)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_label_text"
		}"
		end

	gtk_notebook_get_show_border (a_notebook: POINTER): INTEGER_32 is
 		-- gtk_notebook_get_show_border (node at line 26689)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_show_border"
		}"
		end

	gtk_notebook_append_page (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER): INTEGER_32 is
 		-- gtk_notebook_append_page (node at line 26797)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_append_page"
		}"
		end

	gtk_notebook_get_tab_hborder (a_notebook: POINTER): NATURAL_16 is
 		-- gtk_notebook_get_tab_hborder (node at line 26803)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_hborder"
		}"
		end

	gtk_notebook_get_nth_page (a_notebook: POINTER; a_page_num: INTEGER_32): POINTER is
 		-- gtk_notebook_get_nth_page (node at line 27692)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_nth_page"
		}"
		end

	gtk_notebook_popup_disable (a_notebook: POINTER) is
 		-- gtk_notebook_popup_disable (node at line 29005)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_popup_disable"
		}"
		end

	gtk_notebook_set_current_page (a_notebook: POINTER; a_page_num: INTEGER_32) is
 		-- gtk_notebook_set_current_page (node at line 29778)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_current_page"
		}"
		end

	gtk_notebook_set_scrollable (a_notebook: POINTER; a_scrollable: INTEGER_32) is
 		-- gtk_notebook_set_scrollable (node at line 30449)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_scrollable"
		}"
		end

	gtk_notebook_set_tab_detachable (a_notebook: POINTER; a_child: POINTER; a_detachable: INTEGER_32) is
 		-- gtk_notebook_set_tab_detachable (node at line 33192)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_detachable"
		}"
		end

	gtk_notebook_set_menu_label_text (a_notebook: POINTER; a_child: POINTER; a_menu_text: POINTER) is
 		-- gtk_notebook_set_menu_label_text (node at line 33543)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_menu_label_text"
		}"
		end

	gtk_notebook_new: POINTER is
 		-- gtk_notebook_new (node at line 34579)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_new()"
		}"
		end

	gtk_notebook_get_group_name (a_notebook: POINTER): POINTER is
 		-- gtk_notebook_get_group_name (node at line 34999)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_group_name"
		}"
		end

	gtk_notebook_get_tab_vborder (a_notebook: POINTER): NATURAL_16 is
 		-- gtk_notebook_get_tab_vborder (node at line 35665)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_vborder"
		}"
		end

	gtk_notebook_get_tab_label_text (a_notebook: POINTER; a_child: POINTER): POINTER is
 		-- gtk_notebook_get_tab_label_text (node at line 35701)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_label_text"
		}"
		end

	gtk_notebook_get_type: NATURAL_64 is
 		-- gtk_notebook_get_type (node at line 36000)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_type()"
		}"
		end

	gtk_notebook_get_scrollable (a_notebook: POINTER): INTEGER_32 is
 		-- gtk_notebook_get_scrollable (node at line 36131)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_scrollable"
		}"
		end

	gtk_notebook_get_menu_label (a_notebook: POINTER; a_child: POINTER): POINTER is
 		-- gtk_notebook_get_menu_label (node at line 36741)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_menu_label"
		}"
		end

	gtk_notebook_next_page (a_notebook: POINTER) is
 		-- gtk_notebook_next_page (node at line 39338)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_next_page"
		}"
		end

	gtk_notebook_popup_enable (a_notebook: POINTER) is
 		-- gtk_notebook_popup_enable (node at line 39818)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_popup_enable"
		}"
		end

	gtk_notebook_set_group_name (a_notebook: POINTER; a_group_name: POINTER) is
 		-- gtk_notebook_set_group_name (node at line 40154)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_group_name"
		}"
		end

	gtk_notebook_prepend_page (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER): INTEGER_32 is
 		-- gtk_notebook_prepend_page (node at line 40822)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_prepend_page"
		}"
		end


end -- class GTKNOTEBOOK_EXTERNALS
