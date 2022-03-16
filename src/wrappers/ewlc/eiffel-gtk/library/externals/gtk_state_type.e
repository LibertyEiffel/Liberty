note
	description: "Enum GtkStateType"
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
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

	-- typedef enum
	-- {
	--   GTK_STATE_NORMAL,
	--   GTK_STATE_ACTIVE,
	--   GTK_STATE_PRELIGHT,
	--   GTK_STATE_SELECTED,
	--   GTK_STATE_INSENSITIVE
	--  } GtkStateType;

	-- This type indicates the current state of a widget; the state determines how
	-- the widget is drawn. The GtkStateType enumeration is also used to identify
	-- different colors in a GtkStyle for drawing, so states can be used for
	-- subparts of a widget as well as entire widgets.

deferred class GTK_STATE_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_state_type (a_state_type: INTEGER): BOOLEAN
		do
			Result:=((a_state_type = gtk_state_normal) or else
			         (a_state_type = gtk_state_active) or else
			         (a_state_type = gtk_state_prelight) or else
			         (a_state_type = gtk_state_selected) or else
			         (a_state_type = gtk_state_insensitive))
		end

	gtk_state_normal: INTEGER
			-- State during normal operation.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STATE_NORMAL"
		end

	gtk_state_active: INTEGER
			-- State of a currently active widget, such as a depressed button.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STATE_ACTIVE"
		end

	gtk_state_prelight: INTEGER
			-- State indicating that the mouse pointer is over the widget and
			-- the widget will respond to mouse clicks.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STATE_PRELIGHT"
		end

	gtk_state_selected: INTEGER
			-- State of a selected item, such the selected row in a list.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STATE_SELECTED"
		end

	gtk_state_insensitive: INTEGER
			-- State indicating that the widget is unresponsive to user actions.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STATE_INSENSITIVE"
		end

end -- GTK_STATE_TYPE
