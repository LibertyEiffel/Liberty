indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"
	description: "[
					  enum GdkWindowTypeHint are hints for the window manager that indicate what type of function the window has. The window manager can use this when determining decoration and behaviour of the window. The hint must be set before mapping the window.

					  See the Extended Window Manager Hints specification for more details about window types.
					  ]"
deferred class GDK_WINDOW_TYPE_HINT  
feature -- Enum
	
	gdk_window_type_hint_normal: INTEGER is
			-- 	Normal toplevel window.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TYPE_HINT_NORMAL"
		end

	gdk_window_type_hint_dialog: INTEGER is
			-- 	Dialog window.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TYPE_HINT_DIALOG"
		end

	gdk_window_type_hint_menu: INTEGER is
			-- 	Window used to implement a menu.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TYPE_HINT_MENU"
		end

	gdk_window_type_hint_toolbar: INTEGER is
			-- 	Window used to implement toolbars.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TYPE_HINT_TOOLBAR"
		end

	gdk_window_type_hint_splashscreen: INTEGER is
			-- 	Window used to display a splash screen during application startup.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TYPE_HINT_SPLASHSCREEN"
		end

	gdk_window_type_hint_utility: INTEGER is
			-- 	Utility windows which are not detached toolbars or dialogs.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TYPE_HINT_UTILITY"
		end

	gdk_window_type_hint_dock: INTEGER is
			-- 	Used for creating dock or panel windows.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TYPE_HINT_DOCK"
		end

	gdk_window_type_hint_desktop: INTEGER is
			-- 	Used for creating the desktop background window.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TYPE_HINT_DESKTOP"
		end

	are_valid_window_type_hint (an_hint: INTEGER): BOOLEAN is
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

