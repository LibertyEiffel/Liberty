note
	description: "Enum GtkUpdateType"
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

			-- A GtkWindow can be one of these types. Most things you'd
			-- consider a "window" should have type
			-- `gtk_window_toplevel'; windows with this type are managed
			-- by the window manager and have a frame by default (call
			-- GTK_WINDOW.set_decorated to toggle the frame). Windows
			-- with type 'gtk_window_popup' are ignored by the window
			-- manager; window manager keybindings won't work on them,
			-- the window manager won't decorate the window with a frame,
			-- many GTK+ features that rely on the window manager will
			-- not work (e.g. resize grips and
			-- maximization/minimization). `gtk_window_popup' is used to
			-- implement widgets such as GtkMenu or tooltips that you
			-- normally don't think of as windows per se. Nearly all
			-- windows should be `gtk_window_toplevel'. In particular, do
			-- not use `gtk_window_popup' just to turn off the window
			-- borders; use GTK_WINDOW.set_decorated for that.

deferred class GTK_UPDATE_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_update_type (an_update_type: INTEGER): BOOLEAN
		do
			Result:=((an_update_type=gtk_update_continuous) or else
			         (an_update_type=gtk_update_discontinuous) or else
			         (an_update_type=gtk_update_delayed))
		end

	gtk_update_continuous: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_UPDATE_CONTINUOUS"
		end

	gtk_update_discontinuous: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_UPDATE_DISCONTINUOUS"
		end

	gtk_update_delayed: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_UPDATE_DELAYED"
		end

end
