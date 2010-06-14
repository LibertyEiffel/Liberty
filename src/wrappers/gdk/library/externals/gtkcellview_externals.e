-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLVIEW_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_view_set_model (a_cell_view: POINTER; a_model: POINTER) is
 		-- gtk_cell_view_set_model (node at line 1931)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_set_model"
		}"
		end

	gtk_cell_view_new_with_text (a_text: POINTER): POINTER is
 		-- gtk_cell_view_new_with_text (node at line 10454)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_new_with_text"
		}"
		end

	gtk_cell_view_get_size_of_row (a_cell_view: POINTER; a_path: POINTER; a_requisition: POINTER): INTEGER_32 is
 		-- gtk_cell_view_get_size_of_row (node at line 14378)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_get_size_of_row"
		}"
		end

	gtk_cell_view_set_background_color (a_cell_view: POINTER; a_color: POINTER) is
 		-- gtk_cell_view_set_background_color (node at line 16816)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_set_background_color"
		}"
		end

	gtk_cell_view_new_with_pixbuf (a_pixbuf: POINTER): POINTER is
 		-- gtk_cell_view_new_with_pixbuf (node at line 24794)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_new_with_pixbuf"
		}"
		end

	gtk_cell_view_get_model (a_cell_view: POINTER): POINTER is
 		-- gtk_cell_view_get_model (node at line 25980)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_get_model"
		}"
		end

	gtk_cell_view_get_displayed_row (a_cell_view: POINTER): POINTER is
 		-- gtk_cell_view_get_displayed_row (node at line 29132)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_get_displayed_row"
		}"
		end

	gtk_cell_view_new: POINTER is
 		-- gtk_cell_view_new (node at line 32920)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_new()"
		}"
		end

	gtk_cell_view_set_displayed_row (a_cell_view: POINTER; a_path: POINTER) is
 		-- gtk_cell_view_set_displayed_row (node at line 34390)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_set_displayed_row"
		}"
		end

	gtk_cell_view_get_cell_renderers (a_cell_view: POINTER): POINTER is
 		-- gtk_cell_view_get_cell_renderers (node at line 34915)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_get_cell_renderers"
		}"
		end

	gtk_cell_view_get_type: NATURAL_32 is
 		-- gtk_cell_view_get_type (node at line 34926)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_get_type()"
		}"
		end

	gtk_cell_view_new_with_markup (a_markup: POINTER): POINTER is
 		-- gtk_cell_view_new_with_markup (node at line 37558)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_new_with_markup"
		}"
		end


end -- class GTKCELLVIEW_EXTERNALS
