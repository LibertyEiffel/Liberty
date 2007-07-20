indexing
	description: "Shared features."
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

deferred class SHARED_GTS

insert
	GTS_VERTEX_EXTERNALS
	GTS_SEGMENT_EXTERNALS
	GTS_EDGE_EXTERNALS
	WRAPPER_HANDLER
	SHARED_WRAPPERS_DICTIONARY
	
feature 

	vertices_from_segments (some_segments: G_SLIST[GTS_SEGMENT]): G_SLIST[GTS_VERTEX] is
			-- a list of the vertices of `some_segments'. Each element in the list
			-- is unique (no duplicates).
		do
			create Result.from_external_pointer(gts_vertices_from_segments(some_segments.handle))
		end
	
	
	merge_vertices (some_vertices: G_LIST[GTS_VERTEX]; an_epsilon: REAL): G_LIST[GTS_VERTEX] is
			-- For each vertex in `some_vertices' look if there are any vertex of
			-- vertices contained in a box centered on the vertex of size
			-- 2*epsilon. If there are and if check is not NULL and returns TRUE,
			-- replace them with v (using gts_vertex_replace()), destroy them and
			-- remove them from list. This is done efficiently using Kd-Trees.

			-- epsilon : half the size of the bounding box to consider for each
			-- vertex.

			-- check : function called for each pair of vertices about to
			-- be merged or NULL.
		do
			create Result.from_external_pointer (gts_vertices_merge (some_vertices.handle, an_epsilon, default_pointer))
			-- gboolean (*check) (GtsVertex *, GtsVertex *));
		end

	segments_from_vertices (some_vertices: G_SLIST[GTS_VERTEX]): G_SLIST[GTS_SEGMENT] is
			-- a list of unique GtsSegment which have one of their vertices in
			-- vertices.
		do
			create Result.from_external_pointer(gts_segments_from_vertices(some_vertices.handle))
		end

feature -- Edge features
	edges_from_vertices (some_vertices: G_SLIST[GTS_VERTEX]; a_parent: GTS_SURFACE): G_SLIST[GTS_EDGE] is
			-- a list of unique GtsEdge which have one of their vertices
			-- in `some_vertices' and are used by a face of `a_parent'.
		require 
			vertices_not_void: some_vertices /= Void
			parent_not_void: a_parent /= Void
		local a_pointer: POINTER
		do
			a_pointer:=gts_edges_from_vertices(some_vertices.handle, a_parent.handle)
			if a_pointer.is_not_null then
				Result ::= wrappers.reference_at(a_pointer)
				if Result=Void then
					create Result.from_external_pointer(a_pointer)
				end
			end
		end

feature -- Triangle related 
	are_folded (some_triangles: G_SLIST[GTS_TRIANGLE]; a_vertex, another_vertex: GTS_VERTEX; a_max: REAL): BOOLEAN is
			-- Does any pair of `some_triangles' make an angle larger
			-- than a maximum value? All triangles must share `a_vertex'
			-- and `another_vertex' as vertices.  `a_max' os the maximum
			-- value of the square of the cosine of the angle between two
			-- triangles.
		do
			Result:=(gts_triangles_are_folded(some_triangles.handle,
														 a_vertex.handle,
														 another_vertex.handle,
														 a_max)).to_boolean	
		end			


	triangles_from_edges (some_edges: G_SLIST[GTS_EDGE]):	G_SLIST[GTS_EDGE] is
			-- A list of unique triangles which have one of their edges
			-- in `some_edges'.
		local a_pointer: POINTER
		do
			a_pointer:=gts_triangles_from_edges(some_edges.handle)
			if a_pointer.is_not_null then
				Result ::= wrappers.reference_at(a_pointer)
				if Result=Void then
					create Result.from_external_pointer(a_pointer)
				end
			end
		end
	
feature -- Face related
	faces_from_edges (some_edges: G_SLIST[GTS_EDGE]; a_surface: GTS_SURFACE): G_SLIST[GTS_EDGE] is
			-- A list of unique faces which belong to `a_surface' and
			-- have one of their edges in `some_edges'.
		require edges_not_void: some_edges /= Void
		local a_pointer: POINTER
		do
			a_pointer:=gts_faces_from_edges(some_edges.handle, null_or(a_surface))
			if a_pointer.is_not_null then
				Result ::= wrappers.reference_at(a_pointer)
				if Result=Void then
					create Result.from_external_pointer(a_pointer)
				end
			end
		end
			
feature {} -- External calls
	gts_faces_from_edges (some_edges, a_surface: POINTER): POINTER is
		external "C use <gts.h>"
		end
	
	gts_triangles_from_edges (some_edges: POINTER): POINTER is
		external "C use <gts.h>"
		end	

	gts_triangles_are_folded (some_triangles, vertex_a, vertex_b: POINTER; a_max: REAL): INTEGER is -- gboolean
		external "C use <gts.h>"
		end
	
end -- class SHARED_GTS
