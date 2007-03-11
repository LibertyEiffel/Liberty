indexing
	description: "External calls for "
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class CAIRO_MATRIX_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	cairo_matrix_init (a_matrix: POINTER; an_xx, an_yx, an_xy, an_yy, an_x0, an_y0: REAL) is
			-- void cairo_matrix_init (cairo_matrix_t *matrix, double xx, double yx, double xy, double yy, double x0, double y0);
		external "C use <pango.h>"
		end

	cairo_matrix_init_identity (an_matrix: POINTER) is
			-- void cairo_matrix_init_identity (cairo_matrix_t *matrix);
		external "C use <pango.h>"
		end

	cairo_matrix_init_translate (a_matrix: POINTER; a_tx, a_ty: POINTER) is
			-- void cairo_matrix_init_translate (cairo_matrix_t *matrix, double tx, double ty);
		external "C use <pango.h>"
		end

	cairo_matrix_init_scale (a_matrix: POINTER; an_sx, an_sy: REAL) is
			-- void cairo_matrix_init_scale (cairo_matrix_t *matrix, double sx, double sy);
		external "C use <pango.h>"
		end

	cairo_matrix_init_rotate (a_matrix: POINTER; some_radians: REAL) is
			-- void cairo_matrix_init_rotate (cairo_matrix_t *matrix, double radians);
		external "C use <pango.h>"
		end

	cairo_matrix_translate (a_matrix: POINTER; a_tx,a_ty: REAL) is
			-- void cairo_matrix_translate (cairo_matrix_t *matrix, double tx, double ty);
		external "C use <pango.h>"
		end

	cairo_matrix_scale (a_matrix: POINTER; an_sx,an_sy: REAL) is
			-- void cairo_matrix_scale (cairo_matrix_t *matrix, double sx, double sy);
		external "C use <pango.h>"
		end

	cairo_matrix_rotate (a_matrix: POINTER; some_radians: REAL) is
			-- void cairo_matrix_rotate (cairo_matrix_t *matrix, double radians);
		external "C use <pango.h>"
		end

	cairo_matrix_invert (a_matrix: POINTER): INTEGER is
			--	cairo_status_t cairo_matrix_invert (cairo_matrix_t *matrix);
		external "C use <pango.h>"
		end

	cairo_matrix_multiply (a_result, an_a, a_b: POINTER) is
			-- void cairo_matrix_multiply (cairo_matrix_t *result, const cairo_matrix_t *a, const cairo_matrix_t *b);
		external "C use <pango.h>"
		end
	
	cairo_matrix_transform_distance (a_matrix, a_dx, a_dy: POINTER) is
			-- void cairo_matrix_transform_distance (const cairo_matrix_t *matrix, double *dx, double *dy);
		external "C use <pango.h>"
		end

	cairo_matrix_transform_point (a_matrix, a_x, a_y: POINTER) is
			-- void cairo_matrix_transform_point (const cairo_matrix_t *matrix, double *x, double *y);
		external "C use <pango.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <cairo.h>"
		alias "sizeof(cairo_matrix_t)"
		end
end -- class CAIRO_MATRIX_EXTERNALS

