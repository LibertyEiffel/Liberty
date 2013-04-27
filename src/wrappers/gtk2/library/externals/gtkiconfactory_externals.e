-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKICONFACTORY_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_icon_factory_add (a_factory: POINTER; a_stock_id: POINTER; an_icon_set: POINTER) is
 		-- gtk_icon_factory_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_factory_add"
		}"
		end

	gtk_icon_factory_add_default (a_factory: POINTER) is
 		-- gtk_icon_factory_add_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_factory_add_default"
		}"
		end

	-- `hidden' function _gtk_icon_factory_ensure_default_icons skipped.
	gtk_icon_factory_get_type: like long_unsigned is
 		-- gtk_icon_factory_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_factory_get_type()"
		}"
		end

	-- `hidden' function _gtk_icon_factory_list_ids skipped.
	gtk_icon_factory_lookup (a_factory: POINTER; a_stock_id: POINTER): POINTER is
 		-- gtk_icon_factory_lookup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_factory_lookup"
		}"
		end

	gtk_icon_factory_lookup_default (a_stock_id: POINTER): POINTER is
 		-- gtk_icon_factory_lookup_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_factory_lookup_default"
		}"
		end

	gtk_icon_factory_new: POINTER is
 		-- gtk_icon_factory_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_factory_new()"
		}"
		end

	gtk_icon_factory_remove_default (a_factory: POINTER) is
 		-- gtk_icon_factory_remove_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_factory_remove_default"
		}"
		end

	gtk_icon_set_add_source (an_icon_set: POINTER; a_source: POINTER) is
 		-- gtk_icon_set_add_source
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_add_source"
		}"
		end

	gtk_icon_set_copy (an_icon_set: POINTER): POINTER is
 		-- gtk_icon_set_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_copy"
		}"
		end

	gtk_icon_set_get_sizes (an_icon_set: POINTER; a_sizes: POINTER; a_n_sizes: POINTER) is
 		-- gtk_icon_set_get_sizes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_get_sizes"
		}"
		end

	gtk_icon_set_get_type: like long_unsigned is
 		-- gtk_icon_set_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_get_type()"
		}"
		end

	-- `hidden' function _gtk_icon_set_invalidate_caches skipped.
	gtk_icon_set_new: POINTER is
 		-- gtk_icon_set_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_new()"
		}"
		end

	gtk_icon_set_new_from_pixbuf (a_pixbuf: POINTER): POINTER is
 		-- gtk_icon_set_new_from_pixbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_new_from_pixbuf"
		}"
		end

	gtk_icon_set_ref (an_icon_set: POINTER): POINTER is
 		-- gtk_icon_set_ref
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_ref"
		}"
		end

	gtk_icon_set_render_icon (an_icon_set: POINTER; a_style: POINTER; a_direction: INTEGER; a_state: INTEGER; a_size: INTEGER; a_widget: POINTER; a_detail: POINTER): POINTER is
 		-- gtk_icon_set_render_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_render_icon"
		}"
		end

	gtk_icon_set_unref (an_icon_set: POINTER) is
 		-- gtk_icon_set_unref
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_set_unref"
		}"
		end

	gtk_icon_size_from_name (a_name: POINTER): INTEGER is
 		-- gtk_icon_size_from_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_size_from_name"
		}"
		end

	gtk_icon_size_get_name (a_size: INTEGER): POINTER is
 		-- gtk_icon_size_get_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_size_get_name"
		}"
		end

	gtk_icon_size_lookup (a_size: INTEGER; a_width: POINTER; a_height: POINTER): INTEGER is
 		-- gtk_icon_size_lookup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_size_lookup"
		}"
		end

	gtk_icon_size_lookup_for_settings (a_settings: POINTER; a_size: INTEGER; a_width: POINTER; a_height: POINTER): INTEGER is
 		-- gtk_icon_size_lookup_for_settings
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_size_lookup_for_settings"
		}"
		end

	gtk_icon_size_register (a_name: POINTER; a_width: INTEGER; a_height: INTEGER): INTEGER is
 		-- gtk_icon_size_register
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_size_register"
		}"
		end

	gtk_icon_size_register_alias (an_alias_external: POINTER; a_target: INTEGER) is
 		-- gtk_icon_size_register_alias
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_size_register_alias"
		}"
		end

	gtk_icon_source_copy (a_source: POINTER): POINTER is
 		-- gtk_icon_source_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_copy"
		}"
		end

	gtk_icon_source_free (a_source: POINTER) is
 		-- gtk_icon_source_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_free"
		}"
		end

	gtk_icon_source_get_direction (a_source: POINTER): INTEGER is
 		-- gtk_icon_source_get_direction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_direction"
		}"
		end

	gtk_icon_source_get_direction_wildcarded (a_source: POINTER): INTEGER is
 		-- gtk_icon_source_get_direction_wildcarded
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_direction_wildcarded"
		}"
		end

	gtk_icon_source_get_filename (a_source: POINTER): POINTER is
 		-- gtk_icon_source_get_filename
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_filename"
		}"
		end

	gtk_icon_source_get_icon_name (a_source: POINTER): POINTER is
 		-- gtk_icon_source_get_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_icon_name"
		}"
		end

	gtk_icon_source_get_pixbuf (a_source: POINTER): POINTER is
 		-- gtk_icon_source_get_pixbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_pixbuf"
		}"
		end

	gtk_icon_source_get_size (a_source: POINTER): INTEGER is
 		-- gtk_icon_source_get_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_size"
		}"
		end

	gtk_icon_source_get_size_wildcarded (a_source: POINTER): INTEGER is
 		-- gtk_icon_source_get_size_wildcarded
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_size_wildcarded"
		}"
		end

	gtk_icon_source_get_state (a_source: POINTER): INTEGER is
 		-- gtk_icon_source_get_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_state"
		}"
		end

	gtk_icon_source_get_state_wildcarded (a_source: POINTER): INTEGER is
 		-- gtk_icon_source_get_state_wildcarded
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_state_wildcarded"
		}"
		end

	gtk_icon_source_get_type: like long_unsigned is
 		-- gtk_icon_source_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_get_type()"
		}"
		end

	gtk_icon_source_new: POINTER is
 		-- gtk_icon_source_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_new()"
		}"
		end

	gtk_icon_source_set_direction (a_source: POINTER; a_direction: INTEGER) is
 		-- gtk_icon_source_set_direction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_direction"
		}"
		end

	gtk_icon_source_set_direction_wildcarded (a_source: POINTER; a_setting: INTEGER) is
 		-- gtk_icon_source_set_direction_wildcarded
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_direction_wildcarded"
		}"
		end

	gtk_icon_source_set_filename (a_source: POINTER; a_filename: POINTER) is
 		-- gtk_icon_source_set_filename
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_filename"
		}"
		end

	gtk_icon_source_set_icon_name (a_source: POINTER; an_icon_name: POINTER) is
 		-- gtk_icon_source_set_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_icon_name"
		}"
		end

	gtk_icon_source_set_pixbuf (a_source: POINTER; a_pixbuf: POINTER) is
 		-- gtk_icon_source_set_pixbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_pixbuf"
		}"
		end

	gtk_icon_source_set_size (a_source: POINTER; a_size: INTEGER) is
 		-- gtk_icon_source_set_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_size"
		}"
		end

	gtk_icon_source_set_size_wildcarded (a_source: POINTER; a_setting: INTEGER) is
 		-- gtk_icon_source_set_size_wildcarded
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_size_wildcarded"
		}"
		end

	gtk_icon_source_set_state (a_source: POINTER; a_state: INTEGER) is
 		-- gtk_icon_source_set_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_state"
		}"
		end

	gtk_icon_source_set_state_wildcarded (a_source: POINTER; a_setting: INTEGER) is
 		-- gtk_icon_source_set_state_wildcarded
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_source_set_state_wildcarded"
		}"
		end


end -- class GTKICONFACTORY_EXTERNALS
