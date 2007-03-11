indexing
	description: "External calls for "
	copyright: "(C) 2007 Paolo Redaelli"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class _EXTERNALS

inherit ANY undefine is_equal, copy end

insert
	CAIRO_CONTENT
	CAIRO_SURFACE_TYPE
	
feature {} -- External calls

	cairo_surface_create_similar (a_other: POINTER, a_content, a_width, an_height: INTEGER): POINTER is
			-- cairo_surface_t* cairo_surface_create_similar
			-- (cairo_surface_t *other, cairo_content_t content, int
			-- width, int height);
		external "C use <cairo.h>"
		end

	cairo_surface_destroy (a_surface: POINTER) is
			-- 	void cairo_surface_destroy (cairo_surface_t *surface);
		external "C use <cairo.h>"
		end

	cairo_surface_finish (a_surface: POINTER) is
			-- 	void cairo_surface_finish (cairo_surface_t *surface);
		external "C use <cairo.h>"
		end

	cairo_surface_flush (a_surface: POINTER) is
			-- 	void cairo_surface_flush (cairo_surface_t *surface);
		external "C use <cairo.h>"
		end

	cairo_surface_get_font_options (a_surface, some_options: POINTER) is
			-- 	void cairo_surface_get_font_options (cairo_surface_t *surface, cairo_font_options_t *options);
		external "C use <cairo.h>"
		end

	cairo_surface_get_content (a_surface: POINTER): INTEGER is
			-- 	cairo_content_t cairo_surface_get_content (cairo_surface_t *surface);
		external "C use <cairo.h>"
		end

	cairo_surface_set_user_data (a_surface, a_key, user_data, destroy_func: POINTER): INTEGER is
			-- 	cairo_status_t cairo_surface_set_user_data (cairo_surface_t *surface, const cairo_user_data_key_t *key, void *user_data, cairo_destroy_func_t destroy);
		external "C use <cairo.h>"
		end

	cairo_surface_get_user_data (a_surface, a_key: POINTER): POINTER is
			-- 	void* cairo_surface_get_user_data (cairo_surface_t *surface, const cairo_user_data_key_t *key);
		external "C use <cairo.h>"
		end

	cairo_surface_mark_dirty (a_surface: POINTER) is
			-- 	void cairo_surface_mark_dirty (cairo_surface_t *surface);
		external "C use <cairo.h>"
		end

	cairo_surface_mark_dirty_rectangle (a_surface: POINTER; an_x, an_y, a_width, an_height: INTEGER) is
			-- void cairo_surface_mark_dirty_rectangle (cairo_surface_t
			-- *surface, int x, int y, int width, int height);
		external "C use <cairo.h>"
		end

	cairo_surface_reference (a_surface: POINTER): POINTER is
			-- 	cairo_surface_t* cairo_surface_reference (cairo_surface_t *surface);
		external "C use <cairo.h>"
		end

	cairo_surface_set_device_offset (a_surface: POINTER; an_x_offset, an_y_offset: REAL) is
			-- 	void cairo_surface_set_device_offset (cairo_surface_t *surface, double x_offset, double y_offset);
		external "C use <cairo.h>"
		end

	cairo_surface_get_device_offset (a_surface, an_x_offset, an_y_offset: POINTER) is
			-- void cairo_surface_get_device_offset (cairo_surface_t
			-- *surface, double *x_offset, double *y_offset);
		external "C use <cairo.h>"
		end

	cairo_surface_set_fallback_resolution (a_surface: POINTER; a_x_pixels_per_inch, a_y_pixels_per_inch: REAL) is
			-- void cairo_surface_set_fallback_resolution
			-- (cairo_surface_t *surface, double x_pixels_per_inch,
			-- double y_pixels_per_inch);
		external "C use <cairo.h>"
		end

	cairo_surface_status (a_surface: POINTER): INTEGER is
			-- cairo_status_t cairo_surface_status (cairo_surface_t
			-- *surface);
		external "C use <cairo.h>"
		end

	cairo_surface_get_type (a_surface: POINTER): INTEGER is
			-- cairo_surface_type_t cairo_surface_get_type
			-- (cairo_surface_t *surface);
		external "C use <cairo.h>"
		end


feature -- size
	struct_size: INTEGER is
		external "C inline use <cairo.h>"
		alias "sizeof(cairo_surface_t)"
		end
end
