note
	description: "Enum "
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

deferred class GDK_WINDOW_TYPE
	--    Describes the kind of window.

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_window_type (a_type: INTEGER): BOOLEAN
		do	
			Result:=((a_type = gdk_window_root) or else
						(a_type = gdk_window_toplevel) or else
						(a_type = gdk_window_child) or else
						(a_type = gdk_window_dialog) or else
						(a_type = gdk_window_temp) or else
						(a_type = gdk_window_foreign))
		end

	gdk_window_root: INTEGER
			-- root window; this window has no parent, covers the entire
			-- screen, and is created by the window system
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_ROOT"
		end
	
	gdk_window_toplevel: INTEGER
			-- toplevel window (used to implement GtkWindow)
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TOPLEVEL"
		end


	gdk_window_child: INTEGER
			-- child window (used to implement e.g. GtkButton)
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_CHILD"
		end


	gdk_window_dialog: INTEGER
			-- useless/deprecated compatibility type
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_DIALOG"
		end


	gdk_window_temp: INTEGER
			-- override redirect temporary window (used to implement GtkMenu)
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_TEMP"
		end

	
	gdk_window_foreign: INTEGER
			-- foreign window (see gdk_window_foreign_new())
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_FOREIGN"
		end
end
