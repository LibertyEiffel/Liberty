class
	GOO_CANVAS_RECT
	
inherit
	GOO_CANVAS_ITEM_SIMPLE redefine struct_size end
	
create
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

feature -- struct size
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
