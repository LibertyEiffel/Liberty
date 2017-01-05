note
	description: "Operation on convex polyhedra"
	copyright: "[
					Copyright (C) 2001-2017: Natalia B. Bidart
					
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
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

class POLY

		-- A polyhedron is represented by a structure whose all elements
		-- should considered as private. Operations on polyhedra and
		-- possibly vectors and matrices assumes compatible dimensions of
		-- the parameters. This is checked when possible (we cannot check
		-- the compatibility of vectors with matrices or polyhedra).

		-- A polyhedron can be in minimal form or not. In the first
		-- case, the constraints, the generators, the saturation matrix,
		-- and the dimension of equality and lineality space are available.
		-- Otherwise, only the constraints or the generators are available.

inherit
	C_STRUCT
      redefine
         copy,
         is_equal,
         free_handle
      end

insert
	POLKA_GLOBAL
	POLY_EXTERNALS
   EIFFEL_OWNED

create {ANY} empty, universe, from_constraints, from_frame, copy, from_external_pointer

feature {} -- Creation

	empty (a_dimension: INTEGER)
			-- Creates an empty polyhedron of affine dimension
			-- `a_dimension', in minimized form.
		require
			a_dimension > 0
		do
			from_external_pointer (poly_empty (a_dimension))
		ensure
			dimension = a_dimension
		end

	universe (a_dimension: INTEGER)
			-- Creates an universe polyhedron of affine dimension
			-- `a_dimension', in minimized form.
		require
			a_dimension > 0
		do
			from_external_pointer (poly_universe (a_dimension))
		ensure
			dimension = a_dimension
		end

	from_constraints (a_matrix: POLKA_MATRIX)
			-- Creates a polyhedron defined by the constraints stored in
			-- `a_matrix'. The dimension of the polyhedron is equal to the
			-- number of columns of the matrix minus `polka_dec'.
			-- The returned polyhedron is not in a minimal form.
			
			-- It's the user responsability to put in the matrix the
			-- constraint \xi >= 0 or the constraints \xi >= \epsilon >= 0,
			-- if they are not implied by the other constraints. If you are
			-- not sure of what you are doing, use rather `poly_universe' and
			-- `add_constraints'.
		require
			a_matrix /= Void
			a_matrix.columns > polka_dec
			a_matrix.rows > 0 -- FIXME: ???????????
		local
			other_matrix: POLKA_MATRIX
		do
			create other_matrix.copy (a_matrix)
			from_external_pointer (poly_of_constraints (other_matrix.handle))
		ensure
			dimension = a_matrix.columns - polka_dec
		end

	from_frame (a_frame: POLKA_MATRIX)
			-- Creates a polyhedron defined by the generators stored in
			-- `a_matrix'. The same remarks as in `from_constraints' holds.
			-- The defined polyhedra have to be included in \xi >= 0 or
			-- \xi >= \epsilon >= 0. If you are not sure of what you are
			-- doing, use rather `poly_empty' and `add_frame'.
		require
			a_frame /= Void
			a_frame.columns > polka_dec
			a_frame.rows > 0 -- FIXME: ???????????
		local
			other_frame: POLKA_MATRIX
		do
			create other_frame.copy (a_frame)
			from_external_pointer (poly_of_frames (other_frame.handle))
		ensure
			dimension = a_frame.columns - polka_dec
		end

feature {ANY} -- Operations

	copy (other: like Current)
			-- Makes a copy of the polyhedron `other'.
			-- Referenced elements are recursively duplicated.
		do
			from_external_pointer (poly_copy (other.handle))
		end

	print_to_stdout
			-- Prints the Current polyhedron on standard output.
		do
			poly_print (handle)
		end

	minimize
			-- Computes the minimal representation of the polyhedron.
			-- Once minimized, both constraints and generators are
			-- available, as such as the saturation matrix and the
			-- dimension of equality and lineality spaces.
		do
			poly_minimize (handle)
		end

	canonicalize
			-- If `strict' is false, same effect as `minimize',
			-- but ensures also normalization of equalities and lines
			-- spaces (with Gauss elimination). Otherwise, normalizes the
			-- strict constraints of Current and performs minimization on the
			-- new set of constraints (also with normalization of
			-- equalities and lines spaces). This allows to remove
			-- constraints which are redundant considering the special
			-- meaning of the epsilon dimension.
		do
			poly_canonicalize (handle)
		end

