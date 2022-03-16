note
	description: "enum GtkTreeModelFlags "
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

	-- These flags indicate various properties of a GtkTreeModel. They
	-- are returned by gtk_tree_model_get_flags(), and must be static for
	-- the lifetime of the object. A more complete description of
	-- GTK_TREE_MODEL_ITERS_PERSIST can be found in the overview of this
	-- section.

deferred class GTK_TREE_MODEL_FLAGS

inherit ANY undefine is_equal, copy end

feature {} -- enum

	are_valid_tree_model_flags (some_flags: INTEGER): BOOLEAN
		do
			Result:=(some_flags & (gtk_tree_model_iters_persist |
										  gtk_tree_model_list_only)).to_boolean
		end

	gtk_tree_model_iters_persist: INTEGER
			-- 	Iterators survive all signals emitted by the tree.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_MODEL_ITERS_PERSIST"
		end

	gtk_tree_model_list_only: INTEGER
			-- 	The model is a list only, and never has children
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_MODEL_LIST_ONLY"
		end

end
