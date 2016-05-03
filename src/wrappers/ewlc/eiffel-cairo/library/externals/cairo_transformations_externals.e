note
	description: "External calls for cairo context transformations"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class CAIRO_TRANSFORMATIONS_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	cairo_translate (a_context: POINTER; a_tx, a_ty: REAL) is
				-- void cairo_translate (cairo_t *cr, double tx, double ty);
		external "C use <cairo.h>"
		end

	cairo_scale (a_context: POINTER; a_sx, a_sy: REAL) is
				-- void cairo_scale (cairo_t *cr, double sx, double sy);
		external "C use <cairo.h>"
		end

	cairo_rotate (a_context: POINTER; an_angle: REAL) is
				-- void cairo_rotate (cairo_t *cr, double angle);
		external "C use <cairo.h>"
		end

	cairo_transform (a_context, a_matrix: POINTER) is
				-- void cairo_transform (cairo_t *cr, const cairo_matrix_t *matrix);
		external "C use <cairo.h>"
		end

	cairo_set_matrix (a_context, a_matrix: POINTER) is
			-- void cairo_set_matrix (cairo_t *cr, const cairo_matrix_t *matrix);
		external "C use <cairo.h>"
		end
	
	cairo_get_matrix (a_context, a_matrix: POINTER) is
				-- void cairo_get_matrix (cairo_t *cr, cairo_matrix_t *matrix);
		external "C use <cairo.h>"
		end

	cairo_identity_matrix (a_context: POINTER) is
				-- void cairo_identity_matrix (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_user_to_device (a_context, an_x, an_y: POINTER) is
			-- void cairo_user_to_device (cairo_t *cr, double *x, double *y);
		external "C use <cairo.h>"
		end
	
	cairo_user_to_device_distance (a_context, a_dx, a_dy: POINTER) is
				-- void cairo_user_to_device_distance (cairo_t *cr, double *dx, double *dy);
		external "C use <cairo.h>"
		end

	cairo_device_to_user (a_context, an_x, an_y: POINTER) is
			-- void cairo_device_to_user (cairo_t *cr, double *x, double *y);
		external "C use <cairo.h>"
		end
	
	cairo_device_to_user_distance (a_context, an_x, an_y: POINTER) is
				-- void cairo_device_to_user_distance (cairo_t *cr, double *dx, double *dy);
		external "C use <cairo.h>"
		end
end
