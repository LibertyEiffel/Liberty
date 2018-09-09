note
	description: "Vertices"
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

class GTS_VERTEX
	-- Vertices are points used as endpoints of GtsSegment.

inherit 
	GTS_POINT
		redefine 
			make, struct_size, fill_tagged_out_memory
		end

insert
	GTS_VERTEX_EXTERNALS
		undefine
			fill_tagged_out_memory
		end

	SHARED_GTS

create {ANY}  make, from_external_pointer

feature {} -- Creation
	make (an_x, an_y, a_z: REAL)
			-- Create a new GTS_VERTEX an the given coordinates
		do
			from_external_pointer (gts_vertex_new (gts_vertex_class,
																an_x,an_y,a_z))
		end
feature {ANY} 
	is_unattached: BOOLEAN
			-- Is Current GTS_VERTEX not the endpoint of any GtsSegment?
		do
			Result:=(gts_vertex_is_unattached(handle).to_boolean)
		end
	
	is_boundary (a_surface: GTS_SURFACE): BOOLEAN
			-- Is Current used by a GtsEdge boundary of `a_surface' as determined
			-- by GTS_EDGE.is_boundary? 

			-- Note: GTS allows `a_surface' to be NULL. The reason is not
			-- clear,
		do
			-- require surface_not_void: a_surface /= Void
			Result:=(gts_vertex_is_boundary(handle,null_or(a_surface)).to_boolean)
		end

	contact_number (do_sever: BOOLEAN): INTEGER
			-- the number of sets of connected triangles sharing Current
			-- as a contact vertex.

			-- `do_sever': if TRUE and if Current vertex is a contact
			-- vertex between two or more sets of connected triangles
			-- replaces it with as many vertices, clones of v.

			-- TODO: Should be NATURAL since it is guint
		obsolete "This feature breaks command-query separation principle!"
		do
			Result:=gts_vertex_is_contact(handle, do_sever.to_integer)
		end

	segment_connecting_with (another: GTS_VERTEX): GTS_SEGMENT
			-- the segment that connects Current and `another'
		local p: POINTER
		do
			p:=gts_vertices_are_connected(handle, another.handle)
			if p.is_not_null then create Result.from_external_pointer(p) end
		end

	replace_with (another: GTS_VERTEX)
			-- Replaces Current vertex with `another'. v and with must be
			-- different. All the GtsSegment which have v has one of
			-- their vertices are updated. The segments list of vertex is
			-- freed and `segments' is set to Void.
		require 
			another_not_void: another/=Void
			not_equal: not is_equal(another)
		do
			gts_vertex_replace (handle, another.handle)
		end
	
	neighbors (except_list: G_SLIST[GTS_VERTEX]; a_surface: GTS_SURFACE): G_SLIST[GTS_VERTEX]
			-- the vertices connected to Current vertex by a segment,
			-- except those listed in `except_list' . If `a_surface' is
			-- not Void only the vertices connected to Current by an edge
			-- belonging to surface are considered.
		local l,s: POINTER
		do
			if except_list /= Void then l:=except_list.handle end
			if a_surface /= Void then s:=a_surface.handle end
			create Result.from_external(gts_vertex_neighbors(handle,l,s),
												 vertex_factory)
		end

	triangles: G_SLIST[GTS_TRIANGLE]
			-- the GtsTriangles which share Current GTS_VERTEX as a vertex. 

			-- Note: the original implementation allow to provide a list of already
			-- know triangles.	 
		do
			create Result.from_external_pointer(gts_vertex_triangles
															(handle, default_pointer))
		end

	faces (a_surface: GTS_SURFACE): G_SLIST[GTS_SURFACE]
			-- the GtsFaces belonging to surface (if not Void) which share Current
			-- GTS_VERTEX as a vertex (TODO: and do not already belong
			-- `already_present' to list.
		local s: POINTER
		do
			if a_surface/=Void then s:=a_surface.handle end
			create Result.from_external_pointer
			(gts_vertex_faces (handle, s, default_pointer))
		end

	fan_oriented (a_surface: GTS_SURFACE): G_SLIST[GTS_EDGE]
			-- a list of GtsEdge describing in counterclockwise order the boundary
			-- of the fan of summit Current GTS_VERTEX, the faces of the fan
			-- belonging to surface.
		local s: POINTER
		do
			if a_surface/=Void then s:=a_surface.handle end
			create Result.from_external_pointer
			(gts_vertex_fan_oriented(handle,s))
		end

	encroaches (an_edge: GTS_EDGE): BOOLEAN
			-- Is Current strictly contained in the diametral circle of `an_edge'.
		require edge_not_void: an_edge /= Void
		do
			Result:=(gts_vertex_encroaches_edge
						(handle, an_edge.handle)).to_boolean
		end

	segments: G_SLIST[GTS_SEGMENT]
			-- the GtsSegments using this vertex as one of their
			-- endpoints.
		do
			-- segments list are not cached because 
			create Result.from_external_pointer(get_segments(handle))
		end
	
feature {} -- Unwrapped code
	-- typedef struct { GtsPointClass parent_class;
	-- void (* intersection_attributes) (GtsVertex *, GtsObject *,
	-- GtsObject *); } GtsVertexClass;
	
	-- The vertex class. No virtual functions are associated.

feature {} -- Struct access
	get_segments (a_struct: POINTER): POINTER
		external "C struct GtsVertex get segments use <gts.h>"
		end
	
	-- typedef struct { GtsPoint p; GSList * segments; } GtsVertex;
	
	-- GtsPoint p; The parent object.
	
	-- GSList *segments; Contains all the GtsSegment using this vertex
	-- as one of their endpoints.

feature {} -- size
	struct_size: INTEGER
		external "C inline use <gts.h>"
		alias "sizeof(GtsVertex)"
		end

feature {ANY}
	fill_tagged_out_memory
		do
			tagged_out_memory.append(once "(")
			x.append_in(tagged_out_memory)
			tagged_out_memory.append(once ", ")
			y.append_in(tagged_out_memory)
			tagged_out_memory.append(once ")")
		end
end -- class GTS_VERTEX
