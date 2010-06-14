-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLRENDERERPIXBUF_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_renderer_pixbuf_new: POINTER is
 		-- gtk_cell_renderer_pixbuf_new (node at line 5727)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_pixbuf_new()"
		}"
		end

	gtk_cell_renderer_pixbuf_get_type: NATURAL_32 is
 		-- gtk_cell_renderer_pixbuf_get_type (node at line 22628)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_pixbuf_get_type()"
		}"
		end


end -- class GTKCELLRENDERERPIXBUF_EXTERNALS
