class
	GOO_CANVAS_IMAGE
	
inherit
	GOO_CANVAS_ITEM_SIMPLE redefine struct_size end
	
create
	make, from_external_pointer
	
feature {} -- creation
	make (parent : GOO_CANVAS_ITEM; pixbuf : GDK_PIXBUF; x, y : REAL_64) is
		do
			from_external_pointer (goo_canvas_image_new (parent.handle, pixbuf.handle, x, y))
		end
	
	
	goo_canvas_image_new (parent, pixbuf : POINTER; x, y : REAL_64) : POINTER is
		external "C use <goocanvas-1.0/goocanvasimage.h>"
		end

feature -- struct size
	struct_size: INTEGER is
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
