note
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

deferred class GTK_ICON_VIEW_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gtk_icon_view_new: POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_new_with_model (a_model: POINTER): POINTER  is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_get_model (handle: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_set_model (handle, a_model: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_get_text_column (handle: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_set_text_column (handle: POINTER; a_column: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_get_markup_column (handle: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_set_markup_column (handle: POINTER; a_column: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_get_pixbuf_column (handle: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_set_pixbuf_column (handle: POINTER; a_column: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_enable_model_drag_source (handle: POINTER; a_start_button_mask: INTEGER; a_gtktargetentry: POINTER; a_n_targets: INTEGER; some_gdkdragaction: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_enable_model_drag_dest (handle, a_gtktargetentry: POINTER; a_n_targets: INTEGER; some_gdkdragaction: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_unset_model_drag_source (handle: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_unset_model_drag_dest (handle: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_set_reorderable (handle: POINTER; a_boolean: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_get_reorderable (handle: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_get_dest_item_at_pos (handle: POINTER; drag_x, drag_y: INTEGER; a_gtktreepath, a_gtkiconviewdropposition: POINTER): INTEGER is --gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_get_cursor (handle, a_gtktreepath, a_gtkcellrenderer: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_get_item_width (handle: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_view_set_item_width (handle: POINTER; a_width: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

end
