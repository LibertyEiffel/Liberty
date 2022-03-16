note
	description: "Delaunay and constrained Delaunay triangulations."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli, GTS team
					
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

deferred class GTS_DELAUNAY
	-- Delaunay and constrained Delaunay triangulations implementation
	-- of a dynamic Delaunay triangulation algorithm.

	-- Description: The functions described in this section are useful
	-- to build two-dimensional Delaunay and constrained Delaunay
	-- triangulations. Only the x and y coordinates of the points are
	-- taken into account.
	
	-- The algorithm is fully dynamic (insertion and deletion) for
	-- Delaunay triangulation and semi-dynamic (insertion only of
	-- vertices and constraints) for constrained Delaunay
	-- triangulation.
	
	-- The insertion part uses a very simple jump-and-walk location
	-- algorithm which can be used on any (even non-Delaunay) 2D
	-- triangulation as long as its boundary is convex.

	-- The functions `conform' and `refine' can be used to build
	-- Delaunay conforming constrained triangulations and to refine
	-- them.
	
feature {ANY} 
--    -----------------------------------------------------------------------------------------------------------

--   gts_delaunay_add_vertex ()

--  GtsVertex*  gts_delaunay_add_vertex         (GtsSurface *surface,
--                                               GtsVertex *v,
--                                               GtsFace *guess);

--    Adds vertex v to the Delaunay triangulation defined by surface. If v is not contained in the convex hull
--    bounding surface, v is not added to the triangulation.

--     surface :  a GtsSurface.
--     v :        a GtsVertex.
--     guess :    NULL or a GtsFace belonging to surface to be used as an initial guess for point location.
--     Returns :  NULL is v has been successfully added to surface or was already contained in surface, v if v
--                is not contained in the convex hull bounding surface or a GtsVertex having the same x and y
--                coordinates as v.

--    -----------------------------------------------------------------------------------------------------------

--   gts_delaunay_add_vertex_to_face ()

--  GtsVertex*  gts_delaunay_add_vertex_to_face (GtsSurface *surface,
--                                               GtsVertex *v,
--                                               GtsFace *f);

--    Adds vertex v to the face f of the Delaunay triangulation defined by surface.

--     surface :  a GtsSurface.
--     v :        a GtsVertex.
--     f :        a GtsFace belonging to surface.
--     Returns :  NULL is v has been successfully added to surface or was already contained in surface or a
--                GtsVertex having the same x and y coordinates as v.

--    -----------------------------------------------------------------------------------------------------------

--   gts_delaunay_remove_vertex ()

--  void        gts_delaunay_remove_vertex      (GtsSurface *surface,
--                                               GtsVertex *v);

--    Removes v from the Delaunay triangulation defined by surface and restores the Delaunay property. Vertex v
--    must not be used by any constrained edge otherwise the triangulation is not guaranteed to be Delaunay.

--     surface :  a GtsSurface.
--     v :        a GtsVertex.

--    -----------------------------------------------------------------------------------------------------------

--   gts_delaunay_add_constraint ()

--  GSList*     gts_delaunay_add_constraint     (GtsSurface *surface,
--                                               GtsConstraint *c);

--    Add constraint c to the constrained Delaunay triangulation defined by surface.

--     surface :  a GtsSurface.
--     c :        a GtsConstraint.
--     Returns :  a list of GtsConstraint conflicting (i.e. intersecting) with c which were removed from surface
--                (NULL if there was none).

--    -----------------------------------------------------------------------------------------------------------

--   gts_delaunay_check ()

--  GtsFace*    gts_delaunay_check              (GtsSurface *surface);

--     surface :  a GtsSurface.
--     Returns :  NULL if the planar projection of surface is a Delaunay triangulation (unconstrained), a
--                GtsFace violating the Delaunay property otherwise.

--    -----------------------------------------------------------------------------------------------------------

--   gts_delaunay_remove_hull ()

--  void        gts_delaunay_remove_hull        (GtsSurface *surface);

--    Removes all the edges of the boundary of surface which are not constraints.

--     surface :  a GtsSurface.

--    -----------------------------------------------------------------------------------------------------------

--   gts_delaunay_conform ()

--  guint       gts_delaunay_conform            (GtsSurface *surface,
--                                               gint steiner_max,
--                                               GtsEncroachFunc encroaches,
--                                               gpointer data);

