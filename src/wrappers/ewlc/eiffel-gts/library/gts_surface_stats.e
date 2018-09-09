note
	description: "Statistics of a GTS_SRUFACE."
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

class GTS_SURFACE_STATS

inherit
	C_STRUCT

insert
	GTS_SURFACE_STATS_STRUCT
		-- redefine copy end
	
create {ANY}  make, from_external_pointer

feature {} -- Creation
	make
		do
			allocate
		end
	
feature {ANY}
	faces_count: INTEGER
			-- Number of faces.
		do
			Result := get_n_faces(handle)
		end

	incompatible_faces_count: INTEGER
			-- Number of incompatible faces (see GTS_TRIANGLE's `are_compatible'
			-- for details).
		do
			Result := get_n_incompatible_faces(handle)
		end

	duplicate_faces_count: INTEGER
			-- Number of duplicate faces (see GTS_TRIANGLE's `is_duplicate' for 
			-- details).
		do
			Result:=get_n_duplicate_faces(handle)
		end

	duplicate_edges_count: INTEGER
			--  Number of duplicate edges (see GTS_SEGMENT's `is_duplicate' for
			--  details).
		do
			Result:=get_n_duplicate_edges(handle)
		end

	boundary_edges_count: INTEGER
			--  Number of boundary edges.
		do
			Result:=get_n_boundary_edges(handle)
		end

	non_manifold_edges_count: INTEGER
			-- Number of non-manifold edges.
		do
			Result:=get_n_non_manifold_edges(handle)
		end

	
	-- GtsRange edges_per_vertex; Statistics on the number of edges per vertex.
	
	--GtsRange faces_per_edge; Statistics on the number of faces per vertex.
	
	-- GtsSurface *parent; Surface from which these statistics have been
	-- obtained.
end -- class GTS_SURFACE_STATS
