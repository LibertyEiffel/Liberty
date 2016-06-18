note
	description: "External calls for GTK_TOOLBAR"
	copyright: "[
					Copyright (C) 2007 Soluciones Informaticas Libres S.A.,
					eiffel-libraries team, GTK+ team
					
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

deferred class GTK_TOOLTIPS_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gtk_tooltips_new: POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_tooltips_enable (a_handle: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tooltips_disable (a_handle: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tooltips_set_delay (a_handle: POINTER; a_delay: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_tooltips_set_tip (a_handle, a_widget, a_tip_text, a_tip_private: POINTER)
		external "C use <gtk/gtk.h>"
		end

end -- class GTK_TOOLTIPS_EXTERNALS
