note
	description: "Access to GTK_EDITABLE struct."
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
	revision: "$Revision:$"

deferred class GTK_EDITABLE_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Access calls
	-- The GtkEditable structure contains the following fields. (These
	-- fields should be considered read-only. They should never be set
	-- by an application.)
	
	get_selection_start (an_editable: POINTER): INTEGER
			--	(guint) the starting position of the selected characters
			--	in the widget.
		external "C macro get GtkEditable <gtk/gtk.h>"
		end
	
	get_selection_end (an_editable: POINTER): INTEGER
			-- (guint) the end position of the selected characters in the
			-- widget.
		external "C macro get GtkEditable <gtk/gtk.h>"
		end
	
	get_editable  (an_editable: POINTER): INTEGER
			-- (guint) a flag indicating whether or not the widget is
			-- editable by the user.
		external "C macro get GtkEditable <gtk/gtk.h>"
		end
end

