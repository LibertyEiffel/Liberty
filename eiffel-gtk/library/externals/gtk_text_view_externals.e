indexing

	description: "GtkTextView - Widget that displays a GtkTextBuffer"

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
	date: "$Date:  $"
	revision: "$Revision:  $"

deferred class GTK_TEXT_VIEW_EXTERNALS

feature {NONE}

	gtk_text_view_new: POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_new_with_buffer(buff: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_set_buffer (handle, buff: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_buffer (handle: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

end -- class GTK_TEXT_VIEW_EXTERNALS
