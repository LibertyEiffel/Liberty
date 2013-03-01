-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRC_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_rc_find_module_in_path (a_module_file: POINTER): POINTER is
 		-- gtk_rc_find_module_in_path (node at line 182)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_find_module_in_path"
		}"
		end

	-- `hidden' function _gtk_rc_init skipped.
	gtk_rc_style_new: POINTER is
 		-- gtk_rc_style_new (node at line 1296)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_style_new()"
		}"
		end

	-- `hidden' function _gtk_rc_style_get_color_hashes skipped.
	-- `hidden' function _gtk_rc_style_set_rc_property skipped.
	-- `hidden' function _gtk_rc_context_get_default_font_name skipped.
	gtk_rc_reset_styles (a_settings: POINTER) is
 		-- gtk_rc_reset_styles (node at line 8204)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_reset_styles"
		}"
		end

	gtk_rc_style_get_type: NATURAL_64 is
 		-- gtk_rc_style_get_type (node at line 10617)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_style_get_type()"
		}"
		end

	gtk_rc_style_copy (an_orig: POINTER): POINTER is
 		-- gtk_rc_style_copy (node at line 11631)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_style_copy"
		}"
		end

	gtk_rc_parse_color_full (a_scanner: POINTER; a_style: POINTER; a_color: POINTER): NATURAL_32 is
 		-- gtk_rc_parse_color_full (node at line 12965)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_parse_color_full"
		}"
		end

	gtk_rc_parse (a_filename: POINTER) is
 		-- gtk_rc_parse (node at line 13659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_parse"
		}"
		end

	gtk_rc_get_style_by_paths (a_settings: POINTER; a_widget_path: POINTER; a_class_path: POINTER; a_type: NATURAL_64): POINTER is
 		-- gtk_rc_get_style_by_paths (node at line 13871)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_get_style_by_paths"
		}"
		end

	-- `hidden' function _gtk_rc_style_unset_rc_property skipped.
	gtk_rc_get_module_dir: POINTER is
 		-- gtk_rc_get_module_dir (node at line 16772)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_get_module_dir()"
		}"
		end

	gtk_rc_reparse_all_for_settings (a_settings: POINTER; a_force_load: INTEGER_32): INTEGER_32 is
 		-- gtk_rc_reparse_all_for_settings (node at line 16874)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_reparse_all_for_settings"
		}"
		end

	-- `hidden' function _gtk_rc_match_widget_class skipped.
	-- `hidden' function _gtk_rc_free_widget_class_path skipped.
	-- `hidden' function _gtk_rc_parse_widget_class_path skipped.
	gtk_rc_get_default_files: POINTER is
 		-- gtk_rc_get_default_files (node at line 21969)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_get_default_files()"
		}"
		end

	gtk_rc_reparse_all: INTEGER_32 is
 		-- gtk_rc_reparse_all (node at line 22595)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_reparse_all()"
		}"
		end

	-- `hidden' function _gtk_rc_style_lookup_rc_property skipped.
	gtk_rc_parse_string (a_rc_string: POINTER) is
 		-- gtk_rc_parse_string (node at line 23949)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_parse_string"
		}"
		end

	gtk_rc_get_im_module_file: POINTER is
 		-- gtk_rc_get_im_module_file (node at line 24421)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_get_im_module_file()"
		}"
		end

	gtk_rc_parse_state (a_scanner: POINTER; a_state: POINTER): NATURAL_32 is
 		-- gtk_rc_parse_state (node at line 27009)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_parse_state"
		}"
		end

	gtk_rc_set_default_files (a_filenames: POINTER) is
 		-- gtk_rc_set_default_files (node at line 28050)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_set_default_files"
		}"
		end

	gtk_rc_parse_priority (a_scanner: POINTER; a_priority: POINTER): NATURAL_32 is
 		-- gtk_rc_parse_priority (node at line 28125)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_parse_priority"
		}"
		end

	gtk_rc_get_style (a_widget: POINTER): POINTER is
 		-- gtk_rc_get_style (node at line 29567)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_get_style"
		}"
		end

	gtk_rc_parse_color (a_scanner: POINTER; a_color: POINTER): NATURAL_32 is
 		-- gtk_rc_parse_color (node at line 31634)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_parse_color"
		}"
		end

	gtk_rc_get_theme_dir: POINTER is
 		-- gtk_rc_get_theme_dir (node at line 36658)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_get_theme_dir()"
		}"
		end

	gtk_rc_add_default_file (a_filename: POINTER) is
 		-- gtk_rc_add_default_file (node at line 38049)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_add_default_file"
		}"
		end

	gtk_rc_get_im_module_path: POINTER is
 		-- gtk_rc_get_im_module_path (node at line 38308)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_get_im_module_path()"
		}"
		end

	-- `hidden' function _gtk_rc_context_destroy skipped.
	gtk_rc_find_pixmap_in_path (a_settings: POINTER; a_scanner: POINTER; a_pixmap_file: POINTER): POINTER is
 		-- gtk_rc_find_pixmap_in_path (node at line 39499)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_find_pixmap_in_path"
		}"
		end

	gtk_rc_scanner_new: POINTER is
 		-- gtk_rc_scanner_new (node at line 41266)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_scanner_new()"
		}"
		end


end -- class GTKRC_EXTERNALS
