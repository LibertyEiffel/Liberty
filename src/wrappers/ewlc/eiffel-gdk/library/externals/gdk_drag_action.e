note
	description: "enum GdkDragAction"
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

	-- Used in GdkDragContext to indicate what the destination should do
	-- with the dropped data.

deferred class GDK_DRAG_ACTION

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gdk_drag_action (an_action: INTEGER) : BOOLEAN
		do
			Result:=((an_action=gdk_action_default) or else
			         (an_action=gdk_action_copy) or else
			         (an_action=gdk_action_move) or else
			         (an_action=gdk_action_link) or else
			         (an_action=gdk_action_private) or else
			         (an_action=gdk_action_ask))
		end

	gdk_action_default: INTEGER
			-- Means nothing, and should not be used
		external "C macro use <gdk/gdk.h>"
		alias "GDK_ACTION_DEFAULT"
		end

	gdk_action_copy: INTEGER
			-- Copy the data
		external "C macro use <gdk/gdk.h>"
		alias "GDK_ACTION_COPY"
		end

	gdk_action_move: INTEGER
			-- Move the data, i.e. first copy it, then delete it from
			-- the source using the DELETE target of the X selection protocol
		external "C macro use <gdk/gdk.h>"
		alias "GDK_ACTION_MOVE"
		end

	gdk_action_link: INTEGER
			-- Add a link to the data. Note that this is only useful if
			-- source and destination agree on what it means
		external "C macro use <gdk/gdk.h>"
		alias "GDK_ACTION_LINK"
		end

	gdk_action_private: INTEGER
			-- Special action which tells the source that the
			-- destination will do something that the source doesn't understand
		external "C macro use <gdk/gdk.h>"
		alias "GDK_ACTION_PRIVATE"
		end

	gdk_action_ask: INTEGER
			-- Ask the user what to do with the data
		external "C macro use <gdk/gdk.h>"
		alias "GDK_ACTION_ASK"
		end

end -- class GDK_DRAG_ACTION
