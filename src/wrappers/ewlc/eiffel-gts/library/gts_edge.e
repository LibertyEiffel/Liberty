note
	description: "Edges are derived from GtsSegment. They are used to define GtsTriangle.."
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

class GTS_EDGE

inherit GTS_SEGMENT redefine duplicate, make, struct_size end
	
insert GTS_EDGE_EXTERNALS

create {ANY}  make, from_external_pointer

feature {} -- Creation
	make (a_vertex, another_vertex: GTS_VERTEX) is
			-- Creates a new GtsEdge linking v1 and v2.
		do
			from_external_pointer (gts_edge_new (gts_edge_class,
															 a_vertex.handle, another_vertex.handle)) 
		end

feature {ANY}
	replace (another: GTS_EDGE) is
			-- Replaces Current with `another': for each triangle which
			-- uses Current as an edge, it is replaced with
			-- `another'. `another.triangles' list is updated
			-- appropriately and the `Current.triangles' list set to
			-- Void (Note: the underlying C list is also freed).
		require another_not_void: another /= Void
		do
			gts_edge_replace (handle, another.handle)
		end

	is_unattached: BOOLEAN is
			-- Is Current used as an edge of any triangle?
		do
			Result:=gts_edge_is_unattached(handle).to_boolean
		end

	duplicate: like Current is
			-- the first GtsEdge different from Current which shares the
			-- same endpoints or Void if there is none.
		local p: POINTER
		do
			p:=gts_edge_is_duplicate(handle)
			if p.is_not_null then
				if wrappers.has(p) then Result ::= wrappers.at(p)
				else create Result.from_external_pointer(p)
				end
			end
		end

	face_on_surface (a_surface: GTS_SURFACE): GTS_FACE is
			-- a GtsFace of `a_surface' having Current as an edge; can be
			-- Void if there is no faces. Note: the original C feature
			-- was called "gts_edge_had_parent_surface".
		local a_pointer: POINTER
		do
			a_pointer:= gts_edge_has_parent_surface (handle, a_surface.handle)
			if a_pointer.is_not_null then
				if wrappers.has(a_pointer) then
					Result ::= wrappers.at(a_pointer)
				else
					create Result.from_external_pointer(a_pointer)
				end
			end
		end
	
	face: GTS_FACE is 
			-- a GtsFace belonging to any surface and having Current as
			-- an edge. It is Void if Current is not an edge of any
			-- triangle or if all the faces having Current has an edge do
			-- not belong to any surface. Note: the original C feature is
			-- called "gts_edge_has_any_parent_surface".
		local p: POINTER
		do
			p:=gts_edge_has_any_parent_surface (handle)
			if p.is_not_null then
				if wrappers.has(p) then
					Result ::= wrappers.at(p)
				else
					create Result.from_external_pointer(p)
				end
			end
		end
 
	boundary_face_of (a_surface: GTS_SURFACE): GTS_FACE is
			--	the unique GtsFace (which belongs to `a_surface') and
			--	which has Current as an edge (i.e. e is a boundary edge
			--	(of surface)) or Void if there is more than one or no
			--	faces (belonging to `a_surface') and with Current as an
			--	edge. `a_surface' can be Void. Note: the original C
			--	documentation is not clear on the meaning of Result when
			--	`a_surface' is Void.
		local sp,p: POINTER
		do
			if a_surface/=Void then sp:=a_surface.handle end
			p:=gts_edge_is_boundary(handle,sp)
			if p.is_not_null then
				if wrappers.has(p) then Result ::= wrappers.at(p)
				else create Result.from_external_pointer(p)
				end
			end
		end

	contact_edges_count: INTEGER is 
			-- the number of sets of connected triangles sharing Current
			-- as a contact edge. Note: this feature wraps C function
			-- "gts_edge_is_contact".
			-- TODO: should be NATURAL since it is a guint
		do
			Result := gts_edge_is_contact(handle)
		end

	belongs_to_tetrahedron: BOOLEAN is
			-- Is Current edge used by faces forming a tetrahedron?
		do
			Result := gts_edge_belongs_to_tetrahedron(handle).to_boolean
		end
 
	face_count (a_surface: GTS_SURFACE): INTEGER is
			-- the number of faces using Current and belonging to `a_surface'.
			-- TODO: Should be Natural since it is a guint
		do
			Result := gts_edge_face_number (handle, null_or(a_surface))
		end

	manifold_faces_of (a_surface: GTS_SURFACE): TUPLE[GTS_FACE, GTS_FACE] is
			-- If Current is a manifold edge of `a_surface' Result will
			-- contain the faces belonging to `a_surface' and
			-- sharing Current. Otherwise it will be Void.
		require 
			surface_not_void: a_surface /= Void
		local 
			has_manifold: BOOLEAN;
			f1p, f2p: POINTER;
			f1, f2: GTS_FACE
		do
			has_manifold:=(gts_edge_manifold_faces (handle, a_surface.handle,
																 $f1p,$f2p)).to_boolean
			if has_manifold then 
				if wrappers.has(f1p) then f1::= wrappers.at(f1p)
				else create f1.from_external_pointer(f1p)
				end
				
				if wrappers.has(f2p) then f2 ::= wrappers.at(f2p)
				else create f2.from_external_pointer(f2p)
				end
				create Result.make_2(f1,f2)
			end
		end
	
	encroaching_vertex (a_surface: GTS_SURFACE; 
							  -- encroaching_function: FUNCTION[BOOLEAN,TUPLE[]]
							  ): GTS_VERTEX is
			-- a GtsVertex belonging to s and encroaching upon e (as defined by encroaches) or NULL if there is 
			-- none. a GtsSurface describing a (constrained) Delaunay triangulation.
			-- encroaches : a GtsEncroachFunc. 
		obsolete "Currently NOT implemented!"
		local 
			p: POINTER
		do
			not_yet_implemented
			p:=gts_edge_is_encroached (handle, -- GtsEdge *e,
												a_surface.handle, -- GtsSurface *s,
												default_pointer, -- GtsEncroachFunc,
												to_pointer -- gpointer data
												)
			-- gboolean (*GtsEncroachFunc) (GtsVertex *v, GtsEdge *e,
			-- GtsSurface *s, gpointer data);
		ensure implemented: False
		end

	swap (a_surface: GTS_SURFACE) is
			-- Performs an "edge swap" on the two triangles sharing
			-- Current and belonging to `a_surface'.
		require surface_not_void: a_surface /= Void
		do
			gts_edge_swap (handle, a_surface.handle)
		end
feature {} -- size
	struct_size: INTEGER is
		external "C inline use <gts.h>"
		alias "sizeof(GtsEdge)"
		end

end -- class GTS_EDGE

