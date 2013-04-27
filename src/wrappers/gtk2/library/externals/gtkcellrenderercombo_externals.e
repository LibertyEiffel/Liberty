-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLRENDERERCOMBO_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_renderer_combo_get_type: like long_unsigned is
 		-- gtk_cell_renderer_combo_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_combo_get_type()"
		}"
		end

	gtk_cell_renderer_combo_new: POINTER is
 		-- gtk_cell_renderer_combo_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_combo_new()"
		}"
		end


end -- class GTKCELLRENDERERCOMBO_EXTERNALS