feature {ANY} -- Access

	constraints: POLKA_MATRIX
			-- Return the matrix of constraints of the polyhedron,
			-- when this matrix is available, or Void if not.
			-- The obtained set of constraints may not be minimal.
		local
			c_ptr: POINTER
		do
			c_ptr := poly_constraints (handle)
			if c_ptr.is_not_null then
				create Result.copy_from_pointer (c_ptr)
			end
		ensure
			Result /= Void implies Result.columns = dimension + polka_dec
		end

	frame: POLKA_MATRIX
			-- Return the matrix of generators of the polyhedron, if
			-- available, or Void if not. The obtained set of generators
			-- may not be minimal.
		local
			c_ptr: POINTER
		do
			c_ptr := poly_frames (handle)
			if c_ptr.is_not_null then
				create Result.copy_from_pointer (c_ptr)
			end
		ensure
			Result /= Void implies Result.columns = dimension + polka_dec
		end

--const satmat_t* poly_satC (const poly_t* po)
			-- Return the saturation matrix, whose rows are indexed by generators and columns by constraints. The same remarks as above holds.

--const satmat_t* poly_satF (const poly_t* po)
			-- Return the saturation matrix, whose rows are indexed by constraints and columns by generators. The same remarks as above holds.

	dimension: INTEGER
			-- Return the (affine) dimension of the Current polyhedron
			-- (i.e., without taking into accound the additional columns of
			-- vectors and matrices).
		do
			Result := poly_dimension (handle)
		ensure
			Result > 0
		end

	n_equations: INTEGER
			-- Return the dimension of the equality space, i.e. the
			-- number of linearly independant equations satisfied by the
			-- polyhedron. Require minimization.
		do
			Result := poly_nbequations (handle)
		ensure
			Result >= 0 -- FIXME: ?????
		end

	n_lines: INTEGER
			-- Return the dimension of the lineality space, i.e. the
			-- number of linearly independant lines included in the
			-- polyhedron. Require minimization.
		do
			Result := poly_nblines (handle)
		ensure
			Result >= 0 -- FIXME: ?????
		end

	n_constraints: INTEGER
			-- Return the number of constraints in minimal form.
		do
			Result := poly_nbconstraints (handle)
		ensure
			Result >= 0 -- FIXME: ?????
		end

	n_frames: INTEGER
			-- Return the number of generators in minimal form.
		do
			Result := poly_nbframes (handle)
		ensure
			Result >= 0 -- FIXME: ?????
		end

