class
	GOO_CANVAS_POLYLINE
	
inherit
	GOO_CANVAS_ITEM_SIMPLE redefine struct_size end
	
create
	make, from_external_pointer
	
feature {} -- creation
	make (parent : GOO_CANVAS_ITEM; close_path : BOOLEAN; num_points : INTEGER) is
		do
			from_external_pointer (goo_canvas_polyline_new (parent.handle, close_path, num_points))
		end
		
	make_line (parent : GOO_CANVAS_ITEM; x1, y1, x2, y2 : REAL_64) is
		do
			from_external_pointer (goo_canvas_polyline_new_line (parent.handle, x1, y1, x2, y2))
		end
	
	
	goo_canvas_polyline_new (parent : POINTER; close_path : BOOLEAN; num_points : INTEGER) : POINTER is
		external "C use <goocanvas-1.0/goocanvaspolyline.h>"
		end
	
	goo_canvas_polyline_new_line (parent : POINTER; x1, y1, x2, y2 : REAL_64) : POINTER is
		external "C use <goocanvas-1.0/goocanvaspolyline.h>"
		end

feature -- struct size
	struct_size: INTEGER is
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
