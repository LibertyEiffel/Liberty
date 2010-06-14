-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRECENTCHOOSER_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_recent_chooser_set_filter (a_chooser: POINTER; a_filter: POINTER) is
 		-- gtk_recent_chooser_set_filter (node at line 394)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_filter"
		}"
		end

	gtk_recent_chooser_get_sort_type (a_chooser: POINTER): INTEGER is
 		-- gtk_recent_chooser_get_sort_type (node at line 2281)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_sort_type"
		}"
		end

	gtk_recent_chooser_get_type: NATURAL_32 is
 		-- gtk_recent_chooser_get_type (node at line 2344)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_type()"
		}"
		end

	gtk_recent_chooser_get_select_multiple (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_get_select_multiple (node at line 3801)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_select_multiple"
		}"
		end

	gtk_recent_chooser_select_all (a_chooser: POINTER) is
 		-- gtk_recent_chooser_select_all (node at line 5585)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_select_all"
		}"
		end

	gtk_recent_chooser_select_uri (a_chooser: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_select_uri (node at line 5932)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_select_uri"
		}"
		end

	gtk_recent_chooser_set_sort_type (a_chooser: POINTER; a_sort_type: INTEGER) is
 		-- gtk_recent_chooser_set_sort_type (node at line 6526)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_sort_type"
		}"
		end

	gtk_recent_chooser_set_limit (a_chooser: POINTER; a_limit: INTEGER_32) is
 		-- gtk_recent_chooser_set_limit (node at line 8314)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_limit"
		}"
		end

	gtk_recent_chooser_get_show_numbers (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_get_show_numbers (node at line 10276)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_show_numbers"
		}"
		end

	gtk_recent_chooser_remove_filter (a_chooser: POINTER; a_filter: POINTER) is
 		-- gtk_recent_chooser_remove_filter (node at line 10662)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_remove_filter"
		}"
		end

	gtk_recent_chooser_set_show_numbers (a_chooser: POINTER; a_show_numbers: INTEGER_32) is
 		-- gtk_recent_chooser_set_show_numbers (node at line 12912)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_show_numbers"
		}"
		end

	gtk_recent_chooser_list_filters (a_chooser: POINTER): POINTER is
 		-- gtk_recent_chooser_list_filters (node at line 13017)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_list_filters"
		}"
		end

	gtk_recent_chooser_set_sort_func (a_chooser: POINTER; a_sort_func: POINTER; a_sort_data: POINTER; a_data_destroy: POINTER) is
 		-- gtk_recent_chooser_set_sort_func (node at line 14455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_sort_func"
		}"
		end

	gtk_recent_chooser_get_current_item (a_chooser: POINTER): POINTER is
 		-- gtk_recent_chooser_get_current_item (node at line 14510)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_current_item"
		}"
		end

	gtk_recent_chooser_get_filter (a_chooser: POINTER): POINTER is
 		-- gtk_recent_chooser_get_filter (node at line 17084)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_filter"
		}"
		end

	gtk_recent_chooser_get_items (a_chooser: POINTER): POINTER is
 		-- gtk_recent_chooser_get_items (node at line 18458)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_items"
		}"
		end

	gtk_recent_chooser_get_current_uri (a_chooser: POINTER): POINTER is
 		-- gtk_recent_chooser_get_current_uri (node at line 19067)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_current_uri"
		}"
		end

	gtk_recent_chooser_get_local_only (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_get_local_only (node at line 19423)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_local_only"
		}"
		end

	gtk_recent_chooser_set_show_tips (a_chooser: POINTER; a_show_tips: INTEGER_32) is
 		-- gtk_recent_chooser_set_show_tips (node at line 19810)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_show_tips"
		}"
		end

	gtk_recent_chooser_set_show_private (a_chooser: POINTER; a_show_private: INTEGER_32) is
 		-- gtk_recent_chooser_set_show_private (node at line 24629)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_show_private"
		}"
		end

	gtk_recent_chooser_set_select_multiple (a_chooser: POINTER; a_select_multiple: INTEGER_32) is
 		-- gtk_recent_chooser_set_select_multiple (node at line 24785)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_select_multiple"
		}"
		end

	gtk_recent_chooser_set_current_uri (a_chooser: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_set_current_uri (node at line 24847)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_current_uri"
		}"
		end

	gtk_recent_chooser_set_local_only (a_chooser: POINTER; a_local_only: INTEGER_32) is
 		-- gtk_recent_chooser_set_local_only (node at line 25436)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_local_only"
		}"
		end

	gtk_recent_chooser_get_show_icons (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_get_show_icons (node at line 27587)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_show_icons"
		}"
		end

	gtk_recent_chooser_get_show_not_found (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_get_show_not_found (node at line 27769)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_show_not_found"
		}"
		end

	gtk_recent_chooser_get_show_private (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_get_show_private (node at line 29214)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_show_private"
		}"
		end

	gtk_recent_chooser_error_quark: NATURAL_32 is
 		-- gtk_recent_chooser_error_quark (node at line 29859)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_error_quark()"
		}"
		end

	gtk_recent_chooser_get_uris (a_chooser: POINTER; a_length: POINTER): POINTER is
 		-- gtk_recent_chooser_get_uris (node at line 30335)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_uris"
		}"
		end

	gtk_recent_chooser_set_show_icons (a_chooser: POINTER; a_show_icons: INTEGER_32) is
 		-- gtk_recent_chooser_set_show_icons (node at line 32798)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_show_icons"
		}"
		end

	gtk_recent_chooser_unselect_uri (a_chooser: POINTER; an_uri: POINTER) is
 		-- gtk_recent_chooser_unselect_uri (node at line 33214)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_unselect_uri"
		}"
		end

	gtk_recent_chooser_unselect_all (a_chooser: POINTER) is
 		-- gtk_recent_chooser_unselect_all (node at line 34063)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_unselect_all"
		}"
		end

	gtk_recent_chooser_add_filter (a_chooser: POINTER; a_filter: POINTER) is
 		-- gtk_recent_chooser_add_filter (node at line 35181)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_add_filter"
		}"
		end

	gtk_recent_chooser_set_show_not_found (a_chooser: POINTER; a_show_not_found: INTEGER_32) is
 		-- gtk_recent_chooser_set_show_not_found (node at line 35470)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_show_not_found"
		}"
		end

	gtk_recent_chooser_get_limit (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_get_limit (node at line 36578)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_limit"
		}"
		end

	gtk_recent_chooser_get_show_tips (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_get_show_tips (node at line 36995)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_show_tips"
		}"
		end


end -- class GTKRECENTCHOOSER_EXTERNALS
