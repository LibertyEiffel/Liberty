indexing
	description: "GdaHandlerBoolean -- Default handler for booleans."
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

class GDA_HANDLER_BOOLEAN

inherit 
	GDA_OBJECT
	GDA_DATA_HANDLER
	
creation make, from_external_pointer

feature {} -- Creation
	make is
			-- Creates a data handler for booleans
		do
			from_external_pointer(gda_handler_boolean_new)
		end
	
feature {} -- External calls
	gda_handler_boolean_new: POINTER is
			--	GdaDataHandler* gda_handler_boolean_new     (void);
		external "C use <libgda/libgda.h>"
		end
feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaHandlerBoolean)"
		end

end -- class GDA_HANDLER_BOOLEAN
