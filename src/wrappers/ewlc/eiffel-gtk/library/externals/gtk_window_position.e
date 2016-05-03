note
	description: "Various flags to influence window placement"
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
	revision "$REvision:$"

deferred class GTK_WINDOW_POSITION

inherit ANY undefine is_equal, copy end

feature {} -- enum

	gtk_win_pos_none: INTEGER is
			-- No influence is made on placement.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIN_POS_NONE"
		end

	gtk_win_pos_center: INTEGER is
			-- Windows should be placed in the center of the screen.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIN_POS_CENTER"
		end

	gtk_win_pos_mouse: INTEGER is
			-- Windows should be placed at the current mouse position.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIN_POS_MOUSE"
		end

	gtk_win_pos_center_always: INTEGER is
			-- Keep window centered as it changes size, etc.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIN_POS_CENTER_ALWAYS"
		end

	gtk_win_pos_center_on_parent: INTEGER is
			-- Center the window on its transient parent (see gtk_window_set_transient_for(). 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIN_POS_CENTER_ON_PARENT"
		end

	is_valid_gtk_window_position (a_position: INTEGER): BOOLEAN is
			-- is `a_position' a valid gtk_window_position_flag?
		do
			Result:=((a_position = gtk_win_pos_none) or else
						(a_position = gtk_win_pos_center) or else
						(a_position = gtk_win_pos_mouse) or else
						(a_position = gtk_win_pos_center_always) or else
						(a_position = gtk_win_pos_center_on_parent))
		end

end

