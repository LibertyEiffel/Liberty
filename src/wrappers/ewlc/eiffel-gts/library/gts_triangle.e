note
	description: "A triangle in the GNU Triangulated Surfaces library."
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli, GTS team
					
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

class GTS_TRIANGLE
	-- A GTS_TRIANGLE is defined by three GTS_EDGE. They are oriented,
	-- the normal to the triangle points toward an observer seing the
	-- three edges in counter-clockwise order.

	-- When destroying a GTS_TRIANGLE, all the edges not used by another
	-- triangle are also destroyed. This default behaviour can be
	-- changed punctually by setting the global variable
	-- gts_allow_floating_edges to TRUE. You must not forget to set
	-- this variable back to FALSE as all the algorithms of GTS assume
	-- the default behaviour.

inherit GTS_OBJECT redefine struct_size end

insert GTS_POINT_EXTERNALS
	
create {ANY}  from_edges, enclosing, from_external_pointer

feature {} -- Creation
	from_edges (first,second,third: GTS_EDGE)
			-- a new GtsTriangle having `first', `second' and `third' as
			-- edges.
		require 
			first_edge_not_void: first /= Void
			second_edge_not_void: second /= Void
			third_edge_not_void: third /= Void
			-- TODO: first touches second
			-- TODO: second touches third
			-- TODO: third touches first
		do
			from_external_pointer(gts_triangle_new
										 (gts_triangle_class, first.handle, second.handle, third.handle))
		end

	enclosing (some_points: G_SLIST[GTS_POINT]; a_scale: REAL)
			-- Builds a new triangle (including new vertices and edges)
			-- enclosing the plane projection of `some_points'. This
			-- triangle is equilateral and encloses a rectangle defined
			-- by the maximum and minimum x and y coordinates of the
			-- points. `a_scale' is an homothetic scaling factor. If
			-- equal to one, the triangle encloses exactly the enclosing
			-- rectangle.
		require
			points_not_void: some_points /= Void
			correct_scale: a_scale > 1.0
		do
			from_external_pointer(gts_triangle_enclosing (gts_triangle_class, some_points.handle, a_scale))
		end

