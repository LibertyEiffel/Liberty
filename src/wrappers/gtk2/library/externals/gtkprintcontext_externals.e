-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPRINTCONTEXT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_print_context_create_pango_context (a_context: POINTER): POINTER is
 		-- gtk_print_context_create_pango_context
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_create_pango_context"
		}"
		end

	gtk_print_context_create_pango_layout (a_context: POINTER): POINTER is
 		-- gtk_print_context_create_pango_layout
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_create_pango_layout"
		}"
		end

	gtk_print_context_get_cairo_context (a_context: POINTER): POINTER is
 		-- gtk_print_context_get_cairo_context
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_cairo_context"
		}"
		end

	gtk_print_context_get_dpi_x (a_context: POINTER): REAL is
 		-- gtk_print_context_get_dpi_x
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_dpi_x"
		}"
		end

	gtk_print_context_get_dpi_y (a_context: POINTER): REAL is
 		-- gtk_print_context_get_dpi_y
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_dpi_y"
		}"
		end

	gtk_print_context_get_hard_margins (a_context: POINTER; a_top: POINTER; a_bottom: POINTER; a_left: POINTER; a_right: POINTER): INTEGER is
 		-- gtk_print_context_get_hard_margins
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_hard_margins"
		}"
		end

	gtk_print_context_get_height (a_context: POINTER): REAL is
 		-- gtk_print_context_get_height
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_height"
		}"
		end

	gtk_print_context_get_page_setup (a_context: POINTER): POINTER is
 		-- gtk_print_context_get_page_setup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_page_setup"
		}"
		end

	gtk_print_context_get_pango_fontmap (a_context: POINTER): POINTER is
 		-- gtk_print_context_get_pango_fontmap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_pango_fontmap"
		}"
		end

	gtk_print_context_get_type: like long_unsigned is
 		-- gtk_print_context_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_type()"
		}"
		end

	gtk_print_context_get_width (a_context: POINTER): REAL is
 		-- gtk_print_context_get_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_get_width"
		}"
		end

	gtk_print_context_set_cairo_context (a_context: POINTER; a_cr: POINTER; a_dpi_x: REAL; a_dpi_y: REAL) is
 		-- gtk_print_context_set_cairo_context
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_context_set_cairo_context"
		}"
		end


end -- class GTKPRINTCONTEXT_EXTERNALS
