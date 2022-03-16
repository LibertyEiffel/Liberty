note
	description: "External calls for GtkFontSelectionDialog"
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

deferred class GTK_FONT_SELECTION_DIALOG_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- Externals

	gtk_font_selection_dialog_new (a_title_str: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_font_selection_dialog_get_font_name (fsd: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_font_selection_dialog_set_preview_text (fsd: POINTER; text: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_font_selection_dialog_set_font_name (fsd: POINTER; text: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_font_selection_dialog_get_preview_text (fsd: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

end -- class GTK_FONT_SELECTION_DIALOG_EXTERNALS
