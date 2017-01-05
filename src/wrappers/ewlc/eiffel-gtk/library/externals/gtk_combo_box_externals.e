note
	description: "External calls for GtkComboBox"
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_COMBO_BOX_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gtk_combo_box_new: POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_new_with_model (a_model: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_get_wrap_width (a_combo_box: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_set_wrap_width (a_combo_box: POINTER; a_width: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_get_row_span_column (a_combo_box: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_set_row_span_column (a_combo_box: POINTER; a_row_span: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_get_column_span_column (a_combo_box: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_set_column_span_column (a_combo_box: POINTER; a_column_span: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_get_active (a_combo_box: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_set_active (a_combo_box: POINTER; an_index: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_get_active_iter (a_combo_box: POINTER; a_gtktreeiter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_set_active_iter (a_combo_box: POINTER; a_gtktreeiter: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_get_model (a_combo_box: POINTER): POINTER is -- GtkTreeModel*
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_set_model (a_combo_box: POINTER; a_model: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_new_text: POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_append_text (a_combo_box: POINTER; a_text: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_insert_text (a_combo_box: POINTER; a_position: INTEGER; a_text: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_prepend_text (a_combo_box: POINTER; a_text: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_remove_text (a_combo_box: POINTER; a_position: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_get_active_text (a_combo_box: POINTER): POINTER is --	gchar*
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_popup (a_combo_box: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_popdown (a_combo_box: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_get_popup_accessible (a_combo_box: POINTER): POINTER is -- AtkObject*
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_get_row_separator_func (a_combo_box: POINTER): POINTER is -- GtkTreeViewRowSeparatorFunc
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_set_row_separator_func (a_combo_box: POINTER; a_gtktreeviewrowseparatorfunc: POINTER; some_data: POINTER; a_gtkdestroynotify: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_set_add_tearoffs (a_combo_box: POINTER; add_tearoffs: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_get_add_tearoffs (a_combo_box: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_set_focus_on_click (a_combo_box: POINTER; focus_on_click: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_combo_box_get_focus_on_click (a_combo_box: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

end -- class GTK_COMBO_BOX_EXTERNALS
