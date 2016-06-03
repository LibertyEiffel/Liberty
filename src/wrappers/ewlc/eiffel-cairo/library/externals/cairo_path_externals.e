note
	description: "External calls related to path handling "
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli,
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

deferred class CAIRO_PATH_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	--             cairo_path_t;
	-- union       cairo_path_data_t;
	-- enum        cairo_path_data_type_t;

	cairo_copy_path (a_cr: POINTER): POINTER is
			-- 	cairo_path_t* cairo_copy_path (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_copy_path_flat (a_cr: POINTER): POINTER is
			-- 	cairo_path_t* cairo_copy_path_flat (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_path_destroy (a_path: POINTER) is
			-- 	void cairo_path_destroy (cairo_path_t *path);
		external "C use <cairo.h>"
		end

	cairo_append_path (a_cr, a_path: POINTER) is
			-- 	void cairo_append_path (cairo_t *cr, cairo_path_t *path);
		external "C use <cairo.h>"
		end

	cairo_get_current_point (a_cr, an_x, an_y: POINTER) is
			-- void cairo_get_current_point (cairo_t *cr, double *x,
			-- double *y);
		external "C use <cairo.h>"
		end

	cairo_new_path (a_cr: POINTER) is
			-- 	void cairo_new_path (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_new_sub_path (a_cr: POINTER) is
			-- 	void cairo_new_sub_path (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_close_path (a_cr: POINTER) is
			-- 	void cairo_close_path (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_arc (a_cr: POINTER; an_xc, an_yc, a_radius, an_angle1, an_angle2: REAL) is
			-- void cairo_arc (cairo_t *cr, double xc, double yc, double
			-- radius, double angle1, double angle2);
		external "C use <cairo.h>"
		end

	cairo_arc_negative (a_cr: POINTER; an_xc, an_yc, a_radius, an_angle1, an_angle2: REAL) is
			-- void cairo_arc_negative (cairo_t *cr, double xc, double
			-- yc, double radius, double angle1, double angle2);
		external "C use <cairo.h>"
		end

	cairo_curve_to (a_cr: POINTER; an_x1, a_y1, a_x2, a_y2, a_x3, an_y3: REAL) is
			-- void cairo_curve_to (cairo_t *cr, double x1, double y1,
			-- double x2, double y2, double x3, double y3);
		external "C use <cairo.h>"
		end

	cairo_line_to (a_cr: POINTER; an_x, an_y: REAL) is
			-- 	void cairo_line_to (cairo_t *cr, double x, double y);
		external "C use <cairo.h>"
		end

	cairo_move_to (a_cr: POINTER; an_x, an_y: REAL) is
			-- void cairo_move_to (cairo_t *cr, double x, double y);
		external "C use <cairo.h>"
		end

	cairo_rectangle (a_cr: POINTER; an_x, an_y, a_width, an_height: REAL) is
			-- void cairo_rectangle (cairo_t *cr, double x, double y,
			-- double width, double height);
		external "C use <cairo.h>"
		end

	cairo_glyph_path (a_cr, some_glyphs: POINTER; a_num_glyphs: INTEGER) is
			-- 	void cairo_glyph_path (cairo_t *cr, cairo_glyph_t *glyphs, int num_glyphs);
		external "C use <cairo.h>"
		end

	cairo_text_path (a_cr, an_utf8: POINTER) is
			-- 	void cairo_text_path (cairo_t *cr, const char *utf8);
		external "C use <cairo.h>"
		end

	cairo_rel_curve_to (a_cr: POINTER; a_dx1, a_dy1, a_dx2, a_dy2, a_dx3, a_dy3: REAL) is
			--	void cairo_rel_curve_to (cairo_t *cr, double dx1, double
			--	dy1, double dx2, double dy2, double dx3, double dy3);
		external "C use <cairo.h>"
		end

	cairo_rel_line_to (a_cr: POINTER; a_dx, a_dy: REAL) is
			-- 	void cairo_rel_line_to (cairo_t *cr, double dx, double dy);
		external "C use <cairo.h>"
		end

	cairo_rel_move_to (a_cr: POINTER; a_dx, a_dy: REAL) is
			-- void cairo_rel_move_to (cairo_t *cr, double dx, double dy);
		external "C use <cairo.h>"
		end

	cairo_path_get_status (a_path: POINTER): INTEGER is
		external "C struct cairo_path_t get status use <cairo.h>"
		end

end
