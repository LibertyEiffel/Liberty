note
	description: "."
	copyright: "[
					Copyright (C) 2007-2017: Paolo Redaelli, GTK+ team
					
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
	--   Link: Drawing (parent)
	--   Link: Patterns (previous)
	--   Link: Text (next)
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
	--   Transformations
	--
	--   Transformations -- Manipulating the current transformation matrix
	--
	--Synopsis
	--
	--
	--
	--
	-- void        cairo_translate                 (cairo_t *cr,
	--                                              double tx,
	--                                              double ty);
	-- void        cairo_scale                     (cairo_t *cr,
	--                                              double sx,
	--                                              double sy);
	-- void        cairo_rotate                    (cairo_t *cr,
	--                                              double angle);
	-- void        cairo_transform                 (cairo_t *cr,
	--                                              const cairo_matrix_t *matrix);
	-- void        cairo_set_matrix                (cairo_t *cr,
	--                                              const cairo_matrix_t *matrix);
	-- void        cairo_get_matrix                (cairo_t *cr,
	--                                              cairo_matrix_t *matrix);
	-- void        cairo_identity_matrix           (cairo_t *cr);
	-- void        cairo_user_to_device            (cairo_t *cr,
	--                                              double *x,
	--                                              double *y);
	-- void        cairo_user_to_device_distance   (cairo_t *cr,
	--                                              double *dx,
	--                                              double *dy);
	-- void        cairo_device_to_user            (cairo_t *cr,
	--                                              double *x,
	--                                              double *y);
	-- void        cairo_device_to_user_distance   (cairo_t *cr,
	--                                              double *dx,
	--                                              double *dy);
	--
	--Description
	--
	--Details
	--
	--  cairo_translate ()
	--
	-- void        cairo_translate                 (cairo_t *cr,
	--                                              double tx,
	--                                              double ty);
	--
	--   Modifies the current transformation matrix (CTM) by translating the
	--   user-space origin by (tx, ty). This offset is interpreted as a user-space
	--   coordinate according to the CTM in place before the new call to
	--   cairo_translate. In other words, the translation of the user-space origin
	--   takes place after any existing transformation.
	--
	--   cr : a cairo context
	--   tx : amount to translate in the X direction
	--   ty : amount to translate in the Y direction
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_scale ()
	--
	-- void        cairo_scale                     (cairo_t *cr,
	--                                              double sx,
	--                                              double sy);
	--
	--   Modifies the current transformation matrix (CTM) by scaling the X and Y
	--   user-space axes by sx and sy respectively. The scaling of the axes takes
	--   place after any existing transformation of user space.
	--
	--   cr : a cairo context
	--   sx : scale factor for the X dimension
	--   sy : scale factor for the Y dimension
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_rotate ()
	--
	-- void        cairo_rotate                    (cairo_t *cr,
	--                                              double angle);
	--
	--   Modifies the current transformation matrix (CTM) by rotating the
	--   user-space axes by angle radians. The rotation of the axes takes places
	--   after any existing transformation of user space. The rotation direction
	--   for positive angles is from the positive X axis toward the positive Y
	--   axis.
	--
	--   cr :    a cairo context
	--   angle : angle (in radians) by which the user-space axes will be rotated
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_transform ()
	--
	-- void        cairo_transform                 (cairo_t *cr,
	--                                              const cairo_matrix_t *matrix);
	--
	--   Modifies the current transformation matrix (CTM) by applying matrix as an
	--   additional transformation. The new transformation of user space takes
	--   place after any existing transformation.
	--
	--   cr :     a cairo context
	--   matrix : a transformation to be applied to the user-space axes
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_set_matrix ()
	--
	-- void        cairo_set_matrix                (cairo_t *cr,
	--                                              const cairo_matrix_t *matrix);
	--
	--   Modifies the current transformation matrix (CTM) by setting it equal to
	--   matrix.
	--
	--   cr :     a cairo context
	--   matrix : a transformation matrix from user space to device space
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_get_matrix ()
	--
	-- void        cairo_get_matrix                (cairo_t *cr,
	--                                              cairo_matrix_t *matrix);
	--
	--   Stores the current transformation matrix (CTM) into matrix.
	--
	--   cr :     a cairo context
	--   matrix : return value for the matrix
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_identity_matrix ()
	--
	-- void        cairo_identity_matrix           (cairo_t *cr);
	--
	--   Resets the current transformation matrix (CTM) by setting it equal to the
	--   identity matrix. That is, the user-space and device-space axes will be
	--   aligned and one user-space unit will transform to one device-space unit.
	--
	--   cr : a cairo context
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_user_to_device ()
	--
	-- void        cairo_user_to_device            (cairo_t *cr,
	--                                              double *x,
	--                                              double *y);
	--
	--   Transform a coordinate from user space to device space by multiplying the
	--   given point by the current transformation matrix (CTM).
	--
	--   cr : a cairo context
	--   x :  X value of coordinate (in/out parameter)
	--   y :  Y value of coordinate (in/out parameter)
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_user_to_device_distance ()
	--
	-- void        cairo_user_to_device_distance   (cairo_t *cr,
	--                                              double *dx,
	--                                              double *dy);
	--
	--   Transform a distance vector from user space to device space. This function
	--   is similar to cairo_user_to_device() except that the translation
	--   components of the CTM will be ignored when transforming (dx,dy).
	--
	--   cr : a cairo context
	--   dx : X component of a distance vector (in/out parameter)
	--   dy : Y component of a distance vector (in/out parameter)
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_device_to_user ()
	--
	-- void        cairo_device_to_user            (cairo_t *cr,
	--                                              double *x,
	--                                              double *y);
	--
	--   Transform a coordinate from device space to user space by multiplying the
	--   given point by the inverse of the current transformation matrix (CTM).
	--
	--   cr : a cairo
	--   x :  X value of coordinate (in/out parameter)
	--   y :  Y value of coordinate (in/out parameter)
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_device_to_user_distance ()
	--
	-- void        cairo_device_to_user_distance   (cairo_t *cr,
	--                                              double *dx,
	--                                              double *dy);
	--
	--   Transform a distance vector from device space to user space. This function
	--   is similar to cairo_device_to_user() except that the translation
	--   components of the inverse CTM will be ignored when transforming (dx,dy).
	--
	--   cr : a cairo context
	--   dx : X component of a distance vector (in/out parameter)
	--   dy : Y component of a distance vector (in/out parameter)

end -- class FOO
