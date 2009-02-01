class
	GOO_CANVAS_ITEM_SIMPLE
	
inherit
	GOO_CANVAS_ITEM
	-- GTK_OBJECT is unnecessary since I make GOO_CANVAS_ITEM a G_OBJECT
	
insert
	GOO_CANVAS_ITEM_SIMPLE_EXTERNALS
	
create
	from_external_pointer
	
feature 
	struct_size: INTEGER is
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
