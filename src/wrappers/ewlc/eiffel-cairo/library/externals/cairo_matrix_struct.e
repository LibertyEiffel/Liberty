note
	description: "Access to cairo_matrix_t C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class CAIRO_MATRIX_STRUCT
	--   A cairo_matrix_t holds an affine transformation, such as a scale,
	--   rotation, shear, or a combination of those. The transformation of a point
	--   (x, y) is given by:
	--
	--     x_new = xx * x + xy * y + x0;
	--     y_new = yx * x + yy * y + y0;

feature {} -- Structure getter/setter calls
	--  cairo_matrix_t
	--
	-- typedef struct {
	--     double xx; double yx;
	--     double xy; double yy;
	--     double x0; double y0;
	-- } cairo_matrix_t;
	--
	--


	get_xx (a_struct: POINTER): REAL
			--   double xx; xx component of the affine transformation
		external "C struct cairo_matrix_t get xx use <pango.h>"
		end

	set_xx_external (a_struct: POINTER; a_xx: REAL)
		external "C struct cairo_matrix_t set xx use <pango.h>"
		end

	--   double yx; yx component of the affine transformation
	get_yx (a_struct: POINTER): REAL
		external "C struct cairo_matrix_t get yx use <pango.h>"
		end

	set_yx_external (a_struct: POINTER; a_yx: REAL)
		external "C struct cairo_matrix_t set yx use <pango.h>"
		end

	--   double xy; xy component of the affine transformation
	get_xy (a_struct: POINTER): REAL
		external "C struct cairo_matrix_t get xy use <pango.h>"
		end

	set_xy_external (a_struct: POINTER; a_xy: REAL)
		external "C struct cairo_matrix_t set xy use <pango.h>"
		end

	--   double yy; yy component of the affine transformation
	get_yy (a_struct: POINTER): REAL
		external "C struct cairo_matrix_t get yy use <pango.h>"
		end

	set_yy_external (a_struct: POINTER; a_yy: REAL)
		external "C struct cairo_matrix_t set yy use <pango.h>"
		end

	--   double x0; X translation component of the affine transformation
	get_x0 (a_struct: POINTER): REAL
		external "C struct cairo_matrix_t get x0 use <pango.h>"
		end

	set_x0_external (a_struct: POINTER; a_x0: REAL)
		external "C struct cairo_matrix_t set x0 use <pango.h>"
		end

	--   double y0; Y translation component of the affine transformation
	get_y0 (a_struct: POINTER): REAL
		external "C struct cairo_matrix_t get y0 use <pango.h>"
		end

	set_y0_external (a_struct: POINTER; a_y0: REAL)
		external "C struct cairo_matrix_t set y0 use <pango.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <pango.h>"
		alias "sizeof(cairo_matrix_t)"
		end

end
