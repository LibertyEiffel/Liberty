note
	description: "cairo_matrix_t -- Generic matrix operations."
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

class CAIRO_MATRIX
	-- CAIRO_MATRIX (cairo_matrix_t in C) is used throughout cairo to
	-- convert between different coordinate spaces. A cairo_matrix_t
	-- holds an affine transformation, such as a scale, rotation,
	-- shear, or a combination of these. The transformation of a point
	-- (x,y) is given by:
	
	--     x_new = xx * x + xy * y + x0;
	--     y_new = yx * x + yy * y + y0;

	-- The current transformation matrix of a cairo_t, represented as a
	-- cairo_matrix_t, defines the transformation from user-space
	-- coordinates to device-space coordinates. See `matrix'() and
	-- `set_matrix' in CAIRO_CONTEXT.

inherit C_STRUCT

insert
	CAIRO_MATRIX_EXTERNALS
	CAIRO_STATUS

create {ANY} make, allocate, from_external_pointer

feature {} -- Creation
	make (an_xx, an_yx, an_xy, an_yy, an_x0, an_y0: REAL) is
			-- Create matrix to be the affine transformation given by xx,
			-- yx, xy, yy, x0, y0. The transformation is given by:

			--  x_new = xx * x + xy * y + x0;
			--  y_new = yx * x + yy * y + y0;
			
			--   xx :     xx component of the affine transformation
			--   yx :     yx component of the affine transformation
			--   xy :     xy component of the affine transformation
			--   yy :     yy component of the affine transformation
			--   x0 :     X translation component of the affine transformation
			--   y0 :     Y translation component of the affine transformation
		do
			allocate
			cairo_matrix_init(handle, xx, yx, xy, yy, x0, y0);
		end

	identity is
			-- Create a matrix for the identity transformation.
		do
			allocate
			cairo_matrix_init_identity (handle)
		end

	translation (a_tx, a_ty: REAL) is
			-- Initializes matrix to a transformation that translates by
			-- `a_tx' and `a_ty' in the X and Y dimensions, respectively.
		do
			allocate
			cairo_matrix_init_translate (handle, a_tx, a_ty)
		end

	scaling (an_x_scale, an_y_scale: REAL) is
			-- Create matrix to a transformation that scales by
			-- `an_x_scale' and `an_y_scale' in the X and Y dimensions,
			-- respectively.
		do
			allocate
			cairo_matrix_init_scale(handle,an_x_scale,an_y_scale)
		end

	rotation (some_radians: REAL) is
			-- Create matrix as a transformation that rotates by `some_radians'.

			-- `some_radians': angle of rotation, in radians. The
			-- direction of rotation is defined such that positive angles
			-- rotate in the direction from the positive X axis toward
			-- the positive Y axis. With the default axis orientation of
			-- cairo, positive angles rotate in a clockwise direction.
		do
			allocate
			cairo_matrix_init_rotate(handle,some_radians)
		end

feature {ANY} -- Access
	xx: REAL is
			-- xx component of the affine transformation
		do
			Result := cairo_matrix_get_xx(handle)
		end

	yx: REAL is
			-- yx component of the affine transformation
		do
			Result := cairo_matrix_get_yx(handle)
		end

	xy: REAL is
			-- xy component of the affine transformation
		do
			Result := cairo_matrix_get_xy(handle)
		end

	yy: REAL is
			-- yy component of the affine transformation
		do
			Result := cairo_matrix_get_yy(handle)
		end

	x0: REAL is
			-- x0 component of the affine transformation
		do
			Result := cairo_matrix_get_x0(handle)
		end

	y0: REAL is
			-- y0 component of the affine transformation
		do
			Result := cairo_matrix_get_y0(handle)
		end

feature {ANY}
	translate (a_tx, a_ty: REAL) is
			-- Applies a translation by `a_tx', `a_ty' to the
			-- transformation in matrix. The effect of the new
			-- transformation is to first translate the coordinates by
			-- `a_tx' and `a_ty', then apply the original transformation
			-- to the coordinates.

			-- `a_tx' :     amount to translate in the X direction
			-- `a_ty' :     amount to translate in the Y direction		
		do
			cairo_matrix_translate(handle,a_tx,a_ty)
		end			

	scale (an_sx, an_sy: REAL) is
			-- Applies scaling by `an_sx', `an_sy' to the transformation
			-- in matrix. The effect of the new transformation is to
			-- first scale the coordinates by `an_sx' and `an_sy', then
			-- apply the original transformation to the coordinates.
		
			-- `an_sx' :     scale factor in the X direction
			-- `an_sy' :     scale factor in the Y direction
		do
			cairo_matrix_scale(handle,an_sx,an_sy)
		end

	rotate (some_radians: REAL) is
			-- Applies rotation by `some_radians' to the transformation
			-- in matrix. The effect of the new transformation is to
			-- first rotate the coordinates by radians, then apply the
			-- original transformation to the coordinates.
		
			-- `some_radians': angle of rotation, in radians. The
			-- direction of rotation is defined such that positive angles
			-- rotate in the direction from the positive X axis toward
			-- the positive Y axis. With the default axis orientation of
			-- cairo, positive angles rotate in a clockwise direction.
		do
			cairo_matrix_rotate(handle,some_radians)
		end

	inverse: CAIRO_MATRIX is
			-- The inverse of Current value. Void if Current does not
			-- have inverse, i.e.: if the matrix collapses points
			-- together (it is degenerate), then it has no inverse and
			-- this function will fail.
		local a_status: INTEGER
		do
			Result := twin
			a_status := cairo_matrix_invert (Result.handle)
			-- cairo_matrix_invert returns: If matrix has an inverse,
			-- modifies matrix to be the inverse matrix and returns
			-- CAIRO_STATUS_SUCCESS. Otherwise,
			if a_status = cairo_status_invalid_matrix then
				Result := Void
			end
		end

	inverted: BOOLEAN is
			-- True if matrix could be changed into the inverse of it's
			-- original value.

			-- Not all transformation matrices have inverses; if the
			-- matrix collapses points together (it is degenerate), then
			-- it has no inverse and this feature will be False and 
			-- matrix will not be changed.
		local a_status: INTEGER
		do
			Result:=(cairo_matrix_invert(handle) /= cairo_status_invalid_matrix)
		end

	infix "*" (another: like Current): like Current is
			-- A new matrix containing the multiplication of the affine
			-- transformations of Current and `another' together. The
			-- effect of the resulting transformation is to first apply
			-- the transformation in Current to the coordinates and then
			-- apply the transformation in `another' to the coordinates.
		require another_not_void: another /= Void
		do
			create Result.allocate
			cairo_matrix_multiply(Result.handle,handle,another.handle)
			-- TODO: since it is allowable for result to be identical to either current or 
			-- another, it is good to provide `multiply' and `square'.
			ensure not_void: Result/=Void
		end

feature {ANY} -- Memory handling
	dispose is
		do
			free(handle)
		end
end -- class CAIRO_MATRIX
