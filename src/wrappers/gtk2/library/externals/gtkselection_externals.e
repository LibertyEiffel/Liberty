-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSELECTION_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_selection_add_target (a_widget: POINTER; a_selection: POINTER; a_target: POINTER; an_info: NATURAL) is
 		-- gtk_selection_add_target
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_add_target"
		}"
		end

	gtk_selection_add_targets (a_widget: POINTER; a_selection: POINTER; a_targets: POINTER; a_ntargets: NATURAL) is
 		-- gtk_selection_add_targets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_add_targets"
		}"
		end

	gtk_selection_clear_targets (a_widget: POINTER; a_selection: POINTER) is
 		-- gtk_selection_clear_targets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_clear_targets"
		}"
		end

	gtk_selection_convert (a_widget: POINTER; a_selection: POINTER; a_target: POINTER; a_time: NATURAL): INTEGER is
 		-- gtk_selection_convert
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_convert"
		}"
		end

	gtk_selection_data_copy (a_data: POINTER): POINTER is
 		-- gtk_selection_data_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_copy"
		}"
		end

	gtk_selection_data_free (a_data: POINTER) is
 		-- gtk_selection_data_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_free"
		}"
		end

	gtk_selection_data_get_data (a_selection_data: POINTER): POINTER is
 		-- gtk_selection_data_get_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_data"
		}"
		end

	gtk_selection_data_get_data_type (a_selection_data: POINTER): POINTER is
 		-- gtk_selection_data_get_data_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_data_type"
		}"
		end

	gtk_selection_data_get_display (a_selection_data: POINTER): POINTER is
 		-- gtk_selection_data_get_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_display"
		}"
		end

	gtk_selection_data_get_format (a_selection_data: POINTER): INTEGER is
 		-- gtk_selection_data_get_format
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_format"
		}"
		end

	gtk_selection_data_get_length (a_selection_data: POINTER): INTEGER is
 		-- gtk_selection_data_get_length
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_length"
		}"
		end

	gtk_selection_data_get_pixbuf (a_selection_data: POINTER): POINTER is
 		-- gtk_selection_data_get_pixbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_pixbuf"
		}"
		end

	gtk_selection_data_get_selection (a_selection_data: POINTER): POINTER is
 		-- gtk_selection_data_get_selection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_selection"
		}"
		end

	gtk_selection_data_get_target (a_selection_data: POINTER): POINTER is
 		-- gtk_selection_data_get_target
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_target"
		}"
		end

	gtk_selection_data_get_targets (a_selection_data: POINTER; a_targets: POINTER; a_n_atoms: POINTER): INTEGER is
 		-- gtk_selection_data_get_targets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_targets"
		}"
		end

	gtk_selection_data_get_text (a_selection_data: POINTER): POINTER is
 		-- gtk_selection_data_get_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_text"
		}"
		end

	gtk_selection_data_get_type: like long_unsigned is
 		-- gtk_selection_data_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_type()"
		}"
		end

	gtk_selection_data_get_uris (a_selection_data: POINTER): POINTER is
 		-- gtk_selection_data_get_uris
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_get_uris"
		}"
		end

	gtk_selection_data_set (a_selection_data: POINTER; a_type: POINTER; a_format: INTEGER; a_data: POINTER; a_length: INTEGER) is
 		-- gtk_selection_data_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_set"
		}"
		end

	gtk_selection_data_set_pixbuf (a_selection_data: POINTER; a_pixbuf: POINTER): INTEGER is
 		-- gtk_selection_data_set_pixbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_set_pixbuf"
		}"
		end

	gtk_selection_data_set_text (a_selection_data: POINTER; a_str: POINTER; a_len: INTEGER): INTEGER is
 		-- gtk_selection_data_set_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_set_text"
		}"
		end

	gtk_selection_data_set_uris (a_selection_data: POINTER; an_uris: POINTER): INTEGER is
 		-- gtk_selection_data_set_uris
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_set_uris"
		}"
		end

	gtk_selection_data_targets_include_image (a_selection_data: POINTER; a_writable: INTEGER): INTEGER is
 		-- gtk_selection_data_targets_include_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_targets_include_image"
		}"
		end

	gtk_selection_data_targets_include_rich_text (a_selection_data: POINTER; a_buffer: POINTER): INTEGER is
 		-- gtk_selection_data_targets_include_rich_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_targets_include_rich_text"
		}"
		end

	gtk_selection_data_targets_include_text (a_selection_data: POINTER): INTEGER is
 		-- gtk_selection_data_targets_include_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_targets_include_text"
		}"
		end

	gtk_selection_data_targets_include_uri (a_selection_data: POINTER): INTEGER is
 		-- gtk_selection_data_targets_include_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_data_targets_include_uri"
		}"
		end

	-- `hidden' function _gtk_selection_incr_event skipped.
	-- `hidden' function _gtk_selection_notify skipped.
	gtk_selection_owner_set (a_widget: POINTER; a_selection: POINTER; a_time: NATURAL): INTEGER is
 		-- gtk_selection_owner_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_owner_set"
		}"
		end

	gtk_selection_owner_set_for_display (a_display: POINTER; a_widget: POINTER; a_selection: POINTER; a_time: NATURAL): INTEGER is
 		-- gtk_selection_owner_set_for_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_owner_set_for_display"
		}"
		end

	-- `hidden' function _gtk_selection_property_notify skipped.
	gtk_selection_remove_all (a_widget: POINTER) is
 		-- gtk_selection_remove_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_selection_remove_all"
		}"
		end

	-- `hidden' function _gtk_selection_request skipped.
	gtk_target_list_add (a_list: POINTER; a_target: POINTER; a_flags: NATURAL; an_info: NATURAL) is
 		-- gtk_target_list_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_add"
		}"
		end

	gtk_target_list_add_image_targets (a_list: POINTER; an_info: NATURAL; a_writable: INTEGER) is
 		-- gtk_target_list_add_image_targets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_add_image_targets"
		}"
		end

	gtk_target_list_add_rich_text_targets (a_list: POINTER; an_info: NATURAL; a_deserializable: INTEGER; a_buffer: POINTER) is
 		-- gtk_target_list_add_rich_text_targets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_add_rich_text_targets"
		}"
		end

	gtk_target_list_add_table (a_list: POINTER; a_targets: POINTER; a_ntargets: NATURAL) is
 		-- gtk_target_list_add_table
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_add_table"
		}"
		end

	gtk_target_list_add_text_targets (a_list: POINTER; an_info: NATURAL) is
 		-- gtk_target_list_add_text_targets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_add_text_targets"
		}"
		end

	gtk_target_list_add_uri_targets (a_list: POINTER; an_info: NATURAL) is
 		-- gtk_target_list_add_uri_targets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_add_uri_targets"
		}"
		end

	gtk_target_list_find (a_list: POINTER; a_target: POINTER; an_info: POINTER): INTEGER is
 		-- gtk_target_list_find
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_find"
		}"
		end

	gtk_target_list_get_type: like long_unsigned is
 		-- gtk_target_list_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_get_type()"
		}"
		end

	gtk_target_list_new (a_targets: POINTER; a_ntargets: NATURAL): POINTER is
 		-- gtk_target_list_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_new"
		}"
		end

	gtk_target_list_ref (a_list: POINTER): POINTER is
 		-- gtk_target_list_ref
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_ref"
		}"
		end

	gtk_target_list_remove (a_list: POINTER; a_target: POINTER) is
 		-- gtk_target_list_remove
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_remove"
		}"
		end

	gtk_target_list_unref (a_list: POINTER) is
 		-- gtk_target_list_unref
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_unref"
		}"
		end

	gtk_target_table_free (a_targets: POINTER; a_n_targets: INTEGER) is
 		-- gtk_target_table_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_table_free"
		}"
		end

	gtk_target_table_new_from_list (a_list: POINTER; a_n_targets: POINTER): POINTER is
 		-- gtk_target_table_new_from_list
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_table_new_from_list"
		}"
		end

	gtk_targets_include_image (a_targets: POINTER; a_n_targets: INTEGER; a_writable: INTEGER): INTEGER is
 		-- gtk_targets_include_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_targets_include_image"
		}"
		end

	gtk_targets_include_rich_text (a_targets: POINTER; a_n_targets: INTEGER; a_buffer: POINTER): INTEGER is
 		-- gtk_targets_include_rich_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_targets_include_rich_text"
		}"
		end

	gtk_targets_include_text (a_targets: POINTER; a_n_targets: INTEGER): INTEGER is
 		-- gtk_targets_include_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_targets_include_text"
		}"
		end

	gtk_targets_include_uri (a_targets: POINTER; a_n_targets: INTEGER): INTEGER is
 		-- gtk_targets_include_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_targets_include_uri"
		}"
		end


end -- class GTKSELECTION_EXTERNALS
