note
	description: "."
	copyright: "[
					Copyright (C) 2006-2017: Paolo Redaelli, GTK+ team
					
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

class GTS_CONSTRAINT

inherit GTS_EDGE redefine make, struct_size, fill_tagged_out_memory end

create {ANY}  make, from_external_pointer

feature {} -- Creation
	make (a_vertex, another_vertex: GTS_VERTEX)
		do
			from_external_pointer (gts_edge_new (gts_constraint_class, a_vertex.handle, another_vertex.handle)) 
		end
	
feature {} -- External calls
	-- #define     GTS_CONSTRAINT_CLASS            (klass)
	-- #define     GTS_CONSTRAINT_CLASS            (klass)
	-- #define     GTS_CONSTRAINT                  (obj)
	-- #define     GTS_CONSTRAINT                  (obj)
	
	gts_is_constraint (a_pointer: POINTER): INTEGER
			-- #define     GTS_IS_CONSTRAINT               (obj)
		external "C macro use <gts.h>"
		alias "GTS_IS_CONSTRAINT"
		end
		
	gts_constraint_class: POINTER
		external "C use <gts.h>"
		end

	struct_size: INTEGER
		external "C inline use <gts.h>"
		alias "sizeof(GtsConstraint)"
		end

feature {ANY} -- Printing
	fill_tagged_out_memory
		do
			tagged_out_memory.append(once "{(")
			v1.x.append_in(tagged_out_memory)
			tagged_out_memory.append(once ", ")
			v1.y.append_in(tagged_out_memory)
			tagged_out_memory.append(once "),(")
			v2.x.append_in(tagged_out_memory)
			tagged_out_memory.append(once ", ")
			v2.y.append_in(tagged_out_memory)
			tagged_out_memory.append(once ")}")
		end
end -- class GTS_CONSTRAINT
