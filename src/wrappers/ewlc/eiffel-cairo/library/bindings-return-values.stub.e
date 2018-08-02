note
	description: "."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "1.2.4"

class FOO

inherit
	(SHARED_?)C_STRUCT

insert
	FOO_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: Cairo: A Vector Graphics Library (start)
	--   Link: Appendix A. Creating a language binding for cairo (parent)
	--   Link: Memory Management (previous)
	--   Link: Overloading and optional arguments (next)
	--   Link: Part I. Tutorial (part)
	--   Link: Part II. Reference (part)
	--   Link: Drawing (chapter)
	--   Link: Fonts (chapter)
	--   Link: Surfaces (chapter)
	--   Link: Utilities (chapter)
	--   Link: Index (index)
	--   Link: Index of new symbols in 1.2 (index)
	--   Link: Appendix A. Creating a language binding for cairo (appendix)
	--
	--   Prev Up Home             Cairo: A Vector Graphics Library             Next
	--
	--Multiple return values
	--
	--   There are a number of functions in the cairo API that have multiple out
	--   parameters or in-out parameters. In some languages these can be translated
	--   into multiple return values. In Python, what is:
	--
	-- cairo_user_to_device (cr, &x, &y);
	--
	--   can by mapped to:
	--
	-- (x, y) = cr.user_to_device (cr, x, y);
	--
	--   but many languages don't have provisions for multiple return values, so it
	--   is necessary to introduce auxiliary types. Most of the functions that
	--   require the auxiliary types require a type that would, in C, look like
	--
	-- typedef struct _cairo_point cairo_point_t;
	-- struct _cairo_point {
	--     double x;
	--     double y;
	-- }
	--
	--   The same type should be used both for functions that use a pair of
	--   coordinates as an absolute position, and functions that use a pair of
	--   coordinates as a displacement. While an argument could be made that having
	--   a separate "distance" type is more correct, it is more likely just to
	--   confuse users.
	--
	-- void
	-- cairo_user_to_device (cairo_t *cr, double *x, double *y);
	--
	-- void
	-- cairo_user_to_device_distance (cairo_t *cr, double *dx, double *dy);
	--
	-- void
	-- cairo_device_to_user (cairo_t *cr, double *x, double *y);
	--
	-- void
	-- cairo_device_to_user_distance (cairo_t *cr, double *dx, double *dy);
	--
	-- void
	-- cairo_matrix_transform_distance (cairo_matrix_t *matrix, double *dx, double *dy);
	--
	-- void
	-- cairo_matrix_transform_point (cairo_matrix_t *matrix, double *x, double *y);
	--
	-- void
	-- cairo_get_current_point (cairo_t *cr, double *x, double *y);
	--
	--
	--   There are also a couple of functions that return four values representing
	--   a rectangle. These should be mapped to a "rectangle" type that looks like:
	--
	-- typedef struct _cairo_rectangle cairo_rectangle_t;
	-- struct _cairo_rectangle {
	--     double x;
	--     double y;
	--     double width;
	--     double height;
	-- }
	--
	--   The C function returns the rectangle as a set of two points to facilitate
	--   rounding to integral extents, but this isn't worth adding a "box" type to
	--   go along with the more obvious "rectangle" representation.
	--
	--   Q: Would it make sense here to define a standard cairo_rectangle_round()
	--   method that language bindings should map?
	--
	-- void
	-- cairo_stroke_extents (cairo_t *cr,
	--                       double *x1, double *y1,
	--                       double *x2, double *y2);
	--
	-- void
	-- cairo_fill_extents (cairo_t *cr,
	--                     double *x1, double *y1,
	--                     double *x2, double *y2);
	--

end -- class FOO
