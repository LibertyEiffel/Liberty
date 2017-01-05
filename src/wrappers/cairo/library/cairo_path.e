note
	description: "Paths: Creating paths and manipulating path data."
	copyright: "[
					Copyright (C) 2007-2017: Paolo Redaelli,
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
	C_STRUCT

insert
	CAIRO_PATH_EXTERNALS
	CAIRO_PATH_STRUCT
	CAIRO_STATUS

create {ANY} from_external_pointer

feature {} -- Creation

	dispose
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

	append (another: CAIRO_PATH)
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

	-- get_current_point ()
	--
	-- void        cairo_get_current_point         (cairo_t *cr,
	--                                              double *x,
	--                                              double *y);
	--
	--   Gets the current point of the current path, which is conceptually the
	--   final point reached by the path so far.
	--
	--   The current point is returned in the user-space coordinate system. If
	--   there is no defined current point then x and y will both be set to 0.0.
	--
	--   Most path construction functions alter the current point. See the
	--   following for details on how they affect the current point:
	--
	--   cairo_new_path(), cairo_move_to(), cairo_line_to(), cairo_curve_to(),
	--   cairo_arc(), cairo_rel_move_to(), cairo_rel_line_to(),
	--   cairo_rel_curve_to(), cairo_arc(), cairo_text_path(),
	--   cairo_stroke_to_path()
	--
	--   cr : a cairo context
	--   x :  return value for X coordinate of the current point
	--   y :  return value for Y coordinate of the current point
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_new_path ()
	--
	-- void        cairo_new_path                  (cairo_t *cr);
	--
	--   Clears the current path. After this call there will be no path and no
	--   current point.
	--
	--   cr : a cairo context
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_new_sub_path ()
	--
	-- void        cairo_new_sub_path              (cairo_t *cr);
	--
	--   Begin a new sub-path. Note that the existing path is not affected. After
	--   this call there will be no current point.
	--
	--   In many cases, this call is not needed since new sub-paths are frequently
	--   started with cairo_move_to().
	--
	--   A call to cairo_new_sub_path() is particularly useful when beginning a new
	--   sub-path with one of the cairo_arc() calls. This makes things easier as it
	--   is no longer necessary to manually compute the arc's initial coordinates
	--   for a call to cairo_move_to().
	--
	--   cr : a cairo context
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_close_path ()
	--
	-- void        cairo_close_path                (cairo_t *cr);
	--
	--   Adds a line segment to the path from the current point to the beginning of
	--   the current sub-path, (the most recent point passed to cairo_move_to()),
	--   and closes this sub-path. After this call the current point will be at the
	--   joined endpoint of the sub-path.
	--
	--   The behavior of cairo_close_path() is distinct from simply calling
	--   cairo_line_to() with the equivalent coordinate in the case of stroking.
	--   When a closed sub-path is stroked, there are no caps on the ends of the
	--   sub-path. Instead, there is a line join connecting the final and initial
	--   segments of the sub-path.
	--
	--   If there is no current point before the call to cairo_close_path, this
	--   function will have no effect.
	--
	--   Note: As of cairo version 1.2.4 any call to cairo_close_path will place an
	--   explicit MOVE_TO element into the path immediately after the CLOSE_PATH
	--   element, (which can be seen in cairo_copy_path() for example). This can
	--   simplify path processing in some cases as it may not be necessary to save
	--   the "last move_to point" during processing as the MOVE_TO immediately
	--   after the CLOSE_PATH will provide that point.
	--
	--   cr : a cairo context
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_arc ()
	--
	-- void        cairo_arc                       (cairo_t *cr,
	--                                              double xc,
	--                                              double yc,
	--                                              double radius,
	--                                              double angle1,
	--                                              double angle2);
	--
	--   Adds a circular arc of the given radius to the current path. The arc is
	--   centered at (xc, yc), begins at angle1 and proceeds in the direction of
	--   increasing angles to end at angle2. If angle2 is less than angle1 it will
	--   be progressively increased by 2*M_PI until it is greater than angle1.
	--
	--   If there is a current point, an initial line segment will be added to the
	--   path to connect the current point to the beginning of the arc.
	--
	--   Angles are measured in radians. An angle of 0.0 is in the direction of the
	--   positive X axis (in user space). An angle of M_PI/2.0 radians (90 degrees)
	--   is in the direction of the positive Y axis (in user space). Angles
	--   increase in the direction from the positive X axis toward the positive Y
	--   axis. So with the default transformation matrix, angles increase in a
	--   clockwise direction.
	--
	--   (To convert from degrees to radians, use degrees * (M_PI / 180.).)
	--
	--   This function gives the arc in the direction of increasing angles; see
	--   cairo_arc_negative() to get the arc in the direction of decreasing angles.
	--
	--   The arc is circular in user space. To achieve an elliptical arc, you can
	--   scale the current transformation matrix by different amounts in the X and
	--   Y directions. For example, to draw an ellipse in the box given by x, y,
	--   width, height:
	--
	-- cairo_save (cr);
	-- cairo_translate (cr, x + width / 2., y + height / 2.);
	-- cairo_scale (cr, 1. / (height / 2.), 1. / (width / 2.));
	-- cairo_arc (cr, 0., 0., 1., 0., 2 * M_PI);
	-- cairo_restore (cr);
	--
	--   cr :     a cairo context
	--   xc :     X position of the center of the arc
	--   yc :     Y position of the center of the arc
	--   radius : the radius of the arc
	--   angle1 : the start angle, in radians
	--   angle2 : the end angle, in radians
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_arc_negative ()
	--
	-- void        cairo_arc_negative              (cairo_t *cr,
	--                                              double xc,
	--                                              double yc,
	--                                              double radius,
	--                                              double angle1,
	--                                              double angle2);
	--
	--   Adds a circular arc of the given radius to the current path. The arc is
	--   centered at (xc, yc), begins at angle1 and proceeds in the direction of
	--   decreasing angles to end at angle2. If angle2 is greater than angle1 it
	--   will be progressively decreased by 2*M_PI until it is greater than angle1.
	--
	--   See cairo_arc() for more details. This function differs only in the
	--   direction of the arc between the two angles.
	--
	--   cr :     a cairo context
	--   xc :     X position of the center of the arc
	--   yc :     Y position of the center of the arc
	--   radius : the radius of the arc
	--   angle1 : the start angle, in radians
	--   angle2 : the end angle, in radians
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_curve_to ()
	--
	-- void        cairo_curve_to                  (cairo_t *cr,
	--                                              double x1,
	--                                              double y1,
	--                                              double x2,
	--                                              double y2,
	--                                              double x3,
	--                                              double y3);
	--
	--   Adds a cubic Bezier spline to the path from the current point to position
	--   (x3, y3) in user-space coordinates, using (x1, y1) and (x2, y2) as the
	--   control points. After this call the current point will be (x3, y3).
	--
	--   If there is no current point before the call to cairo_curve_to() this
	--   function will behave as if preceded by a call to cairo_move_to (cr, x1,
	--   y1).
	--
	--   cr : a cairo context
	--   x1 : the X coordinate of the first control point
	--   y1 : the Y coordinate of the first control point
	--   x2 : the X coordinate of the second control point
	--   y2 : the Y coordinate of the second control point
	--   x3 : the X coordinate of the end of the curve
	--   y3 : the Y coordinate of the end of the curve
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_line_to ()
	--
	-- void        cairo_line_to                   (cairo_t *cr,
	--                                              double x,
	--                                              double y);
	--
	--   Adds a line to the path from the current point to position (x, y) in
	--   user-space coordinates. After this call the current point will be (x, y).
	--
	--   If there is no current point before the call to cairo_line_to() this
	--   function will behave as cairo_move_to (cr, x, y).
	--
	--   cr : a cairo context
	--   x :  the X coordinate of the end of the new line
	--   y :  the Y coordinate of the end of the new line
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_move_to ()
	--
	-- void        cairo_move_to                   (cairo_t *cr,
	--                                              double x,
	--                                              double y);
	--
	--   Begin a new sub-path. After this call the current point will be (x, y).
	--
	--   cr : a cairo context
	--   x :  the X coordinate of the new position
	--   y :  the Y coordinate of the new position
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_rectangle ()
	--
	-- void        cairo_rectangle                 (cairo_t *cr,
	--                                              double x,
	--                                              double y,
	--                                              double width,
	--                                              double height);
	--
	--   Adds a closed sub-path rectangle of the given size to the current path at
	--   position (x, y) in user-space coordinates.
	--
	--   This function is logically equivalent to:
	--
	-- cairo_move_to (cr, x, y);
	-- cairo_rel_line_to (cr, width, 0);
	-- cairo_rel_line_to (cr, 0, height);
	-- cairo_rel_line_to (cr, -width, 0);
	-- cairo_close_path (cr);
	--
	--   cr :     a cairo context
	--   x :      the X coordinate of the top left corner of the rectangle
	--   y :      the Y coordinate to the top left corner of the rectangle
	--   width :  the width of the rectangle
	--   height : the height of the rectangle
	--
	--   --------------------------------------------------------------------------
	--
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

feature {ANY} -- Access

	status: INTEGER
		-- The current error status
		do
			Result := cairo_path_get_status (handle)
		ensure
			is_valid_cairo_status (Result)
		end

end -- class CAIRO_PATH
