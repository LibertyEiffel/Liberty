indexing
	description: "External calls for GtkDialog struct"
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

deferred class GTK_DIALOG_STRUCT
feature {NONE} -- External calls

	get_vbox (a_gtk_dialog: POINTER): POINTER is
		external "C struct GtkDialog get vbox use <gtk/gtk.h>"
		end
	
	get_action_area (a_gtk_dialog: POINTER): POINTER is
		external "C struct GtkDialog get action_area use <gtk/gtk.h>"
		end
end
