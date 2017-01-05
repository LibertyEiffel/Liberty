note
	description: "GOO_CANVAS_ITEM_SIMPLE_EXTERNALS -- externals..."
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

deferred class
	GOO_CANVAS_ITEM_SIMPLE_EXTERNALS
	
inherit
	ANY undefine is_equal, copy end
	
feature {} -- externals
	
	goo_canvas_item_simple_check_style (item : POINTER)
		external "C use <goocanvas-1.0/goocanvasitemsimple.h>"
		end
		
	goo_canvas_item_simple_get_line_width (item : POINTER) : REAL_64
		external "C use <goocanvas-1.0/goocanvasitemsimple.h>"
		end
		
  goo_canvas_item_simple_get_path_bounds (item, cr, bounds : POINTER)
		external "C use <goocanvas-1.0/goocanvasitemsimple.h>"
		end
		
  goo_canvas_item_simple_user_bounds_to_device (item, cr, bounds : POINTER)
		external "C use <goocanvas-1.0/goocanvasitemsimple.h>"
		end
		
  goo_canvas_item_simple_user_bounds_to_parent (item, cr, bounds : POINTER)
		external "C use <goocanvas-1.0/goocanvasitemsimple.h>"
		end
		
--gboolean            goo_canvas_item_simple_check_in_path (item : POINTER; x, y : REAL_64; cr)
--                                                        (GooCanvasItemSimple *item,
--                                                         gdouble x,
--                                                         gdouble y,
--                                                         cairo_t *cr,
--                                                         GooCanvasPointerEvents pointer_events);
  goo_canvas_item_simple_paint_path (item, cr : POINTER)
		external "C use <goocanvas-1.0/goocanvasitemsimple.h>"
		end
		
  goo_canvas_item_simple_changed (item : POINTER; recompute_bounds : BOOLEAN)
		external "C use <goocanvas-1.0/goocanvasitemsimple.h>"
		end
		
  goo_canvas_item_simple_set_model (item, model : POINTER)
		external "C use <goocanvas-1.0/goocanvasitemsimple.h>"
		end
		
	
end
