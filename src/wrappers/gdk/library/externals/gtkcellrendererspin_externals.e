-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLRENDERERSPIN_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_renderer_spin_new: POINTER is
 		-- gtk_cell_renderer_spin_new (node at line 7591)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_spin_new()"
		}"
		end

	gtk_cell_renderer_spin_get_type: NATURAL_32 is
 		-- gtk_cell_renderer_spin_get_type (node at line 30057)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_spin_get_type()"
		}"
		end


end -- class GTKCELLRENDERERSPIN_EXTERNALS
