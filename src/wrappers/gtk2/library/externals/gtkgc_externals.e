-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKGC_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_gc_release (a_gc: POINTER) is
 		-- gtk_gc_release (node at line 11163)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_gc_release"
		}"
		end

	gtk_gc_get (a_depth: INTEGER_32; a_colormap: POINTER; a_values: POINTER; a_values_mask: INTEGER): POINTER is
 		-- gtk_gc_get (node at line 19063)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_gc_get"
		}"
		end


end -- class GTKGC_EXTERNALS
