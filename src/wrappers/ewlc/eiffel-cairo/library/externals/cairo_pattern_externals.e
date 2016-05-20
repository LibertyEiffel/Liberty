note
	description: "External calls for CAIRO_PATTERN"
	copyright: "[
					Copyright (C) 2006, 2007 Paolo Redaelli ,
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

deferred class CAIRO_PATTERN_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	cairo_pattern_add_color_stop_rgb (a_pattern: POINTER; an_offset, a_red, a_green,  a_blue: REAL) is
			-- void cairo_pattern_add_color_stop_rgb (cairo_pattern_t
			-- *pattern, double offset, double red, double green, double
			-- blue);
		external "C use <cairo.h>"
		end

	cairo_pattern_add_color_stop_rgba (a_pattern: POINTER; an_offset, a_red, a_green, a_blue, an_alpha: REAL) is
			-- 	void        cairo_pattern_add_color_stop_rgba (cairo_pattern_t
			-- *pattern, double offset, double red, double green, double blue,
			-- double alpha);
		external "C use <cairo.h>"
		end

	cairo_pattern_create_rgb (a_red, a_green, a_blue: REAL): POINTER is
			--	cairo_pattern_t* cairo_pattern_create_rgb (double red, --
			--	double green, double blue);
		external "C use <cairo.h>"
		end

	cairo_pattern_create_rgba (a_red, a_green, a_blue, an_alpha: REAL): POINTER is
			-- cairo_pattern_t* cairo_pattern_create_rgba (double red,
			-- double green, double blue, double alpha);
		external "C use <cairo.h>"
		end

	cairo_pattern_create_for_surface (a_surface: POINTER): POINTER is
			-- cairo_pattern_t* cairo_pattern_create_for_surface
			-- (cairo_surface_t *surface);
		external "C use <cairo.h>"
		end

	cairo_pattern_create_linear (an_x0, an_y0, an_x1, an_y1: REAL): POINTER is
			--	cairo_pattern_t* cairo_pattern_create_linear (double x0,
			--	double y0, double x1, double y1);
		external "C use <cairo.h>"
		end

	cairo_pattern_create_radial (a_cx0, a_cy0, a_radius0, a_cx1, a_cy1, a_radius1: REAL): POINTER is
			-- cairo_pattern_t* cairo_pattern_create_radial (double cx0,
			-- double cy0, double radius0, double cx1, double cy1, double
			-- radius1);
		external "C use <cairo.h>"
		end

	cairo_pattern_destroy (a_pattern: POINTER) is
			--	void cairo_pattern_destroy (cairo_pattern_t *pattern);
		external "C use <cairo.h>"
		end

	cairo_pattern_reference (a_pattern: POINTER): POINTER is
			-- cairo_pattern_t* cairo_pattern_reference (cairo_pattern_t
			-- *pattern);
		external "C use <cairo.h>"
		end

	cairo_pattern_status (a_pattern: POINTER): INTEGER is
			-- cairo_status_t cairo_pattern_status (cairo_pattern_t
			-- *pattern);
		external "C use <cairo.h>"
		end

	-- TODO: enum        cairo_extend_t;
	cairo_pattern_set_extend (a_pattern: POINTER; an_extend: INTEGER) is
			--	void cairo_pattern_set_extend (cairo_pattern_t *pattern,
			--	cairo_extend_t extend);
		external "C use <cairo.h>"
		end

	cairo_pattern_get_extend (a_pattern: POINTER): INTEGER is
			--	cairo_extend_t cairo_pattern_get_extend (cairo_pattern_t
			--	*pattern);
		external "C use <cairo.h>"
		end

	cairo_pattern_set_filter (a_pattern: POINTER; a_filter: INTEGER) is
			-- void cairo_pattern_set_filter (cairo_pattern_t *pattern,
			-- cairo_filter_t filter);
		external "C use <cairo.h>"
		end

	cairo_pattern_get_filter (a_pattern: POINTER): INTEGER is
			-- cairo_filter_t cairo_pattern_get_filter (cairo_pattern_t
			-- *pattern);
		external "C use <cairo.h>"
		end

	cairo_pattern_set_matrix (a_pattern, a_matrix: POINTER) is
			-- void cairo_pattern_set_matrix (cairo_pattern_t *pattern,
			-- const cairo_matrix_t *matrix);
		external "C use <cairo.h>"
		end

	cairo_pattern_get_matrix (a_pattern, a_matrix: POINTER) is
			-- void cairo_pattern_get_matrix (cairo_pattern_t *pattern,
			-- cairo_matrix_t *matrix);
		external "C use <cairo.h>"
		end

	cairo_pattern_get_type (a_pattern: POINTER): INTEGER is
			-- cairo_pattern_type_t cairo_pattern_get_type
			-- (cairo_pattern_t *pattern);
		external "C use <cairo.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <cairo.h>"
		alias "sizeof(cairo_pattern_t)"
		end
end
