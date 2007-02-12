indexing
	description: "Faces -- face object."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTS team
					
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

class GTS_FACE
	-- Faces are derived from GtsTriangle. A collection of faces
	-- defined a GtsSurface.
	
inherit GTS_TRIANGLE

creation make, from_external_pointer

feature {} -- Creation
	make (first, second, third: GTS_EDGE) is
			-- a new GtsFace using `first,' `second' and `third' as
			-- edges.
		do
			from_external_class (gts_face_new
										(gts_face_class,
										 first.handle,	second.handle, third.handle))
		end

feature
	has_parent_surface (a_surface: GTS_SURFACE): BOOLEAN is
			-- Does Current face belong to `a_surface'?
		require surface_not_void: a_surface /= Void
		do
			Result:=gts_face_has_parent_surface(handle, a_surface.handle).to_boolean
		end

	neighbor_number (a_surface: GTS_SURFACE): INTEGER is
			-- the number of faces neighbors of Current face and
			-- belonging to a_surface (if it is not Void).
		require surface_not_void: a_surface /= Void
		do
			Result:=gts_face_neighbor_number(handle, null_or(a_surface))
		ensure positive: Result >= 0
		end

	neighbors (a_surface: GTS_SURFACE): G_SLIST[GTS_FACE] is
			-- a list of unique GtsFace neighbors of Current face and
			-- belonging to `a_surface' (if it is not Void).
		do
			create Result.from_external_pointer
			(gts_face_neighbors (handle, null_or(a_surface)))
		end
		
	for_each_neighbor (a_surface: GTS_SURFACE; a_predicate: PREDICATE[TUPLE[GTS_FACE]]) is
			-- Calls `a_function' for each neighbor of Current face
			-- belonging to `a_surface' (if not Void) until `a_function'
			-- returns 0.
		local iter: ITERATOR[GTS_FACE]; stop: BOOLEAN
		do
			iter:=neighbors(a_surface).get_new_iterator
			from iter.start
			until stop and then iter.is_off
			loop
				stop :=  a_predicate.item([iter.item])
				iter.next
			end
		end
	
	is_compatible (a_surface: GTS_SURFACE): BOOLEAN is
			-- Is Current face is compatible with all its neighbors
			-- belonging to `a_surface'?
		do
			Result:=gts_face_is_compatible(handle,a_surface.handle).to_boolean
		end


	surfaces: G_SLIST [GTS_SURFACE] is
			-- Surfaces using Current face.
		do
			create Result.from_external_pointer (get_surfaces(handle))
		end
	
feature {} -- 
	-- typedef struct {
	--   GtsTriangle triangle;
	--   GSList * surfaces;
	-- } GtsFace;

	-- The face object.

	-- GtsTriangle triangle; The parent object.
	-- GSList *surfaces;	A list of GtsSurface using this face.

	get_surfaces (a_face: POINTER): POINTER is
		external "C struct GtsFace get surfaces use <gts.h>"
		end
		
feature {} -- External calls
	gts_face_class (a_class: POINTER): POINTER is
			-- GTS_FACE_CLASS
		external "C macro use <gts.h>"
		alias "GTS_FACE_CLASS"
		end
 
	gts_face (a_pointer: POINTER): POINTER is
			-- GTS_FACE
		external "C macro use <gts.h>"
		alias "GTS_FACE"
		end
 
	-- GtsFaceClass; GtsFace;

	gts_face_class: POINTER is
			-- GtsFaceClass* gts_face_class (void);
		external "C use <gts.h>"
		end

	gts_face_new (a_class, first_edge, second_edge, third_edge: POINTER): POINTER is
			-- GtsFace* gts_face_new (GtsFaceClass *klass, GtsEdge *e1,
			-- GtsEdge *e2, GtsEdge *e3);
		external "C use <gts.h>"
		end

	gts_face_has_parent_surface (a_face, a_surface: POINTER): INTEGER is
			-- gboolean gts_face_has_parent_surface (GtsFace *f,
			-- GtsSurface *s);
		external "C use <gts.h>"
		end

	gts_face_neighbor_number (a_face, a_surface: POINTER): INTEGER is
			-- guint gts_face_neighbor_number(GtsFace *f, GtsSurface *s);
		external "C use <gts.h>"
		end

	gts_face_neighbors (a_face, a_surface: POINTER): POINTER is
			-- GSList* gts_face_neighbors (GtsFace *f, GtsSurface *s);
		external "C use <gts.h>"
		end

	gts_face_foreach_neighbor (a_face, a_surface, a_func, some_data: POINTER) is
			-- void gts_face_foreach_neighbor (GtsFace *f, GtsSurface *s,
			-- GtsFunc func, gpointer data);
		external "C use <gts.h>"
		end

	gts_face_is_compatible (a_face, a_surface: POINTER): INTEGER is
			-- gboolean gts_face_is_compatible(GtsFace *f,GtsSurface *s);
		external "C use <gts.h>"
		end
	
	gts_faces_from_edges (some_edges, a_surface: POINTER): POINTER is
			-- GSList* gts_faces_from_edges(GSList *edges,GtsSurface *s);
		external "C use <gts.h>"
		end
end -- GTS_FACE