--    Recursively split constraints of surface which are encroached by vertices of surface (see Shewchuk 96 for
--    details). The split constraints are destroyed and replaced by a set of new constraints of the same class.
--    If gts_vertex_encroaches_edge() is used for encroaches, the resulting surface will be Delaunay conforming.

--    If steiner_max is positive or nul, the recursive splitting procedure will stop when this maximum number of
--    Steiner points is reached. In that case the resulting surface will not necessarily be Delaunay conforming.

--     surface :      a GtsSurface describing a constrained Delaunay triangulation.
--     steiner_max :  maximum number of Steiner points.
--     encroaches :   a GtsEncroachFunc.
--     data :         user-data to pass to encroaches.
--     Returns :      the number of remaining encroached edges. If steiner_max is set to a negative value and
--                    gts_vertex_encroaches_edge() is used for encroaches this should always be zero.

--    -----------------------------------------------------------------------------------------------------------

--   gts_delaunay_refine ()

--  guint       gts_delaunay_refine             (GtsSurface *surface,
--                                               gint steiner_max,
--                                               GtsEncroachFunc encroaches,
--                                               gpointer encroach_data,
--                                               GtsKeyFunc cost,
--                                               gpointer cost_data);

--    An implementation of the refinement algorithm described in Ruppert (1995) and Shewchuk (1996).

--     surface :        a GtsSurface describing a conforming Delaunay triangulation.
--     steiner_max :    maximum number of Steiner points.
--     encroaches :     a GtsEncroachFunc.
--     encroach_data :  user-data to pass to encroaches.
--     cost :           a GtsKeyFunc used to sort the faces during refinement.
--     cost_data :      user-data to pass to cost.
--     Returns :        the number of unrefined faces of surface left. Should be zero if steiner_max is set to a
	--                      negative value.

feature {} -- External call
	-- #include <gts.h>

	-- #define GTS_CONSTRAINT_CLASS (klass)
	-- #define GTS_CONSTRAINT (obj)
	-- #define GTS_IS_CONSTRAINT (obj)
	
	-- GtsConstraintClass;
	-- GtsConstraint;

	gts_constraint_class: POINTER
			-- GtsConstraintClass* gts_constraint_class (void);
		external "C use <gts.h>"
		end
	
	gts_delaunay_add_vertex (a_surface, a_vertex, a_guess_face: POINTER): POINTER
			-- GtsVertex* gts_delaunay_add_vertex (GtsSurface *surface,
			-- GtsVertex *v, GtsFace *guess);
		external "C use <gts.h>"
		end

	gts_delaunay_add_vertex_to_face (a_surface, a_vertex, a_face: POINTER): POINTER
			-- GtsVertex* gts_delaunay_add_vertex_to_face (GtsSurface
			-- *surface, GtsVertex *v, GtsFace *f);
		external "C use <gts.h>"
		end
	
	gts_delaunay_remove_vertex (a_surface, a_vertex: POINTER)
			-- void gts_delaunay_remove_vertex (GtsSurface *surface,
			-- GtsVertex *v);
		external "C use <gts.h>"
		end
	
	gts_delaunay_add_constraint (a_surface, a_constraint: POINTER): POINTER
			-- GSList* gts_delaunay_add_constraint (GtsSurface *surface,
			-- GtsConstraint *c);
		external "C use <gts.h>"
		end
	
	gts_delaunay_check (a_surface: POINTER): POINTER
			-- GtsFace* gts_delaunay_check (GtsSurface *surface);
		external "C use <gts.h>"
		end
	
	gts_delaunay_remove_hull (a_surface: POINTER)
			-- void gts_delaunay_remove_hull (GtsSurface *surface);
		external "C use <gts.h>"
		end

	gts_delaunay_conform (a_surface: POINTER; steiner_max: INTEGER;  an_encroach_func, some_data: POINTER): INTEGER
			-- guint gts_delaunay_conform (GtsSurface *surface, gint
			-- steiner_max, GtsEncroachFunc encroaches, gpointer data);

			-- TODO: Result should be guint
		external "C use <gts.h>"
		end
	
	gts_delaunay_refine (a_surface: POINTER; a_steiner_max: INTEGER; an_encroach_func, encroach_data, a_key_func, some_cost_data: POINTER): INTEGER
			-- guint gts_delaunay_refine (GtsSurface *surface, gint
			-- steiner_max, GtsEncroachFunc encroaches, gpointer
			-- encroach_data, GtsKeyFunc cost, gpointer cost_data);

			-- TODO: Result should be a guint
	external "C use <gts.h>"
	end
end -- class GTS_DELAUNAY
