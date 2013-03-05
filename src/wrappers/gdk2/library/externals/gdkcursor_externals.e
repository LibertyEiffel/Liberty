-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKCURSOR_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gdk_cursor_get_cursor_type (a_cursor: POINTER): INTEGER is
 		-- gdk_cursor_get_cursor_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cursor_get_cursor_type"
		}"
		end

	gdk_cursor_get_display (a_cursor: POINTER): POINTER is
 		-- gdk_cursor_get_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cursor_get_display"
		}"
		end

	gdk_cursor_get_image (a_cursor: POINTER): POINTER is
 		-- gdk_cursor_get_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cursor_get_image"
		}"
		end

	gdk_cursor_get_type: NATURAL_64 is
 		-- gdk_cursor_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cursor_get_type()"
		}"
		end

	gdk_cursor_new (a_cursor_type: INTEGER): POINTER is
 		-- gdk_cursor_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cursor_new"
		}"
		end

	gdk_cursor_new_for_display (a_display: POINTER; a_cursor_type: INTEGER): POINTER is
 		-- gdk_cursor_new_for_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cursor_new_for_display"
		}"
		end

	gdk_cursor_new_from_name (a_display: POINTER; a_name: POINTER): POINTER is
 		-- gdk_cursor_new_from_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cursor_new_from_name"
		}"
		end

	gdk_cursor_new_from_pixbuf (a_display: POINTER; a_pixbuf: POINTER; a_x: INTEGER_32; a_y: INTEGER_32): POINTER is
 		-- gdk_cursor_new_from_pixbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cursor_new_from_pixbuf"
		}"
		end

	gdk_cursor_new_from_pixmap (a_source: POINTER; a_mask: POINTER; a_fg: POINTER; a_bg: POINTER; a_x: INTEGER_32; a_y: INTEGER_32): POINTER is
 		-- gdk_cursor_new_from_pixmap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cursor_new_from_pixmap"
		}"
		end

	gdk_cursor_ref (a_cursor: POINTER): POINTER is
 		-- gdk_cursor_ref
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cursor_ref"
		}"
		end

	gdk_cursor_unref (a_cursor: POINTER) is
 		-- gdk_cursor_unref
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_cursor_unref"
		}"
		end


end -- class GDKCURSOR_EXTERNALS
