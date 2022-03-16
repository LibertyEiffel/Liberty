note
	description: "Enum GtkSortType -- Determines the direction of a sort."
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_SORT_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_sort_type (a_sort_type: INTEGER): BOOLEAN
		do
			Result:=((a_sort_type=gtk_sort_ascending) or else
						(a_sort_type=gtk_sort_descending))
		end

	gtk_sort_ascending: INTEGER
			-- 	Sorting is in ascending order.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SORT_ASCENDING"
		end

	gtk_sort_descending: INTEGER
			-- 	Sorting is in descending order.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SORT_DESCENDING"
		end

end
