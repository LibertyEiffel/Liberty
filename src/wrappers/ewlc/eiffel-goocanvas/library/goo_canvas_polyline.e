note
	description: "GOO_CANVAS_POLYLINE -- A polyline for a canvas"
	copyright: "[
					GooCanvas. Copyright (C) 2005-2017: Damon Chaplin, eiffel-libraries team and others
					
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
	GOO_CANVAS_POLYLINE
	
inherit
	GOO_CANVAS_ITEM_SIMPLE redefine struct_size end
	
create {ANY}
	make, from_external_pointer
	
feature {} -- creation
	make (parent : GOO_CANVAS_ITEM; close_path : BOOLEAN; num_points : INTEGER)
		do
			from_external_pointer (goo_canvas_polyline_new (parent.handle, close_path, num_points))
		end
		
	make_line (parent : GOO_CANVAS_ITEM; x1, y1, x2, y2 : REAL_64)
		do
			from_external_pointer (goo_canvas_polyline_new_line (parent.handle, x1, y1, x2, y2))
		end
	
	
	goo_canvas_polyline_new (parent : POINTER; close_path : BOOLEAN; num_points : INTEGER) : POINTER
		external "C use <goocanvas-1.0/goocanvaspolyline.h>"
		end
	
	goo_canvas_polyline_new_line (parent : POINTER; x1, y1, x2, y2 : REAL_64) : POINTER
		external "C use <goocanvas-1.0/goocanvaspolyline.h>"
		end

feature {ANY} -- struct size
	struct_size: INTEGER
		external "C inline use <goocanvas-1.0/goocanvaspolyline.h>"
		alias "sizeof(GooCanvasPolyline)"
		end

feature {} -- properties
	
--"arrow-length"             gdouble               : Read / Write
--  "arrow-tip-length"         gdouble               : Read / Write
--  "arrow-width"              gdouble               : Read / Write
--  "close-path"               gboolean              : Read / Write
--  "end-arrow"                gboolean              : Read / Write
--  "points"                   GooCanvasPoints       : Read / Write
--  "start-arrow"              gboolean              : Read / Write
end
