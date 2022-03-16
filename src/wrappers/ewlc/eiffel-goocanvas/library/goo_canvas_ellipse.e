note
	description: "GOO_CANVAS_ELLIPSE -- Ellipse on a canvas"
	copyright: "[
					GooCanvas. Copyright (C) 2005-2022: Damon Chaplin, eiffel-libraries team and others
					
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
	GOO_CANVAS_ELLIPSE
	
inherit
	GOO_CANVAS_ITEM_SIMPLE redefine struct_size end
	
create {ANY}
	make, from_external_pointer
	
feature {} -- creation
	make (parent : GOO_CANVAS_ITEM; center_x, center_y, radius_x, radius_y : REAL_64)
		do
			from_external_pointer (goo_canvas_ellipse_new (parent.handle, center_x, center_y, radius_x, radius_y))
		end
	
	
	goo_canvas_ellipse_new (parent : POINTER; center_x, center_y, radius_x, radius_y : REAL_64) : POINTER
		external "C use <goocanvas-1.0/goocanvasellipse.h>"
		end

feature {ANY} -- struct size
	struct_size: INTEGER
		external "C inline use <goocanvas-1.0/goocanvasellipse.h>"
		alias "sizeof(GooCanvasEllipse)"
		end

feature {} -- properties

--  "center-x"                 gdouble               : Read / Write
--  "center-y"                 gdouble               : Read / Write
--  "radius-x"                 gdouble               : Read / Write
--  "radius-y"                 gdouble               : Read / Write
end
