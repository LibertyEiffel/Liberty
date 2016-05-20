note
	description: "GOO_CANVAS_RECT -- Shows a rect on a canvas"
	copyright: "[
					GooCanvas. Copyright (C) 2005 Damon Chaplin, eiffel-libraries team and others
					
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
	GOO_CANVAS_RECT
	
inherit
	GOO_CANVAS_ITEM_SIMPLE redefine struct_size end
	
create {ANY}
	make, from_external_pointer
	
feature {} -- creation
	make (parent : GOO_CANVAS_ITEM; x, y, width, height : REAL_64) is
		do
--			from_external_pointer (goo_canvas_rect_new (goo_canvas_get_root_item ()))
			from_external_pointer (goo_canvas_rect_new (parent.handle, x, y, width, height))
		end
	
	
	goo_canvas_rect_new (parent : POINTER; x, y, width, height : REAL_64) : POINTER is
		external "C use <goocanvas-1.0/goocanvasrect.h>"
		end

feature {ANY} -- struct size
	struct_size: INTEGER is
		external "C inline use <goocanvas-1.0/goocanvasrect.h>"
		alias "sizeof(GooCanvasRect)"
		end

feature {} -- properties
--	"height"                   gdouble               : Read / Write
--  "radius-x"                 gdouble               : Read / Write
--  "radius-y"                 gdouble               : Read / Write
--  "width"                    gdouble               : Read / Write
--  "x"                        gdouble               : Read / Write
--  "y"                        gdouble               : Read / Write
end
