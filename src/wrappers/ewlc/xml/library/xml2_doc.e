note
	description: "."
	copyright: "[
					Copyright (C) 2008-2017: Paolo Redaelli
					
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

class XML2_DOC
	-- Minimal wrapper of xmlDoc type from libxml2.

inherit 
		C_STRUCT redefine free end
		EIFFEL_OWNED redefine free end

insert 
	LIBXML2_EXTERNALS
	SHARED_XML2_NODE_CACHE	

create {ANY} from_external_pointer

feature {ANY} 
	root:  XML2_NODE
		do
			Result:=cache.wrapper(xml_doc_get_root_element(handle))
		end

feature {} -- Implementation
	free (p: POINTER)
		do
			xml_free (p)
		end

	struct_size: INTEGER
		external "C use <libxml/tree.h>"
		alias "size_of (xmlDoc)"
		end
end -- class XML2_DOC
