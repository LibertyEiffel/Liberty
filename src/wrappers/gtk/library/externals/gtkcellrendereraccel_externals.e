-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLRENDERERACCEL_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_renderer_accel_get_type: NATURAL_32 is
 		-- gtk_cell_renderer_accel_get_type (node at line 8001)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_get_type()"
		}"
		end

	gtk_cell_renderer_accel_new: POINTER is
 		-- gtk_cell_renderer_accel_new (node at line 12469)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_accel_new()"
		}"
		end


end -- class GTKCELLRENDERERACCEL_EXTERNALS
