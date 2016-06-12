note
	description: "	Vectors and matrices -- simple operations on vectors and matrices.."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTS team
					
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

class GTS_MATRIX
	-- Simple transformations on point coordinates. In particular projection onto
	-- a plane passing through the vertices of a given triangle or quadratic
	-- optimization problems.
	
inherit
	C_STRUCT
		redefine
			dispose, print_on
		end
	
	STREAM_HANDLER
		undefine
			is_equal, copy
		redefine
			print_on
		end
	
create {ANY} 
	make, from_external_pointer,
	zero, identity

feature {} -- Creation

	make (a00, a01, a02, a03,
			a10, a11, a12, a13,
			a20, a21, a22, a23,
			a30, a31, a32, a33: REAL) is
			-- Allocates memory and initializes a new GtsMatrix. 
		do
			from_external_pointer(gts_matrix_new(a00, a01, a02, a03,
															 a10, a11, a12, a13,
															 a20, a21, a22, a23,
															 a30, a31, a32, a33))
		end

	zero is
			-- Create a zero matrix (i.e.: all elements are 0)
		do
			from_external_pointer(gts_matrix_zero(default_pointer))
		end

	identity is
			-- Create an identity matrix.
		do
			from_external_pointer(gts_matrix_identity(default_pointer))
		end
	
	projection_of (a_triangle: GTS_TRIANGLE) is
			-- Creates a new GtsMatrix representing the projection onto a plane of
			-- normal given by `a_triangle'.
		require triangle_not_void: a_triangle/=Void
		do
			from_external_pointer(gts_matrix_projection(a_triangle.handle))
		end
	
	scaling_for (a_vector: GTS_VECTOR) is
			-- Create a matrix to be a scaling matrix for `a_vector'.
		local ptr: POINTER
		do
			from_external_pointer(gts_matrix_scale(default_pointer, a_vector.handle))
		end