feature {ANY} 
	set_edges (first,second,third: GTS_EDGE)
			-- Sets the edge of triangle to `first', `second' and `third'
			--  while checking that they define a valid triangle.
		require 
			first_edge_not_void: first /= Void
			second_edge_not_void: second /= Void
			third_edge_not_void: third /= Void
			-- TODO: first touches second
			-- TODO: second touches third
			-- TODO: third touches first
		do
			gts_triangle_set (handle, first.handle, second.handle, third.handle)
		end
	
	area: REAL
			-- the area of the triangle
		do 
			Result := gts_triangle_area (handle)
		ensure positive: Result >= 0
		end

	perimeter: REAL
			-- the perimeter of the triangle
		do
			Result := gts_triangle_perimeter (handle)
		ensure positive: Result >= 0
		end

	quality: REAL
			-- The quality of the triangle, defined as the ratio of its
			-- surface to its perimeter relative to this same ratio for
			-- an equilateral triangle with the same area. The quality is
			-- then one for an equilateral triangle and tends to zero for
			-- a very stretched triangle.
		do
			Result := gts_triangle_quality (handle)
		ensure between_zero_and_one: Result.in_range (0.0, 1.0)
		end

	-- TODO: normal : a_vector_of_some_kind
	
	--  void gts_triangle_normal (GtsTriangle *t, -- gdouble *x, --
	--  gdouble *y, -- gdouble *z);

	-- Computes the coordinates of the oriented normal of t as the
	-- cross-product of two edges, using the left-hand rule. The normal
	-- is not normalized. If this triangle is part of a closed and
	-- oriented surface, the normal points to the outside of the
	-- surface.

	--     t :  a GtsTriangle.
	--     x :  the x coordinate of the normal.
	--     y :  the y coordinate of the normal.
	--     z :  the z coordinate of the normal.
	

	revert
			-- Changes the orientation of triangle t, turning it inside
			-- out.
		do
			gts_triangle_revert (handle)
		end

	orientation: REAL
			-- Checks for the orientation of the plane (x,y) projection
			-- of a triangle. See gts_point_orientation() for
			-- details. This function is geometrically robust.
		do
			Result := gts_triangle_orientation (handle)
		end

	duplicate: GTS_TRIANGLE
			-- a GtsTriangle different from Current but sharing all its
			-- edges with Current or Void if there is none.
		local p: POINTER
		do
			p := gts_triangle_is_duplicate (handle)
			if p.is_not_null then
				if wrappers.has(p) then Result::=wrappers.at(p)
				else create Result.from_external_pointer(p)
				end
			end
		ensure not_void: Result/=Void
		end

	angle (another: GTS_TRIANGLE): REAL
			-- the angle (in radians) between Current and `another'.
		do
			Result := gts_triangles_angle (handle, another.handle)
		ensure positive: Result >= 0
		end

	are_compatible (another: GTS_TRIANGLE; an_edge: GTS_EDGE): BOOLEAN
			-- Do Current and `another' have compatible orientations?
			-- i.e. Can Current and `another' be part of the same surface
			-- without -- conflict in the surface normal orientation?
			-- `an_edge' must be used by both Current and `another'
		require
			another_not_void: another /= Void
			edge_not_void: an_edge /= Void
			-- TODO: edge_is_shared_between_current_and_another: 
		do
			Result:= (gts_triangles_are_compatible (handle, another.handle, an_edge.handle)).to_boolean
		end

	common_edge (another: GTS_TRIANGLE): GTS_EDGE
			-- a GtsEdge common to both Current and `another' or Void if
			-- they do not share any edge.
		local ptr: POINTER
		do
			ptr := gts_triangles_common_edge (handle, another.handle)
			if ptr.is_not_null then create Result.from_external_pointer(ptr) end
		ensure not_void: Result/=Void
		end

	neighbor_number: INTEGER
			-- the number of triangles neighbors of t.
			-- TODO: Should be NATURAL since it is a guint
		do
			Result := gts_triangle_neighbor_number (handle)
		end

	neighbors: G_SLIST [GTS_TRIANGLE]
			-- list of GtsTriangle neighbors of Current.
		do
			create Result.from_external_pointer (gts_triangle_neighbors (handle))
		end

feature {} -- Implementation
	stored_vertices: TUPLE [GTS_VERTEX, GTS_VERTEX, GTS_VERTEX]
	stored_edges: TUPLE [GTS_EDGE, GTS_EDGE, GTS_EDGE]

	retrieve_vertices_and_edges
			-- Retrieve the vertices and edges and store them in
			-- `stored_vertices' and `stored_edges'.
		local v1,v2,v3, e1,e2,e3: POINTER
		do
			not_yet_implemented
			gts_triangle_vertices_edges (handle, default_pointer,
												  $v1, $v2, $v3, $e1, $e2, $e3)
			create stored_vertices.make_3 (create {GTS_VERTEX}.from_external_pointer (v1),
													 create {GTS_VERTEX}.from_external_pointer (v2),
													 create {GTS_VERTEX}.from_external_pointer (v3))
			create stored_edges.make_3 (create {GTS_EDGE}.from_external_pointer (e1),
												 create {GTS_EDGE}.from_external_pointer (e2),
												 create {GTS_EDGE}.from_external_pointer (e3))
		ensure 
			vertices_stored: stored_vertices /= Void
			edges_stored: stored_edges /= Void
		end

