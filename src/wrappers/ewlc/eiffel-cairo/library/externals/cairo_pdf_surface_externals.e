note
	description: "External calls for CAIRO_PDF_SURFACE"
	copyright: "Copyright (C) 2007-2022: $EWLC_developer, $original_copyright_holder"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class CAIRO_PDF_SURFACE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	cairo_pdf_surface_create (a_filename: POINTER; a_width_in_points, an_height_in_points: REAL): POINTER
			-- cairo_surface_t* cairo_pdf_surface_create (const char
			-- *filename, double width_in_points, double
			-- height_in_points);
		external "C use <cairo.h>"
		end
	
	cairo_pdf_surface_create_for_stream (a_write_func, a_closure: POINTER; a_width_in_points, an_height_in_points: REAL): POINTER
			--	cairo_surface_t* cairo_pdf_surface_create_for_stream
			--	(cairo_write_func_t write_func, void *closure, double
			--	width_in_points, double height_in_points);
		external "C use <cairo.h>"
		end
	

	cairo_pdf_surface_set_size (a_surface: POINTER; a_width_in_points, an_height_in_points: REAL)
			-- void cairo_pdf_surface_set_size (cairo_surface_t *surface,
			-- double width_in_points, double height_in_points);
		external "C use <cairo.h>"
		end
end
