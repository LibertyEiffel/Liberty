deferred class
	GOO_CANVAS_ITEM_SIMPLE_EXTERNALS
	
inherit
	ANY undefine is_equal, copy end
	
feature {} -- externals
	
	goo_canvas_item_simple_check_style (item : POINTER)  is
		external "C use <goocanvas-1.0/goocanvasitemsimple.h>"
		end
		
	goo_canvas_item_simple_get_line_width (item : POINTER) : REAL_64  is
		external "C use <goocanvas-1.0/goocanvasitemsimple.h>"
		end
		
  goo_canvas_item_simple_get_path_bounds (item, cr, bounds : POINTER)  is
		external "C use <goocanvas-1.0/goocanvasitemsimple.h>"
		end
		
  goo_canvas_item_simple_user_bounds_to_device (item, cr, bounds : POINTER)  is
		external "C use <goocanvas-1.0/goocanvasitemsimple.h>"
		end
		
  goo_canvas_item_simple_user_bounds_to_parent (item, cr, bounds : POINTER)  is
		external "C use <goocanvas-1.0/goocanvasitemsimple.h>"
		end
		
--gboolean            goo_canvas_item_simple_check_in_path (item : POINTER; x, y : REAL_64; cr)
--                                                        (GooCanvasItemSimple *item,
--                                                         gdouble x,
--                                                         gdouble y,
--                                                         cairo_t *cr,
--                                                         GooCanvasPointerEvents pointer_events);
  goo_canvas_item_simple_paint_path (item, cr : POINTER)  is
		external "C use <goocanvas-1.0/goocanvasitemsimple.h>"
		end
		
  goo_canvas_item_simple_changed (item : POINTER; recompute_bounds : BOOLEAN)  is
		external "C use <goocanvas-1.0/goocanvasitemsimple.h>"
		end
		
  goo_canvas_item_simple_set_model (item, model : POINTER)  is
		external "C use <goocanvas-1.0/goocanvasitemsimple.h>"
		end
		
	
end