feature {ANY}
	assign (a00, a01, a02, a03,
			  a10, a11, a12, a13,
			  a20, a21, a22, a23,
			  a30, a31, a32, a33: REAL) is
			-- 	Set values of matrix elements.
		do
			gts_matrix_assign (handle,
									 a00, a01, a02, a03,
									 a10, a11, a12, a13,
									 a20, a21, a22, a23,
									 a30, a31, a32, a33)
		end

	set_zero is
			-- Initializes matrix to zeros.
		local ptr: POINTER
		do
			ptr:=gts_matrix_zero(handle)
		end


	set_identity is
			-- Initializes Current matrix to an identity matrix. 
		do
			from_external_pointer(gts_matrix_identity(handle))
		end
	

	scale (a_vector: GTS_VECTOR) is
			-- Initializes Current to be a scaling matrix for `a_vector'. Allocates a matrix if m is
			-- NULL. -- 	m :        a GtsMatrix or NULL.
			-- 	s :        the scaling vector.
		local ptr: POINTER
		do
			ptr:=gts_matrix_scale(handle, a_vector.handle)
		end

--   gts_matrix_translate ()

--  GtsMatrix*  gts_matrix_translate            (GtsMatrix *m,
-- 															 GtsVector t);

-- 	Initializes m to a translation matrix for t. Allocates a new matrix if m is NULL.

-- 	m :        a GtsMatrix or NULL.
-- 	t :        the translation vector.
-- 	Returns :  the translation matix.

-- 	-----------------------------------------------------------------------------------------------------------

--   gts_matrix_rotate ()

--  GtsMatrix*  gts_matrix_rotate               (GtsMatrix *m,
-- 															 GtsVector r,
-- 															 gdouble angle);

-- 	Initializes m to a rotation matrix around r by angle. Allocates a new matrix if m is NULL.

-- 	m :        a GtsMatrix or NULL.
-- 	r :        the rotation axis.
-- 	angle :    the angle (in radians) to rotate by.
-- 	Returns :  the rotation matrix.

-- 	-----------------------------------------------------------------------------------------------------------

	transpose: GTS_MATRIX is
			-- the transposed of Current.
		do
			create Result.from_external_pointer(gts_matrix_transpose(handle))
		end

	determinant: REAL is
			-- the determinant of Current matrix.
		do
			Result := gts_matrix_determinant(handle)
		end


	inverse: GTS_MATRIX is
			-- the inverse of Current. Void if Current is not invertible
		local ptr: POINTER
		do
			ptr:=gts_matrix_inverse(handle)
			if ptr.is_not_null then 
				create Result.from_external_pointer(ptr)
			end
		end

	--   gts_matrix3_inverse ()

	--  GtsMatrix* gts_matrix3_inverse (GtsMatrix *m);

	-- 	m :        a 3x3 GtsMatrix.
	-- 	Returns : a pointer to a newly created 3x3 GtsMatrix inverse of m or
	-- 	NULL if m is not invertible.

	infix "*" (another: GTS_MATRIX): GTS_MATRIX is
			-- the product of Current and `another'.
		do
			create Result.from_external_pointer
			(gts_matrix_product(handle, another.handle))
		end

	--   gts_matrix_compatible_row ()
	
	--  guint gts_matrix_compatible_row (GtsMatrix *A, -- GtsVector b, -- guint
	--  n, -- GtsVector A1, -- gdouble b1);
	
	-- Given a system of n constraints A.x=b adds to it the compatible
	-- constraints defined by A1.x=b1. The compatibility is determined by
	-- insuring that the resulting system is well-conditioned (see Lindstrom and
	-- Turk (1998, 1999)).

	-- 	A :        a GtsMatrix.
	-- 	b :        a GtsVector.
	-- 	n :        the number of previous constraints of A.x=b.
	-- 	A1 :       a GtsMatrix.
	-- 	b1 :       a GtsVector.
	-- 	Returns :  the number of constraints of the resulting system.
	
	--   gts_matrix_quadratic_optimization ()
	
	-- guint gts_matrix_quadratic_optimization (GtsMatrix *A, GtsVector b, guint
	-- n, GtsMatrix *H, GtsVector c);

	-- Solve a quadratic optimization problem: Given a quadratic objective
	-- function f which can be written as: f(x) = x^t.H.x + c^t.x + k, where H is
	-- the symmetric positive definite Hessian of f and k is a constant, find the
	-- minimum of f subject to the set of n prior linear constraints, defined by
	-- the first n rows of A and b (A.x = b). The new constraints given by the
	-- minimization are added to A and b only if they are linearly independent as
	-- determined by gts_matrix_compatible_row().

	-- 	A :        a GtsMatrix.
	-- 	b :        a GtsVector.
	-- 	n :        the number of constraints (must be smaller than 3).
	-- 	H :        a symmetric positive definite Hessian.
	-- 	c :        a GtsVector.
	-- 	Returns :  the new number of constraints defined by A and b.

