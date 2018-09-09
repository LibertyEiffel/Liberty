note
	description: "External calls for features of CAIRO_SURFACE"
	copyright: "[
					Copyright (C) 2006-2018: , 2007 Paolo Redaelli ,
					              Soluciones Informaticas Libres S.A. (Except),
					              Cairo team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"
	date: "$Date:$"
	revision: "$Revision:$"
	wrapped_version: "1.2.4"

deferred class CAIRO_SURFACE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	cairo_surface_create_similar (a_other: POINTER; a_content, a_width, an_height: INTEGER): POINTER
			-- cairo_surface_t* cairo_surface_create_similar
			-- (cairo_surface_t *other, cairo_content_t content, int
			-- width, int height);
		external "C use <cairo.h>"
		end

	cairo_surface_destroy (a_surface: POINTER)
			-- 	void cairo_surface_destroy (cairo_surface_t *surface);
		external "C use <cairo.h>"
		end

	cairo_surface_finish (a_surface: POINTER)
			-- 	void cairo_surface_finish (cairo_surface_t *surface);
		external "C use <cairo.h>"
		end

	cairo_surface_flush (a_surface: POINTER)
			-- 	void cairo_surface_flush (cairo_surface_t *surface);
		external "C use <cairo.h>"
		end

	cairo_surface_get_font_options (a_surface, some_options: POINTER)
			-- 	void cairo_surface_get_font_options (cairo_surface_t *surface, cairo_font_options_t *options);
		external "C use <cairo.h>"
		end

	cairo_surface_get_content (a_surface: POINTER): INTEGER
			-- 	cairo_content_t cairo_surface_get_content (cairo_surface_t *surface);
		external "C use <cairo.h>"
		end

	cairo_surface_set_user_data (a_surface, a_key, user_data, destroy_func: POINTER): INTEGER
			-- 	cairo_status_t cairo_surface_set_user_data (cairo_surface_t *surface, const cairo_user_data_key_t *key, void *user_data, cairo_destroy_func_t destroy);
		external "C use <cairo.h>"
		end

	cairo_surface_get_user_data (a_surface, a_key: POINTER): POINTER
			-- 	void* cairo_surface_get_user_data (cairo_surface_t *surface, const cairo_user_data_key_t *key);
		external "C use <cairo.h>"
		end

	cairo_surface_mark_dirty (a_surface: POINTER)
			-- 	void cairo_surface_mark_dirty (cairo_surface_t *surface);
		external "C use <cairo.h>"
		end

	cairo_surface_mark_dirty_rectangle (a_surface: POINTER; an_x, an_y, a_width, an_height: INTEGER)
			-- void cairo_surface_mark_dirty_rectangle (cairo_surface_t
			-- *surface, int x, int y, int width, int height);
		external "C use <cairo.h>"
		end

	cairo_surface_reference (a_surface: POINTER): POINTER
			-- 	cairo_surface_t* cairo_surface_reference (cairo_surface_t *surface);
		external "C use <cairo.h>"
		end

	cairo_surface_set_device_offset (a_surface: POINTER; an_x_offset, an_y_offset: REAL)
			-- 	void cairo_surface_set_device_offset (cairo_surface_t *surface, double x_offset, double y_offset);
		external "C use <cairo.h>"
		end

	cairo_surface_get_device_offset (a_surface, an_x_offset, an_y_offset: POINTER)
			-- void cairo_surface_get_device_offset (cairo_surface_t
			-- *surface, double *x_offset, double *y_offset);
		external "C use <cairo.h>"
		end

	cairo_surface_set_fallback_resolution (a_surface: POINTER; a_x_pixels_per_inch, a_y_pixels_per_inch: REAL)
			-- void cairo_surface_set_fallback_resolution
			-- (cairo_surface_t *surface, double x_pixels_per_inch,
			-- double y_pixels_per_inch);
		external "C use <cairo.h>"
		end

	cairo_surface_status (a_surface: POINTER): INTEGER
			-- cairo_status_t cairo_surface_status (cairo_surface_t
			-- *surface);
		external "C use <cairo.h>"
		end

	cairo_surface_get_type (a_surface: POINTER): INTEGER
			-- cairo_surface_type_t cairo_surface_get_type
			-- (cairo_surface_t *surface);
		external "C use <cairo.h>"
		end


feature {ANY} -- size

	struct_size: INTEGER
		external "C inline use <cairo.h>"
		alias "sizeof(cairo_surface_t)"
		end

end -- class CAIRO_SURFACE_EXTERNALS
