indexing
	description: "Callback for GtsFunc."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli
					
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

class GTS_FUNCTION
	-- gint (*GtsFunc) (gpointer item, gpointer data);
	
	-- A user function called for each item of a collection.
	
	-- item: a pointer this function is called for.
	
	-- data: user data passed to the function.
	
	-- Returns: if 0 the calling sequence continues, otherwise it stops.
	
inherit WRAPPER_HANDLER

creation make

feature {} -- Implementation
	make (a_function: PREDICATE[ANY, TUPLE[GTS_OBJECT]]) is
		do
			function=a_function
		end
	
	function: PREDICATE[ANY, TUPLE[GTS_OBJECT]]

	low_level_callback (gts_object, user_data: POINTER): INTEGER is
			-- Low level callback will be called by GTK; it will call
			-- `callback'.
		external "C use <callbacks.h>"
		alias "EiffelGtsFunc"
		end 
end -- class GTS_FUNCTION
