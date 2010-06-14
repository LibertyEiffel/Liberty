-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSELECTION_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_selection_clear (a_widget: POINTER; an_event: POINTER): INTEGER_32 is
 		-- gtk_selection_clear (node at line 1774)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_clear"
		}"
		end

	gtk_target_table_free (a_targets: POINTER; a_n_targets: INTEGER_32) is
 		-- gtk_target_table_free (node at line 1879)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_table_free"
		}"
		end

	gtk_selection_data_get_type: NATURAL_32 is
 		-- gtk_selection_data_get_type (node at line 2681)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_type()"
		}"
		end

	gtk_selection_data_get_data_type (a_selection_data: POINTER): POINTER is
 		-- gtk_selection_data_get_data_type (node at line 2896)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_data_type"
		}"
		end

	-- `hidden' function _gtk_selection_property_notify skipped.
	gtk_selection_data_targets_include_uri (a_selection_data: POINTER): INTEGER_32 is
 		-- gtk_selection_data_targets_include_uri (node at line 4647)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_targets_include_uri"
		}"
		end

	gtk_selection_data_set_text (a_selection_data: POINTER; a_str: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- gtk_selection_data_set_text (node at line 6222)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_set_text"
		}"
		end

	gtk_selection_data_get_uris (a_selection_data: POINTER): POINTER is
 		-- gtk_selection_data_get_uris (node at line 6735)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_uris"
		}"
		end

	gtk_selection_data_get_display (a_selection_data: POINTER): POINTER is
 		-- gtk_selection_data_get_display (node at line 7478)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_display"
		}"
		end

	gtk_selection_add_target (a_widget: POINTER; a_selection: POINTER; a_target: POINTER; an_info: NATURAL_32) is
 		-- gtk_selection_add_target (node at line 7574)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_add_target"
		}"
		end

	gtk_selection_add_targets (a_widget: POINTER; a_selection: POINTER; a_targets: POINTER; a_ntargets: NATURAL_32) is
 		-- gtk_selection_add_targets (node at line 8588)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_add_targets"
		}"
		end

	gtk_selection_data_get_pixbuf (a_selection_data: POINTER): POINTER is
 		-- gtk_selection_data_get_pixbuf (node at line 8777)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_pixbuf"
		}"
		end

	gtk_selection_clear_targets (a_widget: POINTER; a_selection: POINTER) is
 		-- gtk_selection_clear_targets (node at line 9301)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_clear_targets"
		}"
		end

	gtk_selection_data_get_target (a_selection_data: POINTER): POINTER is
 		-- gtk_selection_data_get_target (node at line 10392)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_target"
		}"
		end

	gtk_target_list_add_text_targets (a_list: POINTER; an_info: NATURAL_32) is
 		-- gtk_target_list_add_text_targets (node at line 11807)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_add_text_targets"
		}"
		end

	gtk_targets_include_rich_text (a_targets: POINTER; a_n_targets: INTEGER_32; a_buffer: POINTER): INTEGER_32 is
 		-- gtk_targets_include_rich_text (node at line 12221)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_targets_include_rich_text"
		}"
		end

	gtk_target_list_add (a_list: POINTER; a_target: POINTER; a_flags: NATURAL_32; an_info: NATURAL_32) is
 		-- gtk_target_list_add (node at line 13565)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_add"
		}"
		end

	gtk_target_list_add_uri_targets (a_list: POINTER; an_info: NATURAL_32) is
 		-- gtk_target_list_add_uri_targets (node at line 15462)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_add_uri_targets"
		}"
		end

	gtk_selection_data_targets_include_rich_text (a_selection_data: POINTER; a_buffer: POINTER): INTEGER_32 is
 		-- gtk_selection_data_targets_include_rich_text (node at line 16530)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_targets_include_rich_text"
		}"
		end

	gtk_selection_data_free (a_data: POINTER) is
 		-- gtk_selection_data_free (node at line 18503)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_free"
		}"
		end

	gtk_target_list_new (a_targets: POINTER; a_ntargets: NATURAL_32): POINTER is
 		-- gtk_target_list_new (node at line 18581)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_new"
		}"
		end

	gtk_targets_include_text (a_targets: POINTER; a_n_targets: INTEGER_32): INTEGER_32 is
 		-- gtk_targets_include_text (node at line 19426)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_targets_include_text"
		}"
		end

	gtk_selection_data_copy (a_data: POINTER): POINTER is
 		-- gtk_selection_data_copy (node at line 19924)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_copy"
		}"
		end

	gtk_selection_data_set (a_selection_data: POINTER; a_type: POINTER; a_format: INTEGER_32; a_data: POINTER; a_length: INTEGER_32) is
 		-- gtk_selection_data_set (node at line 21306)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_set"
		}"
		end

	gtk_target_list_get_type: NATURAL_32 is
 		-- gtk_target_list_get_type (node at line 21377)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_get_type()"
		}"
		end

	gtk_selection_data_get_format (a_selection_data: POINTER): INTEGER_32 is
 		-- gtk_selection_data_get_format (node at line 22087)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_format"
		}"
		end

	-- `hidden' function _gtk_selection_notify skipped.
	gtk_target_list_add_image_targets (a_list: POINTER; an_info: NATURAL_32; a_writable: INTEGER_32) is
 		-- gtk_target_list_add_image_targets (node at line 24137)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_add_image_targets"
		}"
		end

	-- `hidden' function _gtk_selection_incr_event skipped.
	gtk_selection_data_get_length (a_selection_data: POINTER): INTEGER_32 is
 		-- gtk_selection_data_get_length (node at line 24739)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_length"
		}"
		end

	gtk_selection_convert (a_widget: POINTER; a_selection: POINTER; a_target: POINTER; a_time: NATURAL_32): INTEGER_32 is
 		-- gtk_selection_convert (node at line 25179)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_convert"
		}"
		end

	gtk_selection_owner_set_for_display (a_display: POINTER; a_widget: POINTER; a_selection: POINTER; a_time: NATURAL_32): INTEGER_32 is
 		-- gtk_selection_owner_set_for_display (node at line 26017)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_owner_set_for_display"
		}"
		end

	gtk_target_list_unref (a_list: POINTER) is
 		-- gtk_target_list_unref (node at line 26191)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_unref"
		}"
		end

	gtk_selection_data_get_data (a_selection_data: POINTER): POINTER is
 		-- gtk_selection_data_get_data (node at line 26219)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_data"
		}"
		end

	gtk_selection_data_get_text (a_selection_data: POINTER): POINTER is
 		-- gtk_selection_data_get_text (node at line 27011)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_text"
		}"
		end

	gtk_selection_data_get_targets (a_selection_data: POINTER; a_targets: POINTER; a_n_atoms: POINTER): INTEGER_32 is
 		-- gtk_selection_data_get_targets (node at line 27059)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_targets"
		}"
		end

	gtk_selection_remove_all (a_widget: POINTER) is
 		-- gtk_selection_remove_all (node at line 27207)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_remove_all"
		}"
		end

	gtk_target_list_find (a_list: POINTER; a_target: POINTER; an_info: POINTER): INTEGER_32 is
 		-- gtk_target_list_find (node at line 28337)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_find"
		}"
		end

	gtk_target_list_ref (a_list: POINTER): POINTER is
 		-- gtk_target_list_ref (node at line 28543)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_ref"
		}"
		end

	gtk_target_list_add_table (a_list: POINTER; a_targets: POINTER; a_ntargets: NATURAL_32) is
 		-- gtk_target_list_add_table (node at line 28869)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_add_table"
		}"
		end

	gtk_selection_data_targets_include_text (a_selection_data: POINTER): INTEGER_32 is
 		-- gtk_selection_data_targets_include_text (node at line 29484)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_targets_include_text"
		}"
		end

	-- `hidden' function _gtk_selection_request skipped.
	gtk_selection_data_targets_include_image (a_selection_data: POINTER; a_writable: INTEGER_32): INTEGER_32 is
 		-- gtk_selection_data_targets_include_image (node at line 30168)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_targets_include_image"
		}"
		end

	gtk_selection_data_set_pixbuf (a_selection_data: POINTER; a_pixbuf: POINTER): INTEGER_32 is
 		-- gtk_selection_data_set_pixbuf (node at line 30853)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_set_pixbuf"
		}"
		end

	gtk_selection_owner_set (a_widget: POINTER; a_selection: POINTER; a_time: NATURAL_32): INTEGER_32 is
 		-- gtk_selection_owner_set (node at line 31712)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_owner_set"
		}"
		end

	gtk_selection_data_get_selection (a_selection_data: POINTER): POINTER is
 		-- gtk_selection_data_get_selection (node at line 33238)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_selection"
		}"
		end

	gtk_selection_data_set_uris (a_selection_data: POINTER; an_uris: POINTER): INTEGER_32 is
 		-- gtk_selection_data_set_uris (node at line 33787)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_set_uris"
		}"
		end

	gtk_target_table_new_from_list (a_list: POINTER; a_n_targets: POINTER): POINTER is
 		-- gtk_target_table_new_from_list (node at line 33893)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_table_new_from_list"
		}"
		end

	gtk_targets_include_uri (a_targets: POINTER; a_n_targets: INTEGER_32): INTEGER_32 is
 		-- gtk_targets_include_uri (node at line 34022)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_targets_include_uri"
		}"
		end

	gtk_target_list_remove (a_list: POINTER; a_target: POINTER) is
 		-- gtk_target_list_remove (node at line 35069)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_remove"
		}"
		end

	gtk_target_list_add_rich_text_targets (a_list: POINTER; an_info: NATURAL_32; a_deserializable: INTEGER_32; a_buffer: POINTER) is
 		-- gtk_target_list_add_rich_text_targets (node at line 36088)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_add_rich_text_targets"
		}"
		end

	gtk_targets_include_image (a_targets: POINTER; a_n_targets: INTEGER_32; a_writable: INTEGER_32): INTEGER_32 is
 		-- gtk_targets_include_image (node at line 36214)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_targets_include_image"
		}"
		end


end -- class GTKSELECTION_EXTERNALS
