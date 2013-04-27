-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRECENTCHOOSER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_recent_chooser_add_filter (a_chooser: POINTER; a_filter: POINTER) is
 		-- gtk_recent_chooser_add_filter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_add_filter"
		}"
		end

	gtk_recent_chooser_error_quark: NATURAL is
 		-- gtk_recent_chooser_error_quark
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_error_quark()"
		}"
		end

	gtk_recent_chooser_get_current_item (a_chooser: POINTER): POINTER is
 		-- gtk_recent_chooser_get_current_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_current_item"
		}"
		end

	gtk_recent_chooser_get_current_uri (a_chooser: POINTER): POINTER is
 		-- gtk_recent_chooser_get_current_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_current_uri"
		}"
		end

	gtk_recent_chooser_get_filter (a_chooser: POINTER): POINTER is
 		-- gtk_recent_chooser_get_filter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_filter"
		}"
		end

	gtk_recent_chooser_get_items (a_chooser: POINTER): POINTER is
 		-- gtk_recent_chooser_get_items
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_items"
		}"
		end

	gtk_recent_chooser_get_limit (a_chooser: POINTER): INTEGER is
 		-- gtk_recent_chooser_get_limit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_limit"
		}"
		end

	gtk_recent_chooser_get_local_only (a_chooser: POINTER): INTEGER is
 		-- gtk_recent_chooser_get_local_only
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_local_only"
		}"
		end

	gtk_recent_chooser_get_select_multiple (a_chooser: POINTER): INTEGER is
 		-- gtk_recent_chooser_get_select_multiple
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_select_multiple"
		}"
		end

	gtk_recent_chooser_get_show_icons (a_chooser: POINTER): INTEGER is
 		-- gtk_recent_chooser_get_show_icons
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_show_icons"
		}"
		end

	gtk_recent_chooser_get_show_not_found (a_chooser: POINTER): INTEGER is
 		-- gtk_recent_chooser_get_show_not_found
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_show_not_found"
		}"
		end

	gtk_recent_chooser_get_show_private (a_chooser: POINTER): INTEGER is
 		-- gtk_recent_chooser_get_show_private
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_show_private"
		}"
		end

	gtk_recent_chooser_get_show_tips (a_chooser: POINTER): INTEGER is
 		-- gtk_recent_chooser_get_show_tips
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_show_tips"
		}"
		end

	gtk_recent_chooser_get_sort_type (a_chooser: POINTER): INTEGER is
 		-- gtk_recent_chooser_get_sort_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_sort_type"
		}"
		end

	gtk_recent_chooser_get_type: like long_unsigned is
 		-- gtk_recent_chooser_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_type()"
		}"
		end

	gtk_recent_chooser_get_uris (a_chooser: POINTER; a_length: POINTER): POINTER is
 		-- gtk_recent_chooser_get_uris
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_get_uris"
		}"
		end

	gtk_recent_chooser_list_filters (a_chooser: POINTER): POINTER is
 		-- gtk_recent_chooser_list_filters
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_list_filters"
		}"
		end

	gtk_recent_chooser_remove_filter (a_chooser: POINTER; a_filter: POINTER) is
 		-- gtk_recent_chooser_remove_filter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_remove_filter"
		}"
		end

	gtk_recent_chooser_select_all (a_chooser: POINTER) is
 		-- gtk_recent_chooser_select_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_select_all"
		}"
		end

	gtk_recent_chooser_select_uri (a_chooser: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_recent_chooser_select_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_select_uri"
		}"
		end

	gtk_recent_chooser_set_current_uri (a_chooser: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_recent_chooser_set_current_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_current_uri"
		}"
		end

	gtk_recent_chooser_set_filter (a_chooser: POINTER; a_filter: POINTER) is
 		-- gtk_recent_chooser_set_filter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_filter"
		}"
		end

	gtk_recent_chooser_set_limit (a_chooser: POINTER; a_limit: INTEGER) is
 		-- gtk_recent_chooser_set_limit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_limit"
		}"
		end

	gtk_recent_chooser_set_local_only (a_chooser: POINTER; a_local_only: INTEGER) is
 		-- gtk_recent_chooser_set_local_only
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_local_only"
		}"
		end

	gtk_recent_chooser_set_select_multiple (a_chooser: POINTER; a_select_multiple: INTEGER) is
 		-- gtk_recent_chooser_set_select_multiple
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_select_multiple"
		}"
		end

	gtk_recent_chooser_set_show_icons (a_chooser: POINTER; a_show_icons: INTEGER) is
 		-- gtk_recent_chooser_set_show_icons
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_show_icons"
		}"
		end

	gtk_recent_chooser_set_show_not_found (a_chooser: POINTER; a_show_not_found: INTEGER) is
 		-- gtk_recent_chooser_set_show_not_found
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_show_not_found"
		}"
		end

	gtk_recent_chooser_set_show_private (a_chooser: POINTER; a_show_private: INTEGER) is
 		-- gtk_recent_chooser_set_show_private
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_show_private"
		}"
		end

	gtk_recent_chooser_set_show_tips (a_chooser: POINTER; a_show_tips: INTEGER) is
 		-- gtk_recent_chooser_set_show_tips
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_show_tips"
		}"
		end

	gtk_recent_chooser_set_sort_func (a_chooser: POINTER; a_sort_func: POINTER; a_sort_data: POINTER; a_data_destroy: POINTER) is
 		-- gtk_recent_chooser_set_sort_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_sort_func"
		}"
		end

	gtk_recent_chooser_set_sort_type (a_chooser: POINTER; a_sort_type: INTEGER) is
 		-- gtk_recent_chooser_set_sort_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_set_sort_type"
		}"
		end

	gtk_recent_chooser_unselect_all (a_chooser: POINTER) is
 		-- gtk_recent_chooser_unselect_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_unselect_all"
		}"
		end

	gtk_recent_chooser_unselect_uri (a_chooser: POINTER; an_uri: POINTER) is
 		-- gtk_recent_chooser_unselect_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_unselect_uri"
		}"
		end


end -- class GTKRECENTCHOOSER_EXTERNALS
