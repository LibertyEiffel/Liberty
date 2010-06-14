-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPRINTCONTEXT_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_print_context_get_width (a_context: POINTER): REAL_64 is
 		-- gtk_print_context_get_width (node at line 10929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_width"
		}"
		end

	gtk_print_context_get_type: NATURAL_32 is
 		-- gtk_print_context_get_type (node at line 15167)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_type()"
		}"
		end

	gtk_print_context_get_page_setup (a_context: POINTER): POINTER is
 		-- gtk_print_context_get_page_setup (node at line 21833)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_page_setup"
		}"
		end

	gtk_print_context_get_dpi_x (a_context: POINTER): REAL_64 is
 		-- gtk_print_context_get_dpi_x (node at line 21966)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_dpi_x"
		}"
		end

	gtk_print_context_get_dpi_y (a_context: POINTER): REAL_64 is
 		-- gtk_print_context_get_dpi_y (node at line 21969)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_dpi_y"
		}"
		end

	gtk_print_context_get_hard_margins (a_context: POINTER; a_top: POINTER; a_bottom: POINTER; a_left: POINTER; a_right: POINTER): INTEGER_32 is
 		-- gtk_print_context_get_hard_margins (node at line 22119)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_hard_margins"
		}"
		end

	gtk_print_context_get_cairo_context (a_context: POINTER): POINTER is
 		-- gtk_print_context_get_cairo_context (node at line 23487)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_cairo_context"
		}"
		end

	gtk_print_context_get_height (a_context: POINTER): REAL_64 is
 		-- gtk_print_context_get_height (node at line 25341)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_height"
		}"
		end

	gtk_print_context_set_cairo_context (a_context: POINTER; a_cr: POINTER; a_dpi_x: REAL_64; a_dpi_y: REAL_64) is
 		-- gtk_print_context_set_cairo_context (node at line 29301)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_set_cairo_context"
		}"
		end

	gtk_print_context_create_pango_layout (a_context: POINTER): POINTER is
 		-- gtk_print_context_create_pango_layout (node at line 32058)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_create_pango_layout"
		}"
		end

	gtk_print_context_get_pango_fontmap (a_context: POINTER): POINTER is
 		-- gtk_print_context_get_pango_fontmap (node at line 34380)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_pango_fontmap"
		}"
		end

	gtk_print_context_create_pango_context (a_context: POINTER): POINTER is
 		-- gtk_print_context_create_pango_context (node at line 36041)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_create_pango_context"
		}"
		end


end -- class GTKPRINTCONTEXT_EXTERNALS
