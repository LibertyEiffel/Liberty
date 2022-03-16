note
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_NOTEBOOK_EXTERNALS

inherit
	ANY undefine is_equal, copy end

insert
	GTK_POSITION_TYPE
	GTK_PACK_TYPE

feature {} -- External calls

	gtk_notebook_new: POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_append_page (a_notebook, a_child, a_tab_label: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_append_page_menu (a_notebook, a_child, a_tab_label, a_menu_label: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_prepend_page (a_notebook, a_child, a_tab_label: POINTER): INTEGER is --gint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_prepend_page_menu (a_notebook, a_child, a_tab_label, a_menu_label: POINTER): INTEGER is --gint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_insert_page (a_notebook, a_child, a_tab_label: POINTER; a_position: INTEGER): INTEGER is --gint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_insert_page_menu (a_notebook, a_child, a_tab_label, a_menu_label: POINTER; a_position: INTEGER): INTEGER is --gint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_remove_page (a_notebook: POINTER; a_page_num: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_page_num (a_notebook, a_child: POINTER): INTEGER is --gint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_next_page (a_notebook: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_prev_page (a_notebook: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_reorder_child (a_notebook, a_child: POINTER; a_position: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_tab_pos (a_notebook: POINTER; a_position: INTEGER)
		require valid_position: is_valid_gtk_position_type (a_position)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_show_tabs (a_notebook: POINTER; show_tabs_boolean: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_show_border (a_notebook: POINTER; show_border_boolean: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_scrollable (a_notebook: POINTER; scrollable: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_tab_border (a_notebook: POINTER; a_border_width: INTEGER)
			-- Note: `a_border_width' shall be a NATURAL since its a guint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_popup_enable (a_notebook: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_popup_disable (a_notebook: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_get_current_page (a_notebook: POINTER): INTEGER is --gint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_get_menu_label (a_notebook, a_child: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_get_nth_page (a_notebook: POINTER; a_page_num: INTEGER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_get_n_pages (a_notebook: POINTER): INTEGER is --gint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_get_tab_label (a_notebook, a_child: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_query_tab_label_packing (a_notebook, a_child, expand, fill, pack_type: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_homogeneous_tabs (a_notebook: POINTER; homogeneous: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_menu_label (a_notebook, a_child, a_menu_label: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_menu_label_text (a_notebook, a_child, a_menu_text: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_tab_hborder (a_notebook: POINTER; a_tab_hborder: INTEGER)
			-- Note: `a_tab_hborder' shall be NATURAL since its a guint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_tab_label (a_notebook, a_child, a_tab_label: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_tab_label_packing (a_notebook, a_child: POINTER; expand, fill, pack_type: INTEGER)
		require valid_pack_type: is_valid_gtk_pack_type (pack_type)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_tab_label_text (a_notebook, a_child, a_tab_text: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_tab_vborder (a_notebook: POINTER; a_tab_vborder: INTEGER)
		-- Note: `a_tab_vborder' shall be NATURAL since its a guint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_get_menu_label_text (a_notebook, a_child: POINTER): POINTER is -- const gchar*
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_get_scrollable (a_notebook: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_get_show_border (a_notebook: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_get_show_tabs (a_notebook: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_get_tab_label_text (a_notebook, a_child: POINTER): POINTER is -- const gchar*
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_get_tab_pos (a_notebook: POINTER): INTEGER is -- GtkPositionType
		external "C use <gtk/gtk.h>"
		ensure valid_result: is_valid_gtk_position_type (Result)
		end

	gtk_notebook_set_current_page (a_notebook: POINTER; a_page_num: INTEGER)
		external "C use <gtk/gtk.h>"
		end

end
