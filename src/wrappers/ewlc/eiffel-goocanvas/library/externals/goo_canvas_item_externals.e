note
	description: "GOO_CANVAS_ITEM_EXTERNALS -- externals..."
	copyright: "[
					GooCanvas. Copyright (C) 2005-2022: Damon Chaplin, eiffel-libraries team and others
					
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

eferred class
	GOO_CANVAS_ITEM_EXTERNALS
	
inherit
	ANY undefine is_equal, copy end

feature {}
  goo_canvas_item_translate (item : POINTER; tx, ty : REAL_64)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
		
  goo_canvas_item_scale (item : POINTER; sx,sy : REAL_64)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_rotate  (item : POINTER; degrees, cx, cy : REAL_64)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_skew_x  (item : POINTER; degrees, cx, cy : REAL_64)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_skew_y  (item : POINTER; degrees, cx, cy : REAL_64)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_get_transform (item, transform : POINTER) : BOOLEAN
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_set_transform (item, transform : POINTER)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_get_simple_transform (item, x, y, scale, rotation : POINTER) : BOOLEAN
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_set_simple_transform (item : POINTER; x, y, scale, rotation : REAL_64)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_get_bounds (item, bounds : POINTER)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_is_visible (item : POINTER) : BOOLEAN
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_get_is_static (item : POINTER) : BOOLEAN
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_set_is_static (item : POINTER; is_static : BOOLEAN)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end

--  goo_canvas_item_animate  (item : POINTER; x, y, scale, degrees : REAL_64; absolute : BOOLEAN; duration, step_time : INTEGER)  (GooCanvasItem *item,
--   gdouble x,
--   gdouble y,
--   gdouble scale,
--   gdouble degrees,
--   gboolean absolute,
--   gint duration,
--   gint step_time,
--   GooCanvasAnimateType type);
--  goo_canvas_item_stop_animation      (GooCanvasItem *item);

  goo_canvas_item_raise  (item, above : POINTER)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_lower  (item, below : POINTER)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end

  goo_canvas_item_remove (item : POINTER)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end

	goo_canvas_item_get_canvas (item : POINTER) : POINTER
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
		
  goo_canvas_item_set_canvas (item, canvas : POINTER)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end

  goo_canvas_item_get_parent (item : POINTER) : POINTER
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
		
  goo_canvas_item_set_parent (item, parent : POINTER)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end

	goo_canvas_item_get_model (item : POINTER) : POINTER
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_set_model (item, model : POINTER)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end

  goo_canvas_item_is_container (item : POINTER) : BOOLEAN
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_get_n_children (item : POINTER) : INTEGER
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
	goo_canvas_item_get_child (item : POINTER; child_num : INTEGER) : POINTER
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_find_child (item, child : POINTER) : INTEGER
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_add_child (item, child : POINTER; position : INTEGER)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_move_child (item : POINTER; old_position, new_position : INTEGER)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_remove_child  (item : POINTER; child_num : INTEGER)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
	goo_canvas_item_get_transform_for_child (item, child, transform : POINTER) : BOOLEAN
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end

  goo_canvas_item_get_style  (item : POINTER) : POINTER
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_set_style  (item, style : POINTER)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end

  goo_canvas_item_request_update (item : POINTER)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_ensure_updated  (item : POINTER)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_update (item : POINTER; entire_tree : BOOLEAN; cr, bounds : POINTER)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_get_requested_area (item, cr, requested_area : POINTER) : BOOLEAN
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_get_requested_height (item, cr : POINTER; width : REAL_64) : REAL_64
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_allocate_area  (item, cr, requested_area, allocated_area : POINTER; x_offset, y_offset : REAL_64)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_get_items_at (item : POINTER; x, y : REAL_64; cr : POINTER; is_pointer_event, parent_is_visible : BOOLEAN; found_items : POINTER) : POINTER
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end
  goo_canvas_item_paint (item, cr, bounds : POINTER; scale : REAL_64)
		external "C use <goocanvas-1.0/goocanvasitem.h>"
		end

--  goo_canvas_item_class_install_child_property
--  (GObjectClass *iclass,
--   guint property_id,
--   GParamSpec *pspec);
--GParamSpec**        goo_canvas_item_class_list_child_properties
--  (GObjectClass *iclass,
--   guint *n_properties);
--GParamSpec*goo_canvas_item_class_find_child_property
--  (GObjectClass *iclass,
--   const gchar *property_name);
--  goo_canvas_item_get_child_property  (GooCanvasItem *item,
--   GooCanvasItem *child,
--   const gchar *property_name,
--   GValue *value);
--  goo_canvas_item_set_child_property  (GooCanvasItem *item,
--   GooCanvasItem *child,
--   const gchar *property_name,
--   const GValue *value);
--  goo_canvas_item_get_child_properties
--  (GooCanvasItem *item,
--   GooCanvasItem *child,
--   ...);
--  goo_canvas_item_get_child_properties_valist
--  (GooCanvasItem *item,
--   GooCanvasItem *child,
--   va_list var_args);
--  goo_canvas_item_set_child_properties
--  (GooCanvasItem *item,
--   GooCanvasItem *child,
--   ...);
--  goo_canvas_item_set_child_properties_valist
--  (GooCanvasItem *item,
--   GooCanvasItem *child,
--   va_list var_args);
	
feature {ANY}
	handle : POINTER is deferred end
end
