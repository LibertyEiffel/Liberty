note
	description: "Shared features."
	copyright: "[
					Copyright (C) 2006-2022: Paolo Redaelli, GTK+ team
					
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

deferred class SHARED_GTS

insert
	GTS_VERTEX_EXTERNALS undefine fill_tagged_out_memory end
	GTS_SEGMENT_EXTERNALS undefine fill_tagged_out_memory end
	GTS_EDGE_EXTERNALS undefine fill_tagged_out_memory end
	WRAPPER_HANDLER
	
feature {ANY} 

	vertices_from_segments (some_segments: G_SLIST[GTS_SEGMENT]): G_SLIST[GTS_VERTEX]
			-- a list of the vertices of `some_segments'. Each element in the list
			-- is unique (no duplicates).
		do
			create Result.from_external(gts_vertices_from_segments(some_segments.handle),
												 vertex_factory)
		end
	
	
	merge_vertices (some_vertices: G_LIST[GTS_VERTEX]; an_epsilon: REAL): G_LIST[GTS_VERTEX]
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
			create Result.from_external(gts_vertices_merge (some_vertices.handle, an_epsilon, default_pointer),
			vertex_factory)
			-- gboolean (*check) (GtsVertex *, GtsVertex *));
		end

	segments_from_vertices (some_vertices: G_SLIST[GTS_VERTEX]): G_SLIST[GTS_SEGMENT]
			-- a list of unique GtsSegment which have one of their vertices in
			-- vertices.
		do
			create Result.from_external(gts_segments_from_vertices(some_vertices.handle),
			segment_factory)
		end

feature {ANY} -- Edge features
	edges_from_vertices (some_vertices: G_SLIST[GTS_VERTEX]; a_parent: GTS_SURFACE): G_SLIST[GTS_EDGE]
			-- a list of unique GtsEdge which have one of their vertices
			-- in `some_vertices' and are used by a face of `a_parent'.
		require 
			vertices_not_void: some_vertices /= Void
			parent_not_void: a_parent /= Void
		do
			create Result.from_external
			(gts_edges_from_vertices(some_vertices.handle, a_parent.handle),
			edge_factory)
		end

feature {ANY} -- Triangle related 
	are_folded (some_triangles: G_SLIST[GTS_TRIANGLE]; a_vertex, another_vertex: GTS_VERTEX; a_max: REAL): BOOLEAN
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


	triangles_from_edges (some_edges: G_SLIST[GTS_EDGE]):	G_SLIST[GTS_EDGE]
			-- A list of unique triangles which have one of their edges
			-- in `some_edges'.
		local a_pointer: POINTER
		do
			create Result.from_external
			(gts_triangles_from_edges(some_edges.handle),
			triangle_factory)
		end
	
feature {ANY} -- Face related
	faces_from_edges (some_edges: G_SLIST[GTS_EDGE]; a_surface: GTS_SURFACE): G_SLIST[GTS_EDGE]
			-- A list of unique faces which belong to `a_surface' and
			-- have one of their edges in `some_edges'.
		require edges_not_void: some_edges /= Void
		do
			create Result.from_external
			(gts_faces_from_edges(some_edges.handle,
										 null_or(a_surface)),
			edge_factory)
		end

feature {} -- Factories
	vertex_factory: ARCHETYPE_FACTORY[GTS_VERTEX]
		once
			create Result.with_archetype(create {GTS_VERTEX}.dummy)
		end

	edge_factory: ARCHETYPE_FACTORY[GTS_EDGE]
		once
			create Result.with_archetype(create {GTS_EDGE}.dummy)
		end

	segment_factory: ARCHETYPE_FACTORY[GTS_SEGMENT]
		once
			create Result.with_archetype(create {GTS_SEGMENT}.dummy)
		end

	triangle_factory: ARCHETYPE_FACTORY[GTS_TRIANGLE]
		once
			create Result.with_archetype(create {GTS_TRIANGLE}.dummy)
		end

feature {} -- External calls
	gts_faces_from_edges (some_edges, a_surface: POINTER): POINTER
		external "C use <gts.h>"
		end
	
	gts_triangles_from_edges (some_edges: POINTER): POINTER
		external "C use <gts.h>"
		end	

	gts_triangles_are_folded (some_triangles, vertex_a, vertex_b: POINTER; a_max: REAL): INTEGER is -- gboolean
		external "C use <gts.h>"
		end
	
end -- class SHARED_GTS
