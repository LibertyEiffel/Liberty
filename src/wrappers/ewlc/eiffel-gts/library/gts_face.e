note
	description: "Faces -- face object."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GTS team
					
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

class GTS_FACE
	-- Faces are derived from GtsTriangle. A collection of faces
	-- defined a GtsSurface.
	
inherit
	GTS_TRIANGLE
		redefine struct_size, from_edges, enclosing
		end

insert GTS_FACE_EXTERNALS
	
create {ANY}  from_edges, from_triangle, enclosing, from_external_pointer

feature {} -- Creation
	from_edges (first, second, third: GTS_EDGE)
			-- a new GtsFace using `first,' `second' and `third' as
			-- edges.
		do
			from_external_pointer (gts_face_new
										  (gts_face_class,
											first.handle,	second.handle, third.handle))
		end

	from_triangle (a_triangle: GTS_TRIANGLE)
		require triangle_not_void: a_triangle /= Void
		do
			from_edges(a_triangle.edge_1,a_triangle.edge_2,a_triangle.edge_3)
		end

	enclosing (some_points: G_SLIST[GTS_POINT]; a_scale: REAL)
		do
			from_external_pointer(gts_triangle_enclosing (gts_face_class, some_points.handle, a_scale))
		end

feature {ANY}
	has_parent_surface (a_surface: GTS_SURFACE): BOOLEAN
			-- Does Current face belong to `a_surface'?
		require surface_not_void: a_surface /= Void
		do
			Result:=gts_face_has_parent_surface(handle, a_surface.handle).to_boolean
		end

	neighbor_number_of (a_surface: GTS_SURFACE): INTEGER
			-- the number of faces neighbors of Current face and
			-- belonging to a_surface (if it is not Void).
		require surface_not_void: a_surface /= Void
		do
			Result:=gts_face_neighbor_number(handle, null_or(a_surface))
		ensure positive: Result >= 0
		end

	neighbors_of (a_surface: GTS_SURFACE): G_SLIST[GTS_FACE]
			-- a list of unique GtsFace neighbors of Current face and
			-- belonging to `a_surface' (if it is not Void).
		do
			create Result.from_external_pointer
			(gts_face_neighbors (handle, null_or(a_surface)))
		end
		
	for_each_neighbor (a_surface: GTS_SURFACE; a_predicate: PREDICATE[TUPLE[GTS_FACE]])
			-- Calls `a_function' for each neighbor of Current face
			-- belonging to `a_surface' (if not Void) until `a_function'
			-- returns 0.
		local iter: ITERATOR[GTS_FACE]; stop: BOOLEAN
		do
			iter:=neighbors_of(a_surface).get_new_iterator
			from iter.start
			until stop and then iter.is_off
			loop
				stop:=a_predicate.item([iter.item])
				iter.next
			end
		end
	
	is_compatible (a_surface: GTS_SURFACE): BOOLEAN
			-- Is Current face is compatible with all its neighbors
			-- belonging to `a_surface'?
		do
			Result:=gts_face_is_compatible(handle,a_surface.handle).to_boolean
		end


	surfaces: G_SLIST [GTS_SURFACE]
			-- Surfaces using Current face.
		do
			create Result.from_external_pointer (get_surfaces(handle))
		end
	
feature {} -- size
	struct_size: INTEGER
		external "C inline use <gts.h>"
		alias "sizeof(GtsFace)"
		end
end -- GTS_FACE
