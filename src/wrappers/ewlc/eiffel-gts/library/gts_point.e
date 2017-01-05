note
	description: "Three-dimensional points in the GNU Triangulated Surfaces"
	copyright: "[
					Copyright (C) 2006-2017: Paolo Redaelli,  1999 St<E9>phane Popinet
					
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

class GTS_POINT

inherit GTS_OBJECT redefine struct_size end

insert
	GTS_POINT_EXTERNALS
	GTS_POINT_STRUCT

create {ANY}  make, from_external_pointer, make_uninitialized

feature {} -- Creation

	make (an_x, an_y, a_z: REAL)
			-- Create a new point from the given coordinates
		do
			from_external_pointer (gts_point_new (gts_point_class, an_x, an_y, a_z))
		end

	make_uninitialized
		do
			from_external_pointer (gts_point_new (gts_point_class,0.0,0.0,0.0))
		end
	
feature {ANY} 
	x: REAL
		do
			Result := get_x (handle)
		end

	y: REAL
		do
			Result := get_y (handle)
		end

	z: REAL
		do
			Result := get_z (handle)
		end

feature {ANY} 
	set (an_x, an_y, a_z: REAL)
			-- Sets the coordinates of Current point.
		do
			gts_point_set (handle, an_x, an_y, a_z)
		end

	is_in_rectangle (a_point, another_point: GTS_POINT): BOOLEAN
			-- Is Current point contained in the box (boundary included)
			-- defined by its two corners `a_point' and `another_point'? 
		
			-- `a_point' is the lower-left front corner of the box. 
			-- `another_point' is the upper-right back corner of the box.
		require 
			point_not_void: a_point/=Void
			another_point_not_void: another_point/=Void
			point_is_low_left_corner: ((a_point.x < another_point.x) and
												(a_point.y < another_point.y))
		do
			Result:=(gts_point_is_in_rectangle
						(handle, a_point.handle, another_point.handle)).to_boolean
		end

	
	transform (a_matrix: GTS_MATRIX)
			-- Transform the coordinates of Current according to
			-- `a_matrix' that represents the transformation to apply to
			-- the coordinates. i.e. Current := Current * a_matrix
		require matrix_not_void: a_matrix /= Void
		do
			gts_point_transform (handle, a_matrix.handle)
		end

	distance (another: GTS_POINT): REAL
			-- the Euclidean distance between Current and `another'.
		do
			Result := gts_point_distance (handle, another.handle)
		ensure positive: Result >= 0
		end

	distance2 (another: GTS_POINT): REAL
			-- the square of the Euclidean distance between Current and
			-- `another'.
		do
			Result := gts_point_distance2 (handle, another.handle)
		ensure positive: Result >= 0
		end

	orientation_3d (p1,p2,p3: GTS_POINT): REAL
			-- Checks if Current lies above, below or on the plane
			-- passing through the points p1, p2 and p3. Below is defined
			-- so that p1, p2 and p3 appear in counterclockwise order
			-- when viewed from above the plane. The returned value is an
			-- approximation of six times the signed volume of the
			-- tetrahedron defined by the four points. This function uses
			-- adaptive floating point arithmetic and is consequently
			-- geometrically robust. It is a positive value if Current
			-- lies below, a negative value if Current lies above the
			-- plane, zero if the -- four points are coplanar.
		require 
			p1_not_void: p1 /= Void
			p2_not_void: p2 /= Void
			p3_not_void: p3 /= Void
		do
			Result := gts_point_orientation_3d (p1.handle,
															p2.handle,
															p3.handle,
															handle)
		end

	orientation_3d_sos (p1,p2,p3: GTS_POINT): REAL
			-- Checks if Current lies above, below or on the plane
			-- passing through the points p1, p2 and p3. Below is defined
			-- so that p1, p2 and p3 appear in counterclockwise order
			-- when viewed from above the plane. The returned value is an
			-- approximation of six times the signed volume of the
			-- tetrahedron defined by the four points. This function uses
			-- adaptive floating point arithmetic and is consequently
			-- geometrically robust. 

			-- Simulation of Simplicity (SoS) is used to break ties when
			-- the orientation is degenerate (i.e. Current lies on the plane
			-- defined by p1, p2 and p3).
		
			-- +1 if Current lies below, -1 if it lies above the plane.
		require 
			p1_not_void: p1 /= Void
			p2_not_void: p2 /= Void
			p3_not_void: p3 /= Void
		do
			Result := gts_point_orientation_3d_sos (p1.handle,
																 p2.handle,
																 p3.handle,
																 handle)
		end

	in_circle (p1,p2,p3: GTS_POINT): REAL
			-- A positive number if Current lies inside the circle
			-- defined by the planar projection of `p1', `p2' and `p3'; a
			-- negative number if Current lies outside the circle and
			-- zero if Current lies on it.
		require 
			p1_not_void: p1 /= Void
			p2_not_void: p2 /= Void
			p3_not_void: p3 /= Void
		do
			Result := gts_point_in_circle (handle,
													 p1.handle,
													 p2.handle,
													 p3.handle)
		end
	
	in_triangle_circle (a_triangle: GTS_TRIANGLE): REAL
			-- Tests if the planar projection (x, y) of Current is inside
			-- or outside the circumcircle of the planar projection of
			-- `a_triangle'. This function is geometrically robust.
		require
			triangle_not_void: a_triangle /= Void
		do
			Result := gts_point_in_triangle_circle (handle, a_triangle.handle)
		end

	is_in_triangle (a_triangle: GTS_TRIANGLE): INTEGER
			-- Tests if the planar projection (x, y) of Current is
			-- inside, outside or on the boundary of the planar
			-- projection of `a_triangle'. This function is geometrically
			-- robust. `gts_in' if Current is inside `a_triangle',
			-- `gts_on' if Current is on the boundary, `gts_out'
			-- otherwise.
		require
			triangle_not_void: a_triangle /= Void
		do
			Result := gts_point_is_in_triangle (handle, a_triangle.handle)
		end

	segment_distance2 (a_segment: GTS_SEGMENT): REAL
			-- the square of the minimun Euclidean distance between Current and `a_segment'.
		require
			segment_not_void: a_segment /= Void
		do
			Result := gts_point_segment_distance2 (handle, a_segment.handle)
		ensure positive: Result >= 0
		end

	segment_distance (a_segment: GTS_SEGMENT): REAL
			-- the minimun Euclidean distance between Current and `a_segment'.
		require
			segment_not_void: a_segment /= Void
		do
			Result := gts_point_segment_distance2 (handle, a_segment.handle)
		ensure positive: Result >= 0
		end

	-- TODO: void gts_point_segment_closest (GtsPoint *p, GtsSegment
	-- *s, GtsPoint *closest);

	-- Set the coordinates of closest to the coordinates of the point
	-- belonging to s closest to p.  p : a GtsPoint.  s : a GtsSegment.
	-- closest : a GtsPoint.

	triangle_distance (a_triangle: GTS_TRIANGLE): REAL
			-- the minimun Euclidean distance between Current and `a_triangle'.
		do
			Result := gts_point_triangle_distance (handle,a_triangle.handle)
		end

	closest (a_triangle: GTS_TRIANGLE): GTS_POINT
			--  The point belonging to `a_triangle' and closest to Current.
		require
			triangle_not_void: a_triangle /= Void
		do
			create Result.make_uninitialized
			gts_point_triangle_closest(handle, a_triangle.handle, Result.handle)
		end

	triangle_distance2 (a_triangle: GTS_TRIANGLE): REAL
			-- the square of the minimun Euclidean distance between Current and `a_triangle'.
		do
			Result:=gts_point_triangle_distance2(handle, a_triangle.handle)
		end

	--	is_inside_surface (a_tree: G_NODE; is_open: BOOLEAN): BOOLEAN is
	-- do Result:=(gts_point_is_inside_surface (GtsPoint *p, GNode
	-- *tree, gboolean is_open);

	--     p :        a GtsPoint.
	--     tree :     a bounding box tree of the faces of a closed, orientable surface (see gts_bb_tree_surface()).
	--     is_open :  TRUE if the surface defined by tree is "open" i.e. its volume is negative, FALSE otherwise.
	--     Returns :  TRUE if p is inside the surface defined by tree, FALSE 
	--     otherwise.

feature {ANY} -- Locating
	container_face (a_surface: GTS_SURFACE; guess: GTS_FACE): GTS_FACE
			-- The face of the planar projection of surface containing
			-- Current point. The planar projection of surface must
			-- define a connected set of triangles without holes and
			-- bounded by a convex boundary. The algorithm is randomized
			-- and performs in O(n^1/3) expected time where n is the
			-- number of triangles of surface.

			-- It is Void if Current point is not contained within the
			-- boundary of surface.

			-- If a good `guess' is given the point location can be
			-- significantly faster. `guess' can be Void; a good `guess'
			-- face is a face close to Current.
		require surface_not_void: a_surface /= Void
		local ptr: POINTER
		do
			ptr := gts_point_locate (handle, a_surface.handle, null_or(guess))
			if ptr.is_not_null then
				create Result.from_external_pointer(ptr)
			end
		end
	
feature {} -- size
	struct_size: INTEGER
		external "C inline use <gts.h>"
		alias "sizeof(GtsPoint)"
		end

feature {} -- struct GtsPointClass

--  typedef struct {
--    GtsObjectClass parent_class;
--    gboolean binary;
--  } GtsPointClass;

--    The class for GtsPoint. No virtual functions are associated.

end -- class GTS_POINT