feature {ANY}
	print_on (a_file: OUTPUT_STREAM) is
			-- Print Current to `a_file'.
		do
			gts_matrix_print(handle, a_file.stream_pointer)
		end

feature {} -- Disposing
	dispose is
			-- 	Free all the memory allocated for m.
		do
			gts_matrix_destroy(handle)
		end

feature {} -- External calls
 gts_matrix_new (a00, a01, a02, a03, a10, a11, a12, a13, a20, a21, a22, a23, a30, a31, a32, a33: REAL): POINTER is
			--  GtsMatrix* gts_matrix_new (gdouble a00, gdouble a01, gdouble a02, gdouble a03, gdouble a10, gdouble a11, gdouble a12, gdouble a13, gdouble a20, gdouble a21, gdouble a22, gdouble a23, gdouble a30, gdouble a31, gdouble a32, gdouble a33);
		external "C use <gts.h>"
		end

	gts_matrix_assign (a_matrix: POINTER;
							 a00, a01, a02, a03,
							 a10, a11, a12, a13,
							 a20, a21, a22, a23,
							 a30, a31, a32, a33: REAL) is
			--  void gts_matrix_assign (GtsMatrix *m, gdouble a00, gdouble a01,
			--  gdouble a02, gdouble a03, gdouble a10, gdouble a11, gdouble a12,
			--  gdouble a13, gdouble a20, gdouble a21, gdouble a22, gdouble a23,
			--  gdouble a30, gdouble a31, gdouble a32, gdouble a33);
		external "C use <gts.h>"
		end
	
 gts_matrix_zero (a_matrix: POINTER): POINTER is
			--  GtsMatrix* gts_matrix_zero (GtsMatrix *m);
		external "C use <gts.h>"
		end

	gts_matrix_identity (a_matrix: POINTER): POINTER is
			--  GtsMatrix* gts_matrix_identity (GtsMatrix *m);
		external "C use <gts.h>"
		end

	gts_matrix_projection (a_triangle: POINTER): POINTER is
			--  GtsMatrix* gts_matrix_projection (GtsTriangle *t);
		external "C use <gts.h>"
		end

 gts_matrix_scale (a_matrix, a_vector: POINTER): POINTER is
			--  GtsMatrix* gts_matrix_scale (GtsMatrix *m, GtsVector s);
		external "C use <gts.h>"
		alias "gts_matrix_scale($a_matrix,*($a_vector))"
		end

	gts_matrix_translate (a_matrix, a_vector: POINTER): POINTER is
			--  GtsMatrix* gts_matrix_translate (GtsMatrix *m, GtsVector t);
		external "C use <gts.h>"
		alias "gts_matrix_translate($a_matrix,*($a_vector))"
		end

 gts_matrix_rotate (a_matrix, a_vector: POINTER; an_angle: REAL): POINTER is
			--  GtsMatrix* gts_matrix_rotate (GtsMatrix *m, GtsVector r, gdouble
			--  angle);
		external "C use <gts.h>"
		alias "gts_matrix_scale($a_matrix,*($a_vector),an_angle)"
		end
	
	gts_matrix_transpose (a_matrix: POINTER): POINTER is
			--  GtsMatrix* gts_matrix_transpose (GtsMatrix *m);
		external "C use <gts.h>"
		end
	
	gts_matrix_determinant (a_matrix: POINTER): REAL is
			--  gdouble gts_matrix_determinant (GtsMatrix *m);
		external "C use <gts.h>"
		end

	gts_matrix_inverse (a_matrix: POINTER): POINTER is
			--  GtsMatrix* gts_matrix_inverse (GtsMatrix *m);
		external "C use <gts.h>"
		end
	
	gts_matrix3_inverse (a_matrix: POINTER): POINTER is
			--  GtsMatrix* gts_matrix3_inverse (GtsMatrix *m);
		external "C use <gts.h>"
		end
	
	gts_matrix_product (a_matrix, another: POINTER): POINTER is
			--  GtsMatrix* gts_matrix_product (GtsMatrix *m1, GtsMatrix *m2);
		external "C use <gts.h>"
		end

	gts_matrix_compatible_row (an_a, a_b: POINTER; an_n: INTEGER; an_a1: POINTER; a_b1: REAL): INTEGER is
			-- guint gts_matrix_compatible_row (GtsMatrix *A, GtsVector b, guint n,
			-- GtsVector A1, gdouble b1);

			-- TODO: an_n and REsult should be NATURAL, since they are guint
		external "C use <gts.h>"
		alias "gts_matrix_compatible_row ($an_a, *($a_b), $an_n, *(an_a1),$a_b1)"
		end

	gts_matrix_quadratic_optimization (an_a, a_b: POINTER; an_n: INTEGER; an_h, a_c: POINTER): INTEGER is
			-- guint gts_matrix_quadratic_optimization (GtsMatrix *A, GtsVector b,
			-- guint n, GtsMatrix *H, GtsVector c);

			-- TODO: an_n and REsult should be NATURAL, since they are guint
		external "C use <gts.h>"
		alias "gts_matrix_quadratic_optimization ($an_a, *($a_b), $an_n, $an_h, *($a_c))"
		end

	gts_matrix_print (a_matrix, a_fptr: POINTER) is
			--  void gts_matrix_print (GtsMatrix *m, FILE *fptr);
		external "C use <gts.h>"
		end

	gts_matrix_destroy (a_matrix: POINTER) is
			--  void gts_matrix_destroy (GtsMatrix *m);
		external "C use <gts.h>"
		end

feature {} -- size
	struct_size: INTEGER is
		external "C inline use <gts.h>"
		alias "sizeof(GtsMatrix)"
		end
end -- class GTS_MATRIX
