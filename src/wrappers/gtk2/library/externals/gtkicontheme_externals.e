-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKICONTHEME_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_icon_info_new_for_pixbuf (an_icon_theme: POINTER; a_pixbuf: POINTER): POINTER is
 		-- gtk_icon_info_new_for_pixbuf (node at line 947)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_new_for_pixbuf"
		}"
		end

	-- `hidden' function _gtk_icon_theme_check_reload skipped.
	gtk_icon_theme_rescan_if_needed (an_icon_theme: POINTER): INTEGER_32 is
 		-- gtk_icon_theme_rescan_if_needed (node at line 2629)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_rescan_if_needed"
		}"
		end

	gtk_icon_theme_list_contexts (an_icon_theme: POINTER): POINTER is
 		-- gtk_icon_theme_list_contexts (node at line 2859)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_list_contexts"
		}"
		end

	gtk_icon_theme_choose_icon (an_icon_theme: POINTER; an_icon_names: POINTER; a_size: INTEGER_32; a_flags: INTEGER): POINTER is
 		-- gtk_icon_theme_choose_icon (node at line 3662)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_choose_icon"
		}"
		end

	gtk_icon_info_copy (an_icon_info: POINTER): POINTER is
 		-- gtk_icon_info_copy (node at line 4328)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_copy"
		}"
		end

	gtk_icon_theme_get_search_path (an_icon_theme: POINTER; a_path: POINTER; a_n_elements: POINTER) is
 		-- gtk_icon_theme_get_search_path (node at line 6714)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_get_search_path"
		}"
		end

	gtk_icon_theme_get_example_icon_name (an_icon_theme: POINTER): POINTER is
 		-- gtk_icon_theme_get_example_icon_name (node at line 7277)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_get_example_icon_name"
		}"
		end

	gtk_icon_theme_get_type: NATURAL_64 is
 		-- gtk_icon_theme_get_type (node at line 8959)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_get_type()"
		}"
		end

	gtk_icon_theme_get_icon_sizes (an_icon_theme: POINTER; an_icon_name: POINTER): POINTER is
 		-- gtk_icon_theme_get_icon_sizes (node at line 10961)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_get_icon_sizes"
		}"
		end

	gtk_icon_theme_lookup_icon (an_icon_theme: POINTER; an_icon_name: POINTER; a_size: INTEGER_32; a_flags: INTEGER): POINTER is
 		-- gtk_icon_theme_lookup_icon (node at line 13756)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_lookup_icon"
		}"
		end

	gtk_icon_theme_lookup_by_gicon (an_icon_theme: POINTER; an_icon: POINTER; a_size: INTEGER_32; a_flags: INTEGER): POINTER is
 		-- gtk_icon_theme_lookup_by_gicon (node at line 13803)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_lookup_by_gicon"
		}"
		end

	gtk_icon_theme_set_custom_theme (an_icon_theme: POINTER; a_theme_name: POINTER) is
 		-- gtk_icon_theme_set_custom_theme (node at line 14990)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_set_custom_theme"
		}"
		end

	gtk_icon_theme_has_icon (an_icon_theme: POINTER; an_icon_name: POINTER): INTEGER_32 is
 		-- gtk_icon_theme_has_icon (node at line 17609)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_has_icon"
		}"
		end

	gtk_icon_info_set_raw_coordinates (an_icon_info: POINTER; a_raw_coordinates: INTEGER_32) is
 		-- gtk_icon_info_set_raw_coordinates (node at line 18013)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_set_raw_coordinates"
		}"
		end

	gtk_icon_theme_set_search_path (an_icon_theme: POINTER; a_path: POINTER; a_n_elements: INTEGER_32) is
 		-- gtk_icon_theme_set_search_path (node at line 18623)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_set_search_path"
		}"
		end

	gtk_icon_info_get_attach_points (an_icon_info: POINTER; a_points: POINTER; a_n_points: POINTER): INTEGER_32 is
 		-- gtk_icon_info_get_attach_points (node at line 18785)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_get_attach_points"
		}"
		end

	-- `hidden' function _gtk_icon_theme_ensure_builtin_cache skipped.
	gtk_icon_theme_list_icons (an_icon_theme: POINTER; a_context: POINTER): POINTER is
 		-- gtk_icon_theme_list_icons (node at line 20399)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_list_icons"
		}"
		end

	gtk_icon_theme_append_search_path (an_icon_theme: POINTER; a_path: POINTER) is
 		-- gtk_icon_theme_append_search_path (node at line 20491)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_append_search_path"
		}"
		end

	gtk_icon_theme_load_icon (an_icon_theme: POINTER; an_icon_name: POINTER; a_size: INTEGER_32; a_flags: INTEGER; an_error: POINTER): POINTER is
 		-- gtk_icon_theme_load_icon (node at line 22957)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_load_icon"
		}"
		end

	gtk_icon_info_get_display_name (an_icon_info: POINTER): POINTER is
 		-- gtk_icon_info_get_display_name (node at line 23021)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_get_display_name"
		}"
		end

	gtk_icon_theme_add_builtin_icon (an_icon_name: POINTER; a_size: INTEGER_32; a_pixbuf: POINTER) is
 		-- gtk_icon_theme_add_builtin_icon (node at line 24374)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_add_builtin_icon"
		}"
		end

	gtk_icon_info_get_embedded_rect (an_icon_info: POINTER; a_rectangle: POINTER): INTEGER_32 is
 		-- gtk_icon_info_get_embedded_rect (node at line 25727)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_get_embedded_rect"
		}"
		end

	gtk_icon_info_free (an_icon_info: POINTER) is
 		-- gtk_icon_info_free (node at line 26553)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_free"
		}"
		end

	gtk_icon_theme_get_for_screen (a_screen: POINTER): POINTER is
 		-- gtk_icon_theme_get_for_screen (node at line 27363)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_get_for_screen"
		}"
		end

	gtk_icon_info_get_type: NATURAL_64 is
 		-- gtk_icon_info_get_type (node at line 28384)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_get_type()"
		}"
		end

	gtk_icon_info_load_icon (an_icon_info: POINTER; an_error: POINTER): POINTER is
 		-- gtk_icon_info_load_icon (node at line 30268)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_load_icon"
		}"
		end

	gtk_icon_theme_new: POINTER is
 		-- gtk_icon_theme_new (node at line 30492)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_new()"
		}"
		end

	gtk_icon_theme_get_default: POINTER is
 		-- gtk_icon_theme_get_default (node at line 32246)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_get_default()"
		}"
		end

	gtk_icon_info_get_builtin_pixbuf (an_icon_info: POINTER): POINTER is
 		-- gtk_icon_info_get_builtin_pixbuf (node at line 33053)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_get_builtin_pixbuf"
		}"
		end

	gtk_icon_theme_prepend_search_path (an_icon_theme: POINTER; a_path: POINTER) is
 		-- gtk_icon_theme_prepend_search_path (node at line 34094)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_prepend_search_path"
		}"
		end

	gtk_icon_theme_set_screen (an_icon_theme: POINTER; a_screen: POINTER) is
 		-- gtk_icon_theme_set_screen (node at line 34648)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_set_screen"
		}"
		end

	gtk_icon_info_get_filename (an_icon_info: POINTER): POINTER is
 		-- gtk_icon_info_get_filename (node at line 35166)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_get_filename"
		}"
		end

	gtk_icon_info_get_base_size (an_icon_info: POINTER): INTEGER_32 is
 		-- gtk_icon_info_get_base_size (node at line 35385)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_get_base_size"
		}"
		end

	gtk_icon_theme_error_quark: NATURAL_32 is
 		-- gtk_icon_theme_error_quark (node at line 37613)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_error_quark()"
		}"
		end


end -- class GTKICONTHEME_EXTERNALS
