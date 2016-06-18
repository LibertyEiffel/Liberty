note
	description: "enum GtkTreeViewColumnSizing - The sizing method the column uses to determine its width. Please note that GTK_TREE_VIEW_COLUMN_AUTOSIZE are inefficient for large views, and can make columns appear choppy."
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

deferred class GTK_TREE_VIEW_COLUMN_SIZING

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_tree_view_column_sizing (a_sizing :INTEGER): BOOLEAN
		do
			Result:=((a_sizing = gtk_tree_view_column_grow_only) or else
						(a_sizing = gtk_tree_view_column_autosize) or else
						(a_sizing = gtk_tree_view_column_fixed))
		end

	gtk_tree_view_column_grow_only: INTEGER
			-- 	Columns only get bigger in reaction to changes in the model
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_VIEW_COLUMN_GROW_ONLY"
		end

	gtk_tree_view_column_autosize: INTEGER
			-- 	Columns resize to be the optimal size everytime the model changes.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_VIEW_COLUMN_AUTOSIZE"
		end

	gtk_tree_view_column_fixed: INTEGER
			-- 	Columns are a fixed numbers of pixels wide.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_VIEW_COLUMN_FIXED"
		end
end
