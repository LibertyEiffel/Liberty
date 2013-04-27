-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACCELMAP_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_accel_map_add_entry (an_accel_path: POINTER; an_accel_key: NATURAL; an_accel_mods: INTEGER) is
 		-- gtk_accel_map_add_entry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_add_entry"
		}"
		end

	gtk_accel_map_add_filter (a_filter_pattern: POINTER) is
 		-- gtk_accel_map_add_filter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_add_filter"
		}"
		end

	-- `hidden' function _gtk_accel_map_add_group skipped.
	gtk_accel_map_change_entry (an_accel_path: POINTER; an_accel_key: NATURAL; an_accel_mods: INTEGER; a_replace: INTEGER): INTEGER is
 		-- gtk_accel_map_change_entry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_change_entry"
		}"
		end

	gtk_accel_map_foreach (a_data: POINTER; a_foreach_func: POINTER) is
 		-- gtk_accel_map_foreach
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_foreach"
		}"
		end

	gtk_accel_map_foreach_unfiltered (a_data: POINTER; a_foreach_func: POINTER) is
 		-- gtk_accel_map_foreach_unfiltered
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_foreach_unfiltered"
		}"
		end

	gtk_accel_map_get: POINTER is
 		-- gtk_accel_map_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_get()"
		}"
		end

	gtk_accel_map_get_type: like long_unsigned is
 		-- gtk_accel_map_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_get_type()"
		}"
		end

	-- `hidden' function _gtk_accel_map_init skipped.
	gtk_accel_map_load (a_file_name: POINTER) is
 		-- gtk_accel_map_load
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_load"
		}"
		end

	gtk_accel_map_load_fd (a_fd: INTEGER) is
 		-- gtk_accel_map_load_fd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_load_fd"
		}"
		end

	gtk_accel_map_load_scanner (a_scanner: POINTER) is
 		-- gtk_accel_map_load_scanner
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_load_scanner"
		}"
		end

	gtk_accel_map_lock_path (an_accel_path: POINTER) is
 		-- gtk_accel_map_lock_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_lock_path"
		}"
		end

	gtk_accel_map_lookup_entry (an_accel_path: POINTER; a_key: POINTER): INTEGER is
 		-- gtk_accel_map_lookup_entry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_lookup_entry"
		}"
		end

	-- `hidden' function _gtk_accel_map_remove_group skipped.
	gtk_accel_map_save (a_file_name: POINTER) is
 		-- gtk_accel_map_save
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_save"
		}"
		end

	gtk_accel_map_save_fd (a_fd: INTEGER) is
 		-- gtk_accel_map_save_fd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_save_fd"
		}"
		end

	gtk_accel_map_unlock_path (an_accel_path: POINTER) is
 		-- gtk_accel_map_unlock_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_unlock_path"
		}"
		end

	-- `hidden' function _gtk_accel_path_is_valid skipped.

end -- class GTKACCELMAP_EXTERNALS
