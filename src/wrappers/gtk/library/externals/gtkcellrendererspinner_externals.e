-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLRENDERERSPINNER_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_renderer_spinner_new: POINTER is
 		-- gtk_cell_renderer_spinner_new (node at line 11608)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_spinner_new()"
		}"
		end

	gtk_cell_renderer_spinner_get_type: NATURAL_32 is
 		-- gtk_cell_renderer_spinner_get_type (node at line 13893)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_spinner_get_type()"
		}"
		end


end -- class GTKCELLRENDERERSPINNER_EXTERNALS