feature {ANY} 
	vertices: TUPLE [GTS_VERTEX, GTS_VERTEX, GTS_VERTEX]
		local v1,v2,v3: POINTER
		do
			not_yet_implemented
			gts_triangle_vertices (handle, $v1, $v2, $v3)
			create Result.make_3 (create {GTS_VERTEX}.from_external_pointer (v1),
										 create {GTS_VERTEX}.from_external_pointer (v2),
										 create {GTS_VERTEX}.from_external_pointer (v3))
		ensure not_void: Result/=Void
		end

	edge_1: GTS_EDGE
			-- First edge
		local ptr: POINTER
		do
			ptr:=get_e1(handle)
			check ptr.is_not_null end 
			Result::=wrappers.reference_at(ptr)
			if Result=Void then 
				create Result.from_external_pointer (ptr)
			end
		ensure not_void: Result/=Void
		end

	edge_2: GTS_EDGE
			-- Second edge
		local ptr: POINTER
		do
			ptr:=get_e2(handle)
			check ptr.is_not_null end 
			Result::=wrappers.reference_at(ptr)
			if Result=Void then 
				create Result.from_external_pointer (ptr)
			end
		ensure not_void: Result/=Void
		end

	edge_3: GTS_EDGE
			-- Third edge
		local ptr: POINTER
		do
			ptr:=get_e3(handle)
			check ptr.is_not_null end 
			Result::=wrappers.reference_at(ptr)
			if Result=Void then 
				create Result.from_external_pointer (ptr)
			end
		ensure not_void: Result/=Void
		end

	edges: TUPLE [GTS_EDGE, GTS_EDGE, GTS_EDGE]
			-- TODO: Investigate if using e1,e2,e3 is better
		do
			if stored_edges = Void then retrieve_vertices_and_edges end
			Result := stored_edges
		ensure not_void: Result/=Void
		end

	vertex_opposite (an_edge: GTS_EDGE): GTS_VERTEX
			-- the vertex of Current triangle which does not belong to
			-- `an_edge'.
		require 
			edge_not_void: an_edge /= Void
			triangle_has_edge: ((an_edge = edge_1) or else 
									  (an_edge = edge_2) or else 
									  (an_edge = edge_3))
		do
			create Result.from_external_pointer (gts_triangle_vertex_opposite(handle,an_edge.handle))
		ensure not_void: Result/=Void
		end
	
	edge_opposite (a_vertex: GTS_VERTEX): GTS_EDGE
		local ptr: POINTER
		do
			ptr := gts_triangle_edge_opposite (handle, a_vertex.handle)
			-- Returns the edge of t opposite v or NULL if v is not a
			-- vertice of t.
			if ptr.is_not_null then create Result.from_external_pointer (ptr) end
		ensure not_void: Result/=Void
		end

	vertex: GTS_VERTEX
			-- the GtsVertex not used by `e1'.
		local ptr: POINTER
		do
			ptr:=gts_triangle_vertex(handle)
			if ptr.is_not_null then
				Result::=wrappers.reference_at(ptr)
				if Result=Void then 
					create Result.from_external_pointer (ptr)
				end
			else
				raise("Void GTS_TRIANGLE.vertex!")
			end
		ensure not_void: Result/=Void
		end


	is_ok: BOOLEAN
			-- Is Current a non-degenerate, non-duplicate triangle?
		do
			Result := (gts_triangle_is_ok (handle)).to_boolean
		end

	-- TODO: gts_triangle_use_edges ()

	--  GtsTriangle* gts_triangle_use_edges (GtsEdge *e1, GtsEdge *e2,
	--  GtsEdge *e3);
	
	-- e1 : a GtsEdge.  e2 : a GtsEdge.  e3 : a GtsEdge.  Returns : a
	-- GtsTriangle having e1, e2 and e3 as edges or NULL if e1, e2 and
	-- e3 are not part of any -- triangle.

	circumcircle_center: GTS_POINT
			-- a new GtsPoint, center of the circumscribing circle of t
			-- or Void if the circumscribing circle is not defined.
		local ptr: POINTER
		do
			ptr := gts_triangle_circumcircle_center (handle, gts_point_class)
			if ptr.is_not_null then 
				create Result.from_external_pointer (ptr)
			end
		ensure not_void: Result/=Void
		end

	-- TODO: gts_triangle_is_stabbed ()

	-- GtsObject* gts_triangle_is_stabbed (GtsTriangle *t, GtsPoint *p,
	-- gdouble *orientation);

	-- t : a GtsTriangle.  p : a GtsPoint.  orientation : a pointer or
	-- NULL.  Returns : one of the vertices of t, one of the edges of t
	-- or t if any of these are stabbed by the ray starting at p
	-- (included) and ending at (p->x, p->y, +infty), NULL
	-- otherwise. If the ray is contained in the plane of the triangle
	-- NULL is also returned. If orientation is not NULL, it is set to
	-- the value of the orientation of p relative to t (as given by
	-- gts_point_orientation_3d()).

	--    -----------------------------------------------------------------------------------------------------------
	
	
	--    -----------------------------------------------------------------------------------------------------------
	
	--   gts_triangle_interpolate_height ()
	
	--  void        gts_triangle_interpolate_height (GtsTriangle *t,
--                                               GtsPoint *p);

--    Fills the z-coordinate of point p belonging to the plane projection of triangle t with the linearly
--    interpolated value of the z-coordinates of the vertices of t.

--     t :  a GtsTriangle.
--     p :  a GtsPoint.

feature {} -- size
	struct_size: INTEGER
		external "C inline use <gts.h>"
		alias "sizeof(GtsTriangle)"
		end

feature {} -- GtsTriangle struct access
	get_e1 (a_triangle: POINTER): POINTER
		external "C struct GtsTriangle get e1 use <gts.h>"
		end

	get_e2 (a_triangle: POINTER): POINTER
		external "C struct GtsTriangle get e2 use <gts.h>"
		end
	get_e3 (a_triangle: POINTER): POINTER
		external "C struct GtsTriangle get e3 use <gts.h>"
		end

	--  typedef struct {
	--    GtsObject object;
	
	--    GtsEdge * e1;
	--    GtsEdge * e2;
	--    GtsEdge * e3;
	--  } GtsTriangle;
	
	--    The triangle object.
	
	--     GtsObject object;  Parent object.
	--     GtsEdge *e1;       First edge.
	--     GtsEdge *e2;       Second edge.
	--     GtsEdge *e3;       Third edge.

