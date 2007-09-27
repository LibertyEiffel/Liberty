indexing
	description: "Paths: Creating paths and manipulating path data."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli,
					Soluciones Informaticas Libres S.A. (Except),
					Cairo team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
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

class CAIRO_PATH
	-- Notes for the implementator of cairo_path_t wrapper

	-- The cairo_path_t type is one area in which most language
	-- bindings will differ significantly from the C API. The C API for
	-- cairo_path_t is designed for efficiency and to avoid auxiliary
	-- objects that would be have to be manually memory managed by the
	-- application. However, a language binding should not present
	-- cairo_path_t as an array, but rather as an opaque that can be
	-- iterated over. Different languages have quite different
	-- conventions for how iterators work, so it is impossible to give
	-- an exact specification for how this API should work, but the
	-- type names and methods should be similar to the language's
	-- mapping of the following:
	
	-- typedef struct cairo_path_iterator cairo_path_iterator_t;
	-- typedef struct cairo_path_element cairo_path_element_t;
	
	-- cairo_path_iterator_t *cairo_path_get_iterator (cairo_path_t *path);
	
	-- cairo_bool_t cairo_path_iterator_has_next (cairo_path_iterator_t *iterator);
	
	-- cairo_path_element_t *cairo_path_iterator_next (cairo_path_iterator_t *iterator);
	
	-- cairo_path_element_type_t cairo_path_element_get_type (cairo_path_element_t *element);
	
	-- void cairo_path_element_get_point (cairo_path_element_t *element, int index, double *x, double *y);
	
	-- The above is written using the Java conventions for
	-- iterators. To illustrate how the API for PathIterator might
	-- depend on the native iteration conventions of the API, examine
	-- three versions of the loop, first written in a hypothetical Java
	-- binding:

	-- PathIterator iter = cr.copyPath().iterator();
	-- while (cr.hasNext()) {
	--     PathElement element = iter.next();
	--     if (element.getType() == PathElementType.MOVE_TO) {
	--         Point p = element.getPoint(0);
	--         doMoveTo (p.x, p.y);
	--     }
	-- }
	
	--   And then in a hypothetical C++ binding:
	
	-- Path path = cr.copyPath();
	-- for (PathIterator iter = path.begin(); iter != path.end(); iter++) {
	--     PathElement element = *iter;
	--     if (element.getType() == PathElementType.MOVE_TO) {
	--         Point p = element.getPoint(0);
	--         doMoveTo (p.x, p.y);
	--     }
	-- }

	--   And then finally in a Python binding:

	-- for element in cr.copy_path():
	--     if element.getType == cairo.PATH_ELEMENT_MOVE_TO:
	--         (x, y) = element.getPoint(0)
	--         doMoveTo (x, y);

	-- While many of the API elements stay the same in the three
	-- examples, the exact iteration mechanism is quite different, to
	-- match how users of the language would expect to iterate over a
	-- container.

	-- You should not present an API for mutating or for creating new
	-- cairo_path_t objects. In the future, these guidelines may be
	-- extended to present an API for creating a cairo_path_t from
	-- scratch for use with cairo_append_path() but the current
	-- expectation is that cairo_append_path() will mostly be used with
	-- paths from cairo_copy_path().

inherit
	SHARED_C_STRUCT
		redefine
			dispose
		end

insert
	CAIRO_PATH_EXTERNALS
	CAIRO_PATH_STRUCT
	CAIRO_STATUS

creation dummy, from_external_pointer

feature 

	dispose is
			-- Immediately releases all memory associated with
			-- path. 
		
			-- NOTE: cairo_path_destroy function should only be called
			-- with a pointer to a cairo_path_t returned by a cairo
			-- function. Any path that is created manually (ie. outside
			-- of cairo) should be destroyed manually as well.
		do
			cairo_path_destroy(handle)
			handle := default_pointer
		end

	-- TODO: features to manually build a path, instead of getting it 
	-- from a context.

	append (another: CAIRO_PATH) is
			-- Append `another' path onto the current path. The path may
			-- be either the return value from one of `copy_path' or
			-- `copy_path_flat' or it may be constructed manually. See
			-- cairo_path_t for details on how the path data structure
			-- should be initialized, and note that another.status must be
			-- initialized to `cairo_status_success'.
		require
			another_not_void: another /= Void
		do
			cairo_append_path(handle, another.handle)
		end

