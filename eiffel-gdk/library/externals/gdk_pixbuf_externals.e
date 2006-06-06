class GDK_PIXBUF_EXTERNALS

feature {NONE} -- Externals

	gdk_pixbuf_new_from_file(filename, error_dummy: POINTER): POINTER is
		external "C use <gdk-pixbuf/gdk-pixbuf.h>"
		end

	gdk_pixbuf_new_from_file_at_size(filename: POINTER; a_width, a_height: INTEGER; error_dummy: POINTER): POINTER is
		external "C use <gdk-pixbuf/gdk-pixbuf.h>"
		end

end -- class GDK_PIXBUF_EXTERNALS
