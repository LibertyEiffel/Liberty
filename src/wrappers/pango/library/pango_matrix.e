indexing
	description: "."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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

class PANGO_MATRIX
	-- A structure specifying a transformation between user-space
	-- coordinates and device coordinates. The transformation is given
	-- by

	-- x_device = x_user * matrix->xx + y_user * matrix->xy + matrix->x0;

	-- y_device = x_user * matrix->yx + y_user * matrix->yy + matrix->y0;

	-- TODO: should/could be expanded. Put attention to the fact that 
	-- pango_matrix_copy returns a pointer to allocated memory which 
	-- is akin to an Eiffel reference object.

	--    double xx; 1st component of the transformation matrix
	--    double xy; 2nd component of the transformation matrix
	--    double yx; 3rd component of the transformation matrix
	--    double yy; 4th component of the transformation matrix
	--    double x0; x translation
	--    double y0; y translation

inherit 
	C_STRUCT redefine copy end

	-- locally reimplemented EIFFEL_OWNED 

-- insert PANGO_MATRIX_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation
	-- #define PANGO_MATRIX_INIT { 1., 0., 0., 1., 0., 0. }

	-- Constant that can be used to initialize a PangoMatrix to the
	-- identity transform.

	--  PangoMatrix matrix = PANGO_MATRIX_INIT; pango_matrix_rotate
	-- (&matrix, 45.);

	make is
			-- Create a new, uninitialized 
		do
			from_external_pointer(pango_matrix_copy(default_pointer))
			-- pango_matrix_copy returns the newly allocated PangoMatrix,
			-- which should be freed with pango_matrix_free(), or NULL if
			-- matrix was NULL.
		end

feature {ANY}
	copy (another: like Current) is
			-- Copies a PangoMatrix.
		do
			from_external_pointer(pango_matrix_copy(another.handle))
		end

	dispose is
		do 
			-- pango_matrix_free free a PangoMatrix created with pango_matrix_copy(). Does nothing 
			-- if handle is NULL.
			pango_matrix_free (handle)
		end

	translate (an_x, an_y: REAL) is 
			-- Changes the transformation represented by matrix to be the
			-- transformation given by first translating by (`an_x,' `an_y') then
			-- applying the original transformation.
		do
			pango_matrix_translate(handle,an_x,an_y)
		end

	scale (an_x, an_y: REAL) is 
			-- Changes the transformation represented by matrix to be the
			-- transformation given by first scaling by `an_x' in the X
			-- direction and `an_y' in the Y direction then applying the
			-- original transformation.
		do
			pango_matrix_scale(handle, an_x,an_y)
		end

	rotate (degrees: REAL) is
			-- Changes the transformation represented by matrix to be the
			-- transformation given by first rotating by degrees degrees
			-- counter-clokwise then applying the original
			-- transformation.
		do
			pango_matrix_rotate(handle, degrees)
		end   

	concat (another: PANGO_MATRIX) is
			-- Changes the transformation represented by matrix to be the
			-- transformation given by first applying transformation
			-- given by `another' matrix then applying the original
			-- transformation.
		do
			pango_matrix_concat(handle, another.handle)
		end

	font_scale_factor: REAL is
			-- the scale factor of a matrix on the height of the
			-- font. That is, the scale factor in the direction
			-- perpendicular to the vector that the X coordinate is
			-- mapped to.
		do
			Result:=pango_matrix_get_font_scale_factor(handle)   
		end

feature {ANY} -- TODO: Struct access
	--   PangoMatrix
	
	--  typedef struct {
	--    double xx;
	--    double xy;
	--    double yx;
	--    double yy;
	--    double x0;
	--    double y0;
	--  } PangoMatrix;

feature {}
	-- PANGO_TYPE_MATRIX

	-- #define PANGO_TYPE_MATRIX (pango_matrix_get_type ())

	-- The GObject type for PangoMatrix

feature {} -- External calls
	-- #define     PANGO_TYPE_MATRIX
	-- #define     PANGO_MATRIX_INIT
	pango_matrix_copy (a_matrix: POINTER): POINTER is
		external "C use <pango/pango.h>"
		end

	pango_matrix_free (a_matrix: POINTER) is
		external "C use <pango/pango.h>"
		end

	pango_matrix_translate (a_matrix: POINTER; a_tx, a_ty: REAL) is
		external "C use <pango/pango.h>"
		end

	pango_matrix_scale (a_matrix: POINTER; an_x, an_y: REAL) is
		external "C use <pango/pango.h>"
		end

	pango_matrix_rotate (a_matrix: POINTER; some_degrees: REAL) is
		external "C use <pango/pango.h>"
		end

	pango_matrix_concat (a_matrix, a_new_matrix: POINTER) is
		external "C use <pango/pango.h>"
		end

	pango_matrix_get_font_scale_factor (a_matrix: POINTER): REAL is
		external "C use <pango/pango.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <pango/pango.h>"
		alias "sizeof(PangoMatrix)"
		end
end -- class PANGO_MATRIX
