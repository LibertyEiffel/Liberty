note
	description: "Enum GtkIconSize"
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

deferred class GTK_ICON_SIZE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_icon_size (an_icon_size: INTEGER): BOOLEAN
		do
			Result:=((an_icon_size = gtk_icon_size_invalid) or else
						(an_icon_size = gtk_icon_size_menu) or else
						(an_icon_size = gtk_icon_size_small_toolbar) or else
						(an_icon_size = gtk_icon_size_large_toolbar) or else
						(an_icon_size = gtk_icon_size_button) or else
						(an_icon_size = gtk_icon_size_dnd) or else
						(an_icon_size = gtk_icon_size_dialog))
		end

	gtk_icon_size_invalid: INTEGER
			-- GTK_ICON_SIZE_INVALID
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ICON_SIZE_INVALID"
		end

	gtk_icon_size_menu: INTEGER
			-- GTK_ICON_SIZE_MENU
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ICON_SIZE_MENU"
		end

	gtk_icon_size_small_toolbar: INTEGER
			-- GTK_ICON_SIZE_SMALL_TOOLBAR
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ICON_SIZE_SMALL_TOOLBAR"
		end

	gtk_icon_size_large_toolbar: INTEGER
			-- GTK_ICON_SIZE_LARGE_TOOLBAR
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ICON_SIZE_LARGE_TOOLBAR"
		end

	gtk_icon_size_button: INTEGER
			-- GTK_ICON_SIZE_BUTTON
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ICON_SIZE_BUTTON"
		end

	gtk_icon_size_dnd: INTEGER
			-- GTK_ICON_SIZE_DND
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ICON_SIZE_DND"
		end

	gtk_icon_size_dialog: INTEGER
			-- GTK_ICON_SIZE_DIALOG
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ICON_SIZE_DIALOG"
		end

end
