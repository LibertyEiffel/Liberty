indexing
	description: "."
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

class GTS_CONSTRAINT

inherit GTS_EDGE redefine make, struct_size end

creation make, from_external_pointer

feature {} -- Creation
	make (a_vertex, another_vertex: GTS_VERTEX) is
		do
			from_external_pointer (gts_edge_new (gts_constraint_class, a_vertex.handle, another_vertex.handle)) 
		end
	
feature {} -- External calls
	-- #define     GTS_CONSTRAINT_CLASS            (klass)
	-- #define     GTS_CONSTRAINT                  (obj)
	-- #define     GTS_IS_CONSTRAINT               (obj)
	
	gts_constraint_class: POINTER is
		external "C use <gts.h>"
		end

	struct_size: INTEGER is
		external "C inline use <gts.h>"
		alias "sizeof(GtsConstraint)"
		end
end -- class GTS_CONSTRAINT
