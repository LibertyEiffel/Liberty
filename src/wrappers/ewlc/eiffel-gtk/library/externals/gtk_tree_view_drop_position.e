note
	description: "Enum GtkTreeViewDropPosition An enum for determining where a dropped row goes. "
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

deferred class GTK_TREE_VIEW_DROP_POSITION

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_tree_view_drop_position (a_position: INTEGER): BOOLEAN
		do
			Result:=((a_position=gtk_tree_view_drop_before) or else
						(a_position = gtk_tree_view_drop_after) or else
						(a_position = gtk_tree_view_drop_into_or_before) or else
						(a_position = gtk_tree_view_drop_into_or_after))
		end

	gtk_tree_view_drop_before: INTEGER
			-- drop before this row 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_VIEW_DROP_BEFORE"
		end

	gtk_tree_view_drop_after: INTEGER
			--  drop after this row 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_VIEW_DROP_AFTER"
		end

	gtk_tree_view_drop_into_or_before: INTEGER
			--  drop as a child of this row (with fallback to before or after if into is not possible)
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_VIEW_DROP_INTO_OR_BEFORE"
		end

	gtk_tree_view_drop_into_or_after: INTEGER
			--  drop as a child of this row (with fallback to before or after if into is not possible)
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_VIEW_DROP_INTO_OR_AFTER"
		end

end -- class GTK_TREE_VIEW_DROP_POSITION
