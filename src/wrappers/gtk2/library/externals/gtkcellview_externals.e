-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLVIEW_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_view_get_displayed_row (a_cell_view: POINTER): POINTER is
 		-- gtk_cell_view_get_displayed_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_get_displayed_row"
		}"
		end

	gtk_cell_view_get_model (a_cell_view: POINTER): POINTER is
 		-- gtk_cell_view_get_model
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_get_model"
		}"
		end

	gtk_cell_view_get_size_of_row (a_cell_view: POINTER; a_path: POINTER; a_requisition: POINTER): INTEGER is
 		-- gtk_cell_view_get_size_of_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_get_size_of_row"
		}"
		end

	gtk_cell_view_get_type: like long_unsigned is
 		-- gtk_cell_view_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_get_type()"
		}"
		end

	gtk_cell_view_new: POINTER is
 		-- gtk_cell_view_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_new()"
		}"
		end

	gtk_cell_view_new_with_markup (a_markup: POINTER): POINTER is
 		-- gtk_cell_view_new_with_markup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_new_with_markup"
		}"
		end

	gtk_cell_view_new_with_pixbuf (a_pixbuf: POINTER): POINTER is
 		-- gtk_cell_view_new_with_pixbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_new_with_pixbuf"
		}"
		end

	gtk_cell_view_new_with_text (a_text: POINTER): POINTER is
 		-- gtk_cell_view_new_with_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_new_with_text"
		}"
		end

	gtk_cell_view_set_background_color (a_cell_view: POINTER; a_color: POINTER) is
 		-- gtk_cell_view_set_background_color
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_set_background_color"
		}"
		end

	gtk_cell_view_set_displayed_row (a_cell_view: POINTER; a_path: POINTER) is
 		-- gtk_cell_view_set_displayed_row
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_set_displayed_row"
		}"
		end

	gtk_cell_view_set_model (a_cell_view: POINTER; a_model: POINTER) is
 		-- gtk_cell_view_set_model
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_view_set_model"
		}"
		end


end -- class GTKCELLVIEW_EXTERNALS
