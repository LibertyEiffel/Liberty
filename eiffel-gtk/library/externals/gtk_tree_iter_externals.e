indexing
	description: "External calls for GtkTreeIter struct. Just commented C docs for now"
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

deferred class GTK_TREE_ITER_EXTERNALS
feature {} -- External calls
	get_stamp (iter: POINTER): INTEGER is
		external "C struct GtkTreeIter get stamp use <gtk/gtk.h>"
		end

	set_stamp (iter: POINTER; a_stamp: INTEGER) is
		external "C struct GtkTreeIter set stamp use <gtk/gtk.h>"
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
