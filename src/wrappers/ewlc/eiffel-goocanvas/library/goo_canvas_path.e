note
	description: "GOO_CANVAS_PATH -- A svg path on a canvas"
	copyright: "[
					GooCanvas. Copyright (C) 2005-2018: Damon Chaplin, eiffel-libraries team and others
					
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
	date: "$Date:$"
	revision "$REvision:$"

class
	GOO_CANVAS_PATH
	
inherit
	GOO_CANVAS_ITEM_SIMPLE redefine struct_size end
	
create {ANY}
	make, from_external_pointer
	
feature {} -- creation
	make (parent : GOO_CANVAS_ITEM; path_data : STRING)
		do
			from_external_pointer (goo_canvas_path_new (parent.handle, path_data.to_external))
		end
	
	
	goo_canvas_path_new (parent, path_data : POINTER) : POINTER
		external "C use <goocanvas-1.0/goocanvaspath.h>"
		end

feature {ANY} -- struct size
	struct_size: INTEGER
		external "C inline use <goocanvas-1.0/goocanvaspath.h>"
		alias "sizeof(GooCanvasPath)"
		end

feature {} -- properties
	
--  "data"                     gchararray            : Write
end
