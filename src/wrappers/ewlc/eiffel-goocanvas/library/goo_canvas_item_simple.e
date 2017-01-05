note
	description: "GOO_CANVAS_ITEM_SIMPLE -- Ancestor of all the canvas items"
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
	GOO_CANVAS_ITEM_SIMPLE
	
inherit
	GOO_CANVAS_ITEM
	-- GTK_OBJECT is unnecessary since I make GOO_CANVAS_ITEM a G_OBJECT
	
insert
	GOO_CANVAS_ITEM_SIMPLE_EXTERNALS
	
create {ANY}
	from_external_pointer
	
feature {ANY} 
	struct_size: INTEGER
		external "C inline use <goocanvas-1.0/goocanvasitemsimple.h>"
		alias "sizeof(GooCanvasItemSimple)"
		end
	

feature {} -- properties
-- "antialias"                GooCairoAntialias     : Read / Write
--  "clip-fill-rule"           GooCairoFillRule      : Read / Write
--  "clip-path"                gchararray            : Write
--  "fill-color"               gchararray            : Write
--  "fill-color-rgba"          guint                 : Read / Write
--  "fill-pattern"             GooCairoPattern       : Read / Write
--  "fill-pixbuf"              GdkPixbuf             : Write
--  "fill-rule"                GooCairoFillRule      : Read / Write
--  "font"                     gchararray            : Read / Write
--  "font-desc"                PangoFontDescription  : Read / Write
--  "hint-metrics"             GooCairoHintMetrics   : Read / Write
--  "line-cap"                 GooCairoLineCap       : Read / Write
--  "line-dash"                GooCanvasLineDash     : Read / Write
--  "line-join"                GooCairoLineJoin      : Read / Write
--  "line-join-miter-limit"    gdouble               : Read / Write
--  "line-width"               gdouble               : Read / Write
--  "operator"                 GooCairoOperator      : Read / Write
--  "stroke-color"             gchararray            : Write
--  "stroke-color-rgba"        guint                 : Read / Write
--  "stroke-pattern"           GooCairoPattern       : Read / Write
--  "stroke-pixbuf"            GdkPixbuf             : Write
end
