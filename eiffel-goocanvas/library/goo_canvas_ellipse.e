class
	GOO_CANVAS_ELLIPSE
	
inherit
	GOO_CANVAS_ITEM_SIMPLE redefine struct_size end
	
create
	make, from_external_pointer
	
feature {} -- creation
	make (parent : GOO_CANVAS_ITEM; center_x, center_y, radius_x, radius_y : REAL_64) is
		do
			from_external_pointer (goo_canvas_ellipse_new (parent.handle, center_x, center_y, radius_x, radius_y))
		end
	
	
	goo_canvas_ellipse_new (parent : POINTER; center_x, center_y, radius_x, radius_y : REAL_64) : POINTER is
		external "C use <goocanvas-1.0/goocanvasellipse.h>"
		end

feature -- struct size
	struct_size: INTEGER is
		external "C inline use <goocanvas-1.0/goocanvasellipse.h>"
		alias "sizeof(GooCanvasEllipse)"
		end

feature {} -- properties

--  "center-x"                 gdouble               : Read / Write
--  "center-y"                 gdouble               : Read / Write
--  "radius-x"                 gdouble               : Read / Write
--  "radius-y"                 gdouble               : Read / Write
end