feature {} -- External calls
-- Synopsis

--  #include <gts.h>


--  #define     GTS_TRIANGLE_CLASS              (klass)
--  #define     GTS_TRIANGLE                    (obj)
--  #define     GTS_IS_TRIANGLE                 (obj)
--              GtsTriangleClass;
--              GtsTriangle;
			
	gts_triangle_class: POINTER
		external "C use <gts.h>"
		end

	gts_triangle_new (a_class, e1, e2, e3: POINTER): POINTER is -- GtsTriangle*
		external "C use <gts.h>"
		end
	
	gts_triangle_set (a_triangle, e1, e2, e3: POINTER)
		external "C use <gts.h>"
		end
	
	gts_triangle_area (a_triangle: POINTER): REAL is -- gdouble
		external "C use <gts.h>"
		end
	
	gts_triangle_perimeter (a_triangle: POINTER): REAL is -- gdouble
		external "C use <gts.h>"
		end

	gts_triangle_quality (a_triangle: POINTER): REAL is -- gdouble
		external "C use <gts.h>"
		end

	gts_triangle_normal (a_triangle, gdouble_x, gdouble_y, gdouble_z: POINTER) is -- void
		external "C use <gts.h>"
		end
	
	gts_triangle_revert (a_triangle: POINTER)
		external "C use <gts.h>"
		end
	
	gts_triangle_orientation (a_triangle: POINTER): REAL is -- gdouble
		external "C use <gts.h>"
		end
	
	gts_triangle_is_duplicate (a_triangle: POINTER): POINTER is -- GtsTriangle*
		external "C use <gts.h>"
		end

	gts_triangles_angle (a_triangle, another: POINTER): REAL is -- gdouble
		external "C use <gts.h>"
		end
	
	gts_triangles_are_compatible (a_triangle, another_triangle, an_edge: POINTER): INTEGER is -- gboolean
		external "C use <gts.h>"
		end

	gts_triangle_enclosing (gtstriangleclass, gslist_points: POINTER; a_scale: REAL): POINTER is -- GtsTriangle*
		external "C use <gts.h>"
		end

	gts_triangles_common_edge (a_triangle, another: POINTER): POINTER is -- GtsEdge*
		external "C use <gts.h>"
		end
	
	gts_triangle_neighbor_number (a_triangle: POINTER): INTEGER is -- guint
			-- TODO: should be NATURAL since it's a guint
		external "C use <gts.h>"
		end
	
	gts_triangle_neighbors (a_triangle: POINTER): POINTER is -- GSList*
		external "C use <gts.h>"
		end

	gts_triangle_vertices_edges (a_triangle, an_edge, v1_ref, v2_ref, v3_ref, e1_ref, e2_ref, e3_ref: POINTER)
		external "C use <gts.h>"
		end

	gts_triangle_vertex_opposite (a_triangle, an_edge: POINTER): POINTER is -- GtsVertex*
		external "C use <gts.h>"
		end
	
	gts_triangle_edge_opposite (a_triangle, a_vertex: POINTER): POINTER is -- GtsEdge*
		external "C use <gts.h>"
		end
	
	gts_triangle_vertices (a_triangle, v1_handle, v2_handle, v3_handle: POINTER) is -- void
		external "C use <gts.h>"
		end
	
	gts_triangle_vertex (a_triangle: POINTER): POINTER
			-- #define gts_triangle_vertex (t)
		external "C macro use <gts.h>"
		end

	gts_triangle_is_ok (a_triangle: POINTER): INTEGER is -- gboolean
		external "C use <gts.h>"
		end
	
	gts_triangle_use_edges (an_edge_1, an_edge_2, an_edge_3: POINTER): POINTER is -- GtsTriangle*
		external "C use <gts.h>"
		end
	
	gts_triangle_circumcircle_center (a_triangle, a_point_class: POINTER): POINTER is -- GtsPoint*
		external "C use <gts.h>"
		end
	
	gts_triangle_is_stabbed (a_triangle, a_pointer, gdouble_orientation: POINTER): POINTER is -- GtsObject*
		external "C use <gts.h>"
		end
		
	gts_triangle_interpolate_height (a_triangle, a_point: POINTER) is -- void
		external "C use <gts.h>"
		end
end
