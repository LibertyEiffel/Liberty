-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKICONTHEME_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_icon_info_copy (an_icon_info: POINTER): POINTER is
 		-- gtk_icon_info_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_copy"
		}"
		end

	gtk_icon_info_free (an_icon_info: POINTER) is
 		-- gtk_icon_info_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_free"
		}"
		end

	gtk_icon_info_get_attach_points (an_icon_info: POINTER; a_points: POINTER; a_n_points: POINTER): INTEGER is
 		-- gtk_icon_info_get_attach_points
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_get_attach_points"
		}"
		end

	gtk_icon_info_get_base_size (an_icon_info: POINTER): INTEGER is
 		-- gtk_icon_info_get_base_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_get_base_size"
		}"
		end

	gtk_icon_info_get_builtin_pixbuf (an_icon_info: POINTER): POINTER is
 		-- gtk_icon_info_get_builtin_pixbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_get_builtin_pixbuf"
		}"
		end

	gtk_icon_info_get_display_name (an_icon_info: POINTER): POINTER is
 		-- gtk_icon_info_get_display_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_get_display_name"
		}"
		end

	gtk_icon_info_get_embedded_rect (an_icon_info: POINTER; a_rectangle: POINTER): INTEGER is
 		-- gtk_icon_info_get_embedded_rect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_get_embedded_rect"
		}"
		end

	gtk_icon_info_get_filename (an_icon_info: POINTER): POINTER is
 		-- gtk_icon_info_get_filename
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_get_filename"
		}"
		end

	gtk_icon_info_get_type: like long_unsigned is
 		-- gtk_icon_info_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_get_type()"
		}"
		end

	gtk_icon_info_load_icon (an_icon_info: POINTER; an_error: POINTER): POINTER is
 		-- gtk_icon_info_load_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_load_icon"
		}"
		end

	gtk_icon_info_new_for_pixbuf (an_icon_theme: POINTER; a_pixbuf: POINTER): POINTER is
 		-- gtk_icon_info_new_for_pixbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_new_for_pixbuf"
		}"
		end

	gtk_icon_info_set_raw_coordinates (an_icon_info: POINTER; a_raw_coordinates: INTEGER) is
 		-- gtk_icon_info_set_raw_coordinates
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_info_set_raw_coordinates"
		}"
		end

	gtk_icon_theme_add_builtin_icon (an_icon_name: POINTER; a_size: INTEGER; a_pixbuf: POINTER) is
 		-- gtk_icon_theme_add_builtin_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_add_builtin_icon"
		}"
		end

	gtk_icon_theme_append_search_path (an_icon_theme: POINTER; a_path: POINTER) is
 		-- gtk_icon_theme_append_search_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_append_search_path"
		}"
		end

	-- `hidden' function _gtk_icon_theme_check_reload skipped.
	gtk_icon_theme_choose_icon (an_icon_theme: POINTER; an_icon_names: POINTER; a_size: INTEGER; a_flags: INTEGER): POINTER is
 		-- gtk_icon_theme_choose_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_choose_icon"
		}"
		end

	-- `hidden' function _gtk_icon_theme_ensure_builtin_cache skipped.
	gtk_icon_theme_error_quark: NATURAL is
 		-- gtk_icon_theme_error_quark
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_error_quark()"
		}"
		end

	gtk_icon_theme_get_default: POINTER is
 		-- gtk_icon_theme_get_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_get_default()"
		}"
		end

	gtk_icon_theme_get_example_icon_name (an_icon_theme: POINTER): POINTER is
 		-- gtk_icon_theme_get_example_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_get_example_icon_name"
		}"
		end

	gtk_icon_theme_get_for_screen (a_screen: POINTER): POINTER is
 		-- gtk_icon_theme_get_for_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_get_for_screen"
		}"
		end

	gtk_icon_theme_get_icon_sizes (an_icon_theme: POINTER; an_icon_name: POINTER): POINTER is
 		-- gtk_icon_theme_get_icon_sizes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_get_icon_sizes"
		}"
		end

	gtk_icon_theme_get_search_path (an_icon_theme: POINTER; a_path: POINTER; a_n_elements: POINTER) is
 		-- gtk_icon_theme_get_search_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_get_search_path"
		}"
		end

	gtk_icon_theme_get_type: like long_unsigned is
 		-- gtk_icon_theme_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_get_type()"
		}"
		end

	gtk_icon_theme_has_icon (an_icon_theme: POINTER; an_icon_name: POINTER): INTEGER is
 		-- gtk_icon_theme_has_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_has_icon"
		}"
		end

	gtk_icon_theme_list_contexts (an_icon_theme: POINTER): POINTER is
 		-- gtk_icon_theme_list_contexts
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_list_contexts"
		}"
		end

	gtk_icon_theme_list_icons (an_icon_theme: POINTER; a_context: POINTER): POINTER is
 		-- gtk_icon_theme_list_icons
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_list_icons"
		}"
		end

	gtk_icon_theme_load_icon (an_icon_theme: POINTER; an_icon_name: POINTER; a_size: INTEGER; a_flags: INTEGER; an_error: POINTER): POINTER is
 		-- gtk_icon_theme_load_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_load_icon"
		}"
		end

	gtk_icon_theme_lookup_by_gicon (an_icon_theme: POINTER; an_icon: POINTER; a_size: INTEGER; a_flags: INTEGER): POINTER is
 		-- gtk_icon_theme_lookup_by_gicon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_lookup_by_gicon"
		}"
		end

	gtk_icon_theme_lookup_icon (an_icon_theme: POINTER; an_icon_name: POINTER; a_size: INTEGER; a_flags: INTEGER): POINTER is
 		-- gtk_icon_theme_lookup_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_lookup_icon"
		}"
		end

	gtk_icon_theme_new: POINTER is
 		-- gtk_icon_theme_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_new()"
		}"
		end

	gtk_icon_theme_prepend_search_path (an_icon_theme: POINTER; a_path: POINTER) is
 		-- gtk_icon_theme_prepend_search_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_prepend_search_path"
		}"
		end

	gtk_icon_theme_rescan_if_needed (an_icon_theme: POINTER): INTEGER is
 		-- gtk_icon_theme_rescan_if_needed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_rescan_if_needed"
		}"
		end

	gtk_icon_theme_set_custom_theme (an_icon_theme: POINTER; a_theme_name: POINTER) is
 		-- gtk_icon_theme_set_custom_theme
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_set_custom_theme"
		}"
		end

	gtk_icon_theme_set_screen (an_icon_theme: POINTER; a_screen: POINTER) is
 		-- gtk_icon_theme_set_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_set_screen"
		}"
		end

	gtk_icon_theme_set_search_path (an_icon_theme: POINTER; a_path: POINTER; a_n_elements: INTEGER) is
 		-- gtk_icon_theme_set_search_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_icon_theme_set_search_path"
		}"
		end


end -- class GTKICONTHEME_EXTERNALS
