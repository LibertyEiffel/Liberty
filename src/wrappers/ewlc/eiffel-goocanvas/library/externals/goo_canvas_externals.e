note
	description: "GOO_CANVAS_EXTERNALS -- externals for GOO_CANVAS"
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

deferred class GOO_CANVAS_EXTERNALS

inherit
	ANY undefine is_equal, copy end


feature {} -- External calls

	goo_canvas_new : POINTER
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

	goo_canvas_get_root_item (canvas : POINTER) : POINTER
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

	goo_canvas_set_root_item (canvas, item : POINTER)
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

	
-- GooCanvasItemModel* goo_canvas_get_root_item_model      (GooCanvas *canvas);
-- void                goo_canvas_set_root_item_model      (GooCanvas *canvas,
--                                                         GooCanvasItemModel *model);

	goo_canvas_get_static_root_item (canvas : POINTER) : POINTER
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

	goo_canvas_set_static_root_item (canvas, item : POINTER)
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

--GooCanvasItemModel* goo_canvas_get_static_root_item_model
--                                                        (GooCanvas *canvas);
--void                goo_canvas_set_static_root_item_model
--                                                        (GooCanvas *canvas,
--                                                         GooCanvasItemModel *model);

	goo_canvas_get_bounds (canvas, left, top, right, bottom : POINTER)
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

	goo_canvas_set_bounds (canvas : POINTER; left, top, right, bottom : REAL_64)
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

	goo_canvas_get_scale  (canvas : POINTER) : REAL_64
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

  goo_canvas_set_scale  (canvas : POINTER; scale : REAL_64)
		external "C use <goocanvas-1.0/goocanvas.h>"
		end


--GooCanvasItem*      goo_canvas_get_item                 (GooCanvas *canvas,
--                                                         GooCanvasItemModel *model);
	goo_canvas_get_item_at (canvas : POINTER; x,y : REAL_64; is_pointer_event : BOOLEAN) : POINTER
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

--GList*              goo_canvas_get_items_at             (GooCanvas *canvas,
--                                                         gREAL_64 x,
--                                                         gREAL_64 y,
--                                                         gboolean is_pointer_event);
--GList*              goo_canvas_get_items_in_area        (GooCanvas *canvas,
--                                                         const GooCanvasBounds *area,
--                                                         gboolean inside_area,
--                                                         gboolean allow_overlaps,
--                                                         gboolean include_containers);

	goo_canvas_scroll_to (canvas : POINTER; left, top: REAL_64)
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

--void                goo_canvas_render                   (GooCanvas *canvas,
--                                                         cairo_t *cr,
--                                                         const GooCanvasBounds *bounds,
--                                                         gREAL_64 scale);

	goo_canvas_convert_to_pixels (canvas : POINTER; x,y : POINTER)
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

  goo_canvas_convert_from_pixels (canvas : POINTER; x,y : POINTER)
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

  goo_canvas_convert_to_item_space (canvas, item, x,y : POINTER)
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

  goo_canvas_convert_from_item_space (canvas, item, x, y : POINTER)
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

--void                goo_canvas_convert_bounds_to_item_space
--                                                        (GooCanvas *canvas,
--                                                         GooCanvasItem *item,
--                                                         GooCanvasBounds *bounds);

--GdkGrabStatus       goo_canvas_pointer_grab             (GooCanvas *canvas,
--                                                         GooCanvasItem *item,
--                                                         GdkEventMask event_mask,
--                                                         GdkCursor *cursor,
--                                                         guint32 time);
--void                goo_canvas_pointer_ungrab           (GooCanvas *canvas,
--                                                         GooCanvasItem *item,
--                                                         guint32 time);

  goo_canvas_grab_focus (canvas, item : POINTER)
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

  goo_canvas_keyboard_grab (canvas, item : POINTER; owner_events : BOOLEAN; time : INTEGER_32) : POINTER
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

  goo_canvas_keyboard_ungrab (canvas, item : POINTER; time : INTEGER_32)
		external "C use <goocanvas-1.0/goocanvas.h>"
		end


	goo_canvas_create_cairo_context (canvas : POINTER) : POINTER
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

--GooCanvasItem*      goo_canvas_create_item              (GooCanvas *canvas,
--                                                         GooCanvasItemModel *model);
--void                goo_canvas_unregister_item          (GooCanvas *canvas,
--                                                         GooCanvasItemModel *model);
--void                goo_canvas_register_widget_item     (GooCanvas *canvas,
--                                                         GooCanvasWidget *witem);
--void                goo_canvas_unregister_widget_item   (GooCanvas *canvas,
--                                                         GooCanvasWidget *witem);
  goo_canvas_update (canvas : POINTER)
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

  goo_canvas_request_update (canvas : POINTER)
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

--void                goo_canvas_request_redraw           (GooCanvas *canvas,
--                                                         const GooCanvasBounds *bounds);
--void                goo_canvas_request_item_redraw      (GooCanvas *canvas,
--                                                         const GooCanvasBounds *bounds,
--                                                         gboolean is_static);
	goo_canvas_get_default_line_width (canvas : POINTER) : REAL_64
		external "C use <goocanvas-1.0/goocanvas.h>"
		end

	
end
