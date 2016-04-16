note
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli
					
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

deferred class SHARED_DEFAULT_GTK_ICON_THEME

feature {ANY}
	default_gtk_icon_theme: GTK_ICON_THEME is
			-- The (unique) icon theme associated to the default screen.
			-- A unique GtkIconTheme associated with the default
			-- screen. This icon theme is associated with the screen and
			-- can be used as long as the screen is open. 
		once
			create Result.from_external_pointer(gtk_icon_theme_get_default)
		ensure not_void: Result/=Void
		end

feature {} -- External calls
	gtk_icon_theme_get_default: POINTER is
			-- GtkIconTheme* gtk_icon_theme_get_default (void);
		external "C use <gtk/gtk.h>"
		end
	
end -- class SHARED_DEFAULT_GTK_ICON_THEME