feature {ANY} -- Predicates

	is_minimal: BOOLEAN
			-- Says if the polyhedron is minimized. Doesn't imply any
			-- computation.
		do
			Result := poly_is_minimal (handle).to_boolean
		end

	is_empty: BOOLEAN
			-- Tests if the polyedron is empty. Can imply minimization.
		do
			Result := poly_is_empty (handle).to_boolean
		end

	is_universe: BOOLEAN
			-- Tests if the polyhedron is the universe one. Imply minimization.
		do
			Result := poly_is_universe (handle).to_boolean
		end

	is_empty_lazy: INTEGER
			-- This function tests emptiness without minimize the
			-- polyhedron. As a result, the answer can be: I don't know
			-- (tbool_bottom).
		do
			Result := poly_is_empty_lazy (handle)
		ensure
			is_valid_tbool (Result)
		end

	versus_constraint (a_constraint: ARRAY [PKINT]): INTEGER
			-- Tests the relation between the polyhedron and the
			-- constraint, which must have the same dimension. If the
			-- constraint is an inequality the result has the following
			-- meaning:
			--
			-- * tbool_top: all frames belongs to the hyperplane defined
			--              by the constraint;
			-- * tbool_true: all frames satisfies the constraint but do not
			--               verify the preceding property (the polyhedron is
			--               on the positive side of the constraint);
			-- * tbool_false: no frame satisfies the constraint (the polyhedron
			--                is on the strictly negative side of the
			--                constraint);
			-- * tbool_bottom: the constraint splits the polyhedron.
			--
			-- In the case where the constraint is an equality, the
			-- two possible results are tbool_top and tbool_bottom.
		require
			a_constraint /= Void
			a_constraint.count = dimension + polka_dec
			not a_constraint.has (Void)
		do
			-- FIXME: convert `a_constraint' to external representation!
			Result := poly_versus_constraint (handle, default_pointer)
		ensure
			is_valid_tbool (Result)
		end

	is_generator_included_in (a_generator: ARRAY [PKINT]): BOOLEAN
			-- Tests if `a_generator' is included in the polyhedron.
			-- The function may minimize the polyhedron in order to get its
			-- constraints.
		require
			a_generator /= Void
			a_generator.count = dimension + polka_dec
			not a_generator.has (Void)
		do
			-- FIXME: convert `a_generator' to external representation!
			Result := poly_is_generator_included_in (default_pointer, handle).to_boolean
		end

	is_included_in (other: like Current): BOOLEAN
			-- Tests the inclusion of Current in `other'.
			-- This function may minimize the two polyhedra.
		require
			other /= Void
			other.dimension = dimension
		do
			Result := poly_is_included_in (handle, other.handle).to_boolean
		end

	is_equal (other: like Current): BOOLEAN
			-- Tests the equality of two polyhedra. Requires minimal
			-- form for both polyhedra.
		do
			if other.dimension = dimension then
				Result := poly_is_equal (handle, other.handle).to_boolean
			end
		end

