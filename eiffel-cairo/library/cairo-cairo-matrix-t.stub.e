indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "1.2.4"

class FOO

inherit
	(SHARED_?)C_STRUCT

insert
	FOO_EXTERNALS

creation make, from_external_pointer

feature {} -- Creation

	--   Link: Cairo: A Vector Graphics Library (start)
	--   Link: Utilities (parent)
	--   Link: Utilities (previous)
	--   Link: Error handling (next)
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
	--   Top  |  Description
	--
	--   cairo_matrix_t
	--
	--   cairo_matrix_t -- Generic matrix operations
	--
	--Synopsis
	--
	--
	--
	--
	--             cairo_matrix_t;
	-- void        cairo_matrix_init               (cairo_matrix_t *matrix,
	--                                              double xx,
	--                                              double yx,
	--                                              double xy,
	--                                              double yy,
	--                                              double x0,
	--                                              double y0);
	-- void        cairo_matrix_init_identity      (cairo_matrix_t *matrix);
	-- void        cairo_matrix_init_translate     (cairo_matrix_t *matrix,
	--                                              double tx,
	--                                              double ty);
	-- void        cairo_matrix_init_scale         (cairo_matrix_t *matrix,
	--                                              double sx,
	--                                              double sy);
	-- void        cairo_matrix_init_rotate        (cairo_matrix_t *matrix,
	--                                              double radians);
	-- void        cairo_matrix_translate          (cairo_matrix_t *matrix,
	--                                              double tx,
	--                                              double ty);
	-- void        cairo_matrix_scale              (cairo_matrix_t *matrix,
	--                                              double sx,
	--                                              double sy);
	-- void        cairo_matrix_rotate             (cairo_matrix_t *matrix,
	--                                              double radians);
	-- cairo_status_t cairo_matrix_invert          (cairo_matrix_t *matrix);
	-- void        cairo_matrix_multiply           (cairo_matrix_t *result,
	--                                              const cairo_matrix_t *a,
	--                                              const cairo_matrix_t *b);
	-- void        cairo_matrix_transform_distance (const cairo_matrix_t *matrix,
	--                                              double *dx,
	--                                              double *dy);
	-- void        cairo_matrix_transform_point    (const cairo_matrix_t *matrix,
	--                                              double *x,
	--                                              double *y);
	--
	--Description
	--
	--   cairo_matrix_t is used throughout cairo to convert between different
	--   coordinate spaces. A cairo_matrix_t holds an affine transformation, such
	--   as a scale, rotation, shear, or a combination of these. The transformation
	--   of a point (x,y) is given by:
	--
	--     x_new = xx * x + xy * y + x0;
	--     y_new = yx * x + yy * y + y0;
	--
	--
	--   The current transformation matrix of a cairo_t, represented as a
	--   cairo_matrix_t, defines the transformation from user-space coordinates to
	--   device-space coordinates. See cairo_get_matrix() and cairo_set_matrix().
	--
	--Details
	--
	--  cairo_matrix_t
	--
	-- typedef struct {
	--     double xx; double yx;
	--     double xy; double yy;
	--     double x0; double y0;
	-- } cairo_matrix_t;
	--
	--   A cairo_matrix_t holds an affine transformation, such as a scale,
	--   rotation, shear, or a combination of those. The transformation of a point
	--   (x, y) is given by:
	--
	--     x_new = xx * x + xy * y + x0;
	--     y_new = yx * x + yy * y + y0;
	--
	--   double xx; xx component of the affine transformation
	--   double yx; yx component of the affine transformation
	--   double xy; xy component of the affine transformation
	--   double yy; yy component of the affine transformation
	--   double x0; X translation component of the affine transformation
	--   double y0; Y translation component of the affine transformation
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_matrix_init ()
	--
	-- void        cairo_matrix_init               (cairo_matrix_t *matrix,
	--                                              double xx,
	--                                              double yx,
	--                                              double xy,
	--                                              double yy,
	--                                              double x0,
	--                                              double y0);
	--
	--   Sets matrix to be the affine transformation given by xx, yx, xy, yy, x0,
	--   y0. The transformation is given by:
	--
	--  x_new = xx * x + xy * y + x0;
	--  y_new = yx * x + yy * y + y0;
	--
	--   matrix : a cairo_matrix_t
	--   xx :     xx component of the affine transformation
	--   yx :     yx component of the affine transformation
	--   xy :     xy component of the affine transformation
	--   yy :     yy component of the affine transformation
	--   x0 :     X translation component of the affine transformation
	--   y0 :     Y translation component of the affine transformation
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_matrix_init_identity ()
	--
	-- void        cairo_matrix_init_identity      (cairo_matrix_t *matrix);
	--
	--   Modifies matrix to be an identity transformation.
	--
	--   matrix : a cairo_matrix_t
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_matrix_init_translate ()
	--
	-- void        cairo_matrix_init_translate     (cairo_matrix_t *matrix,
	--                                              double tx,
	--                                              double ty);
	--
	--   Initializes matrix to a transformation that translates by tx and ty in the
	--   X and Y dimensions, respectively.
	--
	--   matrix : a cairo_matrix_t
	--   tx :     amount to translate in the X direction
	--   ty :     amount to translate in the Y direction
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_matrix_init_scale ()
	--
	-- void        cairo_matrix_init_scale         (cairo_matrix_t *matrix,
	--                                              double sx,
	--                                              double sy);
	--
	--   Initializes matrix to a transformation that scales by sx and sy in the X
	--   and Y dimensions, respectively.
	--
	--   matrix : a cairo_matrix_t
	--   sx :     scale factor in the X direction
	--   sy :     scale factor in the Y direction
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_matrix_init_rotate ()
	--
	-- void        cairo_matrix_init_rotate        (cairo_matrix_t *matrix,
	--                                              double radians);
	--
	--   Initialized matrix to a transformation that rotates by radians.
	--
	--   matrix :  a cairo_matrix_t
	--   radians : angle of rotation, in radians. The direction of rotation is
	--             defined such that positive angles rotate in the direction from
	--             the positive X axis toward the positive Y axis. With the default
	--             axis orientation of cairo, positive angles rotate in a clockwise
	--             direction.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_matrix_translate ()
	--
	-- void        cairo_matrix_translate          (cairo_matrix_t *matrix,
	--                                              double tx,
	--                                              double ty);
	--
	--   Applies a translation by tx, ty to the transformation in matrix. The
	--   effect of the new transformation is to first translate the coordinates by
	--   tx and ty, then apply the original transformation to the coordinates.
	--
	--   matrix : a cairo_matrix_t
	--   tx :     amount to translate in the X direction
	--   ty :     amount to translate in the Y direction
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_matrix_scale ()
	--
	-- void        cairo_matrix_scale              (cairo_matrix_t *matrix,
	--                                              double sx,
	--                                              double sy);
	--
	--   Applies scaling by tx, ty to the transformation in matrix. The effect of
	--   the new transformation is to first scale the coordinates by sx and sy,
	--   then apply the original transformation to the coordinates.
	--
	--   matrix : a cairo_matrix_t
	--   sx :     scale factor in the X direction
	--   sy :     scale factor in the Y direction
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_matrix_rotate ()
	--
	-- void        cairo_matrix_rotate             (cairo_matrix_t *matrix,
	--                                              double radians);
	--
	--   Applies rotation by radians to the transformation in matrix. The effect of
	--   the new transformation is to first rotate the coordinates by radians, then
	--   apply the original transformation to the coordinates.
	--
	--   matrix :  a cairo_matrix_t
	--   radians : angle of rotation, in radians. The direction of rotation is
	--             defined such that positive angles rotate in the direction from
	--             the positive X axis toward the positive Y axis. With the default
	--             axis orientation of cairo, positive angles rotate in a clockwise
	--             direction.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_matrix_invert ()
	--
	-- cairo_status_t cairo_matrix_invert          (cairo_matrix_t *matrix);
	--
	--   Changes matrix to be the inverse of it's original value. Not all
	--   transformation matrices have inverses; if the matrix collapses points
	--   together (it is degenerate), then it has no inverse and this function will
	--   fail.
	--
	--   Returns: If matrix has an inverse, modifies matrix to be the inverse
	--   matrix and returns CAIRO_STATUS_SUCCESS. Otherwise,
	--
	--   matrix :  a cairo_matrix_t
	--   Returns : CAIRO_STATUS_INVALID_MATRIX.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_matrix_multiply ()
	--
	-- void        cairo_matrix_multiply           (cairo_matrix_t *result,
	--                                              const cairo_matrix_t *a,
	--                                              const cairo_matrix_t *b);
	--
	--   Multiplies the affine transformations in a and b together and stores the
	--   result in result. The effect of the resulting transformation is to first
	--   apply the transformation in a to the coordinates and then apply the
	--   transformation in b to the coordinates.
	--
	--   It is allowable for result to be identical to either a or b.
	--
	--   result : a cairo_matrix_t in which to store the result
	--   a :      a cairo_matrix_t
	--   b :      a cairo_matrix_t
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_matrix_transform_distance ()
	--
	-- void        cairo_matrix_transform_distance (const cairo_matrix_t *matrix,
	--                                              double *dx,
	--                                              double *dy);
	--
	--   Transforms the distance vector (dx,dy) by matrix. This is similar to
	--   cairo_matrix_transform_point() except that the translation components of
	--   the transformation are ignored. The calculation of the returned vector is
	--   as follows:
	--
	-- dx2 = dx1 * a + dy1 * c;
	-- dy2 = dx1 * b + dy1 * d;
	--
	--   Affine transformations are position invariant, so the same vector always
	--   transforms to the same vector. If (x1,y1) transforms to (x2,y2) then
	--   (x1+dx1,y1+dy1) will transform to (x1+dx2,y1+dy2) for all values of x1 and
	--   x2.
	--
	--   matrix : a cairo_matrix_t
	--   dx :     X component of a distance vector. An in/out parameter
	--   dy :     Y component of a distance vector. An in/out parameter
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_matrix_transform_point ()
	--
	-- void        cairo_matrix_transform_point    (const cairo_matrix_t *matrix,
	--                                              double *x,
	--                                              double *y);
	--
	--   Transforms the point (x, y) by matrix.
	--
	--   matrix : a cairo_matrix_t
	--   x :      X position. An in/out parameter
	--   y :      Y position. An in/out parameter

end -- class FOO