feature {} -- Unwrapped code

	--  cairo_glyph_path ()
	--
	-- void        cairo_glyph_path                (cairo_t *cr,
	--                                              cairo_glyph_t *glyphs,
	--                                              int num_glyphs);
	--
	--   cr :
	--   glyphs :
	--   num_glyphs :
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_text_path ()
	--
	-- void        cairo_text_path                 (cairo_t *cr,
	--                                              const char *utf8);
	--
	--   cr :
	--   utf8 :
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_rel_curve_to ()
	--
	-- void        cairo_rel_curve_to              (cairo_t *cr,
	--                                              double dx1,
	--                                              double dy1,
	--                                              double dx2,
	--                                              double dy2,
	--                                              double dx3,
	--                                              double dy3);
	--
	--   Relative-coordinate version of cairo_curve_to(). All offsets are relative
	--   to the current point. Adds a cubic Bezier spline to the path from the
	--   current point to a point offset from the current point by (dx3, dy3),
	--   using points offset by (dx1, dy1) and (dx2, dy2) as the control points.
	--   After this call the current point will be offset by (dx3, dy3).
	--
	--   Given a current point of (x, y), cairo_rel_curve_to (cr, dx1, dy1, dx2,
	--   dy2, dx3, dy3) is logically equivalent to cairo_curve_to (cr, x + dx1, y +
	--   dy1, x + dx2, y + dy2, x + dx3, y + dy3).
	--
	--   It is an error to call this function with no current point. Doing so will
	--   cause cr to shutdown with a status of CAIRO_STATUS_NO_CURRENT_POINT.
	--
	--   cr :  a cairo context
	--   dx1 : the X offset to the first control point
	--   dy1 : the Y offset to the first control point
	--   dx2 : the X offset to the second control point
	--   dy2 : the Y offset to the second control point
	--   dx3 : the X offset to the end of the curve
	--   dy3 : the Y offset to the end of the curve
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_rel_line_to ()
	--
	-- void        cairo_rel_line_to               (cairo_t *cr,
	--                                              double dx,
	--                                              double dy);
	--
	--   Relative-coordinate version of cairo_line_to(). Adds a line to the path
	--   from the current point to a point that is offset from the current point by
	--   (dx, dy) in user space. After this call the current point will be offset
	--   by (dx, dy).
	--
	--   Given a current point of (x, y), cairo_rel_line_to(cr, dx, dy) is
	--   logically equivalent to cairo_line_to (cr, x + dx, y + dy).
	--
	--   It is an error to call this function with no current point. Doing so will
	--   cause cr to shutdown with a status of CAIRO_STATUS_NO_CURRENT_POINT.
	--
	--   cr : a cairo context
	--   dx : the X offset to the end of the new line
	--   dy : the Y offset to the end of the new line
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_rel_move_to ()
	--
	-- void        cairo_rel_move_to               (cairo_t *cr,
	--                                              double dx,
	--                                              double dy);
	--
	--   Begin a new sub-path. After this call the current point will offset by (x,
	--   y).
	--
	--   Given a current point of (x, y), cairo_rel_move_to(cr, dx, dy) is
	--   logically equivalent to cairo_move_to (cr, x + dx, y + dy).
	--
	--   It is an error to call this function with no current point. Doing so will
	--   cause cr to shutdown with a status of CAIRO_STATUS_NO_CURRENT_POINT.
	--
	--   cr : a cairo context
	--   dx : the X offset
	--   dy : the Y offset

feature -- Access

	status: INTEGER is
			-- The current error status
		do
			Result := cairo_path_get_status (handle)
		ensure
			is_valid_cairo_status (Result)
		end

end -- class CAIRO_PATH
