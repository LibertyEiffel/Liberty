-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLRENDERERTEXT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_renderer_text_set_fixed_height_from_font (a_renderer: POINTER; a_number_of_rows: INTEGER_32) is
 		-- gtk_cell_renderer_text_set_fixed_height_from_font (node at line 16206)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_text_set_fixed_height_from_font"
		}"
		end

	gtk_cell_renderer_text_get_type: NATURAL_64 is
 		-- gtk_cell_renderer_text_get_type (node at line 24264)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_text_get_type()"
		}"
		end

	gtk_cell_renderer_text_new: POINTER is
 		-- gtk_cell_renderer_text_new (node at line 33576)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_text_new()"
		}"
		end


end -- class GTKCELLRENDERERTEXT_EXTERNALS
