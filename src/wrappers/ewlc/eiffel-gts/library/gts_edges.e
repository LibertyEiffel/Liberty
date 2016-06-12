note
	description: "List of edges."
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

class GTS_EDGES

inherit G_LIST [GTS_EDGE]

insert GTS_EDGE_EXTERNALS

create {ANY}  make, from_external_pointer

feature {} -- Creation
feature {ANY} -- Edges related functions
	merge is
			-- For each edge check if it is duplicated (as returned by
			-- GTS_EDGE.duplicated); in this case it is replaced it by
			-- its duplicate, destroy it and remove it from the Current
			-- list which is updated.
		local p: POINTER
		do
			p:=gts_edges_merge(handle)
			wrappers.remove (handle)
			from_external_pointer (p)
		ensure 
			some_element_could_have_been_removed: count <= old count
			no_duplicated: -- TODO: something like for_each 
		end
end -- class GTS_EDGES
