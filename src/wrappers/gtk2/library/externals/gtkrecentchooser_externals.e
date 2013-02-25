-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRECENTCHOOSER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_recent_chooser_set_filter (a_chooser: POINTER; a_filter: POINTER) is
 		-- gtk_recent_chooser_set_filter (node at line 405)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_filter"
		}"
		end

	gtk_recent_chooser_get_type: NATURAL_64 is
 		-- gtk_recent_chooser_get_type (node at line 2240)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_type()"
		}"
		end

	gtk_recent_chooser_set_sort_func (a_chooser: POINTER; a_sort_func: POINTER; a_sort_data: POINTER; a_data_destroy: POINTER) is
 		-- gtk_recent_chooser_set_sort_func (node at line 3634)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_sort_func"
		}"
		end

	gtk_recent_chooser_select_all (a_chooser: POINTER) is
 		-- gtk_recent_chooser_select_all (node at line 5856)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_select_all"
		}"
		end

	gtk_recent_chooser_select_uri (a_chooser: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_select_uri (node at line 6266)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_select_uri"
		}"
		end

	gtk_recent_chooser_set_sort_type (a_chooser: POINTER; a_sort_type: INTEGER) is
 		-- gtk_recent_chooser_set_sort_type (node at line 7111)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_sort_type"
		}"
		end

	gtk_recent_chooser_set_limit (a_chooser: POINTER; a_limit: INTEGER_32) is
 		-- gtk_recent_chooser_set_limit (node at line 8981)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_limit"
		}"
		end

	gtk_recent_chooser_get_select_multiple (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_get_select_multiple (node at line 10043)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_select_multiple"
		}"
		end

	gtk_recent_chooser_remove_filter (a_chooser: POINTER; a_filter: POINTER) is
 		-- gtk_recent_chooser_remove_filter (node at line 11593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_remove_filter"
		}"
		end

	gtk_recent_chooser_get_show_not_found (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_get_show_not_found (node at line 14007)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_show_not_found"
		}"
		end

	gtk_recent_chooser_list_filters (a_chooser: POINTER): POINTER is
 		-- gtk_recent_chooser_list_filters (node at line 14146)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_list_filters"
		}"
		end

	gtk_recent_chooser_get_current_item (a_chooser: POINTER): POINTER is
 		-- gtk_recent_chooser_get_current_item (node at line 15676)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_current_item"
		}"
		end

	gtk_recent_chooser_get_local_only (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_get_local_only (node at line 17279)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_local_only"
		}"
		end

	gtk_recent_chooser_get_filter (a_chooser: POINTER): POINTER is
 		-- gtk_recent_chooser_get_filter (node at line 18658)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_filter"
		}"
		end

	gtk_recent_chooser_get_items (a_chooser: POINTER): POINTER is
 		-- gtk_recent_chooser_get_items (node at line 20113)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_items"
		}"
		end

	gtk_recent_chooser_set_show_tips (a_chooser: POINTER; a_show_tips: INTEGER_32) is
 		-- gtk_recent_chooser_set_show_tips (node at line 21736)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_show_tips"
		}"
		end

	gtk_recent_chooser_set_current_uri (a_chooser: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_set_current_uri (node at line 24731)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_current_uri"
		}"
		end

	gtk_recent_chooser_set_show_private (a_chooser: POINTER; a_show_private: INTEGER_32) is
 		-- gtk_recent_chooser_set_show_private (node at line 27182)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_show_private"
		}"
		end

	gtk_recent_chooser_set_select_multiple (a_chooser: POINTER; a_select_multiple: INTEGER_32) is
 		-- gtk_recent_chooser_set_select_multiple (node at line 27366)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_select_multiple"
		}"
		end

	gtk_recent_chooser_set_local_only (a_chooser: POINTER; a_local_only: INTEGER_32) is
 		-- gtk_recent_chooser_set_local_only (node at line 28214)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_local_only"
		}"
		end

	gtk_recent_chooser_get_show_icons (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_get_show_icons (node at line 30468)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_show_icons"
		}"
		end

	gtk_recent_chooser_add_filter (a_chooser: POINTER; a_filter: POINTER) is
 		-- gtk_recent_chooser_add_filter (node at line 30833)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_add_filter"
		}"
		end

	gtk_recent_chooser_get_show_private (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_get_show_private (node at line 32228)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_show_private"
		}"
		end

	gtk_recent_chooser_get_sort_type (a_chooser: POINTER): INTEGER is
 		-- gtk_recent_chooser_get_sort_type (node at line 32352)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_sort_type"
		}"
		end

	gtk_recent_chooser_error_quark: NATURAL_32 is
 		-- gtk_recent_chooser_error_quark (node at line 32923)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_error_quark()"
		}"
		end

	gtk_recent_chooser_get_uris (a_chooser: POINTER; a_length: POINTER): POINTER is
 		-- gtk_recent_chooser_get_uris (node at line 33483)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_uris"
		}"
		end

	gtk_recent_chooser_get_current_uri (a_chooser: POINTER): POINTER is
 		-- gtk_recent_chooser_get_current_uri (node at line 34874)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_current_uri"
		}"
		end

	gtk_recent_chooser_set_show_icons (a_chooser: POINTER; a_show_icons: INTEGER_32) is
 		-- gtk_recent_chooser_set_show_icons (node at line 36175)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_show_icons"
		}"
		end

	gtk_recent_chooser_unselect_uri (a_chooser: POINTER; an_uri: POINTER) is
 		-- gtk_recent_chooser_unselect_uri (node at line 36644)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_unselect_uri"
		}"
		end

	gtk_recent_chooser_unselect_all (a_chooser: POINTER) is
 		-- gtk_recent_chooser_unselect_all (node at line 37598)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_unselect_all"
		}"
		end

	gtk_recent_chooser_set_show_not_found (a_chooser: POINTER; a_show_not_found: INTEGER_32) is
 		-- gtk_recent_chooser_set_show_not_found (node at line 39043)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_show_not_found"
		}"
		end

	gtk_recent_chooser_get_limit (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_get_limit (node at line 40247)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_limit"
		}"
		end

	gtk_recent_chooser_get_show_tips (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_get_show_tips (node at line 40695)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_show_tips"
		}"
		end


end -- class GTKRECENTCHOOSER_EXTERNALS
