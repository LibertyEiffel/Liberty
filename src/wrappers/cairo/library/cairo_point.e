note
	description: "A point in bidimentional space (for Cairo)."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli,
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

class CAIRO_POINT

inherit
	ANY
	WRAPPER_HANDLER

insert
	CAIRO_MATRIX_EXTERNALS
	CAIRO_TRANSFORMATIONS_EXTERNALS

create {ANY} make

feature {} -- Creation

	make (an_x, an_y: REAL)
		do
			x := an_x
			y := an_y
		end

feature {ANY}
	x, y: REAL

	transform_distance (a_matrix: CAIRO_MATRIX)
			-- Transforms Current point handled as a distance vector
			-- (dx,dy) by `a_matrix'. This is similar to
			-- `transform_point' except that the translation components
			-- of the transformation are ignored. The calculation of the
			-- returned vector is as follows:

			-- dx2 = dx1 * a + dy1 * c;
			-- dy2 = dx1 * b + dy1 * d;

			-- Affine transformations are position invariant, so the same
			-- vector always transforms to the same vector. If (x1,y1)
			-- transforms to (x2,y2) then (x1+dx1,y1+dy1) will transform
			-- to (x1+dx2,y1+dy2) for all values of x1 and x2.
		require matrix_not_void: a_matrix /= Void
		do
			cairo_matrix_transform_distance (a_matrix.handle, $x, $y)
		end

	transform_point (a_matrix: CAIRO_MATRIX)
			--  Transforms Current point (x, y) by matrix.
		require matrix_not_void: a_matrix /= Void
		do
			cairo_matrix_transform_point (a_matrix.handle, $x, $y)
		end

feature {ANY} -- Trasformations between user-space and device space 
	from_user_to_device (a_context: CAIRO_CONTEXT)
			-- Transform the point from user space to device space by
			-- multiplying the given point by the current transformation
			-- matrix (CTM).
		require
			context_not_void: a_context /= Void
		do
			cairo_user_to_device (a_context.handle, $x, $y)
		end

	from_user_to_device_distance (a_context: CAIRO_CONTEXT)
			-- Transform the point handled as a distance vector from user
			-- space to device space. This feature is similar to
			-- `from_user_to_device' except that the translation
			-- components of the CTM will be ignored when transforming.		
		require
			context_not_void: a_context /= Void
		do
			cairo_user_to_device_distance (a_context.handle, $x, $y)
		end
			
	from_device_to_user (a_context: CAIRO_CONTEXT)
			-- Transform a coordinate from device space to user space by
			-- multiplying the given point by the inverse of the current
			-- transformation matrix (CTM).
		require
			context_not_void: a_context /= Void
		do
			cairo_device_to_user (a_context.handle, $x, $y)
		end

	from_device_to_user_distance (a_context: CAIRO_CONTEXT)
			-- Transform point handled as a distance vector from device
			-- space to user space. This function is similar to
			-- `device_to_user' except that the translation components of
			-- the inverse CTM will be ignored when transforming.
		require
			context_not_void: a_context /= Void
		do
			cairo_device_to_user_distance (a_context.handle, $x, $y)
		end

end -- class CAIRO_POINT
