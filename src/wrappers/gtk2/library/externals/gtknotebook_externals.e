-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKNOTEBOOK_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_notebook_append_page (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER): INTEGER is
 		-- gtk_notebook_append_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_append_page"
		}"
		end

	gtk_notebook_append_page_menu (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER; a_menu_label: POINTER): INTEGER is
 		-- gtk_notebook_append_page_menu
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_append_page_menu"
		}"
		end

	gtk_notebook_get_action_widget (a_notebook: POINTER; a_pack_type: INTEGER): POINTER is
 		-- gtk_notebook_get_action_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_action_widget"
		}"
		end

	gtk_notebook_get_current_page (a_notebook: POINTER): INTEGER is
 		-- gtk_notebook_get_current_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_current_page"
		}"
		end

	gtk_notebook_get_group_name (a_notebook: POINTER): POINTER is
 		-- gtk_notebook_get_group_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_group_name"
		}"
		end

	gtk_notebook_get_menu_label (a_notebook: POINTER; a_child: POINTER): POINTER is
 		-- gtk_notebook_get_menu_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_menu_label"
		}"
		end

	gtk_notebook_get_menu_label_text (a_notebook: POINTER; a_child: POINTER): POINTER is
 		-- gtk_notebook_get_menu_label_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_menu_label_text"
		}"
		end

	gtk_notebook_get_n_pages (a_notebook: POINTER): INTEGER is
 		-- gtk_notebook_get_n_pages
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_n_pages"
		}"
		end

	gtk_notebook_get_nth_page (a_notebook: POINTER; a_page_num: INTEGER): POINTER is
 		-- gtk_notebook_get_nth_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_nth_page"
		}"
		end

	gtk_notebook_get_scrollable (a_notebook: POINTER): INTEGER is
 		-- gtk_notebook_get_scrollable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_scrollable"
		}"
		end

	gtk_notebook_get_show_border (a_notebook: POINTER): INTEGER is
 		-- gtk_notebook_get_show_border
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_show_border"
		}"
		end

	gtk_notebook_get_show_tabs (a_notebook: POINTER): INTEGER is
 		-- gtk_notebook_get_show_tabs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_show_tabs"
		}"
		end

	gtk_notebook_get_tab_detachable (a_notebook: POINTER; a_child: POINTER): INTEGER is
 		-- gtk_notebook_get_tab_detachable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_detachable"
		}"
		end

	gtk_notebook_get_tab_hborder (a_notebook: POINTER): NATURAL_16 is
 		-- gtk_notebook_get_tab_hborder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_hborder"
		}"
		end

	gtk_notebook_get_tab_label (a_notebook: POINTER; a_child: POINTER): POINTER is
 		-- gtk_notebook_get_tab_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_label"
		}"
		end

	gtk_notebook_get_tab_label_text (a_notebook: POINTER; a_child: POINTER): POINTER is
 		-- gtk_notebook_get_tab_label_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_label_text"
		}"
		end

	gtk_notebook_get_tab_pos (a_notebook: POINTER): INTEGER is
 		-- gtk_notebook_get_tab_pos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_pos"
		}"
		end

	gtk_notebook_get_tab_reorderable (a_notebook: POINTER; a_child: POINTER): INTEGER is
 		-- gtk_notebook_get_tab_reorderable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_reorderable"
		}"
		end

	gtk_notebook_get_tab_vborder (a_notebook: POINTER): NATURAL_16 is
 		-- gtk_notebook_get_tab_vborder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_tab_vborder"
		}"
		end

	gtk_notebook_get_type: like long_unsigned is
 		-- gtk_notebook_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_get_type()"
		}"
		end

	gtk_notebook_insert_page (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER; a_position: INTEGER): INTEGER is
 		-- gtk_notebook_insert_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_insert_page"
		}"
		end

	gtk_notebook_insert_page_menu (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER; a_menu_label: POINTER; a_position: INTEGER): INTEGER is
 		-- gtk_notebook_insert_page_menu
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_insert_page_menu"
		}"
		end

	gtk_notebook_new: POINTER is
 		-- gtk_notebook_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_new()"
		}"
		end

	gtk_notebook_next_page (a_notebook: POINTER) is
 		-- gtk_notebook_next_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_next_page"
		}"
		end

	gtk_notebook_page_num (a_notebook: POINTER; a_child: POINTER): INTEGER is
 		-- gtk_notebook_page_num
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_page_num"
		}"
		end

	gtk_notebook_popup_disable (a_notebook: POINTER) is
 		-- gtk_notebook_popup_disable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_popup_disable"
		}"
		end

	gtk_notebook_popup_enable (a_notebook: POINTER) is
 		-- gtk_notebook_popup_enable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_popup_enable"
		}"
		end

	gtk_notebook_prepend_page (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER): INTEGER is
 		-- gtk_notebook_prepend_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_prepend_page"
		}"
		end

	gtk_notebook_prepend_page_menu (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER; a_menu_label: POINTER): INTEGER is
 		-- gtk_notebook_prepend_page_menu
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_prepend_page_menu"
		}"
		end

	gtk_notebook_prev_page (a_notebook: POINTER) is
 		-- gtk_notebook_prev_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_prev_page"
		}"
		end

	gtk_notebook_remove_page (a_notebook: POINTER; a_page_num: INTEGER) is
 		-- gtk_notebook_remove_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_remove_page"
		}"
		end

	gtk_notebook_reorder_child (a_notebook: POINTER; a_child: POINTER; a_position: INTEGER) is
 		-- gtk_notebook_reorder_child
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_reorder_child"
		}"
		end

	gtk_notebook_set_action_widget (a_notebook: POINTER; a_widget: POINTER; a_pack_type: INTEGER) is
 		-- gtk_notebook_set_action_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_action_widget"
		}"
		end

	gtk_notebook_set_current_page (a_notebook: POINTER; a_page_num: INTEGER) is
 		-- gtk_notebook_set_current_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_current_page"
		}"
		end

	gtk_notebook_set_group_name (a_notebook: POINTER; a_group_name: POINTER) is
 		-- gtk_notebook_set_group_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_group_name"
		}"
		end

	gtk_notebook_set_menu_label (a_notebook: POINTER; a_child: POINTER; a_menu_label: POINTER) is
 		-- gtk_notebook_set_menu_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_menu_label"
		}"
		end

	gtk_notebook_set_menu_label_text (a_notebook: POINTER; a_child: POINTER; a_menu_text: POINTER) is
 		-- gtk_notebook_set_menu_label_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_menu_label_text"
		}"
		end

	gtk_notebook_set_scrollable (a_notebook: POINTER; a_scrollable: INTEGER) is
 		-- gtk_notebook_set_scrollable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_scrollable"
		}"
		end

	gtk_notebook_set_show_border (a_notebook: POINTER; a_show_border: INTEGER) is
 		-- gtk_notebook_set_show_border
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_show_border"
		}"
		end

	gtk_notebook_set_show_tabs (a_notebook: POINTER; a_show_tabs: INTEGER) is
 		-- gtk_notebook_set_show_tabs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_show_tabs"
		}"
		end

	gtk_notebook_set_tab_detachable (a_notebook: POINTER; a_child: POINTER; a_detachable: INTEGER) is
 		-- gtk_notebook_set_tab_detachable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_detachable"
		}"
		end

	gtk_notebook_set_tab_label (a_notebook: POINTER; a_child: POINTER; a_tab_label: POINTER) is
 		-- gtk_notebook_set_tab_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_label"
		}"
		end

	gtk_notebook_set_tab_label_text (a_notebook: POINTER; a_child: POINTER; a_tab_text: POINTER) is
 		-- gtk_notebook_set_tab_label_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_label_text"
		}"
		end

	gtk_notebook_set_tab_pos (a_notebook: POINTER; a_pos: INTEGER) is
 		-- gtk_notebook_set_tab_pos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_pos"
		}"
		end

	gtk_notebook_set_tab_reorderable (a_notebook: POINTER; a_child: POINTER; a_reorderable: INTEGER) is
 		-- gtk_notebook_set_tab_reorderable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_notebook_set_tab_reorderable"
		}"
		end


end -- class GTKNOTEBOOK_EXTERNALS
