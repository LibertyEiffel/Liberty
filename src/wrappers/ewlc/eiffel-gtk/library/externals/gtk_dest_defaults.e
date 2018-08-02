note
	description: "enum GtkDestDefaults"
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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

	-- The GtkDestDefaults enumeration specifies the various types of action
	-- that will be taken on behalf of the user for a drag destination site.

deferred class GTK_DEST_DEFAULTS

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_dest_defaults (a_dest_default :INTEGER): BOOLEAN
		do
			Result := a_dest_default.bit_and (gtk_dest_default_all.bit_not) = 0
		end

	gtk_dest_default_motion: INTEGER
			-- If set for a widget, GTK+, during a drag over this widget will
			-- check if the drag matches this widget's list of possible
			-- targets and actions. GTK+ will then call gdk_drag_status() as
			-- appropriate.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DEST_DEFAULT_MOTION"
		end

	gtk_dest_default_highlight: INTEGER
			-- If set for a widget, GTK+ will draw a highlight on this widget
			-- as long as a drag is over this widget and the widget drag
			-- format and action are acceptable.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DEST_DEFAULT_HIGHLIGHT"
		end

	gtk_dest_default_drop: INTEGER
			-- If set for a widget, when a drop occurs, GTK+ will will check
			-- if the drag matches this widget's list of possible targets
			-- and actions. If so, GTK+ will call gtk_drag_get_data() on
			-- behalf of the widget. Whether or not the drop is successful,
			-- GTK+ will call gtk_drag_finish(). If the action was a move,
			-- then if the drag was successful, then TRUE will be passed
			-- for the delete parameter to gtk_drag_finish().
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DEST_DEFAULT_DROP"
		end

	gtk_dest_default_all: INTEGER
			--  If set, specifies that all default actions should be taken.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DEST_DEFAULT_ALL"
		end

end -- class GTK_DEST_DEFAULTS
