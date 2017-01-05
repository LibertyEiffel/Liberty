note
	description: "External calls for CAIRO_MATRIX"
	copyright: "[
					Copyright (C) 2006-2017: Paolo Radaelli,
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

deferred class CAIRO_MATRIX_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	cairo_matrix_init (a_matrix: POINTER; an_xx, an_yx, an_xy, an_yy, an_x0, an_y0: REAL)
			-- void cairo_matrix_init (cairo_matrix_t *matrix, double xx,
			-- double yx, double xy, double yy, double x0, double y0);
		external "C use <pango.h>"
		end

	cairo_matrix_init_identity (an_matrix: POINTER)
			-- void cairo_matrix_init_identity (cairo_matrix_t *matrix);
		external "C use <pango.h>"
		end

	cairo_matrix_init_translate (a_matrix: POINTER; a_tx, a_ty: REAL)
			-- void cairo_matrix_init_translate (cairo_matrix_t *matrix, double tx, double ty);
		external "C use <pango.h>"
		end

	cairo_matrix_init_scale (a_matrix: POINTER; an_sx, an_sy: REAL)
			-- void cairo_matrix_init_scale (cairo_matrix_t *matrix, double sx, double sy);
		external "C use <pango.h>"
		end

	cairo_matrix_init_rotate (a_matrix: POINTER; some_radians: REAL)
			-- void cairo_matrix_init_rotate (cairo_matrix_t *matrix, double radians);
		external "C use <pango.h>"
		end

	cairo_matrix_translate (a_matrix: POINTER; a_tx,a_ty: REAL)
			-- void cairo_matrix_translate (cairo_matrix_t *matrix, double tx, double ty);
		external "C use <pango.h>"
		end

	cairo_matrix_scale (a_matrix: POINTER; an_sx,an_sy: REAL)
			-- void cairo_matrix_scale (cairo_matrix_t *matrix, double sx, double sy);
		external "C use <pango.h>"
		end

	cairo_matrix_rotate (a_matrix: POINTER; some_radians: REAL)
			-- void cairo_matrix_rotate (cairo_matrix_t *matrix, double radians);
		external "C use <pango.h>"
		end

	cairo_matrix_invert (a_matrix: POINTER): INTEGER
			--	cairo_status_t cairo_matrix_invert (cairo_matrix_t *matrix);
		external "C use <pango.h>"
		end

	cairo_matrix_multiply (a_result, an_a, a_b: POINTER)
			-- void cairo_matrix_multiply (cairo_matrix_t *result,
			-- const cairo_matrix_t *a, const cairo_matrix_t *b);
		external "C use <pango.h>"
		end
	
	cairo_matrix_transform_distance (a_matrix, a_dx, a_dy: POINTER)
			-- void cairo_matrix_transform_distance (const cairo_matrix_t *matrix,
			-- double *dx, double *dy);
		external "C use <pango.h>"
		end

	cairo_matrix_transform_point (a_matrix, a_x, a_y: POINTER)
			-- void cairo_matrix_transform_point (const cairo_matrix_t *matrix,
			-- double *x, double *y);
		external "C use <pango.h>"
		end

feature {ANY} -- Access to the matrix structure

	cairo_matrix_get_xx (a_matrix: POINTER): REAL
		external "C struct cairo_matrix_t get xx use <cairo.h>"
		end

	cairo_matrix_get_xy (a_matrix: POINTER): REAL
		external "C struct cairo_matrix_t get xy use <cairo.h>"
		end

	cairo_matrix_get_x0 (a_matrix: POINTER): REAL
		external "C struct cairo_matrix_t get x0 use <cairo.h>"
		end

	cairo_matrix_get_yx (a_matrix: POINTER): REAL
		external "C struct cairo_matrix_t get yx use <cairo.h>"
		end

	cairo_matrix_get_yy (a_matrix: POINTER): REAL
		external "C struct cairo_matrix_t get yy use <cairo.h>"
		end

	cairo_matrix_get_y0 (a_matrix: POINTER): REAL
		external "C struct cairo_matrix_t get y0 use <cairo.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <cairo.h>"
		alias "sizeof(cairo_matrix_t)"
		end
end -- class CAIRO_MATRIX_EXTERNALS