feature {ANY} -- Intersection and Convex Hull -- Strict version

		-- These functions return polyhedra in minimal form and their
		-- parameters are minimized when it is not already the case.

	intersection (other: like Current): like Current
			-- Return the intersection of the Current polyhedra with
			-- `other'. The function choose one of the polyhedron as
			-- starting point, and adds to it the constraints of the other
			-- one. One chooses the polyhedron that have the greatest
			-- number of equalities, or else the greatest number of constraints.
		require
			other /= Void
			other.dimension = dimension
		do
			create Result.from_external_pointer (poly_intersection (handle, other.handle))
		ensure
			Result /= Void
			Result.dimension = dimension
		end

	intersection_array (polys: ARRAY [POLY]): like Current
			-- Return the intersection of the (non-empty) array of
			-- polyhedra `polys'. The function chooses one of the
			-- polyhedron as starting point, and adds to it the constraints
			-- of all the other ones. One choose the polyhedron that have
			-- the greatest number of equalities, or else the greatest
			-- number of constraints.
		require
			polys /= Void
			polys.count > 0
			not polys.has (Void)
			-- for all p in polys: p.dimension = dimension
		local
			array_ptr: ARRAY [POINTER]
			poly_iter: ITERATOR [POLY]
		do
			create array_ptr.make (1, 0)
			
			from poly_iter := polys.get_new_iterator until poly_iter.is_off loop
				array_ptr.add_last (poly_iter.item.handle)
				poly_iter.next
			end
			
			create Result.from_external_pointer (poly_intersection_array (array_ptr.to_external, polys.count))
		ensure
			Result /= Void
			Result.dimension = dimension
		end

	add_constraints (some_constraints: POLKA_MATRIX): like Current
			-- Return the intersection of the polyhedron with the set of
			-- constraints given by `some_constraints'. The matrix may be
			-- sorted by the function `sort_rows'.
		require
			some_constraints /= Void
			some_constraints.columns = dimension + polka_dec
		do
			create Result.from_external_pointer (poly_add_constraints (handle, some_constraints.handle))
		ensure
			Result /= Void
			Result.dimension = dimension
		end

	add_constraint (a_constraint: ARRAY [PKINT]): like Current
			-- Return the intersection of the polyhedron with the
			-- constraint given by `a_cosntraint'.
		require
			a_constraint /= Void
			a_constraint.count = dimension + polka_dec
			not a_constraint.has (Void)
		local
			array_ptr: ARRAY [POINTER]
			pkint_iter: ITERATOR [PKINT]
		do
			create array_ptr.make (1, 0)
			
			from pkint_iter := a_constraint.get_new_iterator until pkint_iter.is_off loop
				-- FIXME: This is worng! I need: *handle
				array_ptr.add_last (pkint_iter.item.handle)
				pkint_iter.next
			end
			
			create Result.from_external_pointer (poly_add_constraint (handle, array_ptr.to_external))
		ensure
			Result /= Void
			Result.dimension = dimension
		end

	convex_hull (other: like Current): like Current
			-- Return the convex hull of Current and `other'. The
			-- function choose one of the polyhedron as starting point, and
			-- adds to it the generators of the other one. One chooses the
			-- polyhedron that have the greatest number of lines, or else
			-- the greatest number of generators.
		require
			other /= Void
			other.dimension = dimension
		do
			create Result.from_external_pointer (poly_convex_hull (handle, other.handle))
		ensure
			Result /= Void
			Result.dimension = dimension
		end

	convex_hull_array (polys: ARRAY [POLY]): like Current
			-- Return the convex hull of the (non-empty) array of
			-- polyhedra `polys'. The function choose one of the
			-- polyhedron as starting point, and adds to it the generators
			-- of all the other ones. One chooses the polyhedron that have
			-- the greatest number of lines, or else the greatest number of
			-- generators.
		require
			polys /= Void
			polys.count > 0
			not polys.has (Void)
			-- for all p in polys: p.dimension = dimension
		local
			array_ptr: ARRAY [POINTER]
			poly_iter: ITERATOR [POLY]
		do
			create array_ptr.make (1, 0)
			
			from poly_iter := polys.get_new_iterator until poly_iter.is_off loop
				array_ptr.add_last (poly_iter.item.handle)
				poly_iter.next
			end
			
			create Result.from_external_pointer (poly_convex_hull_array (array_ptr.to_external, polys.count))
		ensure
			Result /= Void
			Result.dimension = dimension
		end

	add_frame (a_frame: POLKA_MATRIX): like Current
			-- Return the convex hull of the polyhedron and the set of
			-- generators given by `a_frame'. The matrix may be sorted by
			-- the function `sort_rows'.
		require
			a_frame /= Void
			a_frame.columns = dimension + polka_dec
		do
			create Result.from_external_pointer (poly_add_frames (handle, a_frame.handle))
		ensure
			Result /= Void
			Result.dimension = dimension
		end

	add_generator (a_generator: ARRAY [PKINT]): like Current
			-- Return the convex hull of the polyhedron and the
			-- generator given by `a_generator'.
		require
			a_generator /= Void
			a_generator.count = dimension + polka_dec
			not a_generator.has (Void)
		local
			array_ptr: ARRAY [POINTER]
			pkint_iter: ITERATOR [PKINT]
		do
			create array_ptr.make (1, 0)
			
			from pkint_iter := a_generator.get_new_iterator until pkint_iter.is_off loop
				-- FIXME: This is worng! I need: *handle
				array_ptr.add_last (pkint_iter.item.handle)
				pkint_iter.next
			end
			
			create Result.from_external_pointer (poly_add_frame (handle, array_ptr.to_external))
		ensure
			Result /= Void
			Result.dimension = dimension
		end

