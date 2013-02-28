-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKOFFSCREENWINDOW_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_offscreen_window_get_pixmap (an_offscreen: POINTER): POINTER is
 		-- gtk_offscreen_window_get_pixmap (node at line 8549)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_offscreen_window_get_pixmap"
		}"
		end

	gtk_offscreen_window_new: POINTER is
 		-- gtk_offscreen_window_new (node at line 11340)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_offscreen_window_new()"
		}"
		end

	gtk_offscreen_window_get_type: NATURAL_64 is
 		-- gtk_offscreen_window_get_type (node at line 23065)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_offscreen_window_get_type()"
		}"
		end

	gtk_offscreen_window_get_pixbuf (an_offscreen: POINTER): POINTER is
 		-- gtk_offscreen_window_get_pixbuf (node at line 25445)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_offscreen_window_get_pixbuf"
		}"
		end


end -- class GTKOFFSCREENWINDOW_EXTERNALS
