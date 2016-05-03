note
	description: "Styles -- Functions for drawing widget parts"
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


deferred class GTK_STYLE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {}

	gtk_style_set_background(a_handle, a_pixmap: POINTER; a_state: INTEGER) is
		external "C inline use <gtk/gtk.h>"
		alias "((GtkStyle*)$a_handle)->bg_pixmap[$a_state] = $a_pixmap"
		end

	gtk_style_get_bg (a_handle: POINTER; a_state: INTEGER): POINTER is
		external "C inline use <gtk/gtk.h>"
		alias "&(((GtkStyle*)$a_handle)->bg[$a_state])"
		end

	gtk_style_get_fg (a_handle: POINTER; a_state: INTEGER): POINTER is
		external "C inline use <gtk/gtk.h>"
		alias "&(((GtkStyle*)$a_handle)->fg[$a_state])"
		end

	gtk_style_get_text (a_handle: POINTER; a_state: INTEGER): POINTER is
		external "C inline use <gtk/gtk.h>"
		alias "&(((GtkStyle*)$a_handle)->text[$a_state])"
		end

	gtk_style_get_base (a_handle: POINTER; a_state: INTEGER): POINTER is
		external "C inline use <gtk/gtk.h>"
		alias "&(((GtkStyle*)$a_handle)->base[$a_state])"
		end

end -- class GTK_STYLE_EXTERNALS