feature {ANY} -- Intersection and Convex Hull -- Lazy version

		-- These functions are the lazy version of the preceding ones.
		-- They return polyhedra in non minimal form and their parameters
		-- are minimized only if it is necessary.

			-- create Result.from_external_pointer (poly_intersection_lazy (const poly_t* pa, const poly_t* pb)
			-- create Result.from_external_pointer (poly_intersection_array_lazy (const poly_t* const* po, int size)
			-- create Result.from_external_pointer (poly_add_constraints_lazy (const poly_t* po, matrix_t* mat)
			-- create Result.from_external_pointer (poly_add_constraint_lazy (const poly_t* po, const pkint_t* tab)
			-- create Result.from_external_pointer (poly_convex_hull_lazy (const poly_t* pa, const poly_t* pb)
			-- create Result.from_external_pointer (poly_convex_hull_array_lazy (const poly_t* const* po, int size)
			-- create Result.from_external_pointer (poly_add_frames_lazy (const poly_t* po, matrix_t* mat)
			-- create Result.from_external_pointer (poly_add_frame_lazy (const poly_t* po, const pkint_t* tab)

feature {ANY} --  Linear transformations -- Single variable/expression

	assign_variable (a_variable: INTEGER; an_assignment: ARRAY [PKINT]): like Current
			-- This function applies to the polyhedron the linear
			-- transformation x'_rank := \sum_{i=0}^{dim-1} a_i/d x_i + b/d
			-- with rank the rank of the variable (rank 0 corresponding to
			-- the first normal variable) and
			-- tab=[d,b,[0],a_0,...,a_{dim-1}]. Current may be minimized in
			-- order to obtain its generators. Minimality is then preserved
			-- if the transformation is inversible.
		require
			a_variable.in_range (0, dimension-1)
			an_assignment /= Void
			an_assignment.count = dimension + polka_dec
			not an_assignment.has (Void)
		do
			-- FIXME: convert `an_assignment' to external representation!
			create Result.from_external_pointer (poly_assign_variable (handle, a_variable, an_assignment.to_external))
		ensure
			Result /= Void
			Result.dimension = dimension
		end

	substitute_variable (a_variable: INTEGER; a_substitution: ARRAY [PKINT]): like Current
			-- This function applies to the polyhedron the linear
			-- substitution x'_rank <- \sum_{i=0}^{dim-1} a_i/d x_i + b/d
			-- with rank denoting the rank of the variable (rank 0
			-- corresponding to the first normal variable) and
			-- tab=[d,b,[0],a_0,...,a_{dim-1}]. Current may be minimized in
			-- order to obtain its constraints. Minimality is then
			-- preserved if the transformation is inversible.
		require
			a_variable.in_range (0, dimension-1)
			a_substitution /= Void
			a_substitution.count = dimension + polka_dec
			not a_substitution.has (Void)
		do
			create Result.from_external_pointer (poly_substitute_variable (handle, a_variable, a_substitution.to_external))
		ensure
			Result /= Void
			Result.dimension = dimension
		end

feature {} --  Linear transformations -- Several variables/expressions

	assign_variables (some_assignments: ARRAY [EQUATION]): like Current
			-- Computes the image of Current by the parallel assignment of
			-- eqn[i].var by eqn[i].expr, for i between 0 and size-1. The
			-- array eqn is supposed to be sorted w.r.t. the field .var.
			-- You may use the function sort_equations to ensure this. 
		require
			some_assignments /= Void
			some_assignments.count > 0
			not some_assignments.has (Void)
			-- for all eq in some_assignments: eq.expr.count = dimension + polka_dec
		do
			-- FIXME: convert `some_assignments' to external representation!
			create Result.from_external_pointer (poly_assign_variables (handle,
																							some_assignments.to_external,
																							some_assignments.count))
		ensure
			Result /= Void
			Result.dimension = dimension
		end

	substitute_variables (some_substitutions: ARRAY [EQUATION]): like Current
			-- Computes the image of poly by the parallel substitution
			-- of eqn[i].expr by eqn[i].expr, for i between 0 and size-1.
			-- The array eqn is supposed to be sorted w.r.t. the field
			-- .var. You may use the function sort_equations to ensure this.
		require
			some_substitutions /= Void
			some_substitutions.count > 0
			not some_substitutions.has (Void)
			-- for all eq in some_substitutions: eq.expr.count = dimension + polka_dec
		do
			-- FIXME: convert `some_substitutions' to external representation!
			create Result.from_external_pointer (poly_substitute_variables (handle,
																								 some_substitutions.to_external,
																								 some_substitutions.count))
		ensure
			Result /= Void
			Result.dimension = dimension
		end

feature {WRAPPER_HANDLER} -- Destruction
	free_handle
			-- release the external memory
		do
			poly_free (handle)
      end
   
feature {} -- size

	struct_size: INTEGER
		external "C inline use <polka/poly.h>"
		alias "sizeof (poly_t)"
		end

invariant
	dimension > 0

end -- class POLY
