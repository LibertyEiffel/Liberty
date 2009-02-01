class
	GOO_CANVAS_WIDGET
	
inherit
	GOO_CANVAS_ITEM_SIMPLE redefine struct_size end
	
create
	make, from_external_pointer
	
feature {} -- creation
	make (parent : GOO_CANVAS_ITEM; widget : GTK_WIDGET; x, y, width, height : REAL_64) is
		do
			from_external_pointer (goo_canvas_widget_new (parent.handle, widget.handle, x, y, width, height))
		end
	
	
	goo_canvas_widget_new (parent, widget : POINTER; x, y, width, height : REAL_64) : POINTER is
		external "C use <goocanvas-1.0/goocanvaswidget.h>"
		end

feature -- struct size
	struct_size: INTEGER is
		external "C inline use <goocanvas-1.0/goocanvaswidget.h>"
		alias "sizeof(GooCanvasWidget)"
		end

feature {} -- properties
	
--	"anchor"                   GtkAnchorType         : Read / Write
--  "height"                   gdouble               : Read / Write
--  "widget"                   GtkWidget             : Read / Write
--  "width"                    gdouble               : Read / Write
--  "x"                        gdouble               : Read / Write
--  "y"                        gdouble               : Read / Write
end
