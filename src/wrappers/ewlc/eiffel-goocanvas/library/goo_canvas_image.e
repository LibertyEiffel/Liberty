note
	description: "GOO_CANVAS_IMAGE -- Shows an image on a canvas"
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
	GOO_CANVAS_IMAGE
	
inherit
	GOO_CANVAS_ITEM_SIMPLE redefine struct_size end
	
create {ANY}
	make, from_external_pointer
	
feature {} -- creation
	make (parent : GOO_CANVAS_ITEM; pixbuf : GDK_PIXBUF; x, y : REAL_64)
		do
			from_external_pointer (goo_canvas_image_new (parent.handle, pixbuf.handle, x, y))
		end
	
	
	goo_canvas_image_new (parent, pixbuf : POINTER; x, y : REAL_64) : POINTER
		external "C use <goocanvas-1.0/goocanvasimage.h>"
		end

feature {ANY} -- struct size
	struct_size: INTEGER
		external "C inline use <goocanvas-1.0/goocanvasimage.h>"
		alias "sizeof(GooCanvasImage)"
		end

feature {} -- properties
	
--	  "height"                   gdouble               : Read / Write
--  "pattern"                  GooCairoPattern       : Read / Write
--  "pixbuf"                   GdkPixbuf             : Write
--  "width"                    gdouble               : Read / Write
--  "x"                        gdouble               : Read / Write
--  "y"                        gdouble               : Read / Write
end
