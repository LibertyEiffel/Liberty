note
	description: "GOO_CANVAS_TABLE -- A class to arrange CANVAS_ITEMs in a table"
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
	GOO_CANVAS_TABLE
	
inherit
	GOO_CANVAS_GROUP redefine struct_size, make end
	
create {ANY}
	make, from_external_pointer
	
feature {} -- creation
	make (parent : GOO_CANVAS_ITEM)
		do
			from_external_pointer (goo_canvas_table_new (parent.handle))
		end
	
	
	goo_canvas_table_new (parent : POINTER) : POINTER
		external "C use <goocanvas-1.0/goocanvastable.h>"
		end

feature {ANY} -- struct size
	struct_size: INTEGER
		external "C inline use <goocanvas-1.0/goocanvastable.h>"
		alias "sizeof(GooCanvasTable)"
		end

feature {} -- properties
	
--  "column-spacing"           gdouble               : Read / Write
--  "height"                   gdouble               : Read / Write
--  "homogeneous-columns"      gboolean              : Read / Write
--  "homogeneous-rows"         gboolean              : Read / Write
--  "horz-grid-line-width"     gdouble               : Read / Write
--  "row-spacing"              gdouble               : Read / Write
--  "vert-grid-line-width"     gdouble               : Read / Write
--  "width"                    gdouble               : Read / Write
--  "x-border-spacing"         gdouble               : Read / Write
--  "y-border-spacing"         gdouble               : Read / Write

feature {} -- child properties
-- Items are added to the table using the normal methods, then 
-- goo_canvas_item_set_child_properties() is used to specify how
-- each child item is to be positioned within the table (i.e. which
-- row and column it is in, how much padding it should have and 
-- whether it should expand or shrink).

--"bottom-padding"           gdouble               : Read / Write
--  "column"                   guint                 : Read / Write
--  "columns"                  guint                 : Read / Write
--  "left-padding"             gdouble               : Read / Write
--  "right-padding"            gdouble               : Read / Write
--  "row"                      guint                 : Read / Write
--  "rows"                     guint                 : Read / Write
--  "top-padding"              gdouble               : Read / Write
--  "x-align"                  gdouble               : Read / Write
--  "x-expand"                 gboolean              : Read / Write
--  "x-fill"                   gboolean              : Read / Write
--  "x-shrink"                 gboolean              : Read / Write
--  "y-align"                  gdouble               : Read / Write
--  "y-expand"                 gboolean              : Read / Write
--  "y-fill"                   gboolean              : Read / Write
--  "y-shrink"                 gboolean              : Read / Write
end
