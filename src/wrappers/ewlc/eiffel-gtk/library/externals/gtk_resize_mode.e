note
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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


deferred class GTK_RESIZE_MODE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	gtk_resize_parent: INTEGER
			--  Pass resize request to the parent
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RESIZE_PARENT"
		end

	gtk_resize_queue: INTEGER
			-- Queue resizes on this widget
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RESIZE_QUEUE"
		end

	is_valid_gtk_resize_mode (a_mode: INTEGER): BOOLEAN
		do
			Result:=((a_mode=gtk_resize_parent) or else
			         (a_mode=gtk_resize_queue))
		end

end

