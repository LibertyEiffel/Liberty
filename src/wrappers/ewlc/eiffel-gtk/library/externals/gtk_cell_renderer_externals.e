note
	description: "External calls for GTK_CELL_RENDERER"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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
	revision: "$Revision:$"

deferred class GTK_CELL_RENDERER_EXTERNALS

inherit ANY undefine is_equal, copy end

insert
	GTK_CELL_RENDERER_STATE
	GTK_CELL_RENDERER_MODE

feature {} -- External calls
	gtk_cell_renderer_get_size (a_gtkcellrenderer, a_gtkwidget,
										 a_gdkrectangle, x_offset_ptr, y_offset_ptr,
										 width_ptr, height_ptr: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_renderer_render (gtkcellrenderer, gdkwindow_ptr,
									  gtkwidget_ptr,
									  gdkrectangle_background_area_ptr,
									  gdkrectangle_cell_area_ptr,
									  gdkrectangle_expose_area_ptr: POINTER;
									  gtkcellrendererstate_flags: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_renderer_activate (gtkcellrenderer_cell_ptr,
										 gdkevent_event_ptr,
										 gtkwidget_widget_ptr,
										 gchar_path_ptr,
										 gdkrectangle_background_area_ptr,
										 gdkrectangle_cell_area_ptr: POINTER;
										 gtkcellrendererstate_flags: INTEGER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_renderer_start_editing (gtkcellrenderer_cell_ptr: POINTER;
												gdkevent_event_ptr: POINTER;
												gtkwidget_widget_ptr: POINTER;
												gchar_path_ptr: POINTER;
												gdkrectangle_background_area_ptr: POINTER;
												gdkrectangle_cell_area_ptr: POINTER;
												gtkcellrendererstate_flags: INTEGER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_renderer_editing_canceled (gtkcellrenderer: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_renderer_stop_editing (gtkcellrenderer: POINTER;
											  gboolean_canceled: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_renderer_get_fixed_size (gtkcellrenderer: POINTER;
												 width_ptr: POINTER;
												 height_ptr: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_renderer_set_fixed_size (gtkcellrenderer: POINTER;
												 a_width, an_height: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
end
	
