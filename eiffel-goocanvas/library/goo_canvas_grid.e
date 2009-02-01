class
	GOO_CANVAS_GRID
	
inherit
	GOO_CANVAS_ITEM_SIMPLE redefine struct_size end
	
create
	make, from_external_pointer
	
feature {} -- creation
	make (parent : GOO_CANVAS_ITEM; x, y, width, height, x_step, y_step, x_offset, y_offset : REAL_64) is
		do
			from_external_pointer (goo_canvas_grid_new (parent.handle, x, y, width, height, x_step, y_step, x_offset, y_offset))
		end
	
	
	goo_canvas_grid_new (parent : POINTER; x, y, width, height, x_step, y_step, x_offset, y_offset : REAL_64) : POINTER is
		external "C use <goocanvas-1.0/goocanvasgrid.h>"
		end

feature -- struct size
	struct_size: INTEGER is
		external "C inline use <goocanvas-1.0/goocanvasgrid.h>"
		alias "sizeof(GooCanvasGrid)"
		end

feature {} -- properties
	
--	"border-color"             gchararray            : Write
--  "border-color-rgba"        guint                 : Read / Write
--  "border-pattern"           GooCairoPattern       : Read / Write
--  "border-pixbuf"            GdkPixbuf             : Write
--  "border-width"             gdouble               : Read / Write
--  "height"                   gdouble               : Read / Write
--  "horz-grid-line-color"     gchararray            : Write
--  "horz-grid-line-color-rgba" guint                 : Read / Write
--  "horz-grid-line-pattern"   GooCairoPattern       : Read / Write
--  "horz-grid-line-pixbuf"    GdkPixbuf             : Write
--  "horz-grid-line-width"     gdouble               : Read / Write
--  "show-horz-grid-lines"     gboolean              : Read / Write
--  "show-vert-grid-lines"     gboolean              : Read / Write
--  "vert-grid-line-color"     gchararray            : Write
--  "vert-grid-line-color-rgba" guint                 : Read / Write
--  "vert-grid-line-pattern"   GooCairoPattern       : Read / Write
--  "vert-grid-line-pixbuf"    GdkPixbuf             : Write
--  "vert-grid-line-width"     gdouble               : Read / Write
--  "vert-grid-lines-on-top"   gboolean              : Read / Write
--  "width"                    gdouble               : Read / Write
--  "x"                        gdouble               : Read / Write
--  "x-offset"                 gdouble               : Read / Write
--  "x-step"                   gdouble               : Read / Write
--  "y"                        gdouble               : Read / Write
--  "y-offset"                 gdouble               : Read / Write
--  "y-step"                   gdouble               : Read / Write
end
