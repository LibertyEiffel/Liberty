-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPIXMAP_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_pixmap_new (a_pixmap: POINTER; a_mask: POINTER): POINTER is
 		-- gtk_pixmap_new (node at line 18640)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_pixmap_new"
		}"
		end

	gtk_pixmap_set (a_pixmap: POINTER; a_val: POINTER; a_mask: POINTER) is
 		-- gtk_pixmap_set (node at line 31240)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_pixmap_set"
		}"
		end

	gtk_pixmap_get_type: NATURAL_32 is
 		-- gtk_pixmap_get_type (node at line 32102)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_pixmap_get_type()"
		}"
		end

	gtk_pixmap_set_build_insensitive (a_pixmap: POINTER; a_build: INTEGER_32) is
 		-- gtk_pixmap_set_build_insensitive (node at line 35014)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_pixmap_set_build_insensitive"
		}"
		end

	gtk_pixmap_get (a_pixmap: POINTER; a_val: POINTER; a_mask: POINTER) is
 		-- gtk_pixmap_get (node at line 37281)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_pixmap_get"
		}"
		end


end -- class GTKPIXMAP_EXTERNALS
