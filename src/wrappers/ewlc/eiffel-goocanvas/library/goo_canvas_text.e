note
	description: "GOO_CANVAS_TEXT -- Shows pango rendered text on the canvas"
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
	GOO_CANVAS_TEXT
	
inherit
	GOO_CANVAS_ITEM_SIMPLE redefine struct_size end
	
create {ANY}
	make, from_external_pointer
	
feature {} -- creation
	make (parent : GOO_CANVAS_ITEM; string : STRING; x, y, width : REAL_64; anchor : INTEGER)
		do
			from_external_pointer (goo_canvas_text_new (parent.handle, string.to_external, x, y, width, anchor))
		end
	
	
	goo_canvas_text_new (parent, string : POINTER; x, y, width : REAL_64; anchor : INTEGER) : POINTER
	 -- TODO: GtkAnchorType anchor ??
		external "C use <goocanvas-1.0/goocanvastext.h>"
		end
		
	-- TODO: 
--	goo_canvas_text_get_natural_extents (GooCanvasText *text,
--                                                         PangoRectangle *ink_rect,
--                                                         PangoRectangle *logical_rect)

feature {ANY} -- struct size
	struct_size: INTEGER
		external "C inline use <goocanvas-1.0/goocanvastext.h>"
		alias "sizeof(GooCanvasText)"
		end

feature {} -- properties
	
-- "alignment"                PangoAlignment        : Read / Write
--  "anchor"                   GtkAnchorType         : Read / Write
--  "ellipsize"                PangoEllipsizeMode    : Read / Write
--  "text"                     gchararray            : Read / Write
--  "use-markup"               gboolean              : Read / Write
--  "width"                    gdouble               : Read / Write
--  "wrap"                     PangoWrapMode         : Read / Write
--  "x"                        gdouble               : Read / Write
--  "y"                        gdouble               : Read / Write
end
