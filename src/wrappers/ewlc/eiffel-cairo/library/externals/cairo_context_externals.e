note
	description: "External calls for features of CAIRO_CONTEXT"
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

deferred class CAIRO_CONTEXT_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	cairo_create (a_surface: POINTER): POINTER
			-- cairo_t* cairo_create (cairo_surface_t *target);
		external "C use <cairo.h>"
		end

	cairo_reference (a_context: POINTER): POINTER
			-- cairo_t* cairo_reference (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_destroy (a_context: POINTER)
			-- void cairo_destroy (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_status (a_context: POINTER): INTEGER
			-- cairo_status_t cairo_status (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_save (a_context: POINTER)
			-- void cairo_save (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_restore (a_context: POINTER)
			-- void cairo_restore (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_get_target (a_context: POINTER): POINTER
			-- cairo_surface_t* cairo_get_target (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_push_group (a_context: POINTER)
			-- void cairo_push_group (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_push_group_with_content (a_context: POINTER; a_content: INTEGER)
			-- void cairo_push_group_with_content (cairo_t *cr, cairo_content_t content);
		external "C use <cairo.h>"
		end

	cairo_pop_group (a_context: POINTER): POINTER
			-- cairo_pattern_t* cairo_pop_group (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_pop_group_to_source (a_context: POINTER)
			-- void cairo_pop_group_to_source (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_get_group_target (a_context: POINTER): POINTER
			-- cairo_surface_t* cairo_get_group_target (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_set_source_rgb (a_context: POINTER; a_red, a_green, a_blue: REAL)
			-- void cairo_set_source_rgb (cairo_t *cr, double red, double green, double blue);
		external "C use <cairo.h>"
		end

	cairo_set_source_rgba (a_context: POINTER; a_red, a_green, a_blue, an_alpha: REAL)
			-- void cairo_set_source_rgba (cairo_t *cr, double red,
			-- double green, double blue, double alpha);
		external "C use <cairo.h>"
		end

	cairo_set_source (a_context, a_source: POINTER)
			-- void cairo_set_source (cairo_t *cr, cairo_pattern_t *source);
		external "C use <cairo.h>"
		end

	cairo_set_source_surface (a_context, a_surface: POINTER; an_x, an_y: REAL)
			-- void cairo_set_source_surface (cairo_t *cr,
			-- cairo_surface_t *surface, double x, double y);
		external "C use <cairo.h>"
		end

	cairo_get_source (a_context: POINTER): POINTER
			-- cairo_pattern_t* cairo_get_source (cairo_t *cr);
		external "C use <cairo.h>"
		end

	-- enum cairo_antialias_t;
	
	cairo_set_antialias (a_context: POINTER; an_antialias: INTEGER)
			-- void cairo_set_antialias (cairo_t *cr, cairo_antialias_t antialias);
		external "C use <cairo.h>"
		end

	cairo_get_antialias (a_context: POINTER): INTEGER
			-- cairo_antialias_t cairo_get_antialias (cairo_t *cr);
		external "C use <cairo.h>"
		end
	
	cairo_set_dash (a_context, some_dashes: POINTER; a_num_dashes: INTEGER; an_offset: REAL)
			-- void cairo_set_dash (cairo_t *cr, const double *dashes,
			-- int num_dashes, double offset);
		external "C use <cairo.h>"
		end

	-- enum cairo_fill_rule_t;

	cairo_set_fill_rule (a_context: POINTER; a_fill_rule: INTEGER)
			-- void cairo_set_fill_rule (cairo_t *cr, cairo_fill_rule_t
			-- fill_rule);
		external "C use <cairo.h>"
		end

	cairo_get_fill_rule (a_context: POINTER): INTEGER
			-- cairo_fill_rule_t cairo_get_fill_rule (cairo_t *cr);
		external "C use <cairo.h>"
		end

	-- enum cairo_line_cap_t;

	cairo_set_line_cap (a_context: POINTER; a_line_cap: INTEGER)
			-- void cairo_set_line_cap (cairo_t *cr, cairo_line_cap_t
			-- line_cap);
		external "C use <cairo.h>"
		end

	cairo_get_line_cap (a_context: POINTER): INTEGER
			-- cairo_line_cap_t cairo_get_line_cap (cairo_t *cr);
		external "C use <cairo.h>"
		end

	-- enum cairo_line_join_t;
	
	cairo_set_line_join (a_context: POINTER; a_line_join: INTEGER)
			-- void cairo_set_line_join (cairo_t *cr, cairo_line_join_t line_join);
		external "C use <cairo.h>"
		end

	cairo_get_line_join (a_context: POINTER): INTEGER
			-- cairo_line_join_t cairo_get_line_join (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_set_line_width (a_context: POINTER; a_width: REAL)
			-- void cairo_set_line_width (cairo_t *cr, double width);
		external "C use <cairo.h>"
		end

	cairo_get_line_width (a_context: POINTER): REAL
			-- double cairo_get_line_width (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_set_miter_limit (a_context: POINTER; a_limit: REAL)
			-- void cairo_set_miter_limit (cairo_t *cr, double limit);
		external "C use <cairo.h>"
		end

	cairo_get_miter_limit (a_context: POINTER): REAL
			-- double cairo_get_miter_limit (cairo_t *cr);
		external "C use <cairo.h>"
		end
	
	-- enum cairo_operator_t;
	
	cairo_set_operator (a_context: POINTER; an_operator: INTEGER)
			-- void cairo_set_operator (cairo_t *cr, cairo_operator_t
			-- op);
		external "C use <cairo.h>"
		end

	cairo_get_operator (a_context: POINTER): INTEGER
			-- cairo_operator_t cairo_get_operator (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_set_tolerance (a_context: POINTER; a_tolerance: REAL)
			-- void cairo_set_tolerance (cairo_t *cr, double tolerance);
		external "C use <cairo.h>"
		end

	cairo_get_tolerance (a_context: POINTER): REAL
			-- double cairo_get_tolerance (cairo_t *cr);
		external "C use <cairo.h>"
		end
	
	cairo_clip (a_context: POINTER)
			-- void cairo_clip (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_clip_preserve (a_context: POINTER)
			-- void cairo_clip_preserve (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_reset_clip (a_context: POINTER)
			-- void cairo_reset_clip (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_fill (a_context: POINTER)
			-- void cairo_fill (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_fill_preserve (a_context: POINTER)
			-- void cairo_fill_preserve (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_fill_extents (a_context, an_x1, an_y1, an_x2, an_y2: POINTER )
			-- void cairo_fill_extents (cairo_t *cr, double *x1, double *y1, double *x2, double *y2);
		external "C use <cairo.h>"
		end

	cairo_in_fill (a_context: POINTER; a_x, an_y: REAL): INTEGER
			-- cairo_bool_t cairo_in_fill (cairo_t *cr, double x, double y);
		external "C use <cairo.h>"
		end

	cairo_mask (a_context, a_pattern: POINTER)
			-- void cairo_mask (cairo_t *cr, cairo_pattern_t *pattern);
		external "C use <cairo.h>"
		end

	cairo_mask_surface (a_context, a_surface: POINTER; a_surface_x, a_surface_y: REAL)
			-- void cairo_mask_surface (cairo_t *cr, cairo_surface_t
			-- *surface, double surface_x, double surface_y);
		external "C use <cairo.h>"
		end

	cairo_paint (a_context: POINTER)
			-- void cairo_paint (cairo_t *cr);
		external "C use <cairo.h>"
		end
	
	cairo_paint_with_alpha (a_context: POINTER; an_alpha: REAL)
			-- void cairo_paint_with_alpha (cairo_t *cr, double alpha);
		external "C use <cairo.h>"
		end

	cairo_stroke (a_context: POINTER)
			-- void cairo_stroke (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_stroke_preserve (a_context: POINTER)
			-- void cairo_stroke_preserve (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_stroke_extents (a_context, an_x1, an_y1, an_x2, an_y2: POINTER)
			-- void cairo_stroke_extents (cairo_t *cr, double *x1, double
			-- *y1, double *x2, double *y2);
		external "C use <cairo.h>"
		end

	cairo_in_stroke (a_context: POINTER; an_x, an_y: REAL): INTEGER
			-- cairo_bool_t cairo_in_stroke (cairo_t *cr, double x, double y);
		external "C use <cairo.h>"
		end

	cairo_copy_page (a_context: POINTER)
			-- void cairo_copy_page (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_show_page (a_context: POINTER)
			-- void cairo_show_page (cairo_t *cr);
		external "C use <cairo.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <cairo.h>"
		alias "sizeof(cairo_t)"
		end
end
