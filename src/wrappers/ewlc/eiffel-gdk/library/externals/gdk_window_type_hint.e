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
	description: "[
					  enum GdkWindowTypeHint are hints for the window manager that indicate what type of function the window has. The window manager can use this when determining decoration and behaviour of the window. The hint must be set before mapping the window.

					  See the Extended Window Manager Hints specification for more details about window types.
				  ]"
deferred class GDK_WINDOW_TYPE_HINT

inherit ANY undefine is_equal, copy end

feature {} -- enum

	gdk_window_type_hint_normal: INTEGER
			-- 	Normal toplevel window.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TYPE_HINT_NORMAL"
		end

	gdk_window_type_hint_dialog: INTEGER
			-- 	Dialog window.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TYPE_HINT_DIALOG"
		end

	gdk_window_type_hint_menu: INTEGER
			-- 	Window used to implement a menu.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TYPE_HINT_MENU"
		end

	gdk_window_type_hint_toolbar: INTEGER
			-- 	Window used to implement toolbars.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TYPE_HINT_TOOLBAR"
		end

	gdk_window_type_hint_splashscreen: INTEGER
			-- 	Window used to display a splash screen during application startup.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TYPE_HINT_SPLASHSCREEN"
		end

	gdk_window_type_hint_utility: INTEGER
			-- 	Utility windows which are not detached toolbars or dialogs.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TYPE_HINT_UTILITY"
		end

	gdk_window_type_hint_dock: INTEGER
			-- 	Used for creating dock or panel windows.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TYPE_HINT_DOCK"
		end

	gdk_window_type_hint_desktop: INTEGER
			-- 	Used for creating the desktop background window.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TYPE_HINT_DESKTOP"
		end

	are_valid_window_type_hint (an_hint: INTEGER): BOOLEAN
		do
			Result:=(an_hint & (gdk_window_type_hint_normal  |
									  gdk_window_type_hint_dialog  |
									  gdk_window_type_hint_menu    |
									  gdk_window_type_hint_toolbar |
									  gdk_window_type_hint_splashscreen |
									  gdk_window_type_hint_utility      |
									  gdk_window_type_hint_dock         |
									  gdk_window_type_hint_desktop)).to_boolean
		end
end
