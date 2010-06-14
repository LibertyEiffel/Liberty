-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKOFFSCREENWINDOW_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_offscreen_window_get_type: NATURAL_32 is
 		-- gtk_offscreen_window_get_type (node at line 8736)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_offscreen_window_get_type()"
		}"
		end

	gtk_offscreen_window_new: POINTER is
 		-- gtk_offscreen_window_new (node at line 10453)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_offscreen_window_new()"
		}"
		end

	gtk_offscreen_window_get_pixbuf (an_offscreen: POINTER): POINTER is
 		-- gtk_offscreen_window_get_pixbuf (node at line 23126)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_offscreen_window_get_pixbuf"
		}"
		end

	gtk_offscreen_window_get_pixmap (an_offscreen: POINTER): POINTER is
 		-- gtk_offscreen_window_get_pixmap (node at line 34241)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_offscreen_window_get_pixmap"
		}"
		end


end -- class GTKOFFSCREENWINDOW_EXTERNALS
