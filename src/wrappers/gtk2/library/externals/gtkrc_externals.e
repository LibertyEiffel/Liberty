-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRC_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_rc_add_default_file (a_filename: POINTER) is
 		-- gtk_rc_add_default_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_add_default_file"
		}"
		end

	-- `hidden' function _gtk_rc_context_destroy skipped.
	-- `hidden' function _gtk_rc_context_get_default_font_name skipped.
	gtk_rc_find_module_in_path (a_module_file: POINTER): POINTER is
 		-- gtk_rc_find_module_in_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_find_module_in_path"
		}"
		end

	gtk_rc_find_pixmap_in_path (a_settings: POINTER; a_scanner: POINTER; a_pixmap_file: POINTER): POINTER is
 		-- gtk_rc_find_pixmap_in_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_find_pixmap_in_path"
		}"
		end

	-- `hidden' function _gtk_rc_free_widget_class_path skipped.
	gtk_rc_get_default_files: POINTER is
 		-- gtk_rc_get_default_files
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_get_default_files()"
		}"
		end

	gtk_rc_get_im_module_file: POINTER is
 		-- gtk_rc_get_im_module_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_get_im_module_file()"
		}"
		end

	gtk_rc_get_im_module_path: POINTER is
 		-- gtk_rc_get_im_module_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_get_im_module_path()"
		}"
		end

	gtk_rc_get_module_dir: POINTER is
 		-- gtk_rc_get_module_dir
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_get_module_dir()"
		}"
		end

	gtk_rc_get_style (a_widget: POINTER): POINTER is
 		-- gtk_rc_get_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_get_style"
		}"
		end

	gtk_rc_get_style_by_paths (a_settings: POINTER; a_widget_path: POINTER; a_class_path: POINTER; a_type: like long_unsigned): POINTER is
 		-- gtk_rc_get_style_by_paths
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_get_style_by_paths"
		}"
		end

	gtk_rc_get_theme_dir: POINTER is
 		-- gtk_rc_get_theme_dir
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_get_theme_dir()"
		}"
		end

	-- `hidden' function _gtk_rc_init skipped.
	-- `hidden' function _gtk_rc_match_widget_class skipped.
	gtk_rc_parse (a_filename: POINTER) is
 		-- gtk_rc_parse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_parse"
		}"
		end

	gtk_rc_parse_color (a_scanner: POINTER; a_color: POINTER): NATURAL is
 		-- gtk_rc_parse_color
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_parse_color"
		}"
		end

	gtk_rc_parse_color_full (a_scanner: POINTER; a_style: POINTER; a_color: POINTER): NATURAL is
 		-- gtk_rc_parse_color_full
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_parse_color_full"
		}"
		end

	gtk_rc_parse_priority (a_scanner: POINTER; a_priority: POINTER): NATURAL is
 		-- gtk_rc_parse_priority
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_parse_priority"
		}"
		end

	gtk_rc_parse_state (a_scanner: POINTER; a_state: POINTER): NATURAL is
 		-- gtk_rc_parse_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_parse_state"
		}"
		end

	gtk_rc_parse_string (a_rc_string: POINTER) is
 		-- gtk_rc_parse_string
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_parse_string"
		}"
		end

	-- `hidden' function _gtk_rc_parse_widget_class_path skipped.
	gtk_rc_reparse_all: INTEGER is
 		-- gtk_rc_reparse_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_reparse_all()"
		}"
		end

	gtk_rc_reparse_all_for_settings (a_settings: POINTER; a_force_load: INTEGER): INTEGER is
 		-- gtk_rc_reparse_all_for_settings
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_reparse_all_for_settings"
		}"
		end

	gtk_rc_reset_styles (a_settings: POINTER) is
 		-- gtk_rc_reset_styles
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_reset_styles"
		}"
		end

	gtk_rc_scanner_new: POINTER is
 		-- gtk_rc_scanner_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_scanner_new()"
		}"
		end

	gtk_rc_set_default_files (a_filenames: POINTER) is
 		-- gtk_rc_set_default_files
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_set_default_files"
		}"
		end

	gtk_rc_style_copy (an_orig: POINTER): POINTER is
 		-- gtk_rc_style_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_style_copy"
		}"
		end

	-- `hidden' function _gtk_rc_style_get_color_hashes skipped.
	gtk_rc_style_get_type: like long_unsigned is
 		-- gtk_rc_style_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_style_get_type()"
		}"
		end

	-- `hidden' function _gtk_rc_style_lookup_rc_property skipped.
	gtk_rc_style_new: POINTER is
 		-- gtk_rc_style_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_style_new()"
		}"
		end

	-- `hidden' function _gtk_rc_style_set_rc_property skipped.
	-- `hidden' function _gtk_rc_style_unset_rc_property skipped.

end -- class GTKRC_EXTERNALS
