-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLRENDERERTEXT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_renderer_text_get_type: like long_unsigned is
 		-- gtk_cell_renderer_text_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_text_get_type()"
		}"
		end

	gtk_cell_renderer_text_new: POINTER is
 		-- gtk_cell_renderer_text_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_text_new()"
		}"
		end

	gtk_cell_renderer_text_set_fixed_height_from_font (a_renderer: POINTER; a_number_of_rows: INTEGER) is
 		-- gtk_cell_renderer_text_set_fixed_height_from_font
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_text_set_fixed_height_from_font"
		}"
		end


end -- class GTKCELLRENDERERTEXT_EXTERNALS
