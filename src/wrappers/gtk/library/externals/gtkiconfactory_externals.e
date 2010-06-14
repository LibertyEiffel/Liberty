-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKICONFACTORY_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_icon_size_register (a_name: POINTER; a_width: INTEGER_32; a_height: INTEGER_32): INTEGER is
 		-- gtk_icon_size_register (node at line 1134)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_size_register"
		}"
		end

	gtk_icon_size_get_name (a_size: INTEGER): POINTER is
 		-- gtk_icon_size_get_name (node at line 1593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_size_get_name"
		}"
		end

	gtk_icon_source_get_size (a_source: POINTER): INTEGER is
 		-- gtk_icon_source_get_size (node at line 4011)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_size"
		}"
		end

	gtk_icon_set_new_from_pixbuf (a_pixbuf: POINTER): POINTER is
 		-- gtk_icon_set_new_from_pixbuf (node at line 4518)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_new_from_pixbuf"
		}"
		end

	gtk_icon_set_copy (an_icon_set: POINTER): POINTER is
 		-- gtk_icon_set_copy (node at line 4679)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_copy"
		}"
		end

	gtk_icon_source_get_size_wildcarded (a_source: POINTER): INTEGER_32 is
 		-- gtk_icon_source_get_size_wildcarded (node at line 4717)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_size_wildcarded"
		}"
		end

	gtk_icon_source_get_pixbuf (a_source: POINTER): POINTER is
 		-- gtk_icon_source_get_pixbuf (node at line 5125)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_pixbuf"
		}"
		end

	gtk_icon_set_ref (an_icon_set: POINTER): POINTER is
 		-- gtk_icon_set_ref (node at line 5263)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_ref"
		}"
		end

	gtk_icon_set_get_type: NATURAL_32 is
 		-- gtk_icon_set_get_type (node at line 5658)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_get_type()"
		}"
		end

	gtk_icon_size_lookup_for_settings (a_settings: POINTER; a_size: INTEGER; a_width: POINTER; a_height: POINTER): INTEGER_32 is
 		-- gtk_icon_size_lookup_for_settings (node at line 6359)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_size_lookup_for_settings"
		}"
		end

	gtk_icon_source_get_direction (a_source: POINTER): INTEGER is
 		-- gtk_icon_source_get_direction (node at line 7245)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_direction"
		}"
		end

	gtk_icon_source_new: POINTER is
 		-- gtk_icon_source_new (node at line 7708)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_new()"
		}"
		end

	gtk_icon_source_copy (a_source: POINTER): POINTER is
 		-- gtk_icon_source_copy (node at line 8143)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_copy"
		}"
		end

	gtk_icon_source_set_direction (a_source: POINTER; a_direction: INTEGER) is
 		-- gtk_icon_source_set_direction (node at line 9451)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_direction"
		}"
		end

	gtk_icon_factory_remove_default (a_factory: POINTER) is
 		-- gtk_icon_factory_remove_default (node at line 11109)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_factory_remove_default"
		}"
		end

	gtk_icon_set_render_icon (an_icon_set: POINTER; a_style: POINTER; a_direction: INTEGER; a_state: INTEGER; a_size: INTEGER; a_widget: POINTER; a_detail: POINTER): POINTER is
 		-- gtk_icon_set_render_icon (node at line 11411)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_render_icon"
		}"
		end

	gtk_icon_source_set_icon_name (a_source: POINTER; an_icon_name: POINTER) is
 		-- gtk_icon_source_set_icon_name (node at line 13604)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_icon_name"
		}"
		end

	gtk_icon_source_get_icon_name (a_source: POINTER): POINTER is
 		-- gtk_icon_source_get_icon_name (node at line 16697)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_icon_name"
		}"
		end

	gtk_icon_source_set_state_wildcarded (a_source: POINTER; a_setting: INTEGER_32) is
 		-- gtk_icon_source_set_state_wildcarded (node at line 17038)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_state_wildcarded"
		}"
		end

	gtk_icon_factory_add (a_factory: POINTER; a_stock_id: POINTER; an_icon_set: POINTER) is
 		-- gtk_icon_factory_add (node at line 17116)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_factory_add"
		}"
		end

	gtk_icon_source_set_direction_wildcarded (a_source: POINTER; a_setting: INTEGER_32) is
 		-- gtk_icon_source_set_direction_wildcarded (node at line 18352)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_direction_wildcarded"
		}"
		end

	gtk_icon_factory_new: POINTER is
 		-- gtk_icon_factory_new (node at line 19044)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_factory_new()"
		}"
		end

	gtk_icon_source_set_filename (a_source: POINTER; a_filename: POINTER) is
 		-- gtk_icon_source_set_filename (node at line 19691)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_filename"
		}"
		end

	gtk_icon_size_from_name (a_name: POINTER): INTEGER is
 		-- gtk_icon_size_from_name (node at line 19921)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_size_from_name"
		}"
		end

	gtk_icon_factory_get_type: NATURAL_32 is
 		-- gtk_icon_factory_get_type (node at line 20476)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_factory_get_type()"
		}"
		end

	gtk_icon_source_get_filename (a_source: POINTER): POINTER is
 		-- gtk_icon_source_get_filename (node at line 20714)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_filename"
		}"
		end

	gtk_icon_source_set_size (a_source: POINTER; a_size: INTEGER) is
 		-- gtk_icon_source_set_size (node at line 21382)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_size"
		}"
		end

	gtk_icon_set_unref (an_icon_set: POINTER) is
 		-- gtk_icon_set_unref (node at line 22685)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_unref"
		}"
		end

	gtk_icon_source_get_direction_wildcarded (a_source: POINTER): INTEGER_32 is
 		-- gtk_icon_source_get_direction_wildcarded (node at line 22762)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_direction_wildcarded"
		}"
		end

	gtk_icon_size_register_alias (an_alias_external: POINTER; a_target: INTEGER) is
 		-- gtk_icon_size_register_alias (node at line 23538)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_size_register_alias"
		}"
		end

	gtk_icon_source_free (a_source: POINTER) is
 		-- gtk_icon_source_free (node at line 24681)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_free"
		}"
		end

	gtk_icon_set_get_sizes (an_icon_set: POINTER; a_sizes: POINTER; a_n_sizes: POINTER) is
 		-- gtk_icon_set_get_sizes (node at line 24687)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_get_sizes"
		}"
		end

	gtk_icon_factory_add_default (a_factory: POINTER) is
 		-- gtk_icon_factory_add_default (node at line 25231)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_factory_add_default"
		}"
		end

	gtk_icon_factory_lookup (a_factory: POINTER; a_stock_id: POINTER): POINTER is
 		-- gtk_icon_factory_lookup (node at line 25996)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_factory_lookup"
		}"
		end

	gtk_icon_source_set_pixbuf (a_source: POINTER; a_pixbuf: POINTER) is
 		-- gtk_icon_source_set_pixbuf (node at line 27301)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_pixbuf"
		}"
		end

	-- `hidden' function _gtk_icon_factory_list_ids skipped.
	gtk_icon_source_get_type: NATURAL_32 is
 		-- gtk_icon_source_get_type (node at line 29692)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_type()"
		}"
		end

	-- `hidden' function _gtk_icon_factory_ensure_default_icons skipped.
	gtk_icon_size_lookup (a_size: INTEGER; a_width: POINTER; a_height: POINTER): INTEGER_32 is
 		-- gtk_icon_size_lookup (node at line 29999)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_size_lookup"
		}"
		end

	gtk_icon_source_set_size_wildcarded (a_source: POINTER; a_setting: INTEGER_32) is
 		-- gtk_icon_source_set_size_wildcarded (node at line 31003)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_size_wildcarded"
		}"
		end

	gtk_icon_source_set_state (a_source: POINTER; a_state: INTEGER) is
 		-- gtk_icon_source_set_state (node at line 31685)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_state"
		}"
		end

	gtk_icon_set_new: POINTER is
 		-- gtk_icon_set_new (node at line 32597)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_new()"
		}"
		end

	gtk_icon_set_add_source (an_icon_set: POINTER; a_source: POINTER) is
 		-- gtk_icon_set_add_source (node at line 32883)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_add_source"
		}"
		end

	-- `hidden' function _gtk_icon_set_invalidate_caches skipped.
	gtk_icon_source_get_state (a_source: POINTER): INTEGER is
 		-- gtk_icon_source_get_state (node at line 35034)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_state"
		}"
		end

	gtk_icon_factory_lookup_default (a_stock_id: POINTER): POINTER is
 		-- gtk_icon_factory_lookup_default (node at line 36748)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_factory_lookup_default"
		}"
		end

	gtk_icon_source_get_state_wildcarded (a_source: POINTER): INTEGER_32 is
 		-- gtk_icon_source_get_state_wildcarded (node at line 37345)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_state_wildcarded"
		}"
		end


end -- class GTKICONFACTORY_EXTERNALS
