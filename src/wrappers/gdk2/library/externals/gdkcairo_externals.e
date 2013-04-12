-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKCAIRO_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gdk_cairo_create (a_drawable: POINTER): POINTER is
 		-- gdk_cairo_create
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cairo_create"
		}"
		end

	gdk_cairo_rectangle (a_cr: POINTER; a_rectangle: POINTER) is
 		-- gdk_cairo_rectangle
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cairo_rectangle"
		}"
		end

	gdk_cairo_region (a_cr: POINTER; a_region: POINTER) is
 		-- gdk_cairo_region
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cairo_region"
		}"
		end

	gdk_cairo_reset_clip (a_cr: POINTER; a_drawable: POINTER) is
 		-- gdk_cairo_reset_clip
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cairo_reset_clip"
		}"
		end

	gdk_cairo_set_source_color (a_cr: POINTER; a_color: POINTER) is
 		-- gdk_cairo_set_source_color
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cairo_set_source_color"
		}"
		end

	gdk_cairo_set_source_pixbuf (a_cr: POINTER; a_pixbuf: POINTER; a_pixbuf_x: REAL_64; a_pixbuf_y: REAL_64) is
 		-- gdk_cairo_set_source_pixbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cairo_set_source_pixbuf"
		}"
		end

	gdk_cairo_set_source_pixmap (a_cr: POINTER; a_pixmap: POINTER; a_pixmap_x: REAL_64; a_pixmap_y: REAL_64) is
 		-- gdk_cairo_set_source_pixmap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cairo_set_source_pixmap"
		}"
		end

	gdk_cairo_set_source_window (a_cr: POINTER; a_window: POINTER; a_x: REAL_64; a_y: REAL_64) is
 		-- gdk_cairo_set_source_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cairo_set_source_window"
		}"
		end


end -- class GDKCAIRO_EXTERNALS
