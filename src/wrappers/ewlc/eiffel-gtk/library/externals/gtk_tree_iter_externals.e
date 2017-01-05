note
	description: "External calls for GtkTreeIter struct. Just commented C docs for now"
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
	revision: "$Revision:$"

deferred class GTK_TREE_ITER_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	get_stamp (iter: POINTER): INTEGER
		external "C struct GtkTreeIter get stamp use <gtk/gtk.h>"
		end

	set_stamp (iter: POINTER; a_stamp: INTEGER)
		external "C struct GtkTreeIter set stamp use <gtk/gtk.h>"
		end

	gtk_tree_iter_copy (a_gtktreeiter: POINTER): POINTER
			-- Creates a dynamically allocated tree iterator as a copy of iter. This
			-- function is not intended for use in applications,
			-- because you can just copy the structs by value 
			-- (GtkTreeIter new_iter = iter;). You must free this iter with 
			-- gtk_tree_iter_free().
		external "C use <gtk/gtk.h>"
		end

	gtk_tree_iter_free (a_gtktreeiter: POINTER)
			-- Frees an iterator that has been allocated on the heap. This function is
			-- mainly used for language bindings.
		external "C use <gtk/gtk.h>"
		end

-- typedef struct {
--   gint stamp;
--   gpointer user_data;
--   gpointer user_data2;
--   gpointer user_data3;
-- } GtkTreeIter;


-- gint stamp; 	A unique stamp to catch invalid iterators
-- gpointer user_data; 	Model specific data
-- gpointer user_data2; 	Model specific data
-- gpointer user_data3; 	Model specific data
end
