indexing
	description: "."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

class PANGO_STRING_ATTRIBUTE

inherit 
	C_STRUCT
	MIXED_MEMORY_HANDLING

create {ANY} from_external_pointer

feature {ANY} 
	value: STRING is
		do
			create {CONST_STRING} Result.from_external(get_value (handle))
		end
	
feature {ANY} -- size

	struct_size: INTEGER is
		external "C inline use <pango/pango.h>"
		alias "sizeof(PangoAttrString)"
		end

feature {} -- struct PangoAttrString
	-- PangoAttrString
	
	-- typedef struct {
	--   PangoAttribute attr;
	--   char *value;
	-- } PangoAttrString;
	
	-- The PangoAttrString structure is used to represent attributes with a string value.
	-- PangoAttribute attr;	the common portion of the attribute
	-- char *value;	the string which is the value of the attribute
	get_value (a_ptr: POINTER): POINTER is
		external "C struct PangoAttrString get value use <pango/pango.h>"
		end
end
